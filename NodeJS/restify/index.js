const cluster = require("cluster");

if (cluster.isMaster) {
  require("os")
    .cpus()
    .forEach(() => cluster.fork());
} else {
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

  const restify = require("restify");
  const app = restify.createServer();

  app.get("/:number", function (req, res, next) {
    res.setHeader("content-type", "text/plain");
    res.send(fib(req.params.number).toString());
    return next();
  });

  app.listen(4000);
}
