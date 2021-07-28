const express = require("express")
const morgan = require("morgan")
const compression = require("compression")
const fetch = require("node-fetch")

const app = express()
app.use(express.json())
app.use(morgan("combined"))
app.use(compression())

var fireAdmin = firebaseConfig()
function firebaseConfig() {
    const fireAdmin = require('firebase-admin')
    const serviceAccount = require("./secrets/hyde-api-firebase-adminsdk-9weli-1d4aca2cdf.json")
    fireAdmin.initializeApp({
        credential: fireAdmin.credential.cert(serviceAccount),
        databaseURL: "https://hyde-api.firebaseio.com"
    })
    return fireAdmin
}

let teamData; // Cached data from API

app.listen(8080, () => {
    refreshDataAPI()
})

// Controllers
const getPlayersData = () => {
    return teamData.players
}

const FB_updateTeam = () => {
    fireAdmin.firestore().collection("team").doc("players").update({
        all: teamData.players
    })
}

const loginUser = async loginUser => {
    const loginURL = "http://localhost:8079/magnificos-login.php";
    const result = await fetch(`${loginURL}?email=${loginUser.email}&password=${loginUser.password}`)
    const text = await result.text()
    if (result.status === 200) return "OK:" + text
    else return "ERROR:Login incorrecto."
}

const refreshDataAPI = async () => {
    const teamDataAPI = "https://apiv3.apifootball.com/?action=get_teams&APIkey=f5bf8a560b2b0785d8c83833daa6719978d782c64d9fe1a40ace1a51d6725dd5&team_id=7283"
    const response = await fetch(teamDataAPI)
    teamData = await response.json()
    teamData = teamData[0]
    if (teamData.players !== undefined) FB_updateTeam()
    else console.warn("ERROR AL CONSUMIR API FOOTBALL")
}

// Routes
app.get("/players", (req, res) => {
    res.send(getPlayersData())
})

app.get("/login", async (req, res) => {
    const response = await loginUser({ email: req.headers["email"], password: req.headers["password"] })
    res.send(response)
})

