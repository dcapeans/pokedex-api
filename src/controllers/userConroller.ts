import { Request, Response } from "express";
import * as userService from "../services/userService";
import {getConnection} from "typeorm";
import User from "../entities/User";
import bcrypt from 'bcrypt'


export async function getUsers (req: Request, res: Response) {
  try {
    const users = await userService.getUsers();
    res.send(users);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}

export async function signUp (req: Request, res: Response) {
  const { email, password } = req.body

  const hashedPassword = bcrypt.hashSync(password, 12);
  await getConnection()
      .createQueryBuilder()
      .insert()
      .into(User)
      .values([
          { email: email, password: hashedPassword }
      ])
      .execute();

  res.sendStatus(201)
}
