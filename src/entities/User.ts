import { Entity, PrimaryGeneratedColumn, Column, OneToMany, ManyToMany, JoinTable } from 'typeorm';
import Pokemon from './Pokemon';
import Session from './Session';
@Entity('users')
export default class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column()
  password: string;

  @ManyToMany(() => Pokemon)
  @JoinTable()
  pokemons: Pokemon[];

  @OneToMany(() => Session, (session) => session.user)
  sessions: Session[];
}
