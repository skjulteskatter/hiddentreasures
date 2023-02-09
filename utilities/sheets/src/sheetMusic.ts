import { GetMXMLData, http } from "./http"
import { GetBetweenChordSVG, GetTopChordSVG, OptimizeSVG } from "./svgModifier"

const _height = 32767
const _standardWidth = 1080
const _numberOfGuitarChordsPerLine = 8

const DEFAULT_CHORD_HEIGHT = 16
const DEFAULT_MinSkyBottomDistBetweenSystems = 5
const DEFAULT_PageTopMargin = 5

// ---- hacks to fake Browser elements OSMD and Vexflow need, like window, document, and a canvas HTMLElement ----
const jsdom = require("jsdom")
const dom = new jsdom.JSDOM(`<!DOCTYPE html><head></head></html>`)
let window = dom.window
let document = dom.window.document
global.window = dom.window
global.document = window.document
window.console = console
global.HTMLElement = window.HTMLElement
global.HTMLAnchorElement = window.HTMLAnchorElement
global.XMLHttpRequest = window.XMLHttpRequest
global.DOMParser = window.DOMParser
global.Node = window.Node
// @ts-ignore
global.Canvas = window.Canvas

// ---- end browser hacks ----

import { ISheetMusicOptions } from "./types"
import {
    OpenSheetMusicDisplay,
    TransposeCalculator,
    MXLHelper,
} from "opensheetmusicdisplay"
import SheetMusicDetails from "./classes/SheetMusicDetails"
import { client } from "./sanity"

//Cahce dictionary
const dataFiles: {
    [id: string]: string
} = {}

//Cahce dictionary
const osmdInstances: {
    [id: string]: OpenSheetMusicDisplay | null
} = {}

export async function getSheetMusicDetails(
    id: string
): Promise<SheetMusicDetails | null> {
    //Change this instance for a default instance
    const instance: OpenSheetMusicDisplay | null = await getOrSetOsmdInstance({
        id: id,
        clef: "treble",
        drawPartNames: true,
        guitarChords: "none",
        imageFormat: "svg",
        optimizeSVGsize: false,
        pageFormat: "Endless",
        transposition: 0,
        width: 1440,
        zoom: 1,
        instruments: null,
    })

    if (instance === null) return null

    const instruments: string[] = instance.Sheet.Instruments.map(
        ({ NameLabel }) => NameLabel.text
    )
    return new SheetMusicDetails({
        id: id,
        instruments: instruments,
        title: instance.Sheet.TitleString,
    })
}

