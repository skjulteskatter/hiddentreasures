import { config } from 'dotenv';

config();

export default {
    secret: process.env.ST_APITOKEN ?? "123456",
    sanity: {
        token: process.env.SANITY_TOKEN!,
        projectId: process.env.SANITY_PROJECT_ID!,
    },
    port: process.env.PORT ?? "5016",
}
