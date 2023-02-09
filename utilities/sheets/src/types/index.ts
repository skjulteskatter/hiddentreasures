export type IGuitarChordOptions = {
    chordName: string;
    imageFormat: ImageFormat;
    allCombinations: boolean;
    width: number;
    drawTitle: boolean;
};

export type Clef = "treble" | "bass" | "alto";

// Define formats here:
export type ImageFormat = "svg" | "json";

export type GuitarChordInsertion = "none" | "top" | "between";

export type PageFormat = "A4 P" | "Endless";

export type ISheetMusicOptions = {
    transposition: number;
    clef: Clef;
    zoom: number;
    width: number;
    imageFormat: ImageFormat;
    instruments: string[] | null;
    drawPartNames: boolean;
    guitarChords: GuitarChordInsertion;
    pageFormat: PageFormat;
    optimizeSVGsize: boolean;
    id: string;
}

type ISheetMusicDetails = {
    instruments: string[];
}
