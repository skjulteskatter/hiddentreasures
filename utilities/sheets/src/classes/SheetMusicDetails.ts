export default class SheetMusicDetails {
    public instruments: string[];
    public id: string;

    constructor(i: any) {
        this.id = i.id;
        this.instruments = i.instruments;
    }
}