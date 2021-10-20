
import pg from "pg";

import { DBCONFIG } from "../config";
import { INSTALL_DBCONFIG } from "./install_config";


export const createDbandUser: () => Promise<void> = async () => {
    try {
        const pool = new pg.Pool(INSTALL_DBCONFIG);

        console.log('Creating Database user')
        await pool.query(`CREATE USER ${DBCONFIG.user} WITH PASSWORD '${DBCONFIG.password}'`);
        console.log('Created!')
        console.log('Creating Database');
        await pool.query(`CREATE DATABASE ${DBCONFIG.database} OWNER ${DBCONFIG.user}`);
        console.log('Created!')
        pool.end();
    } catch (e) {
        console.error('ERROR WHILE CREATING DATABASE AND DB USER');
        throw new Error(e);
    }
}