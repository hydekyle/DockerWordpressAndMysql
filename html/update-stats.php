<?php
    include_once("./wp-load.php");
    include_once("./wp-config.php");
    include_once("./wp-includes/wp-db.php");

    $player_id = $_GET["id"];
    $player_rating = $_GET["rating"];
    $player_type = $_GET["type"];
    $player_goals = $_GET["goals"];
    $player_minutes = $_GET["minutes"];
    $player_fouls_commited = $_GET["fouls_committed"];
    $player_duels_total = $_GET["duels_total"];
    $player_duels_won = $_GET["duels_won"];
    global $wpdb;
    $wpdb->select("Magnificos");
    $result = $wpdb->insert('Futbolistas_Stats', array(
        'idFutbolista' => $player_id,
        'player_rating' => $player_rating,
        'player_type' => $player_type,
        'player_goals' => $player_goals,
        'player_minutes' => $player_minutes,
        'player_fouls_committed' => $player_fouls_commited,
        'player_duels_total' => $player_duels_total,
        'player_duels_won' => $player_duels_won
    )) or die (mysql_error());
    echo ($result);
?>