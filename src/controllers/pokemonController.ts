import { Request, Response } from "express";

import * as userService from "../services/userService";
import * as pokemonService from "../services/pokemonService";

export async function catchThemAll (req: Request, res: Response) {
    try {
        const token = req.headers['authorization']?.replace("Bearer ", "")
        const session = await userService.getSession(token) 
        
        if(!token || !session) return res.sendStatus(401)
        
        const pokemons = await pokemonService.getPokemons()
        const parsePokemons: any[] = pokemons.map(p => (
            {
                id: p.id,
                name: p.name,
                number: p.number,
                weight: p.weight,
                height: p.height,
                baseExp: p.base_exp,
                image: p.image,
                description: p.description,
                inMyPokemons: p.in_my_pokemons
            }
        ))
        res.send(parsePokemons).status(200)
    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}