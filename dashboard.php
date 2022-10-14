<?php
set_time_limit(0);
ini_set("memory_limit", "1000M"); 
require "config.php";
require "UrgentMerging.php";

if(isset($username))
{
	// Lets use participant id as participant email address
	
	$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$username'");
	$getuinfo->execute();
	if($getuinfo->rowCount() == 0)
	{
		redirect_to("office");
		exit();
	}
	$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
	$pid = $ginfo['pid'];
	$participant_name = $ginfo['name'];
	$user_status = $ginfo['status'];
	$blocked = strtoupper(substr(md5("blocked"), -4));
	if($user_status != 'active')
	{
		redirect_to("ticket?msg=$blocked");
	}
	
	//Has user made payment to any participant before?
	$available_toGH = rows("select * from providehelp where status='Confirmed' and  participantID='$pid'");
	$get_allref_row = rows("SELECT * from `referral` where referralID='$pid' and user_status='active' and status='Confirmed'");
	$getbank = rows("select * from bankaccount where participant='$pid'");
	
	//We need to lock GET HELP if user is yet to complete his or her PH
	$check_allMERGEGH = $con->prepare("Select * from merge_gh where gh_participantID='$pid'");
	$check_allMERGEGH->execute();
	
	//We need to lock GET HELP if user is yet to complete his or her PH
	$check_allMERGEPH = $con->prepare("Select * from merge_gh where participantID='$pid'");
	$check_allMERGEPH->execute();
	$check_allMERGEPHrow = rows("Select * from merge_gh where participantID='$pid'");
	for($i=1; $i<=$check_allMERGEPHrow; $i++)
	{
		$check_allMERGEPHINFO = $check_allMERGEPH->fetch(PDO::FETCH_ASSOC);
		$attachment_PH = $check_allMERGEPHINFO['attachment'];
		$status_PH = $check_allMERGEPHINFO['status'];
	}
	
	//We need to redirect user to write letter of happiness
	$check_all= $con->prepare("Select * from merge_gh where gh_participantID='$pid' and status='Confirmed' and gh_letter=''");
	$check_all->execute();
	
	$check_allINFO = $check_all->fetch(PDO::FETCH_ASSOC);
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
		$recheck_all= $con->prepare("Select * from gethelp where participantID='$pid' and ghID='$ghID' and merge='YES'");
		$recheck_all->execute();
		$recheck_allINFO = $recheck_all->fetch(PDO::FETCH_ASSOC);
		$real_amountGH = $recheck_allINFO['amountGH'];
		
		if($real_amountGH == $totalGH)
		{
			redirect_to("gh-testimonial?ghID=$ghID");
		}
	}
}
else
{
	redirect_to("office");
}
?>

