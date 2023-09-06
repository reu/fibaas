import { Injectable } from '@nestjs/common';

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

@Injectable()
export class AppService {
  getFibas(number: number): number {
    return fib(number);
  }
}
