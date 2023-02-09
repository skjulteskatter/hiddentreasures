import { GuitarChordOptions } from "./classes"
import {
    CouldBeChord,
    getGuitarChord as GetGuitarChord,
    IsChord,
} from "./guitarChords"
import { IGuitarChordOptions } from "./types"
const { optimize } = require("svgo")

const DEFAULT_CHORD_WIDTH: number = 120
const DEFAULT_WIDTH_OF_ARIAL_CHAR: number = 5.83
const SPACE_BETWEEN_MEASURE_AND_CHORD: number = 40
const DEFAULT_SHEET_MUSIC_WIDTH: number = 1080

function GetTextTagContent(s: string): string {
    let matches = s.match(/(?<=>)((.|	|\n)+)(?=<\/text)/)
    return matches ? matches[0].toString() : ""
}

function GetAllTextTags(s: string): RegExpMatchArray | null {
    return s.match(/<text(.|\s)*?<\/text>/g)
}

function GetTextElementXYPosition(s: string): [number, number] {
    let matches = s.match(/(?<=\sx=')[0-9|\.]*(?<!')/)
    let x: number = matches ? parseInt(matches[0]) : 0
    matches = s.match(/(?<=\sy=')[0-9|\.]*(?<!')/)
    let y: number = matches ? parseInt(matches[0]) : 0
    return [x, y]
}

function GetElementWidthHeight(s: string): [number, number] {
    let matches = s.match(/(?<=\swidth=')[0-9|\.]*(?<!')/)
    let w: number = matches ? parseInt(matches[0]) : 0
    matches = s.match(/(?<=\sheight=')[0-9|\.]*(?<!')/)
    let h: number = matches ? parseInt(matches[0]) : 0
    return [w, h]
}

async function GetUniqueChordsFromSVG(svg: string): Promise<string[]> {
    let textElements: any = GetAllTextTags(svg)
    let alreadyAcceptedChords: string[] = []

    for (let i = 0; i < textElements.length; i++) {
        const element = textElements[i].toString()
        let textContent: string = GetTextTagContent(element)
        if (
            !alreadyAcceptedChords.includes(textContent) &&
            CouldBeChord(textContent) &&
            (await IsChord(textContent))
        ) {
            alreadyAcceptedChords.push(textContent)
        }
    }
    return alreadyAcceptedChords
}

async function GetChordsTextElementsFromSVG(svg: string): Promise<string[]> {
    let textElements: any = GetAllTextTags(svg)
    let chordTextElements: string[] = []

    for (let i = 0; i < textElements.length; i++) {
        const element = textElements[i].toString()
        let textContent: string = GetTextTagContent(element)
        if (CouldBeChord(textContent) && (await IsChord(textContent))) {
            chordTextElements.push(element)
        }
    }
    return chordTextElements
}

/**
 * @param svg an svg of the sheet music with extra spacing at the top
 * @param scale How wide the sheetmusic is compared to it's default size (sheetMusic._standardWidth)
 * @returns A modified svg with guitar chords at the top
 */
