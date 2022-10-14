<?php
require "config.php";

if(isset($username))
{
	$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$username'");
	$getuinfo->execute();
	$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
	$pid = $ginfo['pid'];
	$participant_name = $ginfo['name'];
	$mobile = $ginfo['mobile'];
	
	$getbank = rows("select * from bankaccount where participant='$pid'");
	
	
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
	
	$recheck_all= $con->prepare("Select * from gethelp where participantID='$pid' and ghID='$ghID'");
	$recheck_all->execute();
	$recheck_allINFO = $recheck_all->fetch(PDO::FETCH_ASSOC);
	$real_amountGH = $recheck_allINFO['amountGH'];
	// echo $real_amountGH;
	if($real_amountGH == $totalGH)
	{
		// redirect_to("gh-testimonial?ghID=$ghID");
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
								<h1><a class="navbar-brand" href="index.html">Associate</a></h1>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">
									<li><a href="dashboard"><i class='fa fa-home'></i> Home</a></li>
									<?php if($getbank == 0){ ?> <li><a href="account"><i class='fa fa-money'></i> Account</a></li><?php } else { ?> <li><a href="transactions"><i class='fa fa-exchange'></i> My Transactions</a></li><?php }?>
									
									<?php if($getbank != 0){ ?> <li><a href="wallet"><i class='fa fa-money'></i> Wallet</a></li> <?php }?>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-expanded="false"><i class='fa fa-users'></i> My Page <b class="caret"></b></a>
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
			<br><br>
			<div class='col-md-6'>
				<br/><label><b>My Profile</b></label>
				<br/><br/>
				<label>Participant Name:</label> <?php echo ucfirst($participant_name);?>
				<br/><br/>
				<label>Participant Name:</label> <?php echo strtolower($username);?>
				<br/><br/>
				<label>Mobile Number:</label> <?php echo strtolower($mobile);?>
				<br/><br/>
			</div>
			<div class='col-md-2'></div>
			<div class='col-md-4'>
				<div class="panel panel-default">
					<div class="panel-body">
				<label><b>Account Details</b></label>
				<br/><br/>
				<?php
				$get_account = $con->prepare("SELECT * FROM `bankaccount` where participant='$pid'");
				$get_account_rows = rows("SELECT * FROM `bankaccount` where participant='$pid'");
				$get_account->execute();
				$getBANKINFO = $get_account->fetch(PDO::FETCH_LAZY);
				$bankName = $getBANKINFO["bankName"];
				$merchantName = strtoupper($getBANKINFO["merchantName"]);
				$merchantNo = $getBANKINFO["merchantNo"];
				?>
					<b>Account Holder:</b> <?php echo $merchantName;?>
					<br/><br/>
					<b>Banker:</b> <?php echo $bankName;?>
					<br/><br/>
					<b>Account Number:</b> <?php echo $merchantNo;?>
					<br/><br/>
					<b>Currency:</b> Nigeria NAIRA (&#8358;)
					<br/><br/>
					Should incase there is error on your banking details or you wish to make an adjustment, contact support for help by <a href='ticket'>clicking here</a>
					</div>
				</div>
			</div>
			</div>
			
			
			 
			
		</div>
	</div>
	
	
	
	<!-- footer --

	
	<div class="footer-w3layouts" style="margin-top: 35%">
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
	
</body>
<!-- //Body -->
</html>