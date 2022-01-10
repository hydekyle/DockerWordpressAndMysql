<?php
    $player_id = $_GET["id"];
    $url = "https://apiv3.apifootball.com/?action=get_players&APIkey=f5bf8a560b2b0785d8c83833daa6719978d782c64d9fe1a40ace1a51d6725dd5&player_id=" . $player_id;

    $contents = file_get_contents($url);
    $results = json_decode($contents, true);

    foreach($results as $player){
        if ($player["team_name"] === "Real Zaragoza"){
            insertPlayer($player);
        }
    }

    function insertPlayer($player){
        $api_url = "http://localhost:8079/update-stats.php?" 
            . "id=". $player["player_id"] . "&"
            . "rating=". $player["player_rating"] . "&"
            . "type=". $player["player_type"] . "&"
            . "goals=". $player["player_goals"] . "&"
            . "minutes=". $player["player_minutes"] . "&"
            . "fouls_committed=". $player["player_fouls_committed"] . "&"
            . "duels_total=". $player["player_duels_total"] . "&"
            . "duels_won=". $player["player_duels_won"];
        $api_result = file_get_contents($api_url);
        $result = json_decode($api_result, true);
        die ($result);
    }
?>