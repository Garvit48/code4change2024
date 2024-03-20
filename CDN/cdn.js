const express = require("express")
const multer = require("multer")

const app = express()


const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, __dirname + "/videos")
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname)
    }
})
const uploadManager = multer({ storage })


app.get("/videos/*", (req, res) => {
    let parseArray = req.url.split("/")
    let name = parseArray[parseArray.length - 1]
    res.sendFile(name, { root: __dirname + "/videos/" })
})

app.get("/images/*", (req, res) => {
    let parseArray = req.url.split("/")
    let name = parseArray[parseArray.length - 1]
    res.sendFile(name, { root: __dirname + "/images/" })
})

app.post("/uploadVideo", uploadManager.single("video") ,(req, res) => {
    res.send({"uri": __dirname + "/videos" + req.file.originalname})
})

app.post("/uploadImage", uploadManager.single("video") ,(req, res) => {
    res.send({"uri": __dirname + "/images" + req.file.originalname})
})

app.listen(5050, () => console.log("CDN Active on PORT 5050...."))