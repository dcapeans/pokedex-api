import { NextFunction, Request, Response } from "express";
import { getRepository } from "typeorm";
import User from "../entities/User";
import { signUpSchema, signInSchema } from '../schemas/userSchemas'

export async function authSignUp(req: Request, res: Response, next: NextFunction){
    const validation = signUpSchema.validate(req.body)

    if(validation.error){
      return res.sendStatus(400)
    }

    const emailExists = await getRepository(User).find({ where: {email: req.body.email}});
    if (emailExists.length > 0) {
      return res.sendStatus(409);
    }
    next()
}

