import jwt from 'jsonwebtoken';
import express from "express";
import { isLoginInformation } from "./models/login_info";
import { getUserByLoginInfo } from "./repositories/authenticate";
import createSession from './repositories/create_session'
const authRouter = express.Router();

authRouter.post('/login', async (req, res, next) => {
    if (!isLoginInformation(req.body)) { return res.sendStatus(501) }
    const user = await getUserByLoginInfo(req.body)
    if (user == null) { return res.sendStatus(404) }
    const sess_id = createSession({
        ip: req.ip,
        userId: user.id
    });
    if (sess_id == null) { return res.sendStatus(500) }
    return res.send(sess_id)
});








export default authRouter;