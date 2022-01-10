<?php
    include_once("./wp-load.php");
    include_once("./wp-config.php");
    include_once("./wp-includes/wp-db.php");
    $email = $_GET["email"];
    global $wpdb;
    $wpdb->select("delospie_wp1");

    $result = $wpdb->get_row("SELECT * FROM wp_users WHERE user_email = '$email'", ARRAY_A)
        or die (mysql_error());

    $abonado = $result["user_status"];
    // $foto = $result["foto"];
    die ("$abonado");
?>