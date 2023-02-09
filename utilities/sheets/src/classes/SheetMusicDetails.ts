interface ISheetMusicDetails {
    id: string
    title: string
    instruments: string[]
}

export default class SheetMusicDetails implements ISheetMusicDetails {
    public instruments: string[] = []
    public id: string
    public title: string

    constructor(i: ISheetMusicDetails) {
        this.instruments = i.instruments.filter(i => i.trim() != "")
        this.id = i.id;
        this.title = i.title;
    }
}
