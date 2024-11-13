import { Controller, Post, Body, Get, UseGuards, Request } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import { LoginDto } from './dto/login.dto';
import { User } from './entities/user.entity';
import { JwtAuthGuard } from './jwt-auth.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  async register(@Body() registerDto: RegisterDto) {
    return this.authService.register(registerDto);
  }

  @Post('login')
  async login(@Body() loginDto: LoginDto) {
    return this.authService.login(loginDto);
  }

  @Get('users')
  async getUsers(): Promise<User[]> {
    return this.authService.getUsers();
  }

  @Get('get-sub')
  @UseGuards(JwtAuthGuard)
  getSub(@Request() req) {
    console.log('User ID from token:', req.user.sub);
    return { sub: req.user.sub }; 
  }
}
