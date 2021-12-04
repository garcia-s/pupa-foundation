import { PORT } from './core/config';
import express from 'express';
import cors from 'cors';

const app = express();
app.use(cors({
    origin: () => true,
}));

app.use(express.json())


app.listen(PORT, () => console.log("Listening on port " + PORT));
