import { Request, Response } from "express";
import * as userService from "../services/userService";
import {getConnection, getRepository} from "typeorm";
import User from "../entities/User";
import bcrypt from 'bcrypt'
import Session from "../entities/Session";
import { v4 as uuidv4 } from 'uuid';


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

export async function signIn (req: Request, res: Response){
  const { email } = req.body
  const result = await userService.getUserByEmail(email)
  const user = result[0]

  const session = await getRepository(Session).find({ where: {user_id: user.id}})
  const activeSession = session[0]
  if(activeSession){
    return res.status(200).send({token: activeSession.token})
  }

  const token = uuidv4()
  await userService.createSession(user.id, token)

  res.status(200).send({token})
}