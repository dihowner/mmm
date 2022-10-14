	<div class="modal about-modal fade" id="provideHelp" tabindex="-1" role="dialog" style="margin-top: 30px">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"> 
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					<h4 class="modal-title">Provide Help</h4>
				</div> 
				<div class="modal-body">
					<div class="agileits-w3layouts-info">
						<p>I read <b>THE WARNING</b>, and I fully understand all the risks. I make decision to participate, being of sound mind and memory. </p>
						<p style="margin-left: 30px"><label><input type="checkbox" id="ph_agree" title="Please check this box if you want to proceed"> <b> I agree to participate</b></label></p>
						<div class="modal-footer">
							<button type="button" class="btn btn-success btn-lg" data-dismiss="modal"><i class="fa fa-remove"></i> Close</button>
							<button type="button" class="btn btn-success btn-lg" id="ph_proceed"><i class="fa fa-check"></i> Proceed</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
<!--Participant has an order but has not paid, use these to lock him or her down-->
	<div class="modal about-modal fade" id="GH_payfirst" tabindex="-1" role="dialog" style="margin-top: 100px">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"> 
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					<h4 class="modal-title">Attention!!!</h4>
				</div> 
				<div class="modal-body">
					<div class="agileits-w3layouts-info">
						<p>You have a pending transaction, kindly complete your order to proceed</p>
						
					</div>
				</div>
			</div>
		</div>
	</div>	
<!--Participant has an order but has not paid, use these to lock him or her down-->

	<!--Add Bank Account Details-->
	<div class="modal about-modal fade" id="Add_Account" tabindex="-1" role="dialog" style="margin-top: 30px">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"> 
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					<h4 class="modal-title">Account Information</h4>
				</div> 
				<div class="modal-body">
				<font color="red" size="4px"><b>NOTE:</font> Ensure to provide accurate banking information details. Editing of account details is not allowed!<br/><br/><br/></b>
					<div id="result"></div>
					<form id="getAllBankINFO">
					  
						<div class="form-group">
							<label for="recipient-name" class="form-control-label">Bank Name <font color="red">*</font>:</label>
							<input type="text" class="form-control" name="bank_name" id="bank_name" required autocomplete="off">
						</div>
						
						<div class="form-group">
							<label for="recipient-name" class="form-control-label">Account Name <font color="red">*</font>:</label>
							<input type="text" class="form-control" name="accnt_name" id="accnt_name" required autocomplete="off">
						</div>
					  
						<div class="form-group">
							<label for="recipient-name" class="form-control-label">Account Number <font color="red">*</font>:</label>
							<input type="text" class="form-control" name="accnt_number"  id="accnt_number" required autocomplete="off">
						</div>
			  
					</form>
				</div>
						
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-remove"></i> Close</button>
					<button type="button" class="btn btn-success" id="saveAccnt"><i class="fa fa-check"></i> Save Account</button>
				</div>
			</div>
		</div>
	</div>	
	
	<!--Add Details-->
	<?php
	$available_toGH_row = rows("select * from providehelp where participantID='$pid' and status='Confirmed' and paid='YES'");
	$get_allref_row = rows("SELECT * from `referral` where referralID='$pid' and user_status='active' and status!='Withdraw' ORDER BY status desc");
	// echo $available_toGH_row;
	if($available_toGH_row == 0 && $get_allref_row == 0)
	{
	?>
		
		<div class="modal about-modal fade" id="availableFUND" tabindex="-1" role="dialog" style="margin-top: 150px">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header"> 
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						<h4 class="modal-title">Available For Withdrawal</h4>
					</div> 
					<div class="modal-body">
						<center><b>Available for withdrawal: 0 NGN</b></center>
					</div>
				</div>
			</div>
		</div>
	<?php
	}
	else
	{
		$available_toGH = $con->prepare("select * from providehelp where participantID='$pid' and status='Confirmed' and paid='YES' and releaseDATE=''");
		$available_toGH->execute();

		$total_incrPH = 0;
		$total_incrbonus = 0;
		
		
		$get_allref = $con->prepare("SELECT * from `referral` where referralID='$pid' and user_status='active' and status='Confirmed' ORDER BY status desc");
		$get_allref->execute();
		for($i=1; $i<=$get_allref->rowCount(); $i++)
		{
			$get_allrefINFO = $get_allref->fetch(PDO::FETCH_ASSOC);
			$incrbonus = $get_allrefINFO["incrbonus"]; //incrbonus for all PH
			$total_incrbonus += $incrbonus;
		}
		
		for($i=1; $i<=$available_toGH_row; $i++)
		{
			$availableINFO = $available_toGH->fetch(PDO::FETCH_ASSOC);
			$incrPH = $availableINFO['incrPH'];
			$wallet  = $availableINFO['wallet'];
			$status  = $availableINFO['status'];
			$total_incrPH += $incrPH;
			
			
			// echo number_format($incrPH . $referralBonus . $leftOver).'||' . $wallet .  '||' . $status . '<br><br>';
		}
			if($pid == 1)
			{
				$available_GH =  number_format(($total_incrPH+$total_incrbonus),2);
			}
			else
			{
				$available_GH =  number_format(($total_incrPH+$total_incrbonus),2);
			}
	?>
	<div class="modal about-modal fade" id="availableFUND" tabindex="-1" role="dialog" style="margin-top: 150px">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header"> 
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
					<h4 class="modal-title">Available For Withdrawal</h4>
				</div> 
				<div class="modal-body">
				<center><b>Available for withdrawal: <?php echo $available_GH;?> NGN</b></center>
				</div>
				
			</div>
		</div>
	</div>
	<?php
	}
	?>