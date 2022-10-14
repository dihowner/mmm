<?php


/*********
This part is very complicating but looks easy if you understand the algorithm of merging User

MERGING is base on 4steps

Step 1: USER PH = USER GH: Merge

Step 2: User PH is greater than User GH then remove it from it and update balance for user 

Step 3: Available balance is equal to User GH: Merge

Step 4: Available balance is greater than user GH: Substract User GH from it and Merge then update balance; if user balance is same as another user GH, Step 3 else Continue step 4 till it gets to Zero


**********/


/*************MAKE IT A CONSTANT VARIABLE ***********/


//What's today day?
$todaysDay =  date('D'); //Mon?
//What's today date?
$dateMerge = date('d.m.Y H:i');

if($todaysDay == 'Mon' || $todaysDay == 'Tue'  || $todaysDay == 'Wed'  || $todaysDay == 'Thu')
{
	$dateMerge_expires =  date('d.m.Y H:i', strtotime('+2 days')); //48hours to pay
}
else
{
	$dateMerge_expires =  date('d.m.Y H:i', strtotime('+3 days')); //72hours to pay
}

/**************CONSTANT VARIABLE********************/

#########
# 
#########



$allGH = $con->prepare("SELECT * FROM `gethelp` where participantID='$pid' and merge='NO' and balance='0' order by ID desc");
$allGH->execute();
$allGH_row = rows("SELECT * FROM `gethelp` where participantID='$pid' and merge='NO' and balance='0'");
for($i=1; $i<=$allGH_row; $i++)
{
	$allGHInfo = $allGH->fetch(PDO::FETCH_ASSOC);
	$amountGH = $allGHInfo['amountGH']; //Amount user GH
	$ghID = $allGHInfo['ghID']; // GH id
	$ID = $allGHInfo['ID']; // id of each GH in auto_increment value
	$gh_participantID = $allGHInfo['participantID']; // id of each GH in auto_increment value
	$merge_gh_status = $allGHInfo['merge']; // id of each GH in auto_increment value
	// echo $amountGH;
	
	//Checking ph row so as not to merge participant that GH to pay his PH to him or herself
	$searchPH = $con->prepare("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status = 'Unconfirmed' and wallet='45% Increment' and paid='NO' and merge='NO' order by RAND() limit 1");
	$searchPH->execute();
	$searchPH_row = rows("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status = 'Unconfirmed' and wallet='45% Increment' and paid='NO' and merge='NO' order by RAND() limit 1");
	for($i=1; $i<=$searchPH_row; $i++)
	{
		$searchPHinfo = $searchPH->fetch(PDO::FETCH_ASSOC);
		$amntPH = $searchPHinfo['amntPH'];
		$participantID = $searchPHinfo['participantID'];
		$balance = $searchPHinfo['balance'];
		$participantID_pledge = $searchPHinfo['phID'];
		
		//Lets get participant PH email address
		$phUser = $con->prepare("select * from participant where pid='$participantID'");
		$phUser->execute();
		$phUserInfo = $phUser->fetch(PDO::FETCH_ASSOC);
		$email  = $phUserInfo['email'];
		
		
		//If amount GH is the same with amntPH, then merge 
		
		############
		# STEP 1: Amount PH is equal Amount GH
		############
		
		if($amntPH == $amountGH)
		{
			$getallPH = $con->prepare("SELECT * FROM `providehelp` WHERE status = 'Unconfirmed' and wallet='45% Increment' and amntPH='$amountGH' and paid='NO' and merge='NO' order by RAND() limit 1");
			$getallPH->execute();
			$available_PH_rows= rows("SELECT * FROM `providehelp` WHERE status = 'Unconfirmed' and wallet='45% Increment' and amntPH='$amountGH' and paid='NO'  and merge='NO' order by RAND() limit 1");
			
			for($i=1; $i<=$available_PH_rows; $i++)
			{
				$getallPHINFO = $getallPH->fetch(PDO::FETCH_ASSOC);
				
				//Is there any user that ph GH amount?
				$participantID = $getallPHINFO['participantID'];
				$participantID_pledge = $getallPHINFO['phID'];
				
				//User that GH cant use his ph to pay him or herself naw
				if($gh_participantID != $participantID) // GH participant id is not the same with ph participant
				{
					//MERGING beginssss......
					
					$merge_save = $con->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires) values ('$participantID_pledge', '$ghID', '$participantID', '$gh_participantID', '$amountGH', '$dateMerge', '$dateMerge_expires')");
					
					if($merge_save->execute())
					{
						//since it has merge user then let's stop multiple merging
						//Update GH
						$updateGH = $con->prepare("update gethelp set merge='YES' where ghID='$ghID' and amountGH='$amountGH'");
						$updateGH->execute();
						
						//Update PH
						$updatePH = $con->prepare("update providehelp set merge='complete', balance='0' where amntPH='$amountGH' and phID='$participantID_pledge' and wallet='45% Increment' and participantID='$participantID'");
						$updatePH->execute();
						// echo 'Merged';
					}
					// echo $ghID
				}
			}
		}
		
	}
	
	
	############
	# STEP 2: Participant has PH balance left and someone GH the total balance then Merged
	############
	
	//Has user provide help and not yet complete? e.g User PH 160K but provideHelp help of 120K, User must balance the 40K jare
	// , merge column must be Partial
	$getavail_PHblc_row = rows("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status = 'Unconfirmed' and wallet='45% Increment' and paid='NO' and balance='$amountGH' and merge='partial' order by RAND() limit 1");
	
	if($getavail_PHblc_row == 1)
	{
		
		$getallPH = $con->prepare("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status = 'Unconfirmed' and wallet='45% Increment' and paid='NO' and balance = '$amountGH' and merge='partial'  order by RAND() limit 1");
		$getallPH->execute();
		for($i=1; $i<=$getavail_PHblc_row; $i++)
		{
			$getallPHinfo = $getallPH->fetch(PDO::FETCH_ASSOC);
			$balance = $getallPHinfo['balance'];
			$participantID = $getallPHinfo['participantID']; //Participant who is ready to pay his or her balance
			$participantID_pledge = $getallPHinfo['phID']; // PHID
			echo $participantID;
			//updating.....
			$update_blc =  $con->prepare("update providehelp set balance='0', merge='complete' where phID='$participantID_pledge' and participantID='$participantID' and wallet='45% Increment'");  
			
			//let's save updating process
			if($update_blc->execute())
			{
				
				//Lets merge participant since we have someone to collect the balance
				$merge_save = $con->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires) values ('$participantID_pledge', '$ghID', '$participantID', '$pid', '$amountGH', '$dateMerge', '$dateMerge_expires')");
				$merge_save->execute();
				
				//Update PH
				$updatePH = $con->prepare("update providehelp set merge='complete', balance='0' where phID='$participantID_pledge' and wallet='45% Increment' and participantID='$participantID'");
				$updatePH->execute();
				
				//Update GH
				$updateGH = $con->prepare("update gethelp set merge='YES' where ghID='$ghID' and amountGH='$amountGH'");
				$updateGH->execute();
						
			}
		}
	}
	
		
	//Will user wait for a particularly participant to GH his or her balance???
	// Oh NO, it looks absurd
	// lets get the balance then and keep merging till it gets to zero
	
	###############
	#Step 3: USER PH balance Greater than USER GH
	###############
	$getavail_PH_blc = $con->prepare("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status = 'Unconfirmed' and wallet='45% Increment' and paid='NO' and balance>0 and merge='partial' order by RAND() limit 1");
	$getavail_PH_blc->execute();
	$getavail_PHblc_row = rows("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status = 'Unconfirmed' and wallet='45% Increment' and paid='NO' and balance>0 and merge='partial' order by RAND() limit 1");
	for($i=1; $i<=$getavail_PHblc_row; $i++)
	{
		$getavail_PH_blcINFO = $getavail_PH_blc->fetch(PDO::FETCH_ASSOC);
		$balance = $getavail_PH_blcINFO['balance'];
		$participantID_pledge = $getavail_PH_blcINFO['phID'];
		$participantID = $getavail_PH_blcINFO['participantID'];
		$rmvGH_4rmbalance = $balance - $amountGH;

		if($rmvGH_4rmbalance == 0)
		{
			//updating balance since all is gone.....
			$update_blc =  $con->prepare("update providehelp set balance='0', merge='complete' where phID='$participantID_pledge' and participantID='$participantID' and wallet='45% Increment'");  
			if($update_blc->execute())
			{
				//Lets merge participant since we have someone to collect the balance
				$merge_save = $con->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires) values ('$participantID_pledge', '$ghID', '$participantID', '$pid', '$amountGH', '$dateMerge', '$dateMerge_expires')");
				$merge_save->execute();
				
				//Update PH
				$updatePH = $con->prepare("update providehelp set merge='complete', balance='0' where phID='$participantID_pledge' and wallet='45% Increment' and participantID='$participantID'");
				$updatePH->execute();
				
				//Update GH
				$updateGH = $con->prepare("update gethelp set merge='YES' where ghID='$ghID' and amountGH='$amountGH'");
				$updateGH->execute();
						
			}
		}
		
		else if($rmvGH_4rmbalance > 0)
		{
			// echo $rmvGH_4rmbalance;
			$update_blc =  $con->prepare("update providehelp set balance='$rmvGH_4rmbalance', merge='partial' where phID='$participantID_pledge' and participantID='$participantID' and wallet='45% Increment'");  
			if($update_blc->execute())
			{
				//Lets merge participant since we have someone to collect the balance
				$merge_save = $con->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires) values ('$participantID_pledge', '$ghID', '$participantID', '$pid', '$amountGH', '$dateMerge', '$dateMerge_expires')");
				$merge_save->execute();
				
				//Update GH
				$updateGH = $con->prepare("update gethelp set merge='YES' where ghID='$ghID' and amountGH='$amountGH'");
				$updateGH->execute();
						
			}
		}
	}
	
	
	###############
	#Step 3: USER PH is Greater than USER GH
	###############

	//Checking ph row so as not to merge participant that GH to pay his PH to him or herself
	$searchPH_GH_GREATER = $con->prepare("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status ='Unconfirmed' and wallet='45% Increment' and paid='NO' and merge='NO' and amntPH > $amountGH order by RAND() limit 1");
	$searchPH_GH_GREATER->execute();
	$searchPH_GH_GREATER_row = rows("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status='Unconfirmed' and wallet='45% Increment' and paid='NO' and merge='NO' and amntPH > $amountGH order by RAND() limit 1");
	if($searchPH_GH_GREATER_row != 0)
	{
		for($i=1; $i<=$searchPH_GH_GREATER_row; $i++)
		{
			$searchPH_GH_GREATERINFO = $searchPH_GH_GREATER->fetch(PDO::FETCH_ASSOC);
			$participantID_pledge = $searchPH_GH_GREATERINFO['phID'];
			$participantID = $searchPH_GH_GREATERINFO['participantID'];
			$user_AmntPH = $searchPH_GH_GREATERINFO['amntPH'];
			$balance_GH = $user_AmntPH - $amountGH;
			
			if($balance_GH > 0)
			{
				
				$update_blc =  $con->prepare("update providehelp set balance='$balance_GH', merge='partial' where phID='$participantID_pledge' and participantID='$participantID' and wallet='45% Increment'");  
				if($update_blc->execute())
				{
					if(!empty($ghID))
					{
						// Lets merge participant since we have someone to collect the balance
						$merge_save = $con->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires) values ('$participantID_pledge', '$ghID', '$participantID', '$pid', '$amountGH', '$dateMerge', '$dateMerge_expires')");
						$merge_save->execute();
						
						// Update GH
						$updateGH = $con->prepare("update gethelp set merge='YES' where ghID='$ghID' and amountGH='$amountGH'");
						$updateGH->execute();
							
					}
				}
			}
		}
	}
	
	/* DOnt  let us split GH *
	else
	{
		$searchPH_GH_LESSER = $con->prepare("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status ='Unconfirmed' and wallet='45% Increment' and paid='NO' and merge='NO' and balance='0' and amntPH < $amountGH order by RAND() limit 1");
		$searchPH_GH_LESSER->execute();
		$searchPH_GH_LESSER_row = rows("SELECT * FROM `providehelp` WHERE participantID != '$pid' and status='Unconfirmed' and wallet='45% Increment' and paid='NO' and merge='NO' and balance='0' and amntPH < $amountGH order by RAND() limit 1");
		
		
		for($i=1; $i<=$searchPH_GH_LESSER_row; $i++)
		{
			$searchPH_GH_LESSERINFO = $searchPH_GH_LESSER->fetch(PDO::FETCH_ASSOC);
			$participantID_pledge = $searchPH_GH_LESSERINFO['phID'];
			$participantID = $searchPH_GH_LESSERINFO['participantID'];
			$user_AmntPH = $searchPH_GH_LESSERINFO['amntPH'];
			$balance_GH = $amountGH - $user_AmntPH;
			// echo $balance_GH . '<br>';
			// echo $ghID;
			if($balance_GH > 0)
			{
				
				$update_blc =  $con->prepare("update providehelp set merge='complete' where phID='$participantID_pledge' and participantID='$participantID' and wallet='45% Increment'");  
				if($update_blc->execute())
				{
						// Lets merge participant since we have someone to collect the balance
						$merge_save = $con->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires) values ('$participantID_pledge', '$ghID', '$participantID', '$pid', '$user_AmntPH', '$dateMerge', '$dateMerge_expires')");
						$merge_save->execute();
						
						// Update GH
						$updateGH = $con->prepare("update gethelp set merge='partial', balance='$balance_GH' where ghID='$ghID' and amountGH='$amountGH'");
						$updateGH->execute();
				}
			}
			
		}
	}
    /*STOP	*/
	

/**** get help balance ****/

/**** get help balance ****/

}
?>