export async function GetTopChordSVG(
    svg: string,
    scale: number,
    numberOfGuitarChordsPerLine: number
): Promise<string> {
    const startStringArray: RegExpMatchArray | null =
        svg.match(/<svg(.*?)<\/rect>/)
    if (!startStringArray) {
        return svg
    }

    const startString: string = startStringArray[0]

    let chordTextElements: string[] = await GetUniqueChordsFromSVG(svg)

    const widthOfSVG: number = DEFAULT_SHEET_MUSIC_WIDTH * scale
    const distanceBetweenChords: number =
        widthOfSVG / numberOfGuitarChordsPerLine
    let chordWidthHeight: [number, number] = [0, 0]

    for (let i = 0; i < chordTextElements.length; i++) {
        const chordName = chordTextElements[i]

        const guitarChordOptions: IGuitarChordOptions = new GuitarChordOptions({
            chordName: chordName,
            width: DEFAULT_CHORD_WIDTH * scale,
            imageFormat: "svg",
            drawTitle: true,
            allCombinations: false,
        })

        let chord = (await GetGuitarChord(guitarChordOptions))[0].toString()
        chordWidthHeight =
            chordWidthHeight[0] == 0
                ? GetElementWidthHeight(chord)
                : chordWidthHeight

        let y = Math.floor(i / numberOfGuitarChordsPerLine)
        let x = i % numberOfGuitarChordsPerLine

        let embeddedGuitarChord: string = ` <g>${chord.replace(
            `<svg `,
            `<svg x='${
                x * distanceBetweenChords +
                (distanceBetweenChords - chordWidthHeight[0]) / 2
            }' y='${y * chordWidthHeight[1]}' `
        )}</g> `
        svg = svg.replace(startString, ` ${startString} ${embeddedGuitarChord}`)
    }

    return svg
}

/**
 * @param svg an svg of the sheet music with extra spacing
 * @param scale How wide the sheetmusic is compared to it's default size (1080)
 * @returns A modified svg with guitar chords in between the lines
 */
export async function GetBetweenChordSVG(
    svg: string,
    scale: number
): Promise<string> {
    let chordSVGs: Map<string, string> = new Map()
    let modifiedSVG: string = svg

    let chordTextElements: string[] = await GetChordsTextElementsFromSVG(svg)

    let nextChordWidth: number = DEFAULT_CHORD_WIDTH * scale

    for (let i = 0; i < chordTextElements.length; i++) {
        const textElement = chordTextElements[i]

        let chordName: string = GetTextTagContent(textElement)
        let chordWidth: number = nextChordWidth

        //position of current textelement
        let position = GetTextElementXYPosition(textElement)

        position[0] += DEFAULT_WIDTH_OF_ARIAL_CHAR * chordName.length

        //position of next (or the first if no next) textelement
        let nextChord: string =
            chordTextElements[i + 1 >= chordTextElements.length ? 0 : i + 1]
        let nextPosition = GetTextElementXYPosition(nextChord)

        nextPosition[0] +=
            DEFAULT_WIDTH_OF_ARIAL_CHAR * GetTextTagContent(nextChord).length

        let xDifference: number = Math.abs(position[0] - nextPosition[0])

        if (
            xDifference < DEFAULT_CHORD_WIDTH * scale &&
            Math.abs(position[1] - nextPosition[1]) < 5 * scale
        ) {
            chordWidth = xDifference
            nextChordWidth = chordWidth
        } else {
            nextChordWidth = DEFAULT_CHORD_WIDTH * scale
        }

        if (!chordSVGs.has(chordName + chordWidth)) {
            const guitarChordOptions: IGuitarChordOptions =
                new GuitarChordOptions({
                    chordName: chordName,
                    width: chordWidth,
                    imageFormat: "svg",
                    drawTitle: false,
                    allCombinations: false,
                })
            const chord: string =
                (await GetGuitarChord(guitarChordOptions)) + ""
            if (chord != "") {
                chordSVGs.set(chordName + chordWidth, chord)
            }
        }

        if (chordSVGs.has(chordName + chordWidth)) {
            let chord: string = chordSVGs.get(chordName + chordWidth) || ""
            let chordDimensions = GetElementWidthHeight(chord)

            let chordX =
                position[0] -
                chordDimensions[0] / 2 -
                chordName.lastIndexOf("/")
            let chordY =
                position[1] -
                chordDimensions[1] -
                SPACE_BETWEEN_MEASURE_AND_CHORD * scale

            let embeddedGuitarChord: string = ` <g>${chord.replace(
                `<svg `,
                `<svg x='${chordX}' y='${chordY}' `
            )}</g> `
            modifiedSVG = modifiedSVG.replace(
                textElement,
                ` ${embeddedGuitarChord} ${textElement}`
            )
        }
    }

    return modifiedSVG
}

export function OptimizeSVG(svg: string) {
    const result = optimize(svg, {
        multipass: false,
    })

    return result.data.replace(/"/g, "'")
}
