<?php
    header("Access-Control-Allow-Origin: *");
    $livesPerCredit = 3;
    $playerMovementSpeed = 7;
    $playerAttackSpeed = 7;
    $storyLevelWaitTime = 10;
    $miniBossHealth = 700;
    $finalBossHealth = 1800;
    
    $historia = 
    "
2 0 2 2

The cyber invasion is here !!
Destroy all enemies and survive.
Good Luck !
    ";
    
    $nivel1 = 
    "
Ready?
    ";

    $nivel2 = 
    "
Nivel 2
    ";

    $nivel3 = 
    "
Nivel 3
    ";

    $nivel4 =
    "
Nivel 4
    ";

    $nivel5 = 
    "
¡Felicidades!
Lograste llegar al nivel donde solo los Code Pilots más experimentados y con más horas de vuelo lo han conseguido.
 
Aquí conocerás a los dos principales líderes y archienemigos de la ciberseguridad: Dragon Malware, que si logras vencerlo, podrás ganar una Vida Extra para poder pelear contra el poderoso Lucifer, quien es el Líder Supremo de todo los malwares, si logras eliminarlo, ¡serás todo un guerrero de la Ciberseguridad!
    ";

    $gameover = 
    "
Code Pilot, gracias por participar en este Videojuego que hemos diseñado especialmente para ti.

En Palo Alto Networks estamos ciertos, que hoy más que nunca, la ciberseguridad debe ser una de las prioridades principales de toda organización, por eso, nuestras soluciones están diseñadas, no solo para contrarrestar ataques cibernéticos, sino también, para prevenirlos. 

En https://www.paloaltonetworks.com.mx/ encontrarás toda la información sobre nuestras soluciones, así como nuestros datos de contacto.

¡Hasta la próxima batalla!
    ";

    die ("$livesPerCredit|$playerMovementSpeed|$playerAttackSpeed|$storyLevelWaitTime|$miniBossHealth|$finalBossHealth|$historia|$nivel1|$nivel2|$nivel3|$nivel4|$nivel5|$gameover");
?>
