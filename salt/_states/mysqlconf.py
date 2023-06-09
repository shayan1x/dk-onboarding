import MySQLdb

def _connect(mysql_host, mysql_user, mysql_pwd):
    connection = MySQLdb.connect(host = mysql_host, user = mysql_user, passwd = mysql_pwd)
    return connection

def _get_mysql_config(connection, key):
    cursor = connection.cursor()

    try:
        cursor.execute("SELECT @@global.%s", (key, ))
        row = cursor.fetchone()
        return row[0]
    except:
        return None

def __set_mysql_config(connection, key, value):
    cursor = connection.cursor()

    try:
        cursor.execute("SET @@global.{} = {}".format(key, value))
        return True

    except:
        return False


def present(name, value, mysql_host = "127.0.0.1", mysql_user = "root", mysql_pwd = "", mysql_port = 3306, mysql_db = "mysql"):
    ret = {
        "name": name,
        "changes": {},
        "result": True,
        "comment": "There is nothing to update in mysql configuration"
    }

    connection = MySQLdb.connect(
        host = mysql_host,
        user = mysql_user,
        passwd = mysql_pwd,
        port = mysql_port,
        db = mysql_db
    )

    currentValue = _get_mysql_config(connection, name)

    if currentValue == None:
        ret["result"] = False
        ret["comment"] = "The config '{}' was not found in mysql configuration".format(name)
        return ret

    if currentValue == value:
        ret["result"] = True
        ret["changes"] = {}
        ret["comment"] = "The config '{}' with value {} is already present in your mysql configuration".format(name, value)
        return ret

    result = __set_mysql_config(connection, name, value)

    if result:
        ret["result"] = True
        ret["changes"][name] = value
        ret["comment"] = "The config '{}' with value {} has updated in your mysql configuration".format(name, value)
    else:
        ret["result"] = False
        ret["changes"] = {}
        ret["comment"] = "The config '{}' with value {} could not be updated in your mysql configuration".format(name, value)


    return ret