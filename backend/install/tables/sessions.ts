import { DBCONFIG } from "../../core/config";
import pg from "pg";

export const createSessionsTable: () => Promise<void> = async () => {
  try {
    const pool = new pg.Pool(DBCONFIG);
    console.log("Creating SESSION'S table");
    await pool.query(`
    CREATE TABLE public."pupa_sessions"
    (   
        "sessid" text NOT NULL,
        "start" text NOT NULL,
        "expires" text NOT NULL,
        "user" uuid NOT NULL,
        PRIMARY KEY (sessid)
    )`);
    pool.end();
    console.log("DONE!");
  } catch (e) {
    console.error("ERROR WHILE CREATING THE SESSIONS TABLE");
    throw new Error(e);
  }
};
