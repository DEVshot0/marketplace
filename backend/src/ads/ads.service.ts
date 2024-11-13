import { Injectable, NotFoundException, ForbiddenException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Ad } from './entities/ad.entity';
import { CreateAdDto } from './dto/create-ad.dto';
import { UpdateAdDto } from './dto/update-ad.dto'; 
import { AdStatus } from './dto/update-ad.dto';
import { JwtService } from '@nestjs/jwt';
import { User } from '../auth/entities/user.entity'; 

@Injectable()
export class AdService {
  constructor(
    @InjectRepository(Ad)
    private adRepository: Repository<Ad>,
    @InjectRepository(User)
    private userRepository: Repository<User>, 
  ) {}

  async createAd(createAdDto: CreateAdDto, userId: number): Promise<Ad> {
    const ad = this.adRepository.create({ ...createAdDto, userId });  
    return this.adRepository.save(ad); 
  }

  async findOne(id: number): Promise<Ad> {
    const ad = await this.adRepository.findOne({ where: { id } });  
    if (!ad) {
      throw new NotFoundException(`Ad with ID ${id} not found`);
    }
    return ad;
  }

  async updateAd(id: number, updateAdDto: UpdateAdDto, userId: number): Promise<Ad> {
    const ad = await this.adRepository.findOne({ where: { id } });

    if (!ad) {
      throw new NotFoundException('Anúncio não encontrado');
    }

    if (ad.userId !== userId) {
      throw new ForbiddenException('You can only edit your own ads');
    }

    const updatedAd = Object.assign(ad, updateAdDto);
    return this.adRepository.save(updatedAd);
  }

  async deleteAd(id: number, userId: number): Promise<void> {
    const ad = await this.adRepository.findOne({ where: { id } });

    if (!ad) {
      throw new NotFoundException('Anúncio não encontrado');
    }
    if (ad.userId !== userId) {
      throw new ForbiddenException('You can only delete your own ads');
    }

    await this.adRepository.remove(ad);
  }

  async findAll(filters: any): Promise<{ ads: Ad[], total: number, page: number, lastPage: number }> {
    const { page = 1, limit = 10 } = filters; 
    const offset = (page - 1) * limit;  
  
    const queryBuilder = this.adRepository.createQueryBuilder('ad');

    if (filters.title) {
      queryBuilder.andWhere('ad.title LIKE :title', { title: `%${filters.title}%` });
    }

    if (filters.status) {
      queryBuilder.andWhere('ad.status = :status', { status: filters.status });
    }

    if (filters.price) {
      if (typeof filters.price === 'object') {
        if (filters.price.gt) {
          queryBuilder.andWhere('ad.price > :gt', { gt: filters.price.gt });
        }
        if (filters.price.lt) {
          queryBuilder.andWhere('ad.price < :lt', { lt: filters.price.lt });
        }
        if (filters.price.eq) {
          queryBuilder.andWhere('ad.price = :eq', { eq: filters.price.eq });
        }
      } else {
        const priceValue = parseFloat(filters.price);
        queryBuilder.andWhere('ad.price = :price', { price: priceValue });
      }
    }

    if (filters.userId) {
      queryBuilder.andWhere('ad.userId = :userId', { userId: filters.userId });
    }

    queryBuilder.skip(offset).take(limit); 

    const [ads, total] = await queryBuilder.getManyAndCount();
  
    const lastPage = Math.ceil(total / limit);
  
    return { ads, total, page, lastPage };  
  }

  async findAdsByUser(userId: number): Promise<Ad[]> {
    const ads = await this.adRepository.find({
      where: { userId },  
    });
  

    if (!ads || ads.length === 0) {
      throw new NotFoundException('Você não tem anúncios.');
    }
  
    return ads;
  }

  async findValidAds(): Promise<Ad[]> {
    return this.adRepository.find({ where: { status: AdStatus.AVAILABLE } }); 
  }
  
}
