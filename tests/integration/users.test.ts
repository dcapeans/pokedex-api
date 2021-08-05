import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";
import { createUser } from "../factories/userFactory";
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

describe("GET /users", () => {
  it("should answer with text \"OK!\" and status 200", async () => {
    const user = await createUser();

    const response = await supertest(app).get("/users");
    
    expect(response.body).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          email: user.email
        })
      ])
    );

    expect(response.status).toBe(200);
  });
});

describe("POST /sign-up", () => {
  it("should answer with status 201", async () => {
    const body = { email: "test@test.com", password: "123456", confirmPassword: "123456"}

    const response = await supertest(app).post("/sign-up").send(body);

    expect(response.status).toBe(201);
  });
});


