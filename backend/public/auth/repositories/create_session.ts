import { User } from "../../../models/user";
import poolConnection from "../../../../database";
import crypto from 'crypto'

const generateSessionId: () => string = () =>
    crypto.randomBytes(32).toString('base64');


const createSession: (p: { userId: string, ip: string }) => Promise<string | null> = async ({ userId, ip }) => {
    const client = await poolConnection.connect();
    try {

        while (true) {
            const sess_id = generateSessionId()
            const result = await client.query('SELECT * FROM pupa_sessions WHERE id = $1', [sess_id]);
            if (result.rowCount === 0) {
                await client.query('INSERT INTO pupa_sessions (id, user, ip,) VALUES ($1,$2,$3)',
                    [sess_id, userId, ip])
                return sess_id;
            }
        }
    } catch (e) {
        //TODO: LOG TO FILE
        // throw new Error(e);
    } finally {
        client.release();
        return null;
    }
}

export default createSession