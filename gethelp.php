<?php
require "config.php";

if(isset($username))
{
	// Lets use participant id as participant email address
	
	### Save Account
	$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$username'");
	$getuinfo->execute();
	$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
	$pid = $ginfo['pid'];
	$participant_name = $ginfo['name'];
	
	
	//Has user made payment to any participant before?
	
	$available_toGH = rows("select * from providehelp where status='Confirmed' and  participantID='$pid' and releaseDATE=''");
	
	$get_allref_row = rows("SELECT * from `referral` where referralID='$pid' and user_status='active' and status='Confirmed'");
	// echo $available_toGH;
	if($available_toGH == 0 && $get_allref_row == 0)
	{
		// redirect_to("dashboard");
		// die();
	}
	
	$getbank = rows("select * from bankaccount where participant='$pid'");
	
	//We need to lock GET HELP if user is yet to complete his or her PH
	$check_allMERGEPH = $con->prepare("Select * from merge_gh where participantID='$pid'");
	$check_allMERGEPH->execute();
	$check_allMERGEPHrow = rows("Select * from merge_gh where participantID='$pid'");
	for($i=1; $i<=$check_allMERGEPHrow; $i++)
	{
		$check_allMERGEPHINFO = $check_allMERGEPH->fetch(PDO::FETCH_ASSOC);
		$attachment_PH = $check_allMERGEPHINFO['attachment'];
		$status_PH = $check_allMERGEPHINFO['status'];
		if(empty($attachment_PH) && empty($status_PH))
		{
			// redirect_to("dashboard");
			// die();
		}
		else if(!empty($attachment_PH) && $status_PH='Upload')
		{
			// redirect_to("dashboard");
			// die();
		}
	}
	
	function sum_GH()
	{
		global $con, $pid;
		$total_availGH = 0;
		$total_availRef = 0;
		$total_availReg = 0;
		
		
		$rqLeftOver = $con->prepare("SELECT * FROM `leftover` where pid='$pid'");
		$rqLeftOver->execute();
		$rqLeftOver_info = $rqLeftOver->fetch(PDO::FETCH_ASSOC);
		$amount_inLeft = $rqLeftOver_info["amount"];
		
		$total_GH = $con->prepare("select * from providehelp where releaseDATE='' and status='Confirmed'  and paid='YES' and  wallet='45% Increment' and  participantID='$pid'");
		$total_GH->execute();
		for($i=1; $i<=$total_GH->rowCount(); $i++)
		{
			$GHinfo = $total_GH->fetch(PDO::FETCH_ASSOC);
			$incrPH = $GHinfo['incrPH'];
			$total_availGH += $incrPH;
		}
		
		//Registration Bonus
		$total_GH_regbonus = $con->prepare("select * from providehelp where  releaseDATE='' and status='Confirmed'  and paid='YES' and wallet='Reg. Bonus' and  participantID='$pid'");
		$total_GH_regbonus->execute();
		for($i=1; $i<=$total_GH_regbonus->rowCount(); $i++)
		{
			$GHinfo = $total_GH_regbonus->fetch(PDO::FETCH_ASSOC);
			$regBonus = $GHinfo['incrPH'];
			$total_availReg += $regBonus;
		}
		
		//Referral Bonus GH
		$total_GH_rfr = $con->prepare("select * from referral where referralID='$pid' and user_status='active' and status='Confirmed'");
		$total_GH_rfr->execute();
		for($i=1; $i<=$total_GH_rfr->rowCount(); $i++)
		{
			$total_GH_rfrinfo = $total_GH_rfr->fetch(PDO::FETCH_ASSOC);
			$wallet = $total_GH_rfrinfo['wallet'];
			$referralBonus = $total_GH_rfrinfo['incrbonus'];
			$total_availRef += $referralBonus;
		}
		return $total_availGH + $total_availReg + $total_availRef + $amount_inLeft;
	}
	
	$rqLeftOver = $con->prepare("SELECT * FROM `leftover` where pid='$pid'");
	$rqLeftOver->execute();
	if($rqLeftOver->rowCount() == 0)
	{
		$autoSaveLeft = $con->prepare("insert into`leftover` (pid, amount)values ('$pid', '0')");
		$autoSaveLeft->execute();
	}
	
	//We need to lock GET HELP if user is yet to complete his or her PH
	$check_allMERGEPH = $con->prepare("Select * from merge_gh where participantID='$pid'");
	$check_allMERGEPH->execute();
	
	//We need to lock GET HELP if user is yet to complete his or her GH
	$check_allMERGEGH = $con->prepare("Select * from merge_gh where gh_participantID='$pid'");
	$check_allMERGEGH->execute();
	
	if($check_allMERGEPH->rowCount() > 0 || $check_allMERGEGH->rowCount() > 0)
	{
		// redirect_to("dashboard");
	}
	//We need to redirect user to write letter of happiness
	$check_all= $con->prepare("Select * from merge_gh where gh_participantID='$pid' and status='Confirmed' and gh_letter=''");
	$check_all->execute();
	
	$check_allINFO = $check_all->fetch(PDO::FETCH_ASSOC);
	$gh_letter = $check_allINFO['gh_letter'];
	$ghID = $check_allINFO['ghID'];
	$totalGH = 0;
	$recheck_merge= $con->prepare("Select * from merge_gh where gh_participantID='$pid' and ghID='$ghID' and status='Confirmed'");
	$recheck_merge->execute();
	for($i=1; $i<=$recheck_merge->rowCount(); $i++)
	{
		$recheck_mergeINFO = $recheck_merge->fetch(PDO::FETCH_ASSOC);
		$sum_amountGH = $recheck_mergeINFO['amountGH'];
		$totalGH += $sum_amountGH;
	}
	
	if($recheck_merge->rowCount() > 0){
		$recheck_all= $con->prepare("Select * from gethelp where participantID='$pid' and ghID='$ghID'");
		$recheck_all->execute();
		$recheck_allINFO = $recheck_all->fetch(PDO::FETCH_ASSOC);
		$real_amountGH = $recheck_allINFO['amountGH'];
		// echo $real_amountGH;
		if($real_amountGH == $totalGH)
		{
			redirect_to("gh-testimonial?ghID=$ghID");
		}
	}
	
}
else
{
	redirect_to("office");
	die();
}
?>

