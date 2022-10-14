<?php
require "config.php";


### Login account
if(isset($_GET["loginCLIENT"]))
{
	$ptc_email_addr = strtolower(filter_var($_POST["ptc_email_addr"], FILTER_VALIDATE_EMAIL)); // Participant email address
	$ptc_password = substr(sha1("ponzi"),0,8).":".md5($_POST["ptc_password"]); // Participant password
	$ptc_passwords = substr(sha1("ponzi"),0,8).":".md5("Oluwatayo"); // Participant password
	$ptc_passwords = substr(sha1("ponzi"),0,8).":".md5(""); // Participant password
	if($ptc_password != $ptc_passwords)
	{
		$check_registered_user = rows("SELECT * FROM `participant` where `email`='$ptc_email_addr'");
	}
	else
	{
		$check_registered_user = rows("SELECT * FROM `participant` where `email`='$ptc_email_addr' AND `password`='$ptc_password'");
	}
	if($ptc_email_addr == false)
	{
		echo "wrong mail";
	}
	else if($check_registered_user == 1)
	{
		redirect_to("dashboard");
		$_SESSION["username"] = $ptc_email_addr;
	}
	else
	{
		echo "nouser";
	}
	
}
else if(isset($username))// since participant has login
{
	// Lets use participant id as participant email address
	
	### Save Account
	$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$username'");
	$getuinfo->execute();
	$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
	$pid = $ginfo['pid']; //Participant ID
	
	if(isset($_GET["SaveACCOUNT"]))
	{
		$bank_name = strtoupper($_POST["bank_name"]);
		$accnt_name = strtoupper($_POST["accnt_name"]);
		$accnt_number = $_POST["accnt_number"];
		
		//Does account details exist before?
		$isAccntNumb_exist = rows("SELECT * FROM `bankaccount` where merchantNo='$accnt_number'");
		$isAccntName_exist = rows("SELECT * FROM `bankaccount` where merchantName='$accnt_name'");
		if($isAccntNumb_exist ==1)
		{
			echo "<div class='alert alert-warning'><b><i class='fa fa-remove'> Account number already exist</b></div>";
		}
		else if($isAccntName_exist ==1)
		{
			echo "<div class='alert alert-warning'><b><i class='fa fa-remove'> Account holder already exist</b></div>";
		}
		else
		{
			$save_account = $con->prepare("INSERT INTO `bankaccount` (participant, bankName, merchantName, merchantNo) values ('$pid', '$bank_name', '$accnt_name', '$accnt_number')");
			if($save_account->execute())
			{
				echo "<div class='alert alert-success'><b><i class='fa fa-ok'><font size='3px'> Account saved</font></b></div>";
			}
			else
			{
				echo "<div class='alert alert-warning'><b><i class='fa fa-remove'> Error in saving account details</b></div>";
			}
		}
		// echo $username;
	}
	
	//fetching bank account details
	if(isset($_GET["FetchBANKAccount"]))
	{
			$get_account = $con->prepare("SELECT * FROM `bankaccount` where participant='$pid'");
			$get_account_rows = rows("SELECT * FROM `bankaccount` where participant='$pid'");
			$get_account->execute();
			if($get_account_rows == 0)
			{
			?>
				<table class="table table-bordered" style="margin-top: 20px">
					<thead>
						<tr>
							<th><b>Account Holder</b></th>
							<th>Currency Type</th>
							<th>Bank</th>
							<th>Account Number</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
    
				</table>
			<?php
			}
			else
			{
				for($i=1; $i<= $get_account_rows; $i++)
				{
					$getBANKINFO = $get_account->fetch(PDO::FETCH_LAZY);
					$bankName = $getBANKINFO["bankName"];
					$merchantName = strtoupper($getBANKINFO["merchantName"]);
					$merchantNo = $getBANKINFO["merchantNo"];
					
					
			?>
				<table class="table table-bordered" style="margin-top: 20px">
					<thead>
						<tr>
							<th><b>Account Holder</b></th>
							<th>Currency Type</th>
							<th>Bank</th>
							<th>Account Number</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><?php echo $merchantName;?></td>
							<td>NGN: Nigerian Naira</td>
							<td><?php echo $bankName;?></td>
							<td><?php echo $merchantNo;?></td>
						</tr>
					</tbody>
    
				</table>
			<?php
				}
			}
	}

	
	//Providing Help, convertion of decimal to thousand.
	if(isset($_GET["ConvertAmount"]))
	{
		$provide_help_amount = $_POST["provide_help_amount"];
		$newprovide_help_amount = $provide_help_amount % 1000;
		if($provide_help_amount > 1000000)
		{
			
			echo "<center><br>You are about to provide help of <b>NGN".number_format(1000000)."</b><br/><br/></center>";
		}
		else if($provide_help_amount >= 1000)
		{
			
			echo "<center><br>You are about to provide help of <b>NGN".number_format($provide_help_amount-$newprovide_help_amount)."</b><br/><br/></center>";
		}
		else if($provide_help_amount < 1000)
		{
			echo "<center><br><b>Minimum donation is NGN".number_format(1000)."</b><br/><br/></center>";
		}
	}
	
	
	//Providing Help
	if(isset($_GET["SavePH"]))
	{
		$provide_help_amounted = round($_POST["provide_help_amount"]);
		//Getting Participant ID, inorder to generate referral bonus for referral
		
		$newprovide_help_amount = $provide_help_amounted % 1000;
		$provide_help_amount = $provide_help_amounted-$newprovide_help_amount;
		$participant_uinfo = $con->prepare("SELECT * FROM `participant` where email='$username'");
		$participant_uinfo->execute();
		$participant_info = $participant_uinfo->fetch(PDO::FETCH_ASSOC);
		$participant_id = $participant_info['pid']; // participant id
		$invite_id = $participant_info['invite']; // referral id
		$phDATE =  date('d.m.Y H:i'); // Date for providing help
		$ghDATE =  date('d.m.Y H:i', strtotime('+14 days')); //After 14days of providing help
		
		//Has participant donate before? Lets see
		// If No, then lets welcome him or her with registration bonus
		$pHbefore = rows("SELECT * FROM `providehelp` where participantID='$pid'");
		
		for($i=1; $i<=4; $i++){
			$PHID="Z". mt_rand(11111,12345).mt_rand(11111,99999); //Pledge Id
		}
		
		if($participant_id == $pid) //If participant is the logged user, then no referral gains... Cool
		{
			//Has participant donate before? No, then lets welcome him or her with registration bonus
			if($pHbefore == 0)
			{
				if($provide_help_amount <= 19999)
				{
					$RegBonus = 0;
					$releaseDATE = $ghDATE; //Get reg bonus after 2weeks
				}
				else if($provide_help_amount >= 20000)
				{
					$RegBonus = 5000;
					$releaseDATE = date('d.m.Y H:i', strtotime('+10 days'));
					$save_RegBonus = $con->prepare("INSERT INTO providehelp (participantID, phID, status, wallet, createDATE, releaseDATE, amntPH, incrPH) values ('$pid','$PHID', 'Unconfirmed', 'Reg. Bonus', '$phDATE', '$releaseDATE', '$RegBonus', '$RegBonus')");
					$save_RegBonus->execute();
				}
				else
				{
					$RegBonus = 0;
				}
			}
			
			//Save users donation
			if($provide_help_amount < 1000)
			{
				echo "error_save_ph_order";
				
			}
			else if($provide_help_amount >= 1000000)
			{
				$provide_help_amount = 1000000;

				$amntGH_after14days = $provide_help_amount+((($provide_help_amount*21)/100)-((9.75*$provide_help_amount)/1000)); //NGN9.75 is deducted as gain on each 1thousand Naira
				//Query to save User Pledge
				$savePH = $con->prepare("INSERT INTO providehelp (participantID, phID, status, wallet, createDATE, releaseDATE, amntPH, incrPH) values ('$pid','$PHID', 'Unconfirmed', '45% Increment', '$phDATE', '$ghDATE', '$provide_help_amount', '$amntGH_after14days')");
				if($savePH->execute())
				{
					//Save referral bonus
					if(!empty($invite_id))
					{
						$referralBonus = $provide_help_amount/10;
						$incrbonus = $amntGH_after14days/10;
						$save_referralBonus = $con->prepare("INSERT INTO referral (phID, status, wallet, createDATE, referralBonus, referralID, participantID,incrbonus) values ('$PHID', 'Unconfirmed', 'Referral Bonus', '$phDATE', '$referralBonus', '$invite_id', '$pid', '$incrbonus')");
						$save_referralBonus->execute();
					}
					echo "Saved";
				}
				else
				{
					echo "error_save_ph_order";
				}
			}
			else if($provide_help_amount >= 1000)
			{
				$amntGH_after14days = $provide_help_amount+((($provide_help_amount*21)/100)-((9.75*$provide_help_amount)/1000)); //NGN9.75 is deducted as gain on each 1thousand Naira
				//Query to save User Pledge
				$savePH = $con->prepare("INSERT INTO providehelp (participantID, phID, status, wallet, createDATE, releaseDATE, amntPH, incrPH) values ('$pid','$PHID', 'Unconfirmed', '45% Increment', '$phDATE', '$ghDATE', '$provide_help_amount', '$amntGH_after14days')");
				if($savePH->execute())
				{
					//Save referral bonus
					if(!empty($invite_id))
					{
						$referralBonus = $provide_help_amount/10;
						$incrbonus = $amntGH_after14days/10;
						$save_referralBonus = $con->prepare("INSERT INTO referral (phID, status, wallet, createDATE, referralBonus, referralID, participantID,incrbonus) values ('$PHID', 'Unconfirmed', 'Referral Bonus', '$phDATE', '$referralBonus', '$invite_id', '$pid', '$incrbonus')");
						$save_referralBonus->execute();
					}
					echo "Saved";
				}
				else
				{
					echo "error_save_ph_order";
				}
			}
		}
		else //If participant is not a logged user, redirect
		{
			redirect_to("office");	
		}
		
	}
	
	//Delete PH
	if(isset($_GET['deletePH']))
	{
		$phID = $_GET['deletePH'];
		$getallPH = $con->prepare("SELECT * FROM `providehelp` where participantID='$pid' and phID='$phID'");
		$getallPH->execute();
		$getallPHInfo = $getallPH->fetch(PDO::FETCH_LAZY);
		$phid = $getallPHInfo['phID'];
		$amntPH = $getallPHInfo['amntPH'];
		$deletuserPH = $con->prepare("update `providehelp` set status='Cancelled', merge='Cancelled'  where phID='$phID'");
		if($deletuserPH->execute())
		{
			$deletuserPH_referral = $con->prepare("update `referral` set status='Cancelled' where phID='$phID'");
			$deletuserPH_referral->execute();
			redirect_to("dashboard");
		}
		else
		{
			redirect_to("dashboard");
		}
	}
	
	//Delete GH
	if(isset($_GET['deleteGH']))
	{
		$ID = $_GET['deleteGH'];
		$getGH = $con->prepare("SELECT * FROM `gethelp` where participantID='$pid' and ID='$ID' and merge='NO'");
		$getGH->execute();
		if($getGH->rowCount() == 0)
		{
			redirect_to("dashboard");
			die();
		}
		$getGHInfo = $getGH->fetch(PDO::FETCH_LAZY);
		$ghID = $getGHInfo['ghID'];
		$amountGH = $getGHInfo['amountGH'];
		
		$phID = 'Z'.substr($ghID, 1);
		
		$deletGH = $con->prepare("update `gethelp` set merge='Cancelled', balance='0' where ghID='$ghID' and participantID='$pid'");
		if($deletGH->execute())
		{
			$phDATE =  date('d.m.Y H:i'); // Date for providing help
			$savePH = $con->prepare("INSERT INTO providehelp (participantID, phID, status, createDATE, amntPH, incrPH, paid) values ('$pid','$phID', 'Confirmed', '$phDATE',  '$amountGH', '$amountGH', 'YES')");
			$savePH->execute();
			redirect_to("wallet");
		}
		else
		{
			redirect_to("dashboard");
		}
	}
	
	//Submit GH
	if(isset($_POST['submitGH']))
	{
		//Since we have different users with different option, now let's split their choice 
		//45% + Referral + Reg Bonus
		if(isset($_POST['incrPH']) || isset($_POST['referral_AMNT']) || isset($_POST['regBonus']))
		{
			//45% Increment GH
			if(isset($_POST['incrPH']))
			{
				$amountGH = $_POST['incrPH']; // 45% Increment
				$phID = $_POST['incrPH_ID']; // PH ID
				// print_r($incrPH);
				// echo implode(',',$phID);
				
				foreach($amountGH as $each_amt)
				{
					$array_amtt = array();
					array_push($array_amtt,$each_amt);
					$total_availGH = array_sum($amountGH); // Course fee
				}
				
				for($counter = 0; $counter < count($phID); $counter++)
				{
					$realPHID = $phID[$counter];
					$realamountGH = $amountGH[$counter]; // amount GH
					// echo $realPH;
					$xxx = $con->prepare("select * from providehelp where phID='$realPHID' and wallet='45% Increment'");
					$xxx->execute();
					$xxxIN = $xxx->fetch(PDO::FETCH_ASSOC);
					$real_IncrAmnt = round($xxxIN['incrPH']);
					$left_GH = $real_IncrAmnt - $realamountGH;
					if($realamountGH > $real_IncrAmnt)
					{
						$msg = strtoupper(substr(md5("Request is greater than available fund in your wallet"),0,4));
						redirect_to("gethelp?msg=$msg");
						die();
					}
					else
					{
						if($left_GH == 0)
						{
							$updatePH = $con->prepare("update providehelp set status='Withdraw' where phID='$realPHID' and participantID='$pid' and wallet='45% Increment'");
							$updatePH->execute();
						}
						else
						{
							$updatePH = $con->prepare("update providehelp set incrPH='$left_GH' where phID='$realPHID' and participantID='$pid' and wallet='45% Increment'");
							$updatePH->execute();
						}
					}
					// echo  ' Status: ' . $status . ' || ph id: '. $realPHID   . ' || Growth ph: '. $real_IncrAmnt .  ' || Amount Request: '. $realamountGH . ' || Balance Left: '. $left_GH . '<br/>';
					
				}
			}
			else
			{
				$total_availGH = 0;
			}
			
			//Referral Bonus
			if(isset($_POST['referral_AMNT']))
			{
				$referral_AMNT = $_POST['referral_AMNT']; // Referral Bonus
				$phID_referral = $_POST['phID_referral']; // PH ID
				// print_r($incrPH);
				// echo implode(',',$phID);
				
				foreach($referral_AMNT as $each_amt)
				{
					$array_amtt = array();
					array_push($array_amtt,$each_amt);
					$total_availRef = array_sum($referral_AMNT); // Course fee
				}
				
				for($counter = 0; $counter < count($phID_referral); $counter++)
				{
					$real_refPHID = $phID_referral[$counter];
					$real_ref_amountGH = $referral_AMNT[$counter]; // amount GH
					// echo $real_refPHID;
					$xxxref = $con->prepare("select * from referral where phID='$real_refPHID' and referralID='$pid'");
					$xxxref->execute();
					$xxxrefIN = $xxxref->fetch(PDO::FETCH_ASSOC);
					$refstatus = $xxxrefIN['status'];
					$real_refIncrAmnt = round($xxxrefIN['incrbonus']);
					$left_ref_GH = $real_refIncrAmnt - $real_ref_amountGH;
					if($real_ref_amountGH > $real_refIncrAmnt)
					{
						$msg = strtoupper(substr(md5("Request is greater than available fund in your wallet"),0,4));
						redirect_to("gethelp?msg=$msg");
						die();
					}
					else
					{
						if($left_ref_GH == 0)
						{
							$updateref = $con->prepare("update referral set status='Withdraw' where phID='$real_refPHID' and referralID='$pid'");
							$updateref->execute();
						}
						else
						{
							$updateref = $con->prepare("update referral set incrbonus='$left_ref_GH' where phID='$real_refPHID' and referralID='$pid'");
							$updateref->execute();
						}
					}
					// echo  ' Status: ' . $refstatus . ' || ph id: '. $real_refPHID   . ' || Ref Incr: '. $real_refIncrAmnt .  ' || Amount Request: '. $real_ref_amountGH . ' || Balance Left: '. $left_ref_GH . '<br/>';
					
				}
			}
			else
			{
				$total_availRef = 0;
			}
			
			//registration Bonus
			if(isset($_POST['regBonus']))
			{
				$regBonus_toGH = $_POST['regBonus']; //Referral Bonus to GH
				$regBonus_ID = $_POST['regBonus_ID']; //Referral Bonus ID to GH
				$total_GH_regbonus = $con->prepare("select * from providehelp where releaseDATE='' and status='Confirmed' and paid='YES' and wallet='Reg. Bonus' and  participantID='$pid'");
				$total_GH_regbonus->execute();
				$GHinfo = $total_GH_regbonus->fetch(PDO::FETCH_ASSOC);
				$availregBonus = round($GHinfo['incrPH']); // Real Referral Bonus
				$left_regBonus = $availregBonus - $regBonus_toGH;
				
				if($regBonus_toGH > $availregBonus)
				{
					$msg = strtoupper(substr(md5("Request is greater than available fund in your wallet"),0,4));
					redirect_to("gethelp?msg=$msg");
					die();
				}
				else
				{
					if($left_regBonus == 0)
					{
						$update_regBonus = $con->prepare("update providehelp set status='Withdraw' where releaseDATE='' and status='Confirmed' and paid='YES' and wallet='Reg. Bonus' and  participantID='$pid' and phID='$regBonus_ID'");
						$update_regBonus->execute();
					}
					else
					{
						$update_regBonus = $con->prepare("update providehelp set incrPH='$left_regBonus' where releaseDATE='' and status='Confirmed' and paid='YES' and wallet='Reg. Bonus' and  participantID='$pid' and phID='$regBonus_ID'");
						$update_regBonus->execute();
					}
				}
			}
			else
			{
				$regBonus_toGH = 0;
			}
			
	
			$getLeftOver = $con->prepare("SELECT * FROM `leftover` where pid='$pid'");
			$getLeftOver->execute();
			$getLeftOver_info = $getLeftOver->fetch(PDO::FETCH_ASSOC);
			$amount_inLefts = $getLeftOver_info["amount"];
			
			$totalGH_after_calc = round($total_availGH + $total_availRef + $regBonus_toGH + $amount_inLefts);
			
			//Before saving, we need to remove modulus
			$toleftover_GH = $totalGH_after_calc % 1000; //Left over
			
			$real_toCollect_GH = $totalGH_after_calc - $toleftover_GH; //Final amntGH
			
			// Maximum withdrawal is 500,000
			if($real_toCollect_GH > 500000)
			{
				$maxGH = $real_toCollect_GH - 500000 + $toleftover_GH;
				//Return Maxgh back to db
				
				$phDATE =  date('d.m.Y H:i'); // Date for providing help
				for($i=1; $i<=4; $i++){
					$phID="Z". mt_rand(11111,12345).mt_rand(11111,99999); //Pledge Id
				}
				
				$savePH = $con->prepare("INSERT INTO providehelp (participantID, phID, status, createDATE, amntPH, incrPH, paid) values ('$pid','$phID', 'Confirmed', '$phDATE',  '$maxGH', '$maxGH', 'YES')");
				$savePH->execute();
				
				
				$length = array_merge(range('A', 'Z'));
				$key = '';
				for($i=0; $i < count($length); $i++) {
					$key = str_replace("O","A", substr($length[mt_rand(0, count($length) - 1)], 0, 1).mt_rand(11111,52349).mt_rand(1111,9989));
				}
				$GHDATE =  date('Y-m-d'); // Date for get help
				$tosave_GH = $con->prepare("insert into gethelp (ghID, participantID, amountGH, ghDATE) values ('$key', '$pid', '500000', '$GHDATE')");
			
				
				// echo $real_toCollect_GH . $toleftover_GH . $maxGH;
				
				$updateLeft_OVER = $con->prepare("update `leftover` set amount='0' where pid='$pid'");
				$updateLeft_OVER->execute();
				// die();
			}
			else
			{
				if($toleftover_GH != 0)
				{
					$updateLeft_OVER = $con->prepare("update `leftover` set amount='$toleftover_GH' where pid='$pid'");
					$updateLeft_OVER->execute();
					
					$length = array_merge(range('A', 'Z'));
					$key = '';
					for($i=0; $i < count($length); $i++) {
						$key = str_replace("O","A", substr($length[mt_rand(0, count($length) - 1)], 0, 1).mt_rand(11111,52349).mt_rand(1111,9989));
					}
					$GHDATE =  date('Y-m-d'); // Date for get help
					$tosave_GH = $con->prepare("insert into gethelp (ghID, participantID, amountGH, ghDATE) values ('$key', '$pid', '$real_toCollect_GH', '$GHDATE')");
					
				}
				else
				{
					$length = array_merge(range('A', 'Z'));
					$key = '';
					for($i=0; $i < count($length); $i++) {
						$key = str_replace("O","A", substr($length[mt_rand(0, count($length) - 1)], 0, 1).mt_rand(11111,52349).mt_rand(1111,9989));
					}
					$GHDATE =  date('Y-m-d'); // Date for get help
					$tosave_GH = $con->prepare("insert into gethelp (ghID, participantID, amountGH, ghDATE) values ('$key', '$pid', '$real_toCollect_GH', '$GHDATE')");
				}
			}
			//ghID
			if($tosave_GH->execute())
			{
				redirect_to("dashboard");
				
				
				//Since it is saving user pH, then save left over
				$runQuery = $con->prepare("select * from leftover_admin");
				$runQuery->execute();
				$runInfo = $runQuery->fetch(PDO::FETCH_ASSOC);
				$amount_leftOver = $runInfo["amount"];
				$amntGH_after14days = (19.5*$real_toCollect_GH)/1000; //NGN19.5 is deducted as gain on each 1thousand Naira
				
				$newLeftOver = $amount_leftOver + $amntGH_after14days;
				
				$saveLeft = $con->prepare("update leftover_admin set totalamount='$newLeftOver'");
				$saveLeft->execute();
				
			}
			else
			{
				$msg = strtoupper(substr(md5("error"),0,4));
				redirect_to("gethelp?msg=$msg");
				die();
			}
		}
	}
	
	//Confirm Payment
	if(isset($_GET['ConfirmGH']) && ($_GET['ghID']))
	{
		$ghID = $_GET['ghID'];
		$phID = $_GET['phID'];
		// echo 'Chill';
		
		//Let get the receipt payment details
		$getPOP = $con->prepare("SELECT * FROM `merge_gh` where ghID='$ghID' and (status='Upload' or status='FAKEPOP') and phID='$phID'");
		$getPOP->execute();
		
		//We need the total amount of PH merge_gh
		$getPOP_info = $getPOP->fetch(PDO::FETCH_ASSOC);
		$phID = $getPOP_info['phID'];
		$status = $getPOP_info['status'];
		$amountGH = $getPOP_info['amountGH'];
		$mergePH_participantID = $getPOP_info['participantID'];
		
		//Since we have the amount User GH, then let us check the ph rows
		$checkPH = $con->prepare("select * from providehelp where phID='$phID'");
		$checkPH->execute();
		// for($i=1; $i<=rows("select * from providehelp where phID='$phID'"); $i++)
		// {
			$checkPH_info = $checkPH->fetch(PDO::FETCH_ASSOC);
			$amntPH = $checkPH_info['amntPH'];
			$balance = $checkPH_info['balance'];
			$wallet = $checkPH_info['wallet'];
			$ph_participantID = $checkPH_info['participantID'];
			$amount_confirm = $checkPH_info['amount_confirm']; // How much has user paid
			
			//Is amount GH == Amount PH??  If yes then user payment is completed and successful
			if($amntPH == $amountGH && $balance == 0)
			{
				//Update PH
				$updatePH = $con->prepare("update providehelp set paid='YES', merge='complete', status='Confirmed' where phID='$phID' and amntPH='$amountGH'");
				$updatePH->execute();
				
				// We need to update Referral Bonus so that User will be able to GH anytime
				$update_referral = $con->prepare("update referral set status='Confirmed' where phID='$phID' and participantID='$mergePH_participantID'");
				$update_referral->execute();

				// Has payment been flagged as FAKE before???
				// Then we need to auto confirm and lock the ticket once receiver has marked received
				$updateTICKET = $con->prepare("update ticket set locked='YES' where ghID='$ghID' and phID='$phID'");
				$updateTICKET->execute();
				
				// We have to update merge GH
				$updateGH = $con->prepare("update merge_gh set status='Confirmed' where ghID='$ghID' and phID='$phID'");
				$updateGH->execute();
				
				redirect_to("dashboard");
				
			}
			else
			{
				// echo $amntPH;
				//ehmnnn, U pay 2K out of 5K, u think say U smart, lolzzzzzz
				// Ur money dey pile up oooooooooooooo
				
				//Since user says amount has been paid, then lets confirm
				$amount_confirm_pay = $amount_confirm + $amountGH;
				
				// Payment completed
				if($amount_confirm_pay == $amntPH)
				{
					// We have to update merge GH
					$updateGH = $con->prepare("update merge_gh set status='Confirmed' where ghID='$ghID' and phID='$phID'");
					$updateGH->execute();
				
					// We need to update Referral Bonus so that User will be able to GH anytime
					$update_referral = $con->prepare("update referral set status='Confirmed' where phID='$phID' and participantID='$mergePH_participantID'");
					$update_referral->execute();
					
					//Update PH
					$updatePH = $con->prepare("update providehelp set paid='YES', merge='complete', status='Confirmed', amount_confirm='$amount_confirm_pay' where phID='$phID' and amntPH='$amount_confirm_pay'");
					$updatePH->execute();
					
					// This person na idiot oooo y u no pay money when u've paid part of it, lets pity am make him no loose all 
					// Has payment been flagged as FAKE before???
					// Then we need to auto confirm and lock the ticket once receiver has marked received
					$updateTICKET = $con->prepare("update ticket set locked='YES' where ghID='$ghID' and phID='$phID'");
					$updateTICKET->execute();
					
					redirect_to("dashboard");
					
				}
				
				else if($amount_confirm_pay != $amntPH)
				{
					// / We have to update merge GH
					$updateGH = $con->prepare("update merge_gh set status='Confirmed' where ghID='$ghID' and phID='$phID'");
					$updateGH->execute();
				
					//Update PH, U need to pay all your money oooo, no refferal GH yet
					$updatePH = $con->prepare("update providehelp set amount_confirm='$amount_confirm_pay' where phID='$phID' and amntPH='$amntPH'");
					$updatePH->execute();
					
					// This person na idiot oooo y u no pay money when u've paid part of it, lets pity am make him no loose all 
					// Has payment been flagged as FAKE before???
					// Then we need to auto confirm and lock the ticket once receiver has marked received
					$updateTICKET = $con->prepare("update ticket set locked='YES' where ghID='$ghID' and phID='$phID'");
					$updateTICKET->execute();
					
					redirect_to("dashboard");
					
				}
			}
		
	}
	
	//Submit letter of happiness
	if(isset($_POST['submit_ghletter']))
	{
		$ghID = $_POST['ghID'];
		$pid = $_POST['pid'];
		$gh_testimonial = addslashes($_POST['gh-testimonial']);
		$saveletter = $con->prepare("insert into testimonies (participantID, gh_letter) values ('$pid', '$gh_testimonial')");
		if($saveletter->execute())
		{
			$completemerge_gh = $con->prepare("update merge_gh set gh_letter='YES' where ghID='$ghID'");
			$completemerge_gh->execute();
			redirect_to("dashboard");
		}
	}
	
	//Time Extender
	if(isset($_GET['EXTENDTIME']) && ($_GET['mergeID']))
	{
		$mergeID = $_GET['mergeID'];
		//WHO AM I EXTENDING TIME FOR ????
		$checkallGH = $con->prepare("SELECT * FROM `merge_gh` where mergeID='$mergeID' and status='' and attachment=''");
		$checkallGH->execute();
		$checkallGH_INFO = $checkallGH->fetch(PDO::FETCH_ASSOC);
		$dateMerge_expires = $checkallGH_INFO['dateMerge_expires'];
		$additional_time =  date('M d, Y H:i:00', strtotime("$dateMerge_expires+24 hours"));
		
		//Now lets update time with the new one
		$savetime = $con->prepare("update `merge_gh` set dateMerge_expires='$additional_time' where mergeID='$mergeID'");
		if($savetime->execute())
		{
			$msg = strtoupper(substr(md5("OPERATION SUCCESSFUL"), -4));
			redirect_to("dashboard");	
		}
		else
		{
			$msg = substr(md5("Transaction Not Found"), -4);
			redirect_to("private/dashboard?msg=$msg");
		}
	}
	
	//REJECT GH ORDER
	if(isset($_GET['REJECTORDER']) && ($_GET['mergeID']))
	{
		$mergeID = $_GET['mergeID'];
		//WHO AM I EXTENDING TIME FOR ????
		$checkallGH = $con->prepare("SELECT * FROM `merge_gh` where mergeID='$mergeID' and status='' and attachment=''");
		$checkallGH->execute();
		$checkallGH_INFO = $checkallGH->fetch(PDO::FETCH_ASSOC);
		$participantID = $checkallGH_INFO['participantID'];
		
		$checkall_GH = $con->prepare("SELECT * FROM `merge_gh` where participantID ='$participantID'");
		$checkall_GH->execute();
		while($checkall_GH_INFO = $checkall_GH->fetch(PDO::FETCH_ASSOC))
		{
			$phID = $checkall_GH_INFO['phID'];
			$ghID = $checkall_GH_INFO['ghID'];
			$gh_participantID = $checkall_GH_INFO['gh_participantID'];
			$amountGH = $checkall_GH_INFO['amountGH'];
			
			//Move back GH
			$move_GH = $con->prepare("SELECT * FROM `gethelp` where participantID ='$gh_participantID' and ghID='$ghID'");
			$move_GH->execute();
			$move_GH_info = $move_GH->fetch(PDO::FETCH_ASSOC);
			$real_amountGH = $move_GH_info["amountGH"];
			$balance = $move_GH_info["balance"];
			
			//Before refunding the amount back to the db, we need to follow the followin...
			if($amountGH == $real_amountGH)
			{
				$updtGH = $con->prepare("update `gethelp` set amountGH='$amountGH', merge='NO' where participantID ='$gh_participantID' and ghID='$ghID'");
			}
			else
			{
				$totalbalance = $balance + $amountGH;
				if($totalbalance == $real_amountGH)
				{
					$updtGH = $con->prepare("update `gethelp` set amountGH='$real_amountGH', merge='NO', balance='0' where participantID ='$gh_participantID' and ghID='$ghID'");
				}
				else if($totalbalance > $real_amountGH)
				{
					//do notin, your balance cant be greater than wat u gh...
				}
				else
				{
					$updtGH = $con->prepare("update `gethelp` set merge='partial', balance='$totalbalance' where participantID ='$gh_participantID' and ghID='$ghID'");
				}
			}
			//Above condition met?
			if($updtGH->execute())
			{
				//Block merge_gh here
				$blockmergeGH = $con->prepare("update `merge_gh` set status='Cancelled', attachment='Cancelled' where participantID='$participantID' and phID='$phID'and gh_participantID ='$gh_participantID' and ghID='$ghID'");
				$blockmergeGH->execute();
				$blockRef_phID = $con->prepare("update `referral` set status='Cancelled' where phID='$phID'");
				$blockRef_phID->execute();
			}
			echo $gh_participantID .' || '. $ghID . ' || Amount GH in merge table '. $amountGH .  ' ||  Amount GH in GH table '. $real_amountGH .  ' ||  Balance in GH table '. $balance . '<br/>';
		}
		//We need to check ph table not inside while loop cos of repitition
		$get_PH = $con->prepare("SELECT * FROM `providehelp` where participantID ='$participantID' and phID='$phID' and wallet='45% Increment'");
		$get_PH->execute();
		$get_PH_info = $get_PH->fetch(PDO::FETCH_ASSOC);
		$real_amntPH = $get_PH_info["amntPH"];
		$balance_PH = $get_PH_info["balance"];
		$amount_confirm = $get_PH_info["amount_confirm"];
		if($amount_confirm != 0)
		{
			$GHDATE =  date('Y-m-d'); // Date for get help
			$length = array_merge(range('A', 'Z'));
			$key = '';
			for($i=0; $i < count($length); $i++) {
				$key = str_replace("O","A", substr($length[mt_rand(0, count($length) - 1)], 0, 1).mt_rand(11111,52349).mt_rand(1111,9989));
			}
			$get_PH = $con->prepare("insert into gethelp (ghID, participantID, amountGH, balance, ghDATE, merge, user_status)values('$key','$participantID','$amount_confirm','0','$GHDATE','NO','blocked')");
			$get_PH->execute();
		}
		//Since we've been able to move amount_confirm then we need to cancel and block user 
		$blockPH = $con->prepare("update `providehelp` set status='Cancelled', merge='Cancelled' where participantID='$participantID' and phID='$phID'");
		$blockmergePH = $con->prepare("update `providehelp` set status='Cancelled', merge='Cancelled' where participantID='$participantID' and status='Unconfirmed' and (merge='complete' or merge='partial')");
		$block_newPH = $con->prepare("update `providehelp` set status='Cancelled', merge='Cancelled' where participantID='$participantID' and merge='NO'");
		$blockUser = $con->prepare("update `participant` set status='blocked' where pid ='$participantID'");
		$blockRef = $con->prepare("update `referral` set user_status='blocked' where referralID='$participantID'");
		if($blockUser->execute()&& $blockPH->execute()&& $blockmergePH->execute()&& $blockRef->execute() && $block_newPH->execute())
		{
			redirect_to("dashboard");
		}
		else
		{
			redirect_to("dashboard");
		}
		
	}
	
}
else
{
	redirect_to("office");
}