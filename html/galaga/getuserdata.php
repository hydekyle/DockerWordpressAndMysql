<?php
    header("Access-Control-Allow-Origin: *");
    include_once("./gameconfig.php");
    include_once("../wp-load.php");
    include_once("../wp-config.php");
    include_once("../wp-includes/wp-db.php");
    global $wpdb;
    $wpdb->select(DB_GAME);

    $id = $_GET["id"];
    $query = $wpdb->prepare("SELECT * FROM scores WHERE id = '$id'");
    $result = $wpdb->get_row($query, ARRAY_A);
    if (is_null($result)) {
        http_response_code(400);
        exit;
    }
    foreach($result as $data) {
        echo ($data . "|");
    }
    die();
?>
