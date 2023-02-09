import { ClientRequest, IncomingMessage } from "http"
import { get, RequestOptions } from "https"
import config from "./config"
import { client } from "./sanity"

export async function DownloadBigGuitarJson(): Promise<string> {
    const jsonLink: string = await GetInstrumentJsonLink("Guitar")
    if (jsonLink.length <= 0) {
        return ""
    }
    return await http.get(jsonLink)
}

async function GetInstrumentJsonLink(instrument: string): Promise<string> {
    const result = await client.fetch("*[_type == \"chordData\" && instrument->name == $instrument][0]{'fileUrl': guitarFile.asset->url}", {instrument})
    return result?.fileUrl ?? ""
}

export async function GetMXMLData(directUrl: string): Promise<string> {
    return (await http.get(directUrl))
        .replace(/(\r\n|\r|\n)/g, " ")
        .replace(/"/g, "'")
}

type HttpMethod = "get" | "post" | "delete"

class Http {
    public get(options: string | URL | RequestOptions) {
        return this.fetch("get", options)
    }

    private parseResult(
        result: IncomingMessage,
        resolve: (object: string) => void,
        reject: (object: any) => void
    ) {
        result.setEncoding("utf8")
        let responseBody = ""

        result.on("data", (chunk: any) => {
            responseBody += chunk
        })

        result.on("end", () => {
            resolve(responseBody)
        })

        result.on("error", (e) => {
            reject(e)
        })
    }

    private fetch(
        method: HttpMethod,
        options: string | URL | RequestOptions
    ): Promise<string> {
        return new Promise((resolve, reject) => {
            let request: ClientRequest | null = null

            switch (method) {
                case "get":
                    request = get(options, (result) =>
                        this.parseResult(result, resolve, reject)
                    )
                    break
                default:
                    throw new Error("Method not supported")
            }

            request.on("error", (err: any) => {
                reject(err)
            })
            request.end()
        })
    }
}

export const http = new Http()
