import pymysql
from app import app
from connection import mysql
from flask import jsonify
from flask import flash, request
from db import setUp
# from werkzeug import generate_password_hash, check_password_hash
from werkzeug.security import generate_password_hash, check_password_hash

setUp()
#user
@app.route('/userAdd', methods=['POST'])
def userInsert():
    con  = None
    cursor = None
    try:
        _json = request.json
        _userName = _json['userName']
        _email = _json['email']
        _password = _json['pass']
        # validate the received values
        if _userName and _email and _password and request.method == 'POST':
            # do not save password as a plain text
            _hashed_password = generate_password_hash(_password)
            # save edits
            sql = "INSERT INTO User_tbl(user_name, user_email, user_password) VALUES(%s, %s, %s)"
            data = (_userName, _email, _hashed_password,)
            con = mysql.connect()
            cursor = con.cursor()
            cursor.execute(sql, data)
            con.commit()
            resp = jsonify('Successfully Added User')
            resp.status_code = 200
            return resp
        else:
            return not_found()
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        con.close()

#passsword
@app.route('/passAdd', methods=['POST'])
def passInsert():
    conn = None
    cursor = None
    try:
        _json = request.json
        _id = _json['id']
        _platform = _json['platform']
        _password = _json['pass']
        # validate the received values
        if _id and _platform and _password and request.method == 'POST':
            # do not save password as a plain text
            _hashed_password = generate_password_hash(_password)
            # save edits
            sql = "INSERT INTO Password_tbl(user_id, platform, user_password) VALUES(%s, %s, %s)"
            data = (_id, _platform, _hashed_password,)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute(sql, data)
            conn.commit()
            resp = jsonify('Password added successfully')
            resp.status_code = 200
            return resp
        else:
            return not_found()
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

#display
@app.route('/allUsers')
def users():
    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute("SELECT user_id id, user_name name, user_email email, user_password pwd FROM User_tbl")
        rows = cursor.fetchall()
        resp = jsonify(rows)
        resp.status_code = 200
        return resp
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

#retrieve from user id
@app.route('/pass/<userId>')
def user(userId):
    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute(
            "SELECT user_id id, platform plat, user_password pass FROM Password_tbl WHERE user_id=%s", userId)
        row = cursor.fetchone()
        resp = jsonify(row)
        resp.status_code = 200
        return resp
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

#retrieve from user id passwords
@app.route('/user/<int:id>')
def password(id):
    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute(
            "SELECT  user_id id, user_name name, user_email email, user_password pwd FROM User_tbl WHERE user_id=%s", id)
        row = cursor.fetchone()
        resp = jsonify(row)
        resp.status_code = 200
        return resp
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()


#update user tbl
@app.route('/userUpdate', methods=['PUT'])
def update_user():
    conn = None
    cursor = None
    try:
        _json = request.json
        _id = _json['id']
        _name = _json['name']
        _email = _json['email']
        _password = _json['pass']
        # validate the received values
        if _name and _email and _password and _id and request.method == 'PUT':
            # do not save password as a plain text
            _hashed_password = generate_password_hash(_password)
            # save edits
            sql = "UPDATE User_tbl SET user_name=%s, user_email=%s, user_password=%s WHERE user_id=%s"
            data = (_name, _email, _hashed_password, _id,)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute(sql, data)
            conn.commit()
            resp = jsonify('Successfully updated user')
            resp.status_code = 200
            return resp
        else:
            return not_found()
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

#del user
@app.route('/userDelete/<int:id>', methods=['DELETE'])
def delete_user(id):
    conn = None
    cursor = None
    try:
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM User_tbl WHERE user_id=%s", (id,))
        conn.commit()
        resp = jsonify('Successfully deleted!')
        resp.status_code = 200
        return resp
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

#del pass implemet 
# @app.route('/passDelete/<int:id>/<string:plat>', methods=['DELETE'])
# def delete_pass(id,plat):
#     conn = None
#     cursor = None
#     try:
#         conn = mysql.connect()
#         cursor = conn.cursor()
#         cursor.execute("DELETE FROM Password_tbl WHERE user_id=%s AND platform=%s", (id,plat,))
#         conn.commit()
#         resp = jsonify('Successfully Deleted!')
#         resp.status_code = 200
#         return resp
#     except Exception as e:
#         print(e)
#     finally:
#         cursor.close()
#         conn.close()


@app.errorhandler(404)
def not_found(error=None):
    message = {
        'status': 404,
        'message': 'Not Found: ' + request.url,
    }
    resp = jsonify(message)
    resp.status_code = 404

    return resp


if __name__ == "__main__":
    app.run()