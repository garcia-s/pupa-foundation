import { DBCONFIG } from "../../config";
import pg from "pg";

export const createSessionsTable: () => Promise<void> = async () => {
    try {
        const pool = new pg.Pool(DBCONFIG);
        console.log('Creating SESSION\'S table');
        await pool.query(`
    CREATE TABLE public."pupa_sessions"

    (   
        "id" text NOT NULL,
        "user" uuid NOT NULL,
        "ip" character varying(16) NOT NULL, 
        PRIMARY KEY (id)

    )`)
        pool.end();
        console.log('DONE!');
    } catch (e) {
        console.error('ERROR WHILE CREATING THE SESSIONS TABLE');
        throw new Error(e);
    }
}
