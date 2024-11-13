import { IsString, IsOptional, IsNumber, IsEnum } from 'class-validator';

export enum AdStatus {
  AVAILABLE = 'available',
  SOLD = 'sold',
}

export class UpdateAdDto {
  @IsOptional() 
  @IsString()
  title?: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsNumber()
  price?: number;

  @IsOptional()
  @IsEnum(AdStatus)  
  status?: AdStatus;
}
