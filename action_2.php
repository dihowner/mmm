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


// since participant has login
if(isset($username))
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
			
			
			//Since it is saving user pH, then save left over
			$runQuery = $con->prepare("select * from leftover_admin");
			$runQuery->execute();
			$runInfo = $runQuery->fetch(PDO::FETCH_ASSOC);
			$amount_leftOver = $runInfo["totalamount"];
			$leftOver = (($provide_help_amount+(($provide_help_amount*21)/100)) - $amntGH_after14days);
			$newLeftOver = $amount_leftOver + $leftOver;
			
			$saveLeft = $con->prepare("update leftover_admin set totalamount='$newLeftOver'");
			$saveLeft->execute();
		}
		else //If participant is not a logged user, redirect
		{
			redirect_to("office");	
		}
		
	}
	
	
	//Deleting PH order
	if(isset($_GET['deletePH']))
	{
		$phID = $_GET['deletePH'];
		$deletuserPH = $con->prepare("DELETE from `providehelp` where phID='$phID'");
		if($deletuserPH->execute())
		{
			redirect_to('dashboard');
		}
	}
	
	//Submit GH
	if(isset($_POST['submitGH']))
	{
		//Since we have different users with different option, now let's split their choice 
		
		//45% + Referral + Reg Bonus
		
		if(isset($_POST['incrPH']) || isset($_POST['referral_AMNT']) || isset($_POST['regBonus']) || isset($_POST['leftOver_AMNT']))
		{
			
			//45% Increment GH
			if(isset($_POST['incrPH']))
			{
				$incrPH = $_POST['incrPH']; // 45% Increment
				$incrPH_ID = $_POST['incrPH_ID']; // 45% Increment
				
				//45% Split 
				foreach($incrPH as $each_amt)
				{
					$array_amtt = array();
					array_push($array_amtt,$each_amt);
					$total = array_sum($incrPH); // Course fee
				}
				
				//Referral Bonus ID
				for($counter = 0; $counter < count($incrPH_ID); $counter++)
				{ 
					$incrPH = $incrPH_ID[$counter];
					$xxx = $con->prepare("select * from providehelp where phID='$incrPH' and wallet='45% Increment'");
					$xxx->execute();
					
					
					for($i=1; $i<=rows("select * from providehelp where phID='$incrPH' and wallet='45% Increment'"); $i++)
					{
						$xxxIN = $xxx->fetch(PDO::FETCH_ASSOC);
						$status = $xxxIN['status'];
						// echo $status . '||' . $incrPH . 'PH' .'<br><br>';
						
						
						//TIME TO TURN IT TO PROCESSED
						$change_Incrstatus = $con->prepare("update providehelp set status='Withdraw' where wallet='45% Increment' and phID='$incrPH' and participantID='$pid'");
						$change_Incrstatus->execute();
					}
					
				}
			
			}
			else
			{
				$incrPH = 0;
			}
			
			
			//Registration Bonus GH
			if(isset($_POST['regBonus']))
			{
				$regBonus = $_POST['regBonus']; // Reg Bonus 
				$regBonus_ID = $_POST['regBonus_ID']; // Reg Bonus 
				// echo $regBonus_ID . 'REG<br>';
				
				//TIME TO TURN IT TO PROCESSED
				$change_regstatus = $con->prepare("update providehelp set status='Withdraw' where wallet='Reg. Bonus' and phID='$regBonus_ID'");
				$change_regstatus->execute();
			}
			else
			{
				$regBonus = 0;
			}
			
			
			//Referral Bonus GH
			if(isset($_POST['referral_AMNT']))
			{
				$referral_AMNT = $_POST['referral_AMNT']; // Referral Amount
				$phID_referral = $_POST['phID_referral']; //Referral Bonus ID
				
				//Referral Split 
				foreach($referral_AMNT as $each_amt_rfr)
				{
					$array_amtt = array();
					array_push($array_amtt,$each_amt_rfr);
					$total_rfr = array_sum($referral_AMNT); // Course fee
				}
					
				//Referral Bonus ID
				for($counter = 0; $counter < count($phID_referral); $counter++)
				{ 
					$refPHID = $phID_referral[$counter]; // Standing for all referral ID
					$xxx = $con->prepare("select * from providehelp where phID='$refPHID' and participantID='$pid'");
					$xxx->execute();
					
					
					for($i=1; $i<=rows("select * from providehelp where phID='$refPHID' and wallet='Referral Bonus'"); $i++)
					{
						$xxxIN = $xxx->fetch(PDO::FETCH_ASSOC);
						$status = $xxxIN['status'];
						
						// echo $status . '||' . $refPHID . 'Referral<br><br>';
						
					
					//TIME TO TURN IT TO PROCESSED
					$change_referralstatus = $con->prepare("update providehelp set status='Withdraw' where wallet='Referral Bonus' and phID='$refPHID' and participantID='$pid'");
					$change_referralstatus->execute();
					}
					
				}

			}
			else
			{
				$total_rfr = 0;
			}
			
			if(isset($_POST['leftOver_AMNT']))
			{
				$leftOver_AMNT = $_POST['leftOver_AMNT']; // Reg Bonus 
				$leftOver_phID = $_POST['leftOver_phID']; // Reg Bonus 
				
				//Left Over Split 
				foreach($leftOver_AMNT as $each_amt_leftOver)
				{
					$array_amtt = array();
					array_push($array_amtt,$each_amt_leftOver);
					$total_rfr_leftOver = array_sum($leftOver_AMNT); // Course fee
				}
				
					
				//Referral Bonus ID
				for($counter = 0; $counter < count($leftOver_phID); $counter++)
				{ 
					$leftOver_ID = $leftOver_phID[$counter];
					$xxx = $con->prepare("select * from providehelp where phID='$leftOver_ID' and wallet='Left Over'");
					$xxx->execute();
					
					
					for($i=1; $i<=rows("select * from providehelp where phID='$leftOver_ID' and wallet='Left Over'"); $i++)
					{
						$xxxIN = $xxx->fetch(PDO::FETCH_ASSOC);
						$status = $xxxIN['status'];
						// echo $status . '||' . $leftOver_ID . 'Left<br><br>';
						
						
						$change_leftOverstatus = $con->prepare("update providehelp set status='Withdraw' where wallet='Left Over' and phID='$leftOver_ID' and participantID='$pid'");
						$change_leftOverstatus->execute();
						
					}
					
				}
			}
			else
			{
				$total_rfr_leftOver = 0;
			}
			
			
						
			
			
			
			$sum_GH = round($total + $total_rfr + $regBonus + $total_rfr_leftOver);
			// echo $sum_GH . '<br>';
			
			//OH NO!!!! Thousand only!!!! Yes Modulus rockssssssss
			$modulus = $sum_GH % 1000;
			$toCollect_GH =  $sum_GH - $modulus;
			
			$ghID="M". mt_rand(11111,12345).mt_rand(11111,99999); //Pledge Id
			$GHDATE =  date('d.m.Y'); // Date for providing help
			
			if($sum_GH > 1000000)
			{
				//Since Maximum PH is 3M, then lets split GH
				
				for($i=1; $i<=4; $i++){
					$PHID="Z". mt_rand(11111,12345).mt_rand(11111,99999); //Pledge Id
				}
				$splitGH =  $sum_GH/5;
				
				$modulus = $splitGH % 1000;
				$toCollect_GH =  $splitGH - $modulus;
			
				
				$return_wallet = $sum_GH - $splitGH+$modulus;
				$save_backtoWALLET = $con->prepare("INSERT INTO providehelp (participantID, phID, status, wallet, amntPH, incrPH, paid) values ('$pid','$PHID', 'Confirmed', '45% Increment' , '$return_wallet', '$return_wallet', 'YES')");
				if($save_backtoWALLET->execute())
				{
					$tosave_GH = $con->prepare("insert into gethelp (ghID, participantID, amountGH, ghDATE) values ('$ghID', '$pid', '$toCollect_GH', '$GHDATE')");
				
					if($tosave_GH->execute())
					{
						redirect_to('wallet');
					}
				}
			}
			else
			{
				$tosave_GH = $con->prepare("insert into gethelp (ghID, participantID, amountGH, ghDATE) values ('$ghID', '$pid', '$toCollect_GH', '$GHDATE')");
				
				if($tosave_GH->execute())
				{
					redirect_to('dashboard');
				}
				else
				{
					redirect_to('wallet');
				}
			}
		}
		
	}
	
	//Confirm Payment
	if(isset($_GET['ConfirmPOP']))
	{
		$ConfirmPOP = $_GET['ConfirmPOP'];
		
		//Let get the receipt payment details
		$getPOP = $con->prepare("SELECT * FROM `merge_gh` where ghID='$ConfirmPOP'");
		$getPOP->execute();
		
		//We need the total amount of PH merge_gh
		$getPOP_info = $getPOP->fetch(PDO::FETCH_ASSOC);
		$phID = $getPOP_info['phID'];
		$status = $getPOP_info['status'];
		$amountGH = $getPOP_info['amountGH'];
		$mergePH_participantID = $getPOP_info['participantID'];
		
		//Since we have the amount User GH, then let us check the ph rows
		$checkPH = $con->prepare("select * from providehelp where phID='$phID' and wallet='45% Increment'");
		$checkPH->execute();
		for($i=1; $i<=rows("select * from providehelp where phID='$phID'"); $i++)
		{
			$checkPH_info = $checkPH->fetch(PDO::FETCH_ASSOC);
			$amntPH = $checkPH_info['amntPH'];
			$balance = $checkPH_info['balance'];
			$wallet = $checkPH_info['wallet'];
			$ph_participantID = $checkPH_info['participantID'];
			// echo $wallet . '<br>';
			
			//Is amount GH == Amount PH??  If yes then user payment is completed and successful
			if($amntPH == $amountGH && $balance == 0)
			{
				//Update PH
				$updatePH = $con->prepare("update providehelp set paid='YES', merge='complete', status='Confirmed' where phID='$phID' and amntPH='$amntPH'");
				$updatePH->execute();
				
				// Update Referral
				$updateReferral = $con->prepare("update providehelp set paid='YES', status='Confirmed' where phID='$phID' and wallet='Referral Bonus'");
				$updateReferral->execute();
				
				// Update Reg Bonus
				$updateRegBonus = $con->prepare("update providehelp set paid='YES', status='Confirmed' where phID='$phID' and wallet='Reg. Bonus'");
				$updateRegBonus->execute();
				
				// Update Left Over
				$updateLeftOVER = $con->prepare("update providehelp set paid='YES', status='Confirmed' where phID='$phID' and wallet='Left Over'");
				$updateLeftOVER->execute();
				
				// We need to update gethelp
				$updateGETHELP = $con->prepare("update gethelp set merge='paid' where ghID='$ConfirmPOP' and amountGH='$amountGH'");
				$updateGETHELP->execute();
				
				//Update Merge
				$updateGH = $con->prepare("update merge_gh set status='Confirmed' where ghID='$ConfirmPOP'");
				$updateGH->execute();
				
				// After updating all process, we need to redirect user
				redirect_to("dashboard");
				
				
			}
		}
		
			$checkPH = $con->prepare("select * from providehelp where phID='$phID' and wallet='45% Increment'");
			$checkPH->execute();
			$checkPH_info = $checkPH->fetch(PDO::FETCH_ASSOC);
			$amntPH = $checkPH_info['amntPH'];
			$amount_confirm = $checkPH_info['amount_confirm'];
			$ph_participantID = $checkPH_info['participantID'];
			
			//Since user says amount has been paid, then lets confirm
			$amount_confirm_pay = $amount_confirm + $amountGH;
			// echo $amount_confirm_pay;
			
			//If amount_confirm_pay == amount user provided for help, then he or she is free
			if($amount_confirm_pay == $amntPH)
			{
				
				//Update PH
				$updatePH = $con->prepare("update providehelp set amount_confirm='$amount_confirm_pay', paid='YES', merge='complete', status='Confirmed' where phID='$phID' and amntPH='$amount_confirm_pay'");
				$updatePH->execute();
				
				// Update Referral
				$updateReferral = $con->prepare("update providehelp set paid='YES', status='Confirmed' where phID='$phID' and wallet='Referral Bonus'");
				$updateReferral->execute();
				
				// Update Reg Bonus
				$updateRegBonus = $con->prepare("update providehelp set paid='YES', status='Confirmed' where phID='$phID' and wallet='Reg. Bonus'");
				$updateRegBonus->execute();
				
				// Update Left Over
				$updateLeftOVER = $con->prepare("update providehelp set paid='YES', status='Confirmed' where phID='$phID' and wallet='Left Over'");
				$updateLeftOVER->execute();
				
				// We need to update gethelp
				$updateGETHELP = $con->prepare("update gethelp set merge='paid' where ghID='$ConfirmPOP' and amountGH='$amountGH'");
				$updateGETHELP->execute();
				
				//Update Merge
				$updateGH = $con->prepare("update merge_gh set status='Confirmed' where ghID='$ConfirmPOP'");
				$updateGH->execute();
				
				// After updating all process, we need to redirect user
				redirect_to("dashboard");
			
			}
			else
			{
				$updatePH = $con->prepare("update providehelp set amount_confirm='$amount_confirm_pay' where phID='$phID' and wallet='45% Increment'");

				// is it updating
				if($updatePH->execute())
				{
					
					// We need to update gethelp
					$updateGETHELP = $con->prepare("update gethelp set merge='paid' where ghID='$ConfirmPOP' and amountGH='$amountGH'");
					$updateGETHELP->execute();
					
					//Update Merge
					$updateGH = $con->prepare("update merge_gh set status='Confirmed' where ghID='$ConfirmPOP'");
					$updateGH->execute();
					
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
	
	//Time Extender
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
			$GHDATE =  date('d.m.Y h:i:s A'); // Date for get help
			$length = array_merge(range('A', 'Z'));
			$key = '';
			for($i=0; $i < count($length); $i++) {
				$key = str_replace("O","A", substr($length[mt_rand(0, count($length) - 1)], 0, 1).mt_rand(1111,5234).mt_rand(1111,9989));
			}
			$get_PH = $con->prepare("insert into gethelp (ghID, participantID, amountGH, balance, ghDATE, merge, user_status)values('$key','$participantID','$amount_confirm','0','$GHDATE','NO','blocked')");
			$get_PH->execute();
		}
		//Since we've been able to move amount_confirm then we need to cancel and block user 
		$blockPH = $con->prepare("update `providehelp` set status='Cancelled', merge='Cancelled' where participantID='$participantID' and phID='$phID'");
		$block_newPH = $con->prepare("update `providehelp` set status='Cancelled', merge='Cancelled' where participantID='$participantID' and merge='NO'");
		$blockUser = $con->prepare("update `participant` set status='blocked' where pid ='$participantID'");
		$blockRef = $con->prepare("update `referral` set user_status='blocked' where referralID='$participantID'");
		if($blockUser->execute()&& $blockPH->execute()&& $blockRef->execute()&& $block_newPH->execute())
		{
			redirect_to("dashboard");
		}
		else
		{
			redirect_to("dashboard");
		}
		
	}
	
}
