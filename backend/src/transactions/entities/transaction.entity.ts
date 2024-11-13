import { Entity, PrimaryGeneratedColumn, ManyToOne, JoinColumn, Column } from 'typeorm';
import { Ad } from '../../ads/entities/ad.entity';
import { User } from '../../auth/entities/user.entity';

@Entity()
export class Transaction {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => Ad, { nullable: false })
  @JoinColumn({ name: 'ad_id' })
  ad: Ad;

  @ManyToOne(() => User, { nullable: false })
  @JoinColumn({ name: 'user_id' })
  user: User;

  @Column({ default: 'pending' })
  status: string;
}
