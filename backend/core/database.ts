import { DBCONFIG } from './config';
import { Pool } from 'pg';

const poolConnection: Pool = new Pool(DBCONFIG);


export default poolConnection;