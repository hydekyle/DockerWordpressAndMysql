<?php
    include_once("./config.php");
    include_once("../wp-load.php");
    include_once("../wp-config.php");
    include_once("../wp-includes/wp-db.php");
    global $wpdb;
    $wpdb->select("galaga");
    $table_name = "scores";
    $column_alias = "alias";
    $column_score = "score";
    $column_avatar = "avatar";

    $query = $wpdb->prepare("SELECT * FROM $table_name ORDER BY $column_score DESC LIMIT 9");
    $results = $wpdb->get_results($query, ARRAY_A) or die(mysql_error());

    foreach($results as $row)
    {
        foreach($row as $data)
        {
            echo ($data . "|");
        }
        echo nl2br("\n");
    }
?>