export async function getSheetMusicImages(
    options: ISheetMusicOptions
): Promise<string[]> {
    let scale: number = options.width / _standardWidth
    let osmdInstance: OpenSheetMusicDisplay | null
    let loadParameter: string

    try {
        osmdInstance = await getOrSetOsmdInstance(options)

        if (!osmdInstance) return []

        osmdInstance.TransposeCalculator =
            osmdInstance.TransposeCalculator ?? new TransposeCalculator()

        osmdInstance.Sheet.Transpose =
            options.clef === "bass"
                ? options.transposition - 12
                : options.transposition

        var changedInstruments: boolean = includeInstruments(
            options,
            osmdInstance
        )

        switch (options.guitarChords) {
            case "between":
                osmdInstance.EngravingRules.MinSkyBottomDistBetweenSystems =
                    DEFAULT_CHORD_HEIGHT * scale
                osmdInstance.EngravingRules.PageTopMargin =
                    DEFAULT_CHORD_HEIGHT * scale
                break
            case "top":
                osmdInstance.EngravingRules.MinSkyBottomDistBetweenSystems =
                    DEFAULT_MinSkyBottomDistBetweenSystems
                osmdInstance.EngravingRules.PageTopMargin =
                    DEFAULT_CHORD_HEIGHT *
                    scale *
                    Math.ceil(
                        getNumberOfUniqueChords(
                            await getOrSetFile(options.id)
                        ) / _numberOfGuitarChordsPerLine
                    )
                break
            case "none":
                osmdInstance.EngravingRules.MinSkyBottomDistBetweenSystems =
                    DEFAULT_MinSkyBottomDistBetweenSystems
                osmdInstance.EngravingRules.PageTopMargin =
                    DEFAULT_PageTopMargin
                break
        }

        ;(options.clef === "treble" &&
            options.transposition === 0 &&
            !changedInstruments) ||
            osmdInstance.updateGraphic()

        osmdInstance.zoom = options.zoom
    } catch (ex) {
        console.log("couldn't load sample: " + ex)
        return []
    }

    try {
        osmdInstance.render()
    } catch (ex) {
        console.log("renderError: " + ex)
        return []
    }

    let markupStrings: string[] = [] // svg

    for (let pageNumber: number = 1; true; pageNumber++) {
        const svgElement = document.getElementById(`osmdSvgPage${pageNumber}`)
        if (!svgElement) {
            break
        }

        // The important xmlns attribute is not serialized unless we set it here
        svgElement.setAttribute("xmlns", "http://www.w3.org/2000/svg")
        let markupString: string = svgElement.outerHTML
        svgElement.remove()

        markupString = markupString.replace(/"/g, "'")

        switch (options.guitarChords) {
            case "top":
                markupString = await GetTopChordSVG(
                    markupString,
                    scale,
                    _numberOfGuitarChordsPerLine
                )
                break
            case "between":
                markupString = await GetBetweenChordSVG(markupString, scale)
                break
        }

        markupString = options.optimizeSVGsize
            ? OptimizeSVG(markupString)
            : markupString.trimStart()

        markupStrings.push(markupString)
    }

    return markupStrings
}

function getNumberOfUniqueChords(musicXml: string | null): number {
    return musicXml ? getAllUniqueChords(musicXml).length : 0
}

function getAllUniqueChords(musicXml: string): string[] {
    let differentChords: string[] = []
    let harmonyArray: RegExpMatchArray | null = musicXml.match(
        /(?<=<harmony)(.*?)(<\/harmony>)/g
    )

    if (!harmonyArray) {
        return []
    }

    for (let i = 0; i < harmonyArray.length; i++) {
        const innerHarmonyArray: RegExpMatchArray | null = harmonyArray[i]
            .toString()
            .replace(/\s/g, "")
            .match(/(?<=>)(.*?)(?=<\/harmony>)/g)
        if (!innerHarmonyArray) {
            continue
        }

        const element: string = innerHarmonyArray[0].toString()

        if (!differentChords.includes(element)) {
            differentChords.push(element)
        }
    }

    return differentChords
}

async function getOrSetFile(id: string): Promise<string | null> {
    if (dataFiles[id]) {
        return dataFiles[id]
    }

    const sanityResult = await client.fetch("*[_id == $id && _type == 'sheetMusic' && type == 'musicxml'][0]{'directUrl': file.asset->url}", {id})

    const sourceUrl = sanityResult?.directUrl
    if (!sourceUrl) {
        return null
    }

    const result = await GetMXMLData(sourceUrl)
    if (result === null) {
        return null
    }

    dataFiles[id] = result

    //Keep each value 5 minutes
    setTimeout(() => delete dataFiles[id], 300000)

    return result
}

async function getOrSetOsmdInstance(
    options: ISheetMusicOptions
): Promise<OpenSheetMusicDisplay | null> {

    //Key includes option that modifies the data before being loaded as an osmd instance
    const key: string = `${options.id}CLEF:${options.clef}DRAWPARTNAMES:${options.drawPartNames}PAGEFORMAT:${options.pageFormat}`

    if (!osmdInstances[key]) {
        osmdInstances[key] = await createOsmdInstance(options)

        //Keep each value 2 minutes
        setTimeout(() => delete osmdInstances[key], 120000)
    }


    return osmdInstances[key]
}

async function createOsmdInstance(
    options: ISheetMusicOptions
): Promise<OpenSheetMusicDisplay | null> {
    const div = document.createElement("div")
    div.id = `browserlessDiv`
    document.body.appendChild(div)

    div.width = options.width
    div.height = _height
    div.setAttribute("width", options.width.toString())
    div.setAttribute("height", _height.toString())
    div.setAttribute("offsetWidth", options.width.toString())

    Object.defineProperties(window.HTMLElement.prototype, {
        offsetLeft: {
            get: function () {
                return parseFloat(window.getComputedStyle(this).marginTop) || 0
            },
        },
        offsetTop: {
            get: function () {
                return parseFloat(window.getComputedStyle(this).marginTop) || 0
            },
        },
        offsetHeight: {
            get: function () {
                return _height
            },
        },
        offsetWidth: {
            get: function () {
                return options.width
            },
        },
    })

    const content = await getOrSetFile(options.id)

    if (!content) {
        return null
    }

    const osmdInstance = new OpenSheetMusicDisplay(div, {
        autoResize: false,
        backend: "svg",
        pageBackgroundColor: "#FFFFFF",
        pageFormat: options.pageFormat,
        drawingParameters: "default", // try compact (instead of default)
        drawPartNames: options.drawPartNames, // try false

        drawTitle: false,
        drawSubtitle: false,
        drawComposer: false,
        drawLyricist: false,
        drawCredits: false,

        disableCursor: false,

        setWantedStemDirectionByXml: false,
        drawUpToMeasureNumber: Number.MAX_SAFE_INTEGER,
        drawFromMeasureNumber: 0,
        measureNumberInterval: 4,
        useXMLMeasureNumbers: false,

        drawPartAbbreviations: true,
        drawSlurs: true,
        percussionOneLineCutoff: 4,

        autoBeam: true,
        autoBeamOptions: {
            beam_rests: false,
            beam_middle_rests_only: false,
            maintain_stem_directions: false,
        },
        drawHiddenNotes: true,
        newSystemFromXML: true,
        stretchLastSystemLine: true,

        defaultFontFamily: "Arial",
    })

    osmdInstance.setLogLevel("info")

    let loadParameter

    if (!content.includes("<")) {
        //The data is MXL (base64)
        try {
            loadParameter = await MXLHelper.MXLtoXMLstring(content)
        } catch (e) {
            console.log(`Invalid data. Is "data" base64 or xml? : ${e}`)
            return null
        }
    } else {
        //The data is XML
        loadParameter = content.toString()
    }

    try {
        osmdInstance.setOptions({
            onXMLRead: (e: any) => {
                let clefSpecs: [string, number]

                switch (options.clef) {
                    case "bass":
                        clefSpecs = ["F", 4]
                        break

                    case "alto":
                        clefSpecs = ["C", 3]
                        break

                    default:
                        return e
                }

                e = e
                    .replace(/<sign>G<\/sign>/g, `<sign>${clefSpecs[0]}</sign>`)
                    .replace(/<line>2<\/line>/g, `<line>${clefSpecs[1]}</line>`)

                return e
            },
        })

        await osmdInstance.load(loadParameter)

        return osmdInstance
    } catch (e) {
        console.log("Couldn't load loadParameter")
    }

    return null
}

function includeInstruments(
    options: ISheetMusicOptions,
    osmdInstance: OpenSheetMusicDisplay
): boolean {
    let changedInstruments: boolean = false

    for (let i = 0; i < osmdInstance.Sheet.Instruments.length; i++) {
        const instrument = osmdInstance.Sheet.Instruments[i]
        const lastVisibility: boolean = instrument.Visible

        if (options.instruments) {
            instrument.Visible = !(!containsCaseInsensitive(
                    options.instruments,
                    instrument.NameLabel.text
                ) &&
                options.instruments.length > 0 &&
                osmdInstance.Sheet.Instruments.length > 1);
        }

        if (lastVisibility != instrument.Visible) {
            changedInstruments = true
        }
    }

    return changedInstruments
}

function containsCaseInsensitive(arr: string[], element: string): boolean {
    const query = element.toLowerCase()
    return arr.some((i) => i.toLowerCase() === query)
}
