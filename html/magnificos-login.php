<?php
    include_once("./wp-load.php");
    include_once("./wp-config.php");
    include_once("./wp-includes/wp-db.php");
    $email = $_GET["email"];
    $password = $_GET["password"];
    global $wpdb;
    $wpdb->select("Magnificos");

    $result = $wpdb->get_row("SELECT * FROM Usuarios AS U JOIN Usuarios_Team AS T ON U.IdUsuario = T.IdUsuario WHERE U.email = '$email' AND U.clave = '$password'", ARRAY_A)
        or $wpdb->get_row("SELECT * FROM Usuarios WHERE email = '$email' AND clave = '$password'", ARRAY_A)
        or die (mysql_error());

    $teamName = $result["teamName"];
    $player1 = $result["Idplayer1"];
    $player2 = $result["Idplayer2"];
    $player3 = $result["Idplayer3"];
    $player4 = $result["Idplayer4"];
    $player5 = $result["Idplayer5"];
    $abonado = $result["abonado"];
    $foto = $result["foto"];
    die ("$teamName|$player1|$player2|$player3|$player4|$player5|$abonado|$foto");
?>