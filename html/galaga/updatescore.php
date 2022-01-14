<?php
    header("Access-Control-Allow-Origin: *");
    include_once("./gameconfig.php");
    include_once("../wp-load.php");
    include_once("../wp-config.php");
    include_once("../wp-includes/wp-db.php");
    global $wpdb;
    $wpdb->select(DB_GAME);

    $id = $_GET["id"];
    $alias = $_GET["alias"];
    $newScore = $_GET["score"];
    $avatar = $_GET["avatar"];
    $token = $_GET["token"];

    validate_token($token, $alias, $newScore);
    
    // Leer score previo
    $query = $wpdb->prepare("SELECT * FROM scores WHERE id='$id'");
    $result = $wpdb->get_row($query, ARRAY_A);
    $score = $result["score"];
    if ($score < $newScore) $score = $newScore;
    // Guardar nuevos datos
    $query = $wpdb->prepare("REPLACE INTO scores VALUES ('$id', '$alias', $score, '$avatar')");
    $result = $wpdb->get_results($query, ARRAY_A);
    die('1');
?>
