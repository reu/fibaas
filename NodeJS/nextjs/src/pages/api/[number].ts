import type { NextApiRequest, NextApiResponse } from "next";

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

export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<string>
) {
  const number = Number(req.query.number);

  res.status(200).end(String(fib(number)));
}
