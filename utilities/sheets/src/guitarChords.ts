import { DownloadBigGuitarJson } from "./http";
import { IGuitarChordOptions } from "./types";

let bigGuitarJson: {
    [key: string]: {
        f: any[];
        b: any[];
        p: number;
        title?: string;
    }[];
};

const svgdom = require('svgdom');
const svgdotjs = require('@svgdotjs/svg.js');

const svguitar = require('svguitar/dist/lib/svguitar'); //Just svgGuitar doesn't work. Must specify path for some reason
const document = SetUpSvgDom();
const container = document.documentElement;

const MINIMUM_AMOUNT_OF_FRETS: number = 4;
const NUMBER_OF_STRINGS : number = 6;


const subsituteKeys: Map<string,string> = new Map([
    ["Ab","G#"],
    ["Bb","A#"],
    ["Cb","B"],
    ["Db","C#"],
    ["Eb","D#"],
    ["Fb","E"],
    ["Gb","F#"],
    ["B#","C"],
    ["E#","F"]
])

function ExpandJSONChord(compressedChord: any): JSON {

    return JSON.parse(JSON.stringify(compressedChord)
        .replace(/"f"/g,"\"fingers\"")
        .replace(/"b"/g,"\"barres\"")
        .replace(/"p"/g,"\"position\"")
        .replace(/"r"/g,"\"fromString\"")
        .replace(/"o"/g,"\"toString\"")
        .replace(/"e"/g,"\"fret\""));
}

export async function getGuitarChord(options: IGuitarChordOptions) : Promise<Object[]>{
    let chordsArray: any[] = []; 
    let chordName = options.chordName;
    let keyAdjustedChordName: string = await GetJSONFriendlyChordName(chordName);
    chordName = options.drawTitle ? chordName : "";
    if (await GetGuitarJson() === undefined){
        return chordsArray;
    }
    try{
    
        let chordData = (await GetGuitarJson())[keyAdjustedChordName];
        if(!chordData)
        {
            return chordsArray;
        }
        let numberOfChordsLimit = options.allCombinations ? Number.MAX_SAFE_INTEGER : 1;
        for (let i = 0; i < chordData.length; i++) {
            if (i == numberOfChordsLimit)
            {
                break;
            }
            chordData[i]["title"] = chordName;
            chordsArray.push(options.imageFormat === "json" ? ExpandJSONChord(chordData[i]) : GetChordSVGImage(chordData[i], options.width));
        }
        
    } catch (e){
        console.log(`Couldn't find chord exeption: ${e}`);
    }
    return chordsArray;
}


function ResizeSVG(svgData: string, width: number) : string{

    let [posX, posY, oldWidth, oldHeight] = [0, 0, 400, 440];
    let scale = oldHeight / oldWidth;
    let regexArray = svgData.match(/(?<=viewBox=")[^"]*/g);

    if (regexArray && regexArray.length > 0){
        const arr = regexArray[0].split(" ");
        posX = parseFloat(arr[0]);
        posY = parseFloat(arr[1]);
        oldWidth = parseFloat(arr[2]);
        oldHeight = parseFloat(arr[3]);
        scale = oldHeight / oldWidth;
    }

    return svgData.replace(/viewBox="[^"]*"/, ` width="${width}" height="${width*scale}" viewBox="${posX} ${posY} ${oldWidth} ${oldHeight}" `);
}

function SetUpSvgDom() {

    const window = svgdom.createSVGWindow();
    const registerWindow = svgdotjs.registerWindow;
    registerWindow(window, window.document);
    return window.document;
    
}

async function GetJSONFriendlyChordName(chordName: string): Promise<string>{

    // --- This might be overdoing trying to find the correct chord. Might be better to just ignore parantheses ---
    const addChords : RegExpMatchArray | null = chordName.match(/(?<=\()\d(?=\))/g);
    if (addChords){
        addChords.forEach(element => {
            chordName = chordName.replace(`(${element})`, `add${element}`);
        });
    }
    /// --- End ---

    chordName = chordName.replace(/[mM][aA][jJ](?!(7|9|11|13))/g, "").replace(/alt /g, "");

    const startOfString: string = chordName.substring(0,2);
    if (subsituteKeys.has(startOfString)){
        chordName = chordName.replace(startOfString , subsituteKeys.get(startOfString) || startOfString)
    }

    const endOfString: string = chordName.substring(chordName.length - 2);
    if (subsituteKeys.has(endOfString)){
        chordName = chordName.replace(endOfString , subsituteKeys.get(endOfString) || endOfString)
    }

    // --- This might be overdoing trying to find the correct chord. Might be better to just ignore parantheses ---
    const parantheseChords : RegExpMatchArray | null = chordName.match(/(?<=\().*?(?=\))/g);
    if (parantheseChords){
        while(true){
            let newChordName: string = chordName.replace(/\(.*?\)/g, "");

            parantheseChords.forEach(element => {
                newChordName += element;
            });

            if (await IsJSONFriendlyChord(newChordName)){
                chordName = newChordName;
                break;
            }

            if (parantheseChords.length <= 0){
                break;
            }

            parantheseChords.pop();

        }
    }
    /// --- End ---

    return chordName;
}

function GetChordSVGImage(compressedChord : any, width: number): string{

    const chord: JSON = ExpandJSONChord(compressedChord);

    const svguitarInstance = new svguitar.SVGuitarChord(container);

    svguitarInstance
        .chord(chord)
        .configure({
        strings: NUMBER_OF_STRINGS,
        frets: numberOfFretsNeeded(chord)
    })
    .draw();

    let svgChord: string = container.outerHTML;
    svgChord = ResizeSVG(svgChord, width);
    return svgChord.replace(/"/g, "'");
}

function numberOfFretsNeeded(chord: any){

    const fingers = chord["fingers"];

    let highestPos = MINIMUM_AMOUNT_OF_FRETS;

    for (let i = 0; i < fingers.length; i++) {
        if (fingers[i][1] != "x"){
            if (fingers[i][1] > highestPos){
                highestPos = fingers[i][1];
            }
        }
    }

    return highestPos;
}

export async function IsChord(chord: string) : Promise<boolean>{
    chord = await GetJSONFriendlyChordName(chord);
    return await IsJSONFriendlyChord(chord);
}

async function IsJSONFriendlyChord(chord: string): Promise<boolean>{

    if(!(await GetGuitarJson())){
        return false;
    }

    try {
        return (await GetGuitarJson())[chord] !== undefined
    }
    catch {
        console.log(`"${chord}" is not a real chord`)
        return false;
    }
}

export async function GetGuitarJson() : Promise<{
        [key: string]: {
            f: any[];
            b: any[];
            p: number;
            title?: string;
        }[];
    }>{
    if (!bigGuitarJson){
        try{
            bigGuitarJson = JSON.parse(await DownloadBigGuitarJson());
        } catch(e:any){
            console.log("Couldn't parse bigGuitarJson: " + e);
        }
    }

    return bigGuitarJson;
}

export function CouldBeChord(s:string) : boolean{
    return !!(s.match(/^[A-G](dim|maj|m|sus|aug|add|b|#|o|ø|[0-9]|\(|\)|alt )*((\/[A-G](#|b)?)|())$/));
}