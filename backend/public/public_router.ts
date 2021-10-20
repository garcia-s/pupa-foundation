import express from "express";
import authRouter from './auth/auth';

const publicRouter = express.Router();
publicRouter.use('/auth', authRouter);


export default publicRouter;