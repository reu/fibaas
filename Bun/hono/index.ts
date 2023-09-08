import { Hono } from "hono";

const app = new Hono();

function fib(n: number): number {
  switch (n) {
    case 0:
      return 0;
    case 1:
      return 1;
    default:
      return fib(n - 1) + fib(n - 2);
  }
}

app.get("/:number", (c) => {
  const number = c.req.param("number");
  return c.text(String(fib(Number(number))));
});

const port = 4000;

console.log(`Running at http://localhost:${port}`);

export default {
  port,
  fetch: app.fetch,
};
