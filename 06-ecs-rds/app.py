from flask import Flask
import mysql.connector
import os

app = Flask(__name__)

@app.route("/")
def index():
    connection = mysql.connector.connect(
        host=os.environ["DB_HOST"],
        port=int(os.environ.get("DB_PORT", 3306)),
        database=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"]
    )

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM users")

    users = cursor.fetchall()

    cursor.close()
    connection.close()

    result = ""

    for user in users:
        result += f"{user[0]}: {user[1]} ({user[2]})<br>"

    return result

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)