var cluster = require("cluster");

if (cluster.isMaster) {
  var cpus = require("os").cpus().length;
  for (var i = 0; i < cpus; i++) cluster.fork();
} else {
  var koa = require("koa");
  var route = require("koa-route");

  var app = koa();

  function fib(n) {
    switch (n) {
      case 0: return 0
      case 1: return 1
      default: return fib(n - 1) + fib(n - 2);
    }
  }

  app.use(route.get("/:number", function *(number) {
    this.body = fib(number);
  }));

  app.listen(4000);
}
