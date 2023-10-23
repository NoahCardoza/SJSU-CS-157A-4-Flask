import click
import mysql.connector as _mysql_connector
from flask import current_app, g

# https://dev.mysql.com/doc/connector-python/en/connector-python-connectargs.html
# key = mysql connect arg key, value = flask config key
MYSQL_ARGS = {
    'user': 'MYSQL_USER',
    'password': 'MYSQL_PASSWORD',
    'database': 'MYSQL_DATABASE',
    'host': 'MYSQL_HOST',
    'port': 'MYSQL_PORT',
    'unix_socket': 'MYSQL_UNIX_SOCKET',
    'auth_plugin': 'MYSQL_AUTH_PLUGIN',
    'use_unicode': 'MYSQL_USE_UNICODE',
    'charset': 'MYSQL_CHARSET',
    'collation': 'MYSQL_COLLATION',
    'autocommit': 'MYSQL_AUTOCOMMIT',
    'time_zone': 'MYSQL_TIME_ZONE',
    'sql_mode': 'MYSQL_SQL_MODE',
    'get_warnings': 'MYSQL_GET_WARNINGS',
    'raise_on_warnings': 'MYSQL_RAISE_ON_WARNINGS',
    'connection_timeout': 'MYSQL_CONNECTION_TIMEOUT',
    'client_flags': 'MYSQL_CLIENT_FLAGS',
    'buffered': 'MYSQL_BUFFERED',
    'raw': 'MYSQL_RAW',
    'consume_results': 'MYSQL_CONSUME_RESULTS',
    'ssl_ca': 'MYSQL_SSL_CA',
    'ssl_cert': 'MYSQL_SSL_CERT',
    'ssl_disabled': 'MYSQL_SSL_DISABLED',
    'ssl_key': 'MYSQL_SSL_KEY',
    'ssl_verify_cert': 'MYSQL_SSL_VERIFY_CERT',
    'ssl_verify_identity': 'MYSQL_SSL_VERIFY_IDENTITY',
    'force_ipv6': 'MYSQL_FORCE_IPV6',
    'dsn': 'MYSQL_DSN',
    'pool_name': 'MYSQL_POOL_NAME',
    'pool_size': 'MYSQL_POOL_SIZE',
    'pool_reset_session': 'MYSQL_POOL_RESET_SESSION',
    'compress': 'MYSQL_COMPRESS',
    'converter_class': 'MYSQL_CONVERTER_CLASS',
    'failover': 'MYSQL_FAILOVER',
    'option_files': 'MYSQL_OPTION_FILES',
    'allow_local_infile': 'MYSQL_ALLOW_LOCAL_INFILE',
    'use_pure': 'MYSQL_USE_PURE'
}


class MySQL:
    def __init__(self, app=None, ctx_key=None, connection_args=None):
        """
        :param flask.Flask app:
        :param dict[str, str] connection_args: Args to be used in mysql.connector.connect(). Overrides any args found
            in the Flask app config.
        """
        self._arg_overrides = connection_args
        self._key = 'mysql_db_' + ctx_key if ctx_key else 'mysql_db'

        self.app = app
        if app is not None:
            self.init_app(app)

    def init_app(self, app):
        app.teardown_request(self._teardown)

    def _connect(self):
        connect_args = {}
        config = self.app.config if self.app else current_app.config
        for k, v in MYSQL_ARGS.items():
            val = config.get(v)
            if val:
                connect_args[k] = val

        if self._arg_overrides:
            connect_args.update(self._arg_overrides)

        return _mysql_connector.connect(**connect_args)

    def _teardown(self, _):
        if hasattr(g, self._key):
            getattr(g, self._key).close()

    @property
    def connection(self):
        if g is not None:
            if not hasattr(g, 'mysql_db'):
                setattr(g, self._key, self._connect())
            return getattr(g, self._key)

    def new_cursor(self, **kwargs):
        conn = self.connection
        if conn:
            return conn.cursor(**kwargs)

    def execute_sql(self, sql, dictionary=False):
        """
        :param str sql:
        :param boolean to_pandas:
        :param boolean dictionary:
        :return pd.DataFrame|list:
        """
        cursor = self.new_cursor(dictionary=dictionary)
        cursor.execute(sql)
        out = cursor.fetchall()
        cursor.close()
        return out


mysql = MySQL()


def init_db():
    cur = mysql.connection.cursor()

    with current_app.open_resource('schema.sql') as f:
        cur.execute(f.read().decode('utf8'), multi=True)

    cur.close()


@click.command('init-db')
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Initialized the database.')


def init_app(app):
    mysql.init_app(app)
    app.cli.add_command(init_db_command)
