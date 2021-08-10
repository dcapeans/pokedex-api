/** @format */

import './setup';

import express, { NextFunction, Request, Response } from 'express';
import cors from 'cors';
import 'reflect-metadata';

import connectDatabase from './database';

import * as userController from './controllers/userController';
import * as pokemonController from './controllers/pokemonController';
import * as userMiddleware from './middlewares/userMiddleware';
import * as pokemonMiddleware from './middlewares/pokemonMiddleware';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/users', userController.getUsers);
app.post('/sign-up', userMiddleware.authSignUp, userController.signUp);
app.post('/sign-in', userMiddleware.authSignIn, userController.signIn);

app.get('/pokemons', pokemonMiddleware.validateToken, pokemonController.catchThemAll);
app.post('/my-pokemons/:id/add', pokemonMiddleware.validateToken, pokemonController.catchPokemon);
app.post('/my-pokemons/:id/remove', pokemonMiddleware.validateToken, pokemonController.removePokemon);

app.use((err: any, req: Request, res: Response, next: NextFunction) => {
  console.log(err);
  return res.status(500).send('Deu ruim');
});

export async function init() {
  await connectDatabase();
}

export default app;
