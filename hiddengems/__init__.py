import os

from dotenv import load_dotenv
from flask import Flask

load_dotenv()

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_mapping(
        SECRET_KEY=os.environ.get('SECRET_KEY', default='dev'),
        MYSQL_HOST=os.environ.get('MYSQL_HOST', default='localhost'),
        MYSQL_PORT=int(os.environ.get('MYSQL_PORT', default='3306')),
        MYSQL_USER=os.environ.get('MYSQL_USER', 'root'),
        MYSQL_PASSWORD=os.environ['MYSQL_PASSWORD'],
        MYSQL_DATABASE=os.environ['MYSQL_DATABASE'],
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    from . import routes
    app.register_blueprint(routes.bp)

    # a simple page that says hello
    # @app.route('/hello')
    # def hello():
    #     return 'Hello, World!'
    
    from . import db
    db.init_app(app)


    return app
