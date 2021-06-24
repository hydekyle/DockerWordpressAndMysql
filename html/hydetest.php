<?php
    include_once("./wp-load.php");
    include_once("./wp-config.php");
    include_once("./wp-includes/wp-db.php");
    global $wpdb;
    $wpdb->select("Magnificos");
    $query = $wpdb->prepare("SELECT * FROM Futbolistas_Stats");
    $results = $wpdb->get_results($query, ARRAY_N) or die(mysql_error());
    foreach($results as $row)
    {
        foreach($row as $data)
        {
            echo ($data);
        }
    }
?>