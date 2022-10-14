<?php
set_time_limit(0);
ini_set("memory_limit", "1000M"); 
require "config.php";

$get_allPH = $con->prepare("SELECT * from `providehelp` where releaseDATE='' and (status!='Withdraw' or status!='Cancelled') ORDER BY ID");
$get_allPH->execute();
while($get_allPHINFO = $get_allPH->fetch(PDO::FETCH_ASSOC))
{
	$ID = $get_allPHINFO["ID"]; //Id for all PH
	$amntPH = $get_allPHINFO["amntPH"];
	$incrPH = $get_allPHINFO["incrPH"];
	$phID = $get_allPHINFO["phID"];
	$daily = ($amntPH * 1.5)/100;
	$sumIncr = $incrPH - $daily;
	
	//update the balance 
	$savePH_Grow = $con->prepare("UPDATE providehelp set incrPH='$sumIncr' where ID='$ID'");
	$savePH_Grow->execute();
	
	// echo  ' Id: ' . $ID .' AmountPH: ' . $amntPH . ' || ph id: '. $phID   .  ' || Incr: '. $incrPH   . ' || daily: '. $daily   . ' || sumIncr: '. $sumIncr   . '<br/>';
}
echo '<br/><br/>';
//Referral Bonus Growth
$get_allRFR = $con->prepare("SELECT * from `referral` where releaseDATE='' and (status!='Withdraw' or status!='Cancelled') ORDER BY RID");
$get_allRFR->execute();
while($get_allRFRINFO = $get_allRFR->fetch(PDO::FETCH_ASSOC))
{
	$RID = $get_allRFRINFO["RID"]; //Id for all PH
	$amntPH = $get_allRFRINFO["referralBonus"];
	$incrbonus = $get_allRFRINFO["incrbonus"];
	$phID = $get_allRFRINFO["phID"];
	$dailyRfr = ($amntPH * 1.5)/100;
	$sumRfrIncr = $incrbonus - $dailyRfr;
	
	//update the balance 
	$saveRfr_Grow = $con->prepare("UPDATE referral set incrbonus='$sumRfrIncr' where RID='$RID'");
	$saveRfr_Grow->execute();
	
	// echo  ' RID: ' . $RID .' AmountPH: ' . $amntPH . ' || ph id: '. $phID   .  ' || Incr: '. $incrbonus   . ' || daily: '. $dailyRfr   . ' || sumIncr: '. $sumRfrIncr   . '<br/>';
}