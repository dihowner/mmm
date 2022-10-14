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
								<h1><a class="navbar-brand" href="index">Associate</a></h1>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav" style="margin-top: -10px">
									<li><a href="dashboard">Home</a></li>
									<li><a href="account">Account</a></li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Particpants <b class="caret"></b></a>
										<ul class="dropdown-menu agile_short_dropdown">
											<li><a href="icons">My Referral</a></li>
										</ul>
									</li>
									<li><a href="wallet" class="active">Wallet</a></li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">My Page <b class="caret"></b></a>
										<ul class="dropdown-menu agile_short_dropdown">
											<li><a href="icons">Profile</a></li>
											<li><a href="typography">Get Help Testimonies</a></li>
										</ul>
									</li>
									<li><a href="gallery">SUPPORT</a></li>
									<li><a href="office">LOGOUT</a></li>
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
				<div class="col-md-12">
					<div class="col-md-3 pull-left" style="margin-top: 10px; margin-bottom: 10px">
						<b><button class="btn btn-success" data-toggle="modal" data-target="#availableFUND"><b>Available Fund</b></button></b></div>
					<div class="col-md-5 pull-right" style="margin-top: 10px; margin-bottom: 10px">
						<b>New Balance will be credited everyday at 00:00GMT</b>
					</div>
				</div><br><br><br>
				<table class="table table-bordered table-striped table-hover table-responsive">
					<thead>
						<tr>
							<th><b>ID</b></th>
							<th>Status</th>
							<th>Date Created</th>
							<th>Mature Date</th>
							<th>Wallet</th>
							<th>Donation Amount</th>
							<th>Yield Amount</th>
						</tr>
					</thead>
				<?php
				
				$get_allPH_row = rows("SELECT * from `providehelp` where participantID='$pid' and status!='Withdraw' and status!='Cancelled'");
				$get_ref_row = rows("SELECT * from `referral` where referralID='$pid' and user_status='active' and status!='Withdraw' and status!='Cancelled' ORDER BY status desc");
				if($get_allPH_row == 0 && $get_ref_row == 0)
				{
				?>
					
					
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
				<?php
				}
				else
				{
					$get_allPH = $con->prepare("SELECT * from `providehelp` where participantID='$pid' and status!='Withdraw' and status!='Cancelled' ORDER BY status desc");
					$get_allPH->execute();
					
					
					?>
					
						<tbody>
							<tr>
					<?php
					for($i=1; $i<=$get_allPH->rowCount(); $i++)
					{
						$allPHINFO = $get_allPH->fetch(PDO::FETCH_ASSOC);
						$ID = $allPHINFO["ID"]; //Id for all PH
						$phID = $allPHINFO["phID"];
						$status = $allPHINFO["status"];
						$wallet = $allPHINFO["wallet"];
						$amntPH = $allPHINFO["amntPH"];
						$incrPH = $allPHINFO["incrPH"];
						$createDATE = $allPHINFO["createDATE"];
						$releaseDATE = $allPHINFO["releaseDATE"];
						$paid = $allPHINFO["paid"];
						
						if($status == "Unconfirmed")
						{
							$status = "<font color='red'><b>Unconfirmed<b></font>";
							$incrPH = "<font color='red'><b>".number_format($incrPH,2)."<b></font>";
						}
						else if($status == "Confirmed")
						{
							$status = "<font color='green'><b>Confirmed<b></font>";
							$incrPH = "<font color='green'><b>".number_format($incrPH,2)."<b></font>";
						}
						// echo $phID ."<br>";
						?>
							<td><?php echo $phID;?></td>
							<td><?php echo $status;?></td>
							<td><?php echo $createDATE;?></td>
							<td><?php echo $releaseDATE;?></td>
							<td><?php echo $wallet;?></td>
							<td><b><?php echo number_format($amntPH);?>NGN</b></td>
							<td><b><?php echo $incrPH;?></b></td>
							</tr>
						<?php
					}
					$get_allref = $con->prepare("SELECT * from `referral` where referralID='$pid' and user_status='active' and status!='Withdraw' and status!='Cancelled' ORDER BY status desc");
					$get_allref->execute();
					// echo $get_allref->rowCount();
					for($i=1; $i<=$get_allref->rowCount(); $i++)
					{
						$get_allrefINFO = $get_allref->fetch(PDO::FETCH_ASSOC);
						$refphID = $get_allrefINFO["phID"]; //Id for all PH
						$referralBonus = $get_allrefINFO["referralBonus"]; //Id for all PH
						$refstatus = $get_allrefINFO["status"]; //Id for all PH
						$refwallet = $get_allrefINFO["wallet"]; //Id for all PH
						$refcreateDATE = $get_allrefINFO["createDATE"]; //Id for all PH
						$refreleaseDATE = $get_allrefINFO["releaseDATE"]; //Id for all PH
						$incrbonus = $get_allrefINFO["incrbonus"]; //Id for all PH
						if($refstatus == "Unconfirmed")
						{
							$refstatus = "<font color='red'><b>Unconfirmed<b></font>";
							$incrbonus = "<font color='red'><b>".number_format($incrbonus,2)."<b></font>";
						}
						else if($refstatus == "Confirmed")
						{
							$refstatus = "<font color='green'><b>Confirmed<b></font>";
							$incrbonus = "<font color='green'><b>".number_format($incrbonus,2)."<b></font>";
						}
					?>
							<td><?php echo $refphID;?></td>
							<td><?php echo $refstatus;?></td>
							<td><?php echo $refcreateDATE;?></td>
							<td><?php echo $refreleaseDATE;?></td>
							<td><?php echo $refwallet;?></td>
							<td><b><?php echo number_format($referralBonus*10,2);?></b></td>
							<td><b><?php echo $incrbonus;?></b></td>
						</tr>
					<?php
					}
				}
				
				?>
			 
		
					</table>
			
		</div>
	</div>
	
	<br/><br/><br/><br/>
	
	
	
	<!-- footer --

	
	<div class="footer-w3layouts" style="margin-top: 22%">
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