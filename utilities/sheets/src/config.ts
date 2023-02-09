// import { config } from 'dotenv';

// config();

export default {
    ApiToken: process.env.ST_APITOKEN ?? '123456',
    STAddress: process.env.ST_ADDRESS ?? 'https://localhost:44301',
    Port: process.env.PORT ?? '5016',
}