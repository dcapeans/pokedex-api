import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";
import { createUser, createSession } from "../factories/userFactory";
import { clearDatabase } from "../utils/database";
import "../../src/setup"

beforeAll(async () => {
    await init();
});
  
beforeEach(async () => {
    await clearDatabase();
});

afterAll(async () => {
    await getConnection().close();
});

describe("GET /pokemons", () => {
    it("should answer with array of pokemons objects and status 200", async () => {
      const token = await createSession();
  
      const response = await supertest(app).get("/pokemons").set("Authorization", `Bearer ${token}`);;
      
      expect(response.body).toEqual(
        expect.arrayContaining([
          expect.objectContaining({
            id: expect.any(Number),
            name: expect.any(String),
            number: expect.any(String),
            weight: expect.any(String),
            height: expect.any(String),
            baseExp: expect.any(String),
            image: expect.any(String),
            description: expect.any(String),
            inMyPokemons: expect.any(Boolean)
          })
        ])
      );
      expect(response.status).toBe(200);
    });
  });