import { ISheetMusicOptions } from "../types"

export default class SheetMusicOptions implements ISheetMusicOptions {
    public transposition
    public clef
    public zoom
    public width
    public imageFormat
    public instruments
    public drawPartNames
    public guitarChords
    public optimizeSVGsize
    public pageFormat
    public id

    constructor(i: ISheetMusicOptions) {
        this.transposition = i.transposition
        this.clef = i.clef
        this.width = i.width
        this.zoom = i.zoom
        this.imageFormat = i.imageFormat
        this.instruments = i.instruments ?? null
        this.drawPartNames = i.drawPartNames
        this.guitarChords = i.guitarChords
        this.optimizeSVGsize = i.optimizeSVGsize
        this.pageFormat = i.pageFormat
        this.id = i.id

        for (const [_, value] of Object.entries(this)) {
            if (value === undefined) {
                throw new Error("Invalid value on prop")
            }
        }
    }
}
