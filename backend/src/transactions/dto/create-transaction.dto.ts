import { IsNotEmpty, IsNumber, IsString, IsEnum } from 'class-validator';

export class CreateTransactionDto {
  @IsNumber()
  @IsNotEmpty()
  adId: number;  

  @IsNumber()
  @IsNotEmpty()
  userId: number;  

  @IsString()
  @IsNotEmpty()
  @IsEnum(['pending', 'completed', 'failed'])  
  status: string;  
}
