import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { User } from '../../auth/entities/user.entity';

@Entity('ad')
export class Ad {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column('text')
  description: string;

  @Column('decimal')
  price: number;

  @Column({ default: 'available' })
  status: string;

  @ManyToOne(() => User, (user) => user.ads)  
  @JoinColumn({ name: 'userId' })
  user: User;

  @Column()
  userId: number;

  @ManyToOne(() => User, (user) => user.purchasedAds, { nullable: true })  
  @JoinColumn({ name: 'purchasedBy' })
  purchasedBy: User | null;  
}
