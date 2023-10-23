from flask import Blueprint, redirect, render_template, request, url_for

from hiddengems.db import mysql

bp = Blueprint('locations', __name__, url_prefix='/locations')

# Define the Location class and methods
class Location:
    def __init__(self, id, name, parent_location_id):
        self.id = id
        self.name = name
        self.parent_location_id = parent_location_id

    @classmethod
    def get_location_by_id(cls, location_id):
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT id, name, parent_location_id FROM Location WHERE id = %s", (location_id,))
        row = cursor.fetchone()
        if row:
            id, name, parent_location_id = row
            return cls(id, name, parent_location_id)
        return None

    @classmethod
    def get_parent_locations_of(cls, parent_id):
        cursor = mysql.connection.cursor()
        if parent_id is None:
            cursor.execute("SELECT id, name, parent_location_id FROM Location WHERE parent_location_id IS NULL")
        else:
            cursor.execute("SELECT id, name, parent_location_id FROM Location WHERE parent_location_id = %s", (parent_id,))
        locations = []
        for row in cursor:
            id, name, parent_location_id = row
            locations.append(cls(id, name, parent_location_id))
        return locations

@bp.route('/', methods=['GET'])
def get_all():
    connection = mysql.connection
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM location")
    locations = cursor.fetchall()
    connection.close()
    
    return render_template("locations/get_all.html.j2", locations=locations)

@bp.route('/new', methods=['GET', 'POST'])
def new():
    if request.method == 'POST':
        form = request.form
        action = form.get("action")

        if action == "submit":
            name = form.get("name")
            description = form.get("description")
            address = form.get("address")
            latitude = form.get("latitude")
            longitude = form.get("longitude")
            parent_id = form.get("parentId") or None

            connection = mysql.connection
            cursor = connection.cursor()
            
            # Insert the data into the location table
            insert_query = "INSERT INTO location (name, description, address, latitude, longitude, parent_location_id) VALUES (%s, %s, %s, %s, %s, %s)"
            cursor.execute(insert_query, (name, description, address, latitude, longitude, parent_id))
            connection.commit()
            connection.close()

            # Redirect to the location page
            return redirect(url_for("routes.locations.get_all"))
        
        return render_template("locations/new.html.j2", form=form)
            
    else:
        return render_template("locations/new.html.j2", form=request.form)
    

# Define the route for the parent selector
@bp.route('/new/parent', methods=['POST'])
def new_location_parent_selector():
    parent_id = request.form.get('parentId', type=int, default=0)
    parent_name = request.form.get('parentName', 'None')
    action = request.form.get('action')

    if parent_id == 0:
        parent_id = None

    if action == 'back' and parent_id is not None:
        parent_location = Location.get_location_by_id(parent_id)

        if parent_location:
            parent_id = parent_location.parent_location_id

            if parent_location.parent_location_id is None:
                parent_name = "None"
            else:
                parent_location = Location.get_location_by_id(parent_location.parent_location_id)

                if parent_location:
                    parent_name = parent_location.name
                else:
                    parent_id = None
                    parent_name = "None"
        else:
            parent_id = None
            parent_name = "None"

    locations = Location.get_parent_locations_of(parent_id)

    if parent_id is not None:
        selected = Location.get_location_by_id(parent_id)

        if selected:
            locations.insert(0, selected)

    form = {
        **request.form.to_dict(flat=True),
        **{'parentId': parent_id, 'parentName': parent_name}
    }

    return render_template('locations/new_parent_select.html.j2', form=form, locations=locations, parent_id=parent_id)