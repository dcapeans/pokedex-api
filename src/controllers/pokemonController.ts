import { Request, Response } from "express";

import * as userService from "../services/userService";
import * as pokemonService from "../services/pokemonService";

export async function catchThemAll (req: Request, res: Response) {
   const token = req.headers['authorization']?.replace("Bearer ", "")
   const session = await userService.getSession(token) 

   if(!token || !session) return res.sendStatus(401)

    const pokemons = await pokemonService.getPokemons()
    console.log(pokemons)
}