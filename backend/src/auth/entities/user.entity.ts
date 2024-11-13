import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Ad } from '../../ads/entities/ad.entity'; 

@Entity('user') 
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  username: string;

  @Column()
  password: string;


  @OneToMany(() => Ad, (ad) => ad.user) 
  ads: Ad[];  

  @OneToMany(() => Ad, (ad) => ad.purchasedBy) 
  purchasedAds: Ad[]; 
}
