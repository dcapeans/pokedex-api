import { Request, Response } from "express";

import * as pokemonService from "../services/pokemonService";

export async function catchThemAll (req: Request, res: Response) {
    try {        
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

export async function catchPokemon(req: Request, res: Response){
    try {
        const pokemonId = +req.params.id
        const token = req.headers['authorization']?.replace("Bearer ", "")

        await pokemonService.addPokemonForUser(token, pokemonId)
    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}