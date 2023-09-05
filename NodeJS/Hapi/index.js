const cluster = require("cluster");

if (cluster.isMaster) {
  require("os")
    .cpus()
    .forEach(() => cluster.fork());
} else {
  const Hapi = require("@hapi/hapi");

  const server = Hapi.server({
    port: 4000,
    host: "localhost",
  });

  function fib(n) {
    switch (n) {
      case 0:
        return 0;
      case 1:
        return 1;
      default:
        return fib(n - 1) + fib(n - 2);
    }
  }

  server.route({
    method: "GET",
    path: "/{number}",
    handler: req => {
      return fib(req.params.number);
    },
  });

  server.start();
}
