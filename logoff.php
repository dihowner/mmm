<?php


/*
Wriiten By: OGUNDOWOLE RAHEEM OPEYEMI

Licensed To: MARVELLOUS

Mobile: 09033024846
        08179653448
        
All thanks and glory to Almighty Allah.

*/

ERROR_REPORTING(0);
require_once "config.php";
$username=$_SESSION["username"];
unset($_SESSION["username"]);
session_destroy();
header("location: office");
exit();
?>
