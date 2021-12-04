import { DBCONFIG } from "../core/config";
import { INSTALL_DBCONFIG } from "./install_config";
import { Pool } from "pg";
import { createUsersTable } from "./tables/user";
import { createDbandUser } from "./initial_setup";
import { createSessionsTable } from "./tables/sessions";
const install = async () => {
    try {
        const pool = new Pool(INSTALL_DBCONFIG);
        await pool.query(`DROP DATABASE IF EXISTS ${DBCONFIG.database}`);
        await pool.query(`DROP USER IF EXISTS ${DBCONFIG.user}`);
        await createDbandUser();
        await createUsersTable();
        await createSessionsTable()

    } catch (e) {
        console.log(e);
    }
    // fs.rm(
    //     __dirname,
    //     { recursive: true, force: true },
    //     (e) => console.log(e)
    // )
}

install();