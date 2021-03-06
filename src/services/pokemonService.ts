import { Request, Response } from 'express';
import { getRepository, getConnection } from 'typeorm';
import Pokemon from '../entities/Pokemon';
import User from '../entities/User';
import * as userService from '../services/userService';

export async function getPokemons() {
  const pokemons = await getRepository(Pokemon).find();
  return pokemons;
}

export async function getPokemonById(id: number) {
  const pokemon = await getRepository(Pokemon).find({ where: { id: id } });
  return pokemon[0];
}

export async function addPokemonForUser(token: string, pokemonId: number) {
  const session = await userService.getSession(token);
  const user = await userService.getUserById(session[0].user_id);

  const pokemon = await getPokemonById(pokemonId);

  await getConnection().createQueryBuilder().relation(User, 'pokemons').of(user).add(pokemon);
}

export async function removePokemonForUser(token: string, pokemonId: number) {
  const session = await userService.getSession(token);
  const user = await userService.getUserById(session[0].user_id);

  const pokemon = await getPokemonById(pokemonId);

  await getConnection().createQueryBuilder().relation(User, 'pokemons').of(user).remove(pokemon);
}

export async function checkIfUserHasPokemon(token: string) {
  const session = await userService.getSession(token);

  const userPokemons = await getRepository(User).find({
    where: { id: session[0].user_id },
    relations: ['pokemons'],
  });
  const userPokemonsId = userPokemons[0]?.pokemons.map((p) => p.id);
  return userPokemonsId;
}
