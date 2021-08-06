import { NextFunction, Request, Response } from "express";

import * as userService from '../services/userService'

export async function validateToken(req: Request, res: Response, next: NextFunction){
    const token = req.headers['authorization']?.replace("Bearer ", "")
    const session = await userService.getSession(token) 
    
    if(!token || !session) return res.sendStatus(401)
    next()
}