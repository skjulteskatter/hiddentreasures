import { ClientRequest, IncomingMessage } from "http";
import { get, RequestOptions } from "https";
import config from './config';

export async function DownloadBigGuitarJson() : Promise<string> {
    const jsonLink: string = await GetInstrumentJsonLink("Guitar");
    if (jsonLink.length <= 0){
        return "";
    }

    return await http.get(jsonLink);
}


async function GetInstrumentJsonLink(instrument: string): Promise<string>{
    const responseBody = await stApi.get("/api/Utilities/File/" + instrument);

    try {
        return JSON.parse(responseBody)["directUrl"];
    }
    catch(e:any){
        console.log("Couldn't parse json link result: " + e);
        return "";
    }

}

export async function GetMXMLData(directUrl: string) : Promise<string> {
    return (await http.get(directUrl)).replace(/(\r\n|\r|\n)/g," ").replace(/"/g, "'");
}

type HttpMethod = "get" | "post" | "delete";

export const stApi = {
    get(path: string) {
        const url = new URL(config.STAddress);
        let port = url.protocol === "https:" ? "443" : "80";
        if (url.port.length > 0) {
            port = url.port
        }
    
        const options = {
            hostname: url.hostname,
            port: port,
            path,
            method: 'GET',
            headers: {
                'Authorization': `ApiToken ${config.ApiToken}`,
                'X-Api-Version': '4.0'
            }
        }

        if (url.hostname !== "api.songtreasures.app") {
            process.env['NODE_TLS_REJECT_UNAUTHORIZED'] = "0";
        }
    
        return http.get(options)
    }
}

class Http {
    public get(options: string | URL | RequestOptions) {
        return this.fetch("get", options);
    }

    private parseResult(result: IncomingMessage, resolve: (object: string) => void, reject: (object: any) => void) {
        result.setEncoding('utf8');
        let responseBody = '';

        result.on('data', (chunk: any) => {
            responseBody += chunk;
        });

        result.on('end', () => {
            resolve(responseBody);
        });

        result.on('error', (e) => {
            reject(e);
        })
    }

    private fetch(method: HttpMethod, options: string | URL | RequestOptions): Promise<string> {
        return new Promise((resolve, reject) => {
            let request: ClientRequest | null = null

            switch (method) {
                case "get":
                    request = get(options, (result) => this.parseResult(result, resolve, reject));
                    break;
                default:
                    throw new Error("Method not supported");
            }

            request.on('error', (err: any) => {
                reject(err);
            });
            request.end();
        });
    }
}

export const http = new Http();