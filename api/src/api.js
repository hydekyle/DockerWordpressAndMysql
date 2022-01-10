const express = require("express")
const morgan = require("morgan")
const compression = require("compression")
const fetch = require("node-fetch")
const playerImages = require("./player-images/players-images.json")
const SECRETS = require("./secrets/keys.json")

const app = express()
app.use(express.json())
app.use(morgan("combined"))
app.use(compression())

var fireAdmin = firebaseConfig()
function firebaseConfig() {
    const fireAdmin = require('firebase-admin')
    const serviceAccount = require("./secrets/hyde-api-firebase-adminsdk-9weli-b49a8bde93.json")
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
const getPlayerImage = idPlayer => {
    let result = ""
    playerImages.players.map(player => {if (player.id == idPlayer) result = player.imageURL})
    return result
}

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
    if (result.status === 500) return { status: "ERROR", team: [], abonado: false, photo: "" }
    
    const text = await result.text()
    const data = text.split("|")
    const teamName = data[0]
    const player1 = data[1]
    const player2 = data[2]
    const player3 = data[3]
    const player4 = data[4]
    const player5 = data[5]
    const abonado = data[6]
    const foto = data[7]

    var response = {
        status: "OK",
        teamName: teamName,
        team: player1 !== "" ? [player1,player2,player3,player4,player5] : [],
        abonado: abonado === 1 ? true : false,
        photo: foto
    }
    return response
}

const refreshDataAPI = async () => {
    const teamDataAPI = "https://apiv3.apifootball.com/?action=get_teams&APIkey=f5bf8a560b2b0785d8c83833daa6719978d782c64d9fe1a40ace1a51d6725dd5&team_id=7283"
    const response = await fetch(teamDataAPI)
    teamData = await response.json()
    teamData[0].players.map(player => {
        player.player_image = getPlayerImage(player.player_id)
    })
    teamData = teamData[0]
    if (teamData.players !== undefined) FB_updateTeam() // Copiar jugadores a Firebase
    else console.warn("ERROR AL CONSUMIR API FOOTBALL")
}

// Routes
app.get("/players", (req, res) => {
    res.send(getPlayersData())
})

app.get("/login", async (req, res) => {
    const response = await loginUser({ email: req.headers["email"], password: req.headers["password"] })
    res.json(response)
})

app.get("/message-all", async (req, res) => {
    const message = {
        notification: { title: 'Hola, soy Ayoze', body: 'Soy el puto amo demonstration, amigo.' },
    }
    const result = await fireAdmin.messaging().sendToTopic("Magnificos", message)
    res.send(result)
})

