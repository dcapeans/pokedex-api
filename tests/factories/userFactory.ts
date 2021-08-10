import { getRepository } from 'typeorm';
import bcrypt from 'bcrypt';

import User from '../../src/entities/User';
import { v4 as uuidv4 } from 'uuid';
import * as userService from '../../src/services/userService';

export async function createUser() {
  const password = '123456';
  const hashedPassword = bcrypt.hashSync(password, 12);
  const user = await getRepository(User).create({
    email: 'email@email.com',
    password: hashedPassword,
  });

  await getRepository(User).save(user);

  return user;
}

export async function createSession() {
  const token = uuidv4();
  await userService.createSession(1, token);
  return token;
}
