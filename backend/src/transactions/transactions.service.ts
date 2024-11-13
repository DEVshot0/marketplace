import { Injectable, NotFoundException, ForbiddenException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Transaction } from './entities/transaction.entity';
import { Ad } from '../ads/entities/ad.entity';
import { User } from '../auth/entities/user.entity';
import { CreateTransactionDto } from './dto/create-transaction.dto';

@Injectable()
export class TransactionsService {
  constructor(
    @InjectRepository(Transaction)
    private transactionRepository: Repository<Transaction>,
    @InjectRepository(Ad)
    private adRepository: Repository<Ad>,
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async create(createTransactionDto: CreateTransactionDto, userId: number): Promise<Transaction> {
    const { adId } = createTransactionDto;

    const ad = await this.adRepository.findOne({ where: { id: adId }, relations: ['user'] });
    if (!ad) {
      throw new NotFoundException('Anúncio não encontrado');
    }

    if (ad.status === 'unavailable') {
      throw new ForbiddenException('Este anúncio não está disponível para compra');
    }

    if (ad.user.id === userId) {
      throw new ForbiddenException('Você não pode comprar seu próprio anúncio');
    }

    const user = await this.userRepository.findOne({ where: { id: userId } });
    if (!user) {
      throw new NotFoundException('Usuário não encontrado');
    }

    const transaction = this.transactionRepository.create({
      ad,
      user,
      status: 'completed',
    });

    ad.status = 'unavailable'; 

    ad.purchasedBy = user;

    await this.adRepository.save(ad);

    return this.transactionRepository.save(transaction);
  }

  async getUserTransactions(userId: number): Promise<Transaction[]> {
    const transactions = await this.transactionRepository.find({
      where: { user: { id: userId } },  
      relations: ['ad'],  
    });
  
    if (!transactions || transactions.length === 0) {
      throw new NotFoundException('Você não tem transações.');
    }
  
    return transactions;
  }
}
