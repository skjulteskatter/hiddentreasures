import express from "express"
import { Authorize } from "./auth"
import { getSheetMusicDetails, getSheetMusicImages } from "./sheetMusic"
import { getGuitarChord } from "./guitarChords"
import { GuitarChordOptions, SheetMusicOptions } from "./classes"
import config from "./config"

const app = express()
app.use(express.json({ limit: "30mb" }))
app.use(express.raw({ limit: "30mb", inflate: true }))
app.use(express.urlencoded({ limit: "30mb", extended: true }))
app.set("etag", false)
app.disable("x-powered-by")

app.post("/guitarchord/", async (req, res) => {
    Authorize(req, res)

    let chordOptions: GuitarChordOptions

    try {
        chordOptions = new GuitarChordOptions(req.body)
    } catch {
        const example = new GuitarChordOptions({
            chordName: "C#add9/F",
            imageFormat: "json",
            allCombinations: true,
            width: 200,
            drawTitle: true,
        })
        res.status(400).send(`
        Bad request format.
        Required format of request body:
        ${JSON.stringify(example, null, "\t")}`)

        return
    }

    try {
        const imageData = await getGuitarChord(chordOptions)

        if (!imageData || imageData.length <= 0) {
            res.status(404).send("Couldn't get guitar chord")
            return
        }

        res.contentType("application/json")
        res.status(200).send(JSON.stringify(imageData))
    } catch (e) {
        console.log(e)
        res.status(500).send()
    }
})

app.get("/sheetmusic/:id", async (req, res) => {
    Authorize(req, res)

    try {
        const details = await getSheetMusicDetails(req.params.id)

        if (details == null) {
            res.status(404).send("Details not found")
            return
        }
        res.status(200)
            .contentType("application/json")
            .send(JSON.stringify(details))
    } catch (e) {
        console.log(e)
        res.status(500).send()
    }
})

app.post("/sheetmusic/", async (req, res) => {
    Authorize(req, res)

    let sheetMusicOptions: SheetMusicOptions

    try {
        sheetMusicOptions = new SheetMusicOptions(req.body)
    } catch {
        const example = new SheetMusicOptions({
            transposition: 0,
            clef: "treble",
            zoom: 1,
            width: 1080,
            imageFormat: "svg",
            instruments: ["Oboe", "Piano"],
            drawPartNames: false,
            optimizeSVGsize: true,
            guitarChords: "none",
            pageFormat: "Endless",
            id: "xxxxxxxx-xxxx-xxxx-xxxxxx-xxxxxxxxxxxxxxx",
        })
        res.status(400).send(
            `Bad request format.
        Required format of request body:
        ${JSON.stringify(example, null, "\t")}`
        )
        return
    }

    try {
        const imageData = await getSheetMusicImages(sheetMusicOptions)

        if (!imageData || imageData.length <= 0) {
            res.status(404).send("Couldn't render image")
            return
        }

        res.contentType("application/json")
        res.status(200).send(JSON.stringify(imageData))
    } catch (e) {
        console.log(e)
        res.status(500).send()
    }
})

app.listen(config.port, async () => {
    console.log(`Listening on port ${config.port}`)
})

process.on("unhandledRejection", (e) => {
    console.log(e)
})
