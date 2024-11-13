import { Controller, Post, Body, Get, Param, Patch, Delete, UseGuards, Request, ForbiddenException, Query } from '@nestjs/common';
import { AdService } from './ads.service';
import { CreateAdDto } from './dto/create-ad.dto';
import { UpdateAdDto } from './dto/update-ad.dto';  
import { JwtAuthGuard } from '../auth/jwt-auth.guard';  

@Controller('ads')
export class AdController {
  constructor(private readonly adService: AdService) {}

  @Get('teste')
  helloWorld() {
    return { message: 'Hello World' };
  }

  @Get('get-sub')
  @UseGuards(JwtAuthGuard)
  getSub(@Request() req) {
    console.log('User ID from token:', req.user.sub);
    return { sub: req.user.sub }; 
  }

  @Get('user-ads')
  @UseGuards(JwtAuthGuard)
  async findAdsByUser(@Request() req) {

    const userId = req.user.sub;  
    console.log('Buscando anúncios para o userId:', userId);
  

    return this.adService.findAdsByUser(userId);
  }
  

  @Get('valid')
  async findValidAds() {
    return this.adService.findValidAds();
  }

  @Post()
  @UseGuards(JwtAuthGuard)  
  async create(@Body() createAdDto: CreateAdDto, @Request() req) {
    const userId = req.user.sub;  
    return this.adService.createAd(createAdDto, userId);
  }
  

  @Get()
  async findAll(@Query() filters: any) {
    const page = parseInt(filters.page) || 1;   
    const limit = parseInt(filters.limit) || 10; 

    return this.adService.findAll({ ...filters, page, limit });
  }

  @Get(':id')
  async findOne(@Param('id') id: number) {
    return this.adService.findOne(id);  
  }

  @Patch(':id')
  @UseGuards(JwtAuthGuard)
  async update(@Param('id') id: number, @Body() updateAdDto: UpdateAdDto, @Request() req) {
    const userId = req.user.sub;
  
    return this.adService.updateAd(id, updateAdDto, userId);
  }

  @Delete(':id')
  @UseGuards(JwtAuthGuard)
  async remove(@Param('id') id: number, @Request() req) {
    const userId = req.user.sub;
    return this.adService.deleteAd(id, userId);
  }
}
