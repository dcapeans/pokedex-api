import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import User from './User';

@Entity('sessions')
export default class Session {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  user_id: number;

  @Column()
  token: string;

  @ManyToOne(() => User, (user) => user.sessions)
  user: User;
}
