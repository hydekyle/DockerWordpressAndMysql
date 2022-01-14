<?php
    define('DB_GAME', 'galaga');
    
    function validate_token($token, $alias, $score){
        $valid_token = strlen($alias) * intval($score) + 7;
        if (intval($token) !== $valid_token) die("Token no valido");
    }
?>