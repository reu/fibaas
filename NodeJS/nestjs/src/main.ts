import { NestFactory } from '@nestjs/core';
import {
  Controller,
  Get,
  Param,
  ParseIntPipe,
  Module,
  Injectable,
} from '@nestjs/common';

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
class AppService {
  getFibas(number: number): number {
    return fib(number);
  }
}

@Controller()
class AppController {
  constructor(private readonly appService: AppService) {}

  @Get(':number')
  getFibas(@Param('number', ParseIntPipe) number: number): number {
    return this.appService.getFibas(number);
  }
}

@Module({
  imports: [],
  controllers: [AppController],
  providers: [AppService],
})
class AppModule {}

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  await app.listen(4000);
}
bootstrap();
