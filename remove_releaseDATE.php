<?php
require "config.php";
ini_set("memory_limit", "1000M"); 
set_time_limit(0);
$todaysDATE =  date('d.m.Y H:i'); 
$get_allPH = $con->prepare("SELECT * from `providehelp`");
$get_allPH->execute();
$get_allPH_row = rows("SELECT * from `providehelp`");
// echo $get_allPH_row;
for($i=1; $i<=$get_allPH_row; $i++)
{
	$allPHINFO = $get_allPH->fetch(PDO::FETCH_ASSOC);
	$ID = $allPHINFO["ID"]; //Id for all PH
	$releaseDATE = $allPHINFO["releaseDATE"]; //Id for all PH
	// echo $releaseDATE;
	if($releaseDATE == $todaysDATE)
	{
		$save_remove_releaseDATE = $con->prepare("update providehelp set releaseDATE='' where ID='$ID'");
		$save_remove_releaseDATE->execute();
		// echo '<br>DONE<br>';
	}
}
?>