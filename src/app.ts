import "./setup";

import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database";

import * as userController from "./controllers/userController";
import * as userMiddleware from './middlewares/userMiddleware'

const app = express();
app.use(cors());
app.use(express.json());

app.get("/users", userController.getUsers);
app.post("/sign-up", userMiddleware.authSignUp, userController.signUp)
app.post("/sign-in", userMiddleware.authSignIn, userController.signIn)

export async function init () {
  await connectDatabase();
}

export default app;
