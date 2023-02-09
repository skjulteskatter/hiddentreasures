import createClient from "@sanity/client"
import config from "./config"

export const client = createClient({
    projectId: config.sanity.projectId,
    token: config.sanity.token,
    useCdn: false,
    dataset: "production",
    apiVersion: "2023-02-09"
})