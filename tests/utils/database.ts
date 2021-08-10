import { getRepository, getConnection } from 'typeorm';
import User from '../../src/entities/User';
import * as userService from '../../src/services/userService';
import * as pokemonService from '../../src/services/pokemonService';
import { createUser, createSession } from '../factories/userFactory';

export async function clearDatabase() {
  await getRepository(User).delete({});
}

export async function addPokemonForUser() {
  const token = await createSession();
  const session = await userService.getSession(token);
  const user = await userService.getUserById(session[0].user_id);
  const pokemonId = 1;
  const pokemon = await pokemonService.getPokemonById(pokemonId);

  await getConnection().createQueryBuilder().relation(User, 'pokemons').of(user).add(pokemon);

  return token;
}
