<?php
    include_once("./wp-load.php");
    include_once("./wp-config.php");
    include_once("./wp-includes/wp-db.php");

    $player_id = $_GET["id"];
    $player_rating = $_GET["player_rating"]
    $player_type = $_GET["player_type"]
    $player_goals = $_GET["player_goals"]
    $player_minutes = $_GET["player_minutes"]
    $player_fouls_committed = $_GET["player_fouls_committed"]
    $player_duels_total = $_GET["player_duels_total"]
    $player_duels_won = $_GET["player_duels_won"]
    
    global $wpdb;
    $wpdb->select("Magnificos");
    $result = $wpdb->insert('Futbolistas_Stats', array(
        'idFutbolista' => $player_id,
        'player_rating' => 9.20,
        'player_type' => "2222",
        'player_goals' => 2,
        'player_minutes' => 2,
        'player_fouls_committed' => 2,
        'player_duels_total' => 2,
        'player_duels_won' => 2
    )) or die (mysql_error());
    echo ($result);
?>