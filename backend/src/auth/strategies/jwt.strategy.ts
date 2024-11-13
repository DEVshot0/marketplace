import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { Strategy, ExtractJwt } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import { JwtPayload } from '../interfaces/jwt-payload.interface';
import { BadRequestException } from '@nestjs/common';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private configService: ConfigService) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey: configService.get<string>('JWT_SECRET'),
    });
  }

  async validate(payload: JwtPayload) {
    console.log('JWT Payload:', payload);  
  
    const userId = Number(payload.sub);  
    console.log('User ID after conversion in strategy:', userId, 'Type:', typeof userId);
  
    if (isNaN(userId)) {
      throw new BadRequestException('ID in JWT payload must be a valid number');
    }
  
    return { sub: payload.sub, username: payload.username };
  }
  
}
