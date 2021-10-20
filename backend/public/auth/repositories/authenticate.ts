import { User } from "../../../models/user";
import { Pool, PoolClient } from "pg";
import poolConnection from "../../../../database";
import hash from "../../../../hash";
import { LoginInformation } from "../models/login_info";


export const getUserByLoginInfo: (info: LoginInformation) => Promise<User | null> = async ({ password, username }) => {
    const client = await poolConnection.connect();
    try {

        const response = await client!.query
            ('SELECT * FROM users WHERE username = $1 AND password = $2',
                [username.toLowerCase(), await hash(password)]);
        return response.rows[0] ? response.rows[0] as User : null;
    } catch (e) {
        //TODO: LOG TO FILE
        // throw new Error(e);
    } finally {
        client.release();
    }
}