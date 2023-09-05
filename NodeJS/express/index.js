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

  const express = require("express");
  const app = express();

  app.get("/:number", function (req, res) {
    res.end(fib(req.params.number).toString());
  });

  app.listen(4000);
}
