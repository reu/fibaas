import flask

app = flask.Flask(__name__)

def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

@app.route("/<int:number>")
def fibaas(number):
    return str(fib(number))
