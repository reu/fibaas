import { Controller, Get, Param, ParseIntPipe } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get(':number')
  getFibas(@Param('number', ParseIntPipe) number: number): number {

    return this.appService.getFibas(number);
  }
}
