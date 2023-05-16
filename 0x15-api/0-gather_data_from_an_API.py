#!/usr/bin/python3
"""script that, using REST API, for a given employee ID,
returns information about his/her TODO list progress.
"""
import requests
import sys


if __name__ == "__main__":
    u_id = "{}".format(sys.argv[1])
    user_url = "https://jsonplaceholder.typicode.com/users/"
    todo_url = "https://jsonplaceholder.typicode.com/todos/"
    user = requests.get(user_url + u_id).json()
    todos = requests.get(todo_url, params={"userId": u_id}).json()

    completed_task = [task.get("title") for task in todos
                      if task.get("completed") is True]
    print("Employee {:s} is done with tasks({:d}/{:d}):".format(
            user.get("name"), len(completed_task), len(todos)))
    result = ["\t {}".format(title) for title in completed_task]
    [print(item.expandtabs(4)) for item in result]
