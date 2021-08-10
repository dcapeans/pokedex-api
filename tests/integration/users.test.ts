import supertest from 'supertest';
import { getConnection } from 'typeorm';

import app, { init } from '../../src/app';
import { createUser } from '../factories/userFactory';
import { clearDatabase } from '../utils/database';
import '../../src/setup';

beforeAll(async () => {
  await init();
});

beforeEach(async () => {
  await clearDatabase();
});

afterAll(async () => {
  await getConnection().close();
});

describe('GET /users', () => {
  it('should answer with text "OK!" and status 200', async () => {
    const user = await createUser();

    const response = await supertest(app).get('/users');

    expect(response.body).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          email: user.email,
        }),
      ])
    );

    expect(response.status).toBe(200);
  });
});

describe('POST /sign-up', () => {
  it('should answer with status 201', async () => {
    const body = { email: 'test@test.com', password: '123456', confirmPassword: '123456' };

    const response = await supertest(app).post('/sign-up').send(body);

    expect(response.status).toBe(201);
  });
  it('should answer with status 400 for invalid email', async () => {
    const body = { email: 'test', password: '123456', confirmPassword: '123456' };

    const response = await supertest(app).post('/sign-up').send(body);

    expect(response.status).toBe(400);
  });
  it('should answer with status 400 for password and confirmPassword not matching', async () => {
    const body = { email: 'test', password: '123456', confirmPassword: '456789' };

    const response = await supertest(app).post('/sign-up').send(body);

    expect(response.status).toBe(400);
  });
  it('should answer with status 409 for email already exists', async () => {
    await createUser();
    const body = { email: 'email@email.com', password: '123456', confirmPassword: '123456' };
    const response = await supertest(app).post('/sign-up').send(body);

    expect(response.status).toBe(409);
  });
});

describe('POST /sign-in', () => {
  it('should answer with status 200', async () => {
    const user = await createUser();
    const body = { email: user.email, password: '123456' };

    const response = await supertest(app).post('/sign-in').send(body);

    expect(response.status).toBe(200);
    expect(response.body).toEqual(expect.objectContaining({ token: expect.any(String) }));
  });
  it('should answer with status 400 for invalid email', async () => {
    const body = { email: 'test', password: '123456' };

    const response = await supertest(app).post('/sign-in').send(body);

    expect(response.status).toBe(400);
  });
  it('should answer with status 401 for invalid email and password', async () => {
    await createUser();
    const body = { email: 'teste123@teste.com', password: '123789456' };

    const response = await supertest(app).post('/sign-in').send(body);

    expect(response.status).toBe(401);
  });
});
