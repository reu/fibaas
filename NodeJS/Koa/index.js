const cluster = require("cluster");

if (cluster.isMaster) {
  require("os")
    .cpus()
    .forEach(() => cluster.fork());
} else {
  const Koa = require("koa");
  const route = require("koa-route");

  const app = new Koa();

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

  app.use(
    route.get("/:number", (ctx, number) => {
      ctx.body = fib(number).toString();
    }),
  );

  app.listen(4000);
}
