import { Request, Response } from 'express';
import config from './config';

const API_TOKEN = "ApiToken";

export function Authorize(req: Request, res: Response): boolean{
    try {
        const [schema, value] = req.headers.authorization?.split(" ") ?? [];
        
        if (schema.toLowerCase() === API_TOKEN.toLowerCase() && value === config.ApiToken){
            return true
        }

        throw new Error("Unauthorized");
    }
    catch (e) {
        res.status(401).send("UnauthorizedError");
        res.end();

        throw e;
    }
}