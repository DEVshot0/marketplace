import { Module, forwardRef } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AdService } from './ads.service';
import { AdController } from './ads.controller';
import { Ad } from './entities/ad.entity';
import { AuthModule } from '../auth/auth.module';
import { TransactionModule } from '../transactions/transactions.module';  

@Module({
  imports: [
    TypeOrmModule.forFeature([Ad]),
    AuthModule,
    forwardRef(() => TransactionModule),  
  ],
  providers: [AdService],
  controllers: [AdController],
})
export class AdModule {}
