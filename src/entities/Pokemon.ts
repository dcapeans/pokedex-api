import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("pokemons")
export default class Pokemon {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  number: string;

  @Column()
  weight: string;

  @Column()
  height: string;

  @Column()
  base_exp: string;

  @Column()
  image: string;

  @Column()
  description: string;

  @Column()
  in_my_pokemons: boolean;
}