<!DOCTYPE html>
<html>
<!-- Head -->
<head>
	<title>Associate a Corporate Business Category Flat Bootstrap Responsive Website Template | Home :: W3layouts</title>
	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="keywords" content="Associate a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Meta-Tags -->
	<!-- Custom-Theme-Files -->
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/font-awesome.min.css" />

	<!-- //Custom-Theme-Files -->
	<!-- Web-Fonts -->
	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" 	type="text/css">
	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700" 				type="text/css">
	<!-- //Web-Fonts -->
	<!-- Default-JavaScript-File -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/pns.js"></script>
	<!--FlexSlider-->
		<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
		<script defer src="js/jquery.flexslider.js"></script>
		<script type="text/javascript">
		$(window).load(function(){
		  $('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			  $('body').removeClass('loading');
			}
		  });
		});
		
		
		
</script>
<!--End-slider-script-->

</head>
<!-- //Head -->
<!-- Body -->
<body>

	<!-- Header -->
	<!-- banner -->
	<div class="w3l-banners">
		<div class="header">
		<!-- Top-Bar -->
				<div class="top-bar" style="background: black">
				<div class="container">
					<div class="header-nav">
						<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<h1><a class="navbar-brand" href="dashboard">Associate</a></h1>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav" style='margin-top: -10px'>
									<li><a href="dashboard"><i class='fa fa-home'></i> Home</a></li>
									<?php if($getbank == 0){ ?> <li><a href="account"><i class='fa fa-money'></i> Account</a></li><?php } else { ?> <li><a href="transactions"><i class='fa fa-exchange'></i> My Transactions</a></li><?php }?>
									
									<?php if($getbank != 0){ ?> <li><a href="wallet"><i class='fa fa-money'></i> Wallet</a></li> <?php }?>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class='fa fa-users'></i> My Page <b class="caret"></b></a>
										<ul class="dropdown-menu agile_short_dropdown">
											<li><a href="profile"><i class='fa fa-users'></i> Profile</a></li>
											<li><a href="referral"><i class='fa fa-users'></i> My Referral</a></li>
											<li><a href="gh-testimonial"><i class='fa fa-envelope'></i> Get Help Testimonies</a></li>
										</ul>
									</li>
									<li><a href="ticket"><i class='fa fa-pencil'></i> SUPPORT</a></li>
									<li><a href="logoff"><i class='fa fa-sign-out'></i> LOGOUT</a></li>
								</ul>
							</div>
							<!-- /navbar-collapse -->

						</nav>
					</div>
				</div>
			</div>
		<!-- //Top-Bar -->
	</div>
	<!-- //Header -->
		<div class="container">
			<div class="flexslider-info">				
				<div class="warning col-md-12" style="margin-bottom: 20px;>
					<font color='red' size="4px"><b>WARNING!</b></font> THIS IS A COMMUNITY OF MUTUAL FINANCIAL HELP! Participate only with <b><u>spare money</u></b>. Don't contribute all the money you have.
				</div>
				
				<div class='col-md-12'>
					<?php
					if(isset($_GET["msg"]) == strtoupper(substr(md5("Request is greater than available fund in your wallet"),0,4)))
					{
						echo error("Request is greater than available fund in your wallet");
					}
					else if(isset($_GET["msg"]) == strtoupper(substr(md5("error"),0,4)))
					{
						echo error("error_save_gh_order");
					}
					?>
					<div class="panel panel-default">
						<div class="panel-body">
							<b>Enter the amount you wish to Get HELP</b>
							<br/>
							<p>
							Enter amounts to be withdrawn from each of your wallet<br/>
							Withdrawal currency: <b><i>NGN</i></b><br/>
							Only withdraw in multiples of 10: <b><i>1,000</i></b><br/>
							Maximum to withdraw: <b><i>NGN<?php echo number_format(sum_GH(),2);?></i></b><br/>
							</p>
							<br/><br/>
							
						<form method='post' action='action'>
					<?php
					if(sum_GH() >= 1000)
					{						
					//45% INCREMENT GH
					
					$total_GH = $con->prepare("select * from providehelp where releaseDATE='' and status='Confirmed'  and paid='YES' and  wallet='45% Increment' and  participantID='$pid'");
					$total_GH->execute();
					for($i=1; $i<=$total_GH->rowCount(); $i++)
					{
						$GHinfo = $total_GH->fetch(PDO::FETCH_ASSOC);
						$incrPH = round($GHinfo['incrPH']);
						$phID = $GHinfo['phID'];
						// $totalPH 
						?>
						<div class="col-md-5" style='margin-top: 10px;'>
							<b>45% Increment (<i>NGN<?php echo number_format($incrPH);?></i>):</b>
						</div>
						
						<div class="col-md-7">
							<input type='text' value='<?php echo $incrPH;?>' name='incrPH[]' class='form-control input-lg'>
							<input type='hidden' value='<?php echo $phID;?>' name='incrPH_ID[]' class='form-control input-lg'>
						</div><br/><br/><br/>
					<?php
					}
					
					//Registration Bonus GH
					$total_GH_regbonus = $con->prepare("select * from providehelp where  releaseDATE='' and status='Confirmed'  and paid='YES' and wallet='Reg. Bonus' and  participantID='$pid'");
					$total_GH_regbonus->execute();
					if($total_GH_regbonus->rowCount() != 0)
					{
					$GHinfo = $total_GH_regbonus->fetch(PDO::FETCH_ASSOC);
					$regBonus = $GHinfo['incrPH'];
					$regBonus_ID = $GHinfo['phID'];
						?>
						<div class="col-md-5" style='margin-top: 10px;'>
							<b>Registration Bonus (<i>NGN<?php echo number_format($regBonus);?></i>):</b>
						</div>
						<div class="col-md-7">
							<input type='text' value='<?php echo $regBonus;?>' name='regBonus' class='form-control input-lg' >
							<input type='hidden' value='<?php echo $regBonus_ID;?>' name='regBonus_ID' class='form-control input-lg'>
						</div><br/><br/><br/>
					<?php
					}
					//Referral Bonus GH
					$total_GH_rfr = $con->prepare("select * from referral where referralID='$pid' and user_status='active' and status='Confirmed'");
					$total_GH_rfr->execute();
					for($i=1; $i<=$total_GH_rfr->rowCount(); $i++)
					{
						$total_GH_rfrinfo = $total_GH_rfr->fetch(PDO::FETCH_ASSOC);
						$wallet = $total_GH_rfrinfo['wallet'];
						$referralBonus = round($total_GH_rfrinfo['incrbonus']);
						$refphID = $total_GH_rfrinfo['phID'];
						?>
						<div class="col-md-5" style='margin-top: 10px;'>
							<b>Referral Bonus (<i>NGN<?php echo number_format($referralBonus);?></i>):</b>
						</div>
						<div class="col-md-7">
							<input type='text' value='<?php echo $referralBonus;?>' name='referral_AMNT[]' class='form-control input-lg'>
							<input type='hidden' value='<?php echo $refphID;?>' name='phID_referral[]' class='form-control input-lg'>
						</div><br/><br/><br/>
					<?php
						
						
					}
					
					
					/*LEFT Over GH ..... Admin must flexxxxxxxxxx */ 
					if($pid == 1)
					{
						
					$total_GH = $con->prepare("select * from providehelp where wallet='Left Over' and status='Confirmed' and releaseDATE='' and paid='YES'");
					$total_GH->execute();
						for($i=1; $i<=rows("select * from providehelp where wallet='Left Over' and status='Confirmed' and releaseDATE='' and paid='YES'"); $i++)
						{
							$GHinfo = $total_GH->fetch(PDO::FETCH_ASSOC);
							$wallet = $GHinfo['wallet'];
							$leftOver = $GHinfo['leftOver'];
							$phID = $GHinfo['phID'];
							?>
							<div class="col-md-5" style='margin-top: 10px;'>
								<b>Left Over:</b>
							</div>
							<div class="col-md-7">
								<input type='text' value='<?php echo number_format($leftOver);?>' class='form-control input-lg' disabled>
								<input type='hidden' value='<?php echo $phID;?>' name='leftOver_phID[]' class='form-control input-lg'>
								<input type='hidden' value='<?php echo $leftOver;?>' name='leftOver_AMNT[]' class='form-control input-lg'>
							</div><br/><br/><br/>
						<?php
						}
					}
					
					}
					
					$rqLeftOver = $con->prepare("SELECT * FROM `leftover` where pid='$pid'");
					$rqLeftOver->execute();
					$rqLeftOver_info = $rqLeftOver->fetch(PDO::FETCH_ASSOC);
					$amount_inLeft = $rqLeftOver_info["amount"];
					?>
						<div class="col-md-5" style='margin-top: 10px;'>
							<b>Amount over multiple of 10, saved for next withdrawal: </b>
						</div>
						
						<div class="col-md-7" style='margin-top: 10px;'>
							<b><?php echo number_format($amount_inLeft,3) ;?></b>
						</div><br/>
						<font color='red'size='4px'><b>NOTE: </font> Maximum GH limit at a time is N500,000</b><br/>
						<?php
						if(sum_GH() >= 1000)
						{
						?>
							<button name='submitGH' type='submit' class='btn btn-success btn-lg'><b>Get Help</b></button>
						<?php
						}
						?>
						
						</form>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- footer --

	
	<div class="footer-w3layouts" style="margin-top: 20%">
		<div class="container">
			<div class="agile-copy">
				<p>&copy; 2017  Associate. All rights reserved</a></p>
			</div>
			<div class="agileits-social">
				<ul>
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				</ul>
			</div>
				<div class="clearfix"></div>
		</div>
	</div>
	<!-- //footer -->
	
<?php
include "multi-task-holder.php";
?>					

</body>
<!-- //Body -->
</html>