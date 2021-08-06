import { NextFunction, Request, Response } from "express";
import { getRepository } from "typeorm";
import User from "../entities/User";
import { signUpSchema, signInSchema } from '../schemas/userSchemas'
import bcrypt from 'bcrypt'

import * as userService from '../services/userService'

export async function authSignUp(req: Request, res: Response, next: NextFunction){
  const validation = signUpSchema.validate(req.body)

  if(validation.error){
    return res.sendStatus(400)
  }

  const emailExists = await userService.getUserByEmail(req.body.email);
  if (emailExists.length > 0) {
    return res.sendStatus(409);
  }
  next()
}

export async function authSignIn(req: Request, res: Response, next: NextFunction){
  const validation = signInSchema.validate(req.body)

  if(validation.error){
    return res.sendStatus(400)
  }
  const foundUser = await userService.getUserByEmail(req.body.email);
  
  if (foundUser.length === 0 || !bcrypt.compareSync(req.body.password, foundUser[0].password)) {
    console.log("entrou")
    return res.sendStatus(401);
  }
  next()
}

