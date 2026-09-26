from flask import Flask, request, jsonify
import json
import os
#import cors
from flask_cors import CORS
# cross origin
app = Flask(__name__)
CORS(app)
FILE_NAME = "todos.json"

# Helper function to read todos from file
def read_todos():
    with open(FILE_NAME, "r") as f:
        return json.load(f)

# Helper function to save todos to file
def save_todos(todos):
    with open(FILE_NAME, "w") as f:
        json.dump(todos, f)

# ---------------- GET ALL TODOS ----------------
@app.route("/todos", methods=["GET"])
def get_todos():
    todos = read_todos()
    return jsonify(todos)

# ---------------- ADD TODO ----------------
@app.route("/todos", methods=["POST"])
def add_todo():
    data = request.get_json()
    todos = read_todos()
    todo_item = {"id": len(todos)+1, "task": data["task"]}
    todos.append(todo_item)
    save_todos(todos)

    return {"message": "Task added", "todo": todo_item}, 201

# ---------------- RUN APP ----------------
if __name__ == "__main__":
    if not os.path.exists(FILE_NAME):
        with open(FILE_NAME, "w") as f:
            json.dump([], f)  # initialize with an empty list

    app.run(host="0.0.0.0")
