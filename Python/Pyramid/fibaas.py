from pyramid.config import Configurator
from pyramid.response import Response
from pyramid.view import view_config

def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

@view_config(route_name="fibonacci")
def fibonacci(request):
    number = int(request.matchdict["number"])
    return Response(str(fib(number)))

config = Configurator()
config.add_route("fibonacci", "/{number}")
config.scan()

app = config.make_wsgi_app()
