from wheezy.http import HTTPResponse
from wheezy.http import WSGIApplication
from wheezy.web.handlers import BaseHandler
from wheezy.routing import url
from wheezy.web.middleware import bootstrap_defaults
from wheezy.web.middleware import path_routing_middleware_factory

def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

class FibaasHandler(BaseHandler):
    def get(self):
        number = int(self.route_args["number"])
        response = HTTPResponse()
        response.write(str(fib(number)))
        return response

all_urls = [
    url("{number}", FibaasHandler, name="fib"),
]

app = WSGIApplication(
    middleware=[
        bootstrap_defaults(url_mapping=all_urls),
        path_routing_middleware_factory,
    ],
    options={}
)
