import { PORT } from './config';
import express from 'express';
import cors from 'cors';
import publicRouter from './public/public_router';

const app = express();
app.use(cors({
    origin: () => true,
}));

app.use(express.json())
app.use('/api', publicRouter)
// app.use('/pupadmin',privateRouter );

app.listen(PORT, () => console.log("Listening on port " + PORT));
