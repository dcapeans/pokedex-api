import { Request, Response } from 'express';
import { getRepository, getConnection } from 'typeorm';
import Session from '../entities/Session';

import User from '../entities/User';

export async function getUsers() {
  const users = await getRepository(User).find({
    select: ['id', 'email'],
  });

  return users;
}

export async function getUserByEmail(email: string) {
  const user = await getRepository(User).find({ where: { email: email } });
  return user;
}

export async function getUserById(id: number) {
  const user = await getRepository(User).find({ where: { id: id } });
  return user;
}

export async function createSession(userId: number, token: string) {
  await getConnection()
    .createQueryBuilder()
    .insert()
    .into(Session)
    .values([{ user_id: userId, token: token }])
    .execute();
}

export async function getSession(token: string) {
  const session = await getRepository(Session).find({ where: { token: token } });
  return session;
}