<!DOCTYPE html>
<html>
<!-- Head -->
<head>
	<title>Premium Cycler: Peer to Peer donation community</title>
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
									<li><a href="dashboard" class="active"><i class='fa fa-home'></i> Home</a></li>
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
									<li><a href="logoff"><i class='fa fa-sign-out'></i> LOGOUT (<?php echo $username;?>)</a></li>
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
				<div class="warning col-md-12">
					<font color='red' size="4px"><b>WARNING!</b></font> THIS IS A COMMUNITY OF MUTUAL FINANCIAL HELP! Participate only with <b><u>spare money</u></b>. Don't contribute all the money you have.
				</div>
				<div class="col-md-12">
					<br/>
					<img src='images/PMC.jpg' width='100%' height='120px'>
				</div>
				<div class="col-md-12">
					<div class="col-md-5">
					<?php
					if($getbank == 0)
					{
					?>
						<a href="account" class="provide_help">ADD YOUR ACCOUNT DETAILS</a>
					<?php
					}
					else
					{
					?>
						<button class="provide_help" data-toggle="modal" data-target="#provideHelp">PROVIDE HELP <br></button>
					<?php
					}
					?>
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-5">
						<?php
						if($available_toGH == 0 && $get_allref_row==0)
						{
						?>
							<button class="get_help" id='dashboard_gh' disabled><span id="gh">GET HELP</span></button>
						<?php
						}
						else if($check_allMERGEPHrow >=1)
						{
							if(empty($attachment_PH) && empty($status_PH))
							{
							?>
								<button class="get_help" data-toggle="modal" data-target="#GH_payfirst">GET HELP <br></button>
							<?php
							}
							else if(!empty($attachment_PH) && $status_PH='Upload')
							{
							?>
								<button class="get_help" data-toggle="modal" data-target="#GH_payfirst">GET HELP <br></button>
							<?php
							}
						}
						else if($check_allMERGEGH->rowCount() >=1)
						{
						?>
							<button class="get_help" data-toggle="modal" data-target="#GH_payfirst">GET HELP <br></button>
						<?php
						}
						else
						{
						?>
							<a href='gethelp' class="get_help"><span id="gh">GET HELP</span></a>
						<?php
						}
						?>
					</div>
				</div>
				
				<div class='col-md-12'>
					<br/>
					<div class="col-md-7">
						<font size='6'><b> "GET HELP" REQUEST</b></font>
						<table class="table table-bordered table-striped table-hover table-responsive">
							
							
						<?php
						$todaysTIME =  date('d.m.Y H:i');
						$merge_GH = $con->prepare("SELECT * FROM `merge_gh` where gh_participantID='$pid' and status!='Confirmed'  and status!='Cancelled' ");
						$merge_GH->execute();
						$merge_GHrow = rows("SELECT * FROM `merge_gh` where gh_participantID='$pid' and status!='Confirmed'  and status!='Cancelled' ");
						if($merge_GHrow == 0)
						{
						?>
							<tr>
								<td><b>Payee</b></td>
								<td><b>Amount</b></td>
								<td><b>Match Date</b></td>
								<td><b>Action</b></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						<?php
						}
						else
						{	
						?>
							<tr>
								<td><b>Payee</b></td>
								<td><b>Amount</b></td>
								<td><b>Match Date</b></td>
								<td><b>Action</b></td>
							</tr>
							<tr>
						<?php
							for($i=1; $i<=$merge_GHrow; $i++)
							{
								$merge_GHINFO = $merge_GH->fetch(PDO::FETCH_ASSOC);
								$participantID = $merge_GHINFO['participantID']; //Id of participant who is to pay
								$gh_participantID = $merge_GHINFO['gh_participantID']; //Id of participant who is to pay
								$amountGH = $merge_GHINFO['amountGH'];
								$dateMerge = $merge_GHINFO['dateMerge'];
								$dateMerge_expires = $merge_GHINFO['dateMerge_expires'];
								$ghID = $merge_GHINFO['ghID'];
								$phID = $merge_GHINFO['phID'];
								$attachment = $merge_GHINFO['attachment'];
								$merge_status_pay = $merge_GHINFO['status'];
								$mergeID = $merge_GHINFO['mergeID'];
								// echo $participantID;
								
								//Sender Details
								$getparticipant = $con->prepare("select * from participant where pid='$participantID'");
								$getparticipant->execute();
								$getparticipantINFO = $getparticipant->fetch(PDO::FETCH_ASSOC);
								$participant_name_to_pay = $getparticipantINFO['name'];
								$to_pay_number = $getparticipantINFO['mobile'];
								
								//Receiver Details
								$getrcv_participant = $con->prepare("select * from participant where pid='$gh_participantID'");
								$getrcv_participant->execute();
								$getrcv_participantINFO = $getrcv_participant->fetch(PDO::FETCH_ASSOC);
								$participant_name_to_rcv = $getrcv_participantINFO['name'];
								$to_rcv_number = $getrcv_participantINFO['mobile'];
								
								//Get the receiver bank account details
								$getbank = $con->prepare("select * from bankaccount where participant='$gh_participantID'");
								$getbank->execute();
								$getbankINFO = $getbank->fetch(PDO::FETCH_ASSOC);
								$bankName = $getbankINFO['bankName'];
								$merchantName = $getbankINFO['merchantName'];
								$merchantNo = $getbankINFO['merchantNo'];
								// echo $participant_name_to_pay;
									
							if(empty($attachment) || $merge_status_pay == "Upload")
							{
							?>
								<script>
									// Set the date we're counting down to
									var countDownDate<?php echo $mergeID;?> = new Date("<?php echo $dateMerge_expires;?>").getTime();

									// Update the count down every 1 second
									var x = setInterval(function() {

										// Get todays date and time
										var now = new Date().getTime();
										
										// Find the distance between now an the count down date
										var distance = countDownDate<?php echo $mergeID;?> - now;
										
										// Time calculations for days, hours, minutes and seconds
										var days = Math.floor(distance / (1000 * 60 * 60 * 24));
										var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
										var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
										var seconds = Math.floor((distance % (1000 * 60)) / 1000);
										

										// If the count down is over, write some text 
										if (distance > 0) {
											document.getElementById("countDOWN<?php echo $mergeID;?>").innerHTML = "<center><span style='color: green; font-size: 38pt;'><b> "+days + "d " + hours + "h "
										+ minutes + "m " + seconds + "s  </span></center>";
										}
									}, 1000);
								</script>
								<td><b><?php echo ucfirst($participant_name_to_pay);?></b></td>
								<td><b>&#8358;<?php echo number_format($amountGH);?></b></td>
								<td><b><?php echo $dateMerge;?></b></td>
								<?php
								if(empty($attachment))
								{
								?>
									<td><button class='btn btn-success' data-toggle="modal" data-target="#mergeID<?php echo $mergeID;?>"><b>VIEW ORDER</b></button></td>
								<?php
								}
								else if($merge_status_pay == 'Upload')
								{
								?>
									<td><button class='btn btn-success' data-toggle="modal" data-target="#mergeID<?php echo $mergeID;?>"><b>CONFIRM PAYEE</b></button></td>
								<?php
								}
							}
								?>
							</tr>
							
							<div class="modal about-modal fade" id="mergeID<?php echo $mergeID;?>" tabindex="-1" role="dialog">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header"> 
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
											<h4 class="modal-title">ORDER DETAILS: <?php echo $ghID;?></h4>
										</div> 
										<div class="modal-body">
										<?php if(empty($attachment)){?><p id='countDOWN<?php echo $mergeID;?>'></p><?php }?>
										
										
											<div style="color:#000; font-size:14px">
												You requested for the sum of <b>NGN<?php echo number_format(($amountGH),2);?></b>. You will be paid before <b><?php echo $dateMerge_expires;?></b>, according to banking details provided, payment is to be made to:
											
												<br/><br/>
												<div class="panel panel-default">
													<div class="panel-body">
														<b>Bank Name:</b> <?php echo $bankName;?><br/>
														<b>Account Name:</b> <?php echo strtoupper($merchantName);?><br/>
														<b>Account Number:</b> <?php echo $merchantNo;?><br/>
														<b>Receiver Name:</b> <?php echo ucwords($participant_name_to_rcv);?><br/>
														<b>Receiver Mobile:</b> +<?php echo $to_rcv_number;?><br/>
													</div>
												</div>
												<font color='red' size='5px'><b><u>ATTENTION:</u></b></font><br>
												IF FUNDS HAVE NOT BEEN TRANSFERRED TO YOU BY <b><?php echo $dateMerge_expires;?></b>, SENDER's ACCOUNT WILL BE LOCKED AND WILL NOT BE ABLE TO PARTICIPATE IN THE SYSTEM. GH-ORDER WOULD BE REDIRECTED TO ANOTHER PARTICIPANT.<br/>
												<br/>
												
											<?php
												if(empty($attachment))
												{
												?>
													<center><a class='btn btn-success btn-lg' href='action?EXTENDTIME&mergeID=<?php echo $mergeID;?>' onclick="return confirm('Add Additional 24hours?');"><b><i class='fa fa-plus'></i> EXTEND TIME</b></a></center>
												<?php
												}
												else
												{
												?>
													<center>
													<a href='images/attachment/<?php echo $attachment;?>' target='_blank'><b><i class='fa fa-camera fa-2x'></i> VIEW RECEIPT</b></a><br/>
													<a href='action?ConfirmGH&ghID=<?php echo $ghID;?>&phID=<?php echo $phID;?>' class='btn btn-success' onclick="return confirm('Confirm &#8358;<?php echo number_format($amountGH);?> Donation? \n \nDo you want to Proceed?');"><b>CONFIRM ORDER</b></a>
													</center>
												<?php
												}?>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							<?php
							}
						}
						?>
							
						</table>
						<!----MERGING ASPECT GOES ON--->
						<font size='6'><b> "PROVIDE HELP"  REQUEST</b></font>
						<table class="table table-bordered table-striped table-hover table-responsive">
							
							<!----Showing PH----------> 
						<?php
						$merge_PH = $con->prepare("SELECT * FROM `merge_gh` where participantID='$pid' and status!='Confirmed'  and status!='Cancelled'");
						$merge_PH->execute();
						$merge_PHrow = rows("SELECT * FROM `merge_gh` where participantID='$pid' and status!='Confirmed'  and status!='Cancelled' ");
						if($merge_PHrow == 0)
						{
						?>
							<tr>
								<td><b>Receiver</b></td>
								<td><b>Amount</b></td>
								<td><b>Match Date</b></td>
								<td><b>Action</b></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						<?php
						}
						else
						{
						?>
							<tr>
								<td><b>Receiver</b></td>
								<td><b>Amount</b></td>
								<td><b>Match Date</b></td>
								<td><b>Action</b></td>
							</tr>
							<tr>
						<?php	
							for($i=1; $i<=$merge_PHrow; $i++)
							{
								$merge_PHINFO = $merge_PH->fetch(PDO::FETCH_ASSOC);
								$participantID = $merge_PHINFO['participantID']; //Id of participant who is to collect
								$gh_participantID = $merge_PHINFO['gh_participantID']; //Id of participant who is to pay
								$amountGH = $merge_PHINFO['amountGH'];
								$dateMerge = $merge_PHINFO['dateMerge'];
								$dateMerge_expires = $merge_PHINFO['dateMerge_expires'];
								$status = $merge_PHINFO['status'];
								$ghID = $merge_PHINFO['ghID'];
								$phID = $merge_PHINFO['phID'];
								$attachment = $merge_PHINFO['attachment'];
								$mergeID = $merge_PHINFO['mergeID'];
								// echo $participantID;
								
								//Sender Details
								$getparticipant = $con->prepare("select * from participant where pid='$participantID'");
								$getparticipant->execute();
								$getparticipantINFO = $getparticipant->fetch(PDO::FETCH_ASSOC);
								$participant_name_to_pay = $getparticipantINFO['name'];
								$to_pay_number = $getparticipantINFO['mobile'];
								
								//Receiver Details
								$getrcv_participant = $con->prepare("select * from participant where pid='$gh_participantID'");
								$getrcv_participant->execute();
								$getrcv_participantINFO = $getrcv_participant->fetch(PDO::FETCH_ASSOC);
								$rcvparticipant_name_to_pay = $getrcv_participantINFO['name'];
								$to_rcv_number = $getrcv_participantINFO['mobile'];
								
								//Get the receiver bank account details
								$getbank = $con->prepare("select * from bankaccount where participant='$gh_participantID'");
								$getbank->execute();
								$getbankINFO = $getbank->fetch(PDO::FETCH_ASSOC);
								$bankName = $getbankINFO['bankName'];
								$merchantName = $getbankINFO['merchantName'];
								$merchantNo = $getbankINFO['merchantNo'];
								
								
								//Calculation for time left
									$Draw_time = str_replace('/', '-', $dateMerge_expires);
									$now = new DateTime();
									$futureDate = new DateTime($Draw_time);
									 $interval = $futureDate->diff($now);
								
								// Since User has paid and its confirmed, order disappear
								if($status != "Confirmed")
								{
							?>
							
										<script>
										// Set the date we're counting down to
										var countDownDate<?php echo $mergeID;?> = new Date("<?php echo $dateMerge_expires;?>").getTime();

										// Update the count down every 1 second
										var x = setInterval(function() {

											// Get todays date and time
											var now = new Date().getTime();
											
											// Find the distance between now an the count down date
											var distance = countDownDate<?php echo $mergeID;?> - now;
											
											// Time calculations for days, hours, minutes and seconds
											var days = Math.floor(distance / (1000 * 60 * 60 * 24));
											var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
											var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
											var seconds = Math.floor((distance % (1000 * 60)) / 1000);
											

											// If the count down is over, write some text 
											if (distance > 0) {
												document.getElementById("countDOWN<?php echo $mergeID;?>").innerHTML = "<center><span style='color: green; font-size: 38pt;'><b> "+days + "d " + hours + "h "
											+ minutes + "m " + seconds + "s  </span></center>";
											}
										}, 1000);
										</script>
								<td><b><?php echo ucfirst($rcvparticipant_name_to_pay);?></b></td>
								<td><b>&#8358;<?php echo number_format($amountGH);?></b></td>
								<td><b><?php echo $dateMerge;?></b></td>
								<td><button class='btn btn-success' data-toggle="modal" data-target="#mergeID<?php echo $mergeID;?>"><b>VIEW ORDER</b></button></td>
							</tr>
							
							
							<div class="modal about-modal fade" id="mergeID<?php echo $mergeID;?>" tabindex="-1" role="dialog" style="margin-top: -1%">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header"> 
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
											<h4 class="modal-title">ORDER DETAILS: <?php echo $phID;?></h4>
										</div> 
										<div class="modal-body">
										<?php if(empty($attachment)){?><p id='countDOWN<?php echo $mergeID;?>'></p><?php }?>
											<br/>
											<div style="color:#000; font-size:14px">
												A participant has requested for the sum of <b>NGN<?php echo number_format(($amountGH),2);?></b>, You have to provide help before <b><?php echo $dateMerge_expires;?></b>, according to bank details provided, payment is to be made to:
												
												<br/><br/>
												<div class="panel panel-default">
													<div class="panel-body">
														<b>Bank Name:</b> <?php echo $bankName;?><br/>
														<b>Account Name:</b> <?php echo strtoupper($merchantName);?><br/>
														<b>Account Number:</b> <?php echo $merchantNo;?><br/>
														<b>Receiver Name:</b> <?php echo ucwords($rcvparticipant_name_to_pay);?><br/>
														<b>Receiver Mobile:</b> +<?php echo $to_rcv_number;?><br/>
													</div>
												</div>
												<font color='red' size='5px'><b><u>ATTENTION:</u></b></font><br>
												IF FUNDS HAVE NOT BEEN TRANSFERRED TO RECEIVER BY <b><?php echo $dateMerge_expires;?></b>, YOUR ACCOUNT WILL BE LOCKED AND YOU WILL NOT BE ABLE TO PARTICIPATE IN THE SYSTEM. GH-ORDER WOULD BE REDIRECTED TO ANOTHER PARTICIPANT.<br/>
												<br/>
												
											<?php
												if(empty($attachment))
												{
												?>
													<center>
														<a class='btn btn-success btn-lg' href='uploadPOP?mergeID=<?php echo $mergeID;?>'><b>UPLOAD RECEIPT</b></a>
														<a class='btn btn-danger btn-lg' href='action?REJECTORDER&mergeID=<?php echo $mergeID;?>' onclick="return confirm('Rejecting an order implies getting your account blocked and all fund in your wallet might get lost!\n\nDo you wish to proceed?');"><b>REJECT ORDER</b></a>
													</center>
												<?php
												}
												else
												{
												?>
													<center><a href='images/attachment/<?php echo $attachment;?>' target='_blank'><b><i class='fa fa-camera fa-2x'></i> VIEW RECEIPT</b></a></center>
												<?php
												}?>
											</div>
										</div>
										
									</div>
								</div>
							</div>
							
							<?php
								}
							}
						}
						?>

						</table>
						
							<!----Showing PH---------->

					</div>
				
				
					<div class="col-md-5"><br><br>
						<?php
						//Get Help
						$getallGH = $con->prepare("SELECT * FROM `gethelp` where participantID='$pid' and user_status='active'  and merge!='Cancelled' order by ID desc");
						$getallGH->execute();
						// echo $pid;
						$getallGH_row = $getallGH->rowCount();
						if($getallGH_row == 0)
						{
							// echo 12;
						}
						else
						{
							for($i=1; $i<=$getallGH_row; $i++)
							{
								$getallGHInfo = $getallGH->fetch(PDO::FETCH_LAZY);
								$ghid = $getallGHInfo['ghID'];
								$ID = $getallGHInfo['ID'];
								$ghDATE = $getallGHInfo['ghDATE'];
								$amountGH = $getallGHInfo['amountGH'];
								$merge = $getallGHInfo['merge'];
								$balanceGH = $getallGHInfo['balance'];
								// echo $merge;
								if($merge == 'NO' || $amountGH==$balanceGH)
								{
							?>
								
									<div class='gh_info'>
										<table width="100%" cellspacing="6" cellpadding="0" border="0">
											<tbody>
												<tr>
													<td class="ord_title" style='width: 70%'><span class="translate">Request to Get Help</span> <span class="order_in_id"><?php echo $ghid;?></span></td>
													<td width="6%"><img src="images/strelka_32.png" width="32" height="32"></td>
													
												</tr>
												<tr>
													<td colspan="3" class="ord_body">
														<br>
														<div class="ord_body_info">
															<span class="translate">Participant</span>: <span class="order_in_fio"><?php echo ucfirst($participant_name);?></span><br>
															<span class="translate">Amount</span>: <span class="order_in_amount"><?php echo number_format($amountGH)?>.00</span> <span class="order_in_currency">NGN</span><br>
															<!--<span class="translate">Balance</span>: <span class="order_in_amount"><?php echo number_format($amntPH)?>.00</span> <span class="order_in_currency">NGN</span><br>-->
															<span class="translate">Date</span>: <span class="order_in_date"><?php echo $ghDATE;?></span><br>
															<font color='red'>Status:</font> Your request has been received, merging in progress
															<br><br><a href="action?deleteGH=<?php echo $ID;?>" onclick="return confirm('You are about to delete your request\n\nDo you want to Proceed?');" style="background: #fff; padding: 5px; margin-top:-12px; padding: 10px">Cancel Order</a>
															<br/><br/>
													</td>
												</tr>

											</tbody>
										</table>
									
														</div>
							<?php
								// echo $amountGH;
								}
								else if($merge == 'YES')
								{
								?>
									
								
									<div class='gh_info'>
										<table width="100%" cellspacing="6" cellpadding="0" border="0">
											<tbody>
												<tr>
													<td class="ord_title" style='width: 70%'><span class="translate">Request to Get Help</span> <span class="order_in_id"><?php echo $ghid;?></span></td>
													<td width="6%"><img src="images/strelka_32.png" width="32" height="32"></td>
													
												</tr>
												<tr>
													<td colspan="3" class="ord_body">
														<br>
														<div class="ord_body_info">
															<span class="translate">Participant</span>: <span class="order_in_fio"><?php echo ucfirst($participant_name);?></span><br>
															<span class="translate">Amount</span>: <span class="order_in_amount"><?php echo number_format(($amountGH),2)?></span> <span class="order_in_currency">NGN</span><br>
															<!--<span class="translate">Balance</span>: <span class="order_in_amount"><?php echo number_format($amntPH)?>.00</span> <span class="order_in_currency">NGN</span><br>-->
															<span class="translate">Date</span>: <span class="order_in_date"><?php echo $ghDATE;?></span><br>
															<br>
															
													</td>
												</tr>

											</tbody>
										</table>
									
														</div>
								<?php
								}
								else if($merge == 'partial')
								{
								?>
									
								
									<div class='gh_info'>
										<table width="100%" cellspacing="6" cellpadding="0" border="0">
											<tbody>
												<tr>
													<td class="ord_title" style='width: 70%'><span class="translate">Request to Get Help</span> <span class="order_in_id"><?php echo $ghid;?></span></td>
													<td width="6%"><img src="images/strelka_32.png" width="32" height="32"></td>
													
												</tr>
												<tr>
													<td colspan="3" class="ord_body">
														<br>
														<div class="ord_body_info">
															<span class="translate">Participant</span>: <span class="order_in_fio"><?php echo ucfirst($participant_name);?></span><br>
															<span class="translate">Amount</span>: <span class="order_in_amount"><?php echo number_format(($amountGH),2)?></span> <span class="order_in_currency">NGN</span><br>
															<span class="translate">Balance</span>: <span class="order_in_amount"><?php echo number_format($balanceGH)?>.00</span> <span class="order_in_currency">NGN</span><br>
															<span class="translate">Date</span>: <span class="order_in_date"><?php echo $ghDATE;?></span>
															<br>
															<font color='red'>Status:</font> Dispatcher has created assignment, your request will be merged soon
															<br><br>
															
													</td>
												</tr>

											</tbody>
										</table>
									
														</div>
								<?php
								}
							}
						}
						
						
						//Provide Help
						$getallPH = $con->prepare("SELECT * FROM `providehelp` where participantID='$pid' and wallet='45% Increment' and paid='NO' and status!='Cancelled' order by ID desc");
						$getallPH->execute();
						for($i=1; $i<=$getallPH->rowCount(); $i++)
						{
							$getallPHInfo = $getallPH->fetch(PDO::FETCH_LAZY);
							$phid = $getallPHInfo['phID'];
							// echo $phid;
							$amntPH = $getallPHInfo['amntPH'];
							$merge = $getallPHInfo['merge'];
							$balance = $getallPHInfo['balance'];
							$createDATE = substr($getallPHInfo['createDATE'], 0 , -6);
						?>
							<div class='ph_info'>
								<table width="100%" cellspacing="6" cellpadding="0" border="0">
									<tbody>
										<tr>
											<td width="6%"><img src="images/strelka32.png" width="32" height="32"></td>
											<td class="ord_title" style='width: 70%'><span class="translate">Request to provide help</span><br><span class="order_in_id"><?php echo $phid;?></span></td>
										</tr>
										<tr>
											<td colspan="3" class="ord_body">
												<br>
												<div class="ord_body_info">
													<span class="translate">Participant</span>: <span class="order_in_fio"><?php echo ucfirst($participant_name);?></span><br>
													<span class="translate">Amount</span>: <span class="order_in_amount"><?php echo number_format(($amntPH),2)?></span> <span class="order_in_currency">NGN</span><br>
													<?php 
													if($balance != 0)
													{
													?>
														<span class="translate">Balance</span>: <span class="order_in_amount"><?php echo number_format(($balance),2)?></span> <span class="order_in_currency">NGN</span><br>
													<?php
													}
													?>
													<span class="translate">Date</span>: <span class="order_in_date"><?php echo $createDATE;?></span><br>
													<br>
													<?php
													if($merge == "NO")
													{
													?>
														<div><font color='red'>Status:</font> Your request has been received. Wait patiently to be matched with another participant.</div>
													<?php
													} 
													if($balance != 0)
													{
													?>
														<div><font color='red'>Status:</font> Balance will be merge soon</div>
													<?php
													}
													?>
													<br>
											</td>
										</tr>

										<?php
										if($merge == "NO")
										{
										?>
											<tr class="order_in_remove_row">
												<td></td>
												<td align="right" style=''><a href="action?deletePH=<?php echo $phid;?>" onclick="return confirm('You are about to delete your pledge, \nby doing so this will erase all transactions in your wallet\n\n\n\nDo you want to Proceed?');" style="background: #fff; padding: 5px; margin-top:-12px">Cancel Order</a><br><br></td>
											</tr>
										<?php
										}
										?>
									</tbody>
								</table>
							
												</div>
						<?php
						}
						?>
						

							</div>
									</div>
									</div>
					</div>
					
				</div>
			</div>
			
		<div class="container">
			<div class="flexslider-info">	
				
				<!---Our Testimonies -->
				<div class='col-md-12'>
					<br>
					<div class='col-md-5'>
						<h3><b>OUR TESTIMONIES</b></h3>
						<marquee direction='up' SCROLLDELAY='350'>
						<?php
						$alltestimonies = $con->prepare("select * from testimonies order by rand() limit 5");
						$alltestimonies->execute();
						$alltestimonies_row = rows("select * from testimonies order by rand() limit 5");
						
						for($i=1; $i<=$alltestimonies_row; $i++)
						{
							$alltestimoniesINFO = $alltestimonies->fetch(PDO::FETCH_ASSOC);
							$gh_letter = $alltestimoniesINFO['gh_letter'];
							$participantID = $alltestimoniesINFO['participantID'];
							$gh_participant = $con->prepare("select * from participant where pid='$participantID'");
							$gh_participant->execute();
							$gh_participantINFO = $gh_participant->fetch(PDO::FETCH_ASSOC);
							$participant_name_write_Letter = $gh_participantINFO['name'];
						?>
							<b><?php echo $gh_letter;?></b>
							<br><button class='btn btn-primary pull-right' disabled><b><?php echo ucfirst($participant_name_write_Letter);?></b></button><br>
						<hr/>
						<?php	
						}
						?>
						</marquee>
					</div>
					<div class='col-md-7'>
					</div>
				</div>
				<!---Our Testimonies -->
			</div>
		</div>
		</div>
	</div>
	<br/><br/><br/><br/>
	
	
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