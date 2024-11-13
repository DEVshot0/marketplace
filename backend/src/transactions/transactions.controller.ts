import { Controller, Post, Body, UseGuards, Request, Get } from '@nestjs/common';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';  
import { CreateTransactionDto } from './dto/create-transaction.dto';
import { TransactionsService } from './transactions.service';

@Controller('transactions')  
export class TransactionController {
  constructor(private readonly transactionService: TransactionsService) {}

  @Post()
  @UseGuards(JwtAuthGuard)  
  async create(
    @Body() createTransactionDto: CreateTransactionDto, 
    @Request() req  
  ) {
    const userId = req.user.sub; 
    return this.transactionService.create(createTransactionDto, userId); 
  }

  @Get('purchased')
  @UseGuards(JwtAuthGuard)  
  async getUserTransactions(@Request() req) {
    const userId = req.user.sub; 
    return this.transactionService.getUserTransactions(userId);  
  }
  
}
