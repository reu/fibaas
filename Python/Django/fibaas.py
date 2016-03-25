from django.apps import apps
from django.conf import settings
from django.conf.urls import url
from django.core.handlers.wsgi import WSGIHandler
from django.core.wsgi import get_wsgi_application
from django.http import HttpResponse

settings.configure(
    ALLOWED_HOSTS=["0.0.0.0", "localhost"],
    ROOT_URLCONF=__name__,
    INSTALLED_APPS=(),
    TEMPLATE_CONTEXT_PROCESSORS=(
        "django.core.context_processors.request",
    ),
    MIDDLEWARE_CLASSES=(
        "django.middleware.common.CommonMiddleware",
    ),
)

def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

def fibaas(request, number):
    return HttpResponse(fib(int(number)))

urlpatterns = (
    url(r"^([0-9]+)$", fibaas),
)

apps.populate(settings.INSTALLED_APPS)

app = WSGIHandler()
