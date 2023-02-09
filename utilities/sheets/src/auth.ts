import { Request, Response } from "express"
import config from "./config"

const API_TOKEN = "ApiToken"

export function Authorize(req: Request, res: Response): boolean {
    const [schema, value] = req.headers.authorization?.split(" ") ?? []

    if (
        schema.toLowerCase() === API_TOKEN.toLowerCase() &&
        value === config.secret
    ) {
        return true
    }

    res.status(401).send("UnauthorizedError")
    res.end()
    return false
}
