<?php
    include_once("./gameconfig.php");
    include_once("../wp-load.php");
    include_once("../wp-config.php");
    include_once("../wp-includes/wp-db.php");
    global $wpdb;
    $wpdb->select(DB_GAME);

    $query = $wpdb->prepare("SELECT * FROM scores ORDER BY score DESC LIMIT 9");
    $results = $wpdb->get_results($query, ARRAY_A) or die(mysql_error());
    foreach($results as $row)
    {
        echo $row["alias"] . "·" . $row["score"] . "·" . $row["avatar"];
        echo "|";
    }
    exit(200);
?>
