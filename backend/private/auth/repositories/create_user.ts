import User from "../../../models/user";
import poolConnection from "../../../database";
import hash from "../../../hash";
import NewUser from "../models/new_user";


const createUser: (user: NewUser) => Promise<User | null> = async (user) => {
    const client = await poolConnection.connect();
    try {
        client.query('INSERT INTO users (id, username, password, name,"secondName", lastname, "secondLastname") VALUES ($1,$2,$3,$4,$5,$6,$7)', [
            user.id,
            user.username,
            hash(user.password),
            user.name,
            user.secondName,
            user.lastname,
            user.secondLastname,
        ])

        return {
            id: user.id,
            name: user.name,
            lastname: user.lastname,
            username: user.username,
            secondName: user.secondName,
            secondLastname: user.secondLastname

        }
    } catch (e) {
        //TODO: LOG TO FILE
        // throw new Error(e);
    } finally {
        client.release();
        return null;
    }
}

export default createUser