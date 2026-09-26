from flask import Flask,request

app = Flask(__name__)

@app.route("/")  
def home():
    return "Hello, Flask!"
#  api = application programming interface

@app.route("/greet", methods=["GET"])
def greet():
    name = request.args.get("name", "Guest")
    return f"Hello, {name}!"

@app.route("/login", methods=["POST"])
def login():
    username = request.form["username"]
    password = request.form["password"]
    password = f"---{password}----"
    return f"Welcome, {username}! Your password is {password}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
    # app.run()

