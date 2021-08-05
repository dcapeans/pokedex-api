import axios from "axios";
import { getConnection } from "typeorm";
import "./setup"
import { init } from "./app";

interface newPokemon {
    number: Number;
    name: String;
    image: String;
    weight: Number;
    height: Number;
    baseExp: Number;
    description: String;
    inMyPokemons: Boolean;
}

const pokedex: any[] = []

const getPokemons = async () => {
    for(let i = 1; i < 152; i++){
        const pokemon: newPokemon = {
            number: 1,
            name: "",
            image: `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${i}.png`,
            weight: 1,
            height: 1,
            baseExp: 1,
            description: "",
            inMyPokemons: false
        }

        if(i < 31){
            await axios.get(`https://pokeapi.co/api/v2/characteristic/${i}`)
            .then((res) => {
                pokemon.description = res.data.descriptions[2].description
            })
            .catch((e) => {
                console.log(e)
            })
        } else{
            pokemon.description = "!!Work in progress!!"
        }
        
        await axios.get(`https://pokeapi.co/api/v2/pokemon/${i}`)
        .then((res) => {
            pokemon.number = res.data.id
            pokemon.name = res.data.name
            pokemon.weight = res.data.weight
            pokemon.height = res.data.height
            pokemon.baseExp = res.data.base_experience
        })
        .catch((e) => {
            console.log(e)
        })
        pokedex.push(pokemon)
    }
};

const insertIntoDB = async () => {
    for (let i = 0; i < pokedex.length; i++) {
        const pokemon = pokedex[i];
        
        await getConnection()
        .createQueryBuilder()
        .insert()
        .into('pokemons')
        .values([
            { 
                name: pokemon.name, 
                number: pokemon.number,
                weight: pokemon.weight,
                height: pokemon.height,
                description: pokemon.description,
                image: pokemon.image,
                base_exp: pokemon.baseExp,
                in_my_pokemons: pokemon.inMyPokemons
            }
        ])
        .execute();
    }
}

init().then(() => {
    getPokemons().then(() => {
        insertIntoDB()
    })
})
