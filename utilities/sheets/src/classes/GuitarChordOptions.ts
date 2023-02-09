import { IGuitarChordOptions } from "../types";

export default class GuitarChordOptions implements IGuitarChordOptions {
    public chordName;
    public imageFormat;
    public allCombinations;
    public width;
    public drawTitle;

    constructor(i: IGuitarChordOptions) {
        this.chordName = i.chordName;
        this.imageFormat = i.imageFormat;
        this.allCombinations = i.allCombinations;
        this.width = i.width;
        this.drawTitle = i.drawTitle;
        
        for (const [_, value] of Object.entries(this)) {
            if (value === undefined) {
                throw new Error("Invalid value on prop");
            }
        }
    }
}