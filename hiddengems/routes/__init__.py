import functools

from flask import (Blueprint, flash, g, redirect, render_template, request,
                   session, url_for)

from hiddengems.db import mysql

from . import auth, locations

bp = Blueprint('routes', __name__, url_prefix='/')

bp.register_blueprint(auth.bp)
bp.register_blueprint(locations.bp)

@bp.before_app_request
def load_logged_in_user():
    user_id = session.get('user_id')

    if user_id is None:
        g.user = None
    else:
        cur = mysql.connection.cursor(dictionary=True)
        cur.execute('SELECT * FROM user WHERE id = %s', (user_id,))
        g.user = cur.fetchone()


@bp.route('/')
def index():
    return render_template('index.html.j2')

