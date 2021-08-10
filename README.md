# Pokedex API

A simple pokedex app for looking pokemon info and adding them to your own team.

Try it out now at https://pokedex-front.vercel.app/

Below are the implemented features:

- Sign Up
- Login
- List first Gen 151 pokemons
- Show individual pokemon information
- Add pokemon to your team
- Remove pokemon from your team

## Technologies
The following tools and frameworks were used in the construction of the project:<br>

<p>
  <img style='margin: 5px;' src='https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white'>
  <img style='margin: 5px;' src='https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white'>
  <img style='margin: 5px;' src='https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white'>
  <img style='margin: 5px;' src='https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white'>
  <img style='margin: 5px;' src='https://img.shields.io/badge/Jest-C21325?style=for-the-badge&logo=jest&logoColor=white'>
</p>

## How to run

1. Clone this repository
2. Clone the front-end repository at https://github.com/dcapeans/pokedex-front
3. Follow instructions to run front-end at https://github.com/dcapeans/pokedex-front
4. Install dependencies
```bash
npm i
```
5. Create a PostgresSQL database "your_database_dev"
6. Create a .env file and config it with your database URL
7. Create tables and seed the database, it may take a couple minutes to seed
```bash
npm run seed-db
```
8. Run the back-end with
```bash
npm run dev
```
6. You can optionally build the project running
```bash
npm run build
```
7. Finally access http://localhost:3000 on your favorite browser (unless it is Internet Explorer. In this case, review your life decisions)
