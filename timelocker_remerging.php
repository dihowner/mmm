<?php
require "config.php";
/*IF user fails to pay and time has gone..... then we need to remerge and block */
$getallMERGE = $con->prepare("SELECT * FROM `merge_gh` where attachment='' and status=''");
$getallMERGE->execute();
$getallMERGE_rows = rows("SELECT * FROM `merge_gh` where attachment='' and status=''");
for($i=1; $i<=$getallMERGE_rows; $i++)
{
	$getallMERGE_info = $getallMERGE->fetch(PDO::FETCH_ASSOC);
	$gh_participantID = $getallMERGE_info['gh_participantID'];
	$ghID = $getallMERGE_info['ghID'];
	$participantID = $getallMERGE_info['participantID'];
	$phID = $getallMERGE_info['phID'];
	echo $phID . '<br><br>';
	
	
	//
	// echo $total;
	
		// echo $ghID;
	

// echo $phID;
	$check_all_amntpaid = $con->prepare("SELECT sum(amountGH) FROM `merge_gh` where phID='$phID' and status='Confirmed'");
	$check_all_amntpaid->execute();
	 $total = 0;
	 print_r($check_all_amntpaid);
	// while($check_all_amntpaidINFO = $check_all_amntpaid->fetch(PDO::FETCH_ASSOC))
	// {
	// for($i=1; $i<=rows("SELECT amountGH FROM `merge_gh` where phID='$phID' and status='Confirmed'"); $i++)
	// {
		$check_all_amntpaidINFO = $check_all_amntpaid->fetch(PDO::FETCH_ASSOC);
		// $amountGH_paid = $check_all_amntpaidINFO['amountGH'] . '<br>';
		// $total += $amountGH_paid;
		// echo $check_all_amntpaidINFO['amountGH'] . '<br>';
	// }
	
	// We need to know how much user ph using their phID
	// $getUserPH = $con->prepare("select * from `providehelp` where phID='$phID' and wallet='45% Increment'");
	// $getUserPH->execute();
	// $getUserPH_Info = $getUserPH->fetch(PDO::FETCH_ASSOC);
	// $amntPH = $getUserPH_Info['amntPH'];
	// $amount_left_to_pay = $amntPH-$total;
	
	// Since user did not pay his ph then we have to return it back, User must not lose his money
	// $updatePH_bck = $con->prepare("update providehelp set balance='$amount_left_to_pay' where phID='$phID' and wallet='45% Increment'");
	// if($updatePH_bck->execute())
	// {
	}
/*
	
}
*/
?>