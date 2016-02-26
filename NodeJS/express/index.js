var cluster = require("cluster");

if (cluster.isMaster) {
  var cpus = require("os").cpus().length;
  for (var i = 0; i < cpus; i++) cluster.fork();
} else {
  function fibonacci(n) {
    switch (n) {
      case 0: return 0
      case 1: return 1
      default: return fibonacci(n - 1) + fibonacci(n - 2);
    }
  }

  var express = require("express");
  var app = express();

  app.get("/:number", function(req, res) {
    res.end(fibonacci(req.params.number).toString());
  });

  app.listen(4000);
}
