import functools

from flask import (Blueprint, flash, g, redirect, render_template, request,
                   session, url_for)
from mysql.connector import errors as mysql_errors
from werkzeug.security import generate_password_hash

from hiddengems.db import mysql

bp = Blueprint('auth', __name__, url_prefix='/auth')


@bp.route('/signup', methods=('GET', 'POST'))
def signup():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        
        cur = mysql.connection.cursor()

        error = None
        if not username:
            error = 'Username is required.'
        elif not password:
            error = 'Password is required.'

        if error is None:
            try:
                query = "INSERT INTO User (username, email, normalized_email, password) VALUES (%s, %s, %s, %s)"
                data = (username, email, email, password)
                cur.execute(query, data)
                mysql.connection.commit()
                # cur.execute(
                #     "INSERT INTO user (username, password) VALUES (?, ?)",
                #     (username, generate_password_hash(password)),
                # )
            except mysql_errors.IntegrityError:
                error = "Constraint violated when inserting"
            else:
                return redirect(url_for("routes.auth.login"))

        flash(error)

    return render_template('auth/signup.html.j2')

@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        cur = mysql.connection.cursor(dictionary=True)
        
        cur.execute(
            'SELECT id FROM user WHERE email = %s AND password = %s', (email, password)
        )
        
        user = cur.fetchone()

        error = None
        if user is None:
            error = 'Incorrect email or password.'
        # elif not check_password_hash(user['password'], password):
        #     error = 'Incorrect password.'

        if error is None:
            session.clear()
            session['user_id'] = user['id']
            return redirect(url_for('routes.index'))

        flash(error)
    
    return render_template('auth/login.html.j2')


@bp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('routes.index'))