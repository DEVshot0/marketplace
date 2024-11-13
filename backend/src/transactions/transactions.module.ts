import { Module, forwardRef } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TransactionsService } from './transactions.service';
import { TransactionController } from './transactions.controller';
import { Transaction } from './entities/transaction.entity';
import { Ad } from '../ads/entities/ad.entity';  
import { AdModule } from '../ads/ads.module';  
import { AuthModule } from '../auth/auth.module';  

@Module({
  imports: [
    TypeOrmModule.forFeature([Transaction, Ad]),  
    forwardRef(() => AdModule),  
    AuthModule,
  ],
  providers: [TransactionsService],
  controllers: [TransactionController],
  exports: [TransactionsService],  
})
export class TransactionModule {}
