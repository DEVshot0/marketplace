import { Controller, Get } from '@nestjs/common';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from './jwt-auth.guard'; 

@Controller('protected') 
export class ProtectedController {


  @Get()
  @UseGuards(JwtAuthGuard) 
  getProtectedData() {
    return { message: 'This is a protected route, accessible only with a valid JWT' };
  }
}
