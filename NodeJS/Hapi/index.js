var cluster = require("cluster");

if (cluster.isMaster) {
  var cpus = require("os").cpus().length;
  for (var i = 0; i < cpus; i++) cluster.fork();
} else {
  var hapi = require("hapi");
  var server = new hapi.Server();

  function fib(n) {
    switch (n) {
      case 0: return 0
      case 1: return 1
      default: return fib(n - 1) + fib(n - 2);
    }
  }

  server.connection({ port: 4000 });

  server.route({
    method: "GET",
    path: "/{number}",
    handler: function(request, reply) {
      return reply(fib(request.params.number));
    }
  });

  server.start();
}
