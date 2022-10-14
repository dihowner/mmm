<?php
require "config.php";
ini_set("memory_limit", "1000M"); 
set_time_limit(0);
if(isset($username))
{
// echo $username;
// Lets use participant id as participant email address
	
	### Save Account
	$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$username'");
	$getuinfo->execute();
	$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
	$pid = $ginfo['pid'];
	
	$isAccntNumb_exist = rows("SELECT * FROM `bankaccount` where participant='$pid'");
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
									<li><a href="dashboard">Home</a></li>
									<li><a href="account">Account</a></li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Particpants <b class="caret"></b></a>
										<ul class="dropdown-menu agile_short_dropdown">
											<li><a href="icons.html">My Referral</a></li>
										</ul>
									</li>
									<li><a href="wallet" class="active">Wallet</a></li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">My Page <b class="caret"></b></a>
										<ul class="dropdown-menu agile_short_dropdown">
											<li><a href="icons.html">Profile</a></li>
											<li><a href="typography.html">Get Help Testimonies</a></li>
										</ul>
									</li>
									<li><a href="gallery.html">SUPPORT</a></li>
									<li><a href="office.html">LOGOUT</a></li>
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
						<b><button class="btn btn-success"><b>Available Fund</b></button></b></div>
					<div class="col-md-5 pull-right" style="margin-top: 10px; margin-bottom: 10px"><b>New Balance will be credited everyday at 00:00GMT</b></div></div>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th><b>ID</b></th>
							<th>Status</th>
							<th>Date Created</th>
							<th>Release Date</th>
							<th>Wallet</th>
							<th>Initial Payment</th>
							<th>Current Amount</th>
							<?php if($pid == 1) { ?> <th>Left Over</th> <?php }?>
						</tr>
					</thead>
				<?php
				
				$get_allPH_row = rows("SELECT * from `providehelp` where participantID='$pid' and paid='NO'  or referralID='$pid'");
				
				if($get_allPH_row == 0)
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
								<td></td>
							</tr>
						</tbody>
				<?php
				}
				else
				{
					$get_allPH = $con->prepare("SELECT * from `providehelp` where participantID='$pid' and paid='NO' or referralID='$pid' ORDER BY ID desc");
					$get_allPH->execute();
					
					//Lets Increase fund
					
					$todaysDATE =  date('d.m.Y H:i'); 
					$every12am = date('H:i:s');
					$lastCron = 1390213022;
					// echo time() - $lastCron . "<br>";
					// echo time();
					
					
					?>
					
						<tbody>
							<tr>
					<?php
					for($i=1; $i<=$get_allPH_row; $i++)
					{
						$allPHINFO = $get_allPH->fetch(PDO::FETCH_ASSOC);
						$ID = $allPHINFO["ID"]; //Id for all PH
						$phID = $allPHINFO["phID"];
						$status = $allPHINFO["status"];
						$wallet = $allPHINFO["wallet"];
						$RegBonus = $allPHINFO["RegBonus"];
						$amntPH = $allPHINFO["amntPH"];
						$incrPH = $allPHINFO["incrPH"];
						$createDATE = $allPHINFO["createDATE"];
						$releaseDATE = $allPHINFO["releaseDATE"];
						$referralBonus = $allPHINFO["referralBonus"];
						$leftOver = $allPHINFO["leftOver"];
						// $interval = '07:41:00';
						// echo $every12am % $interval;
						echo $todaysDATE;
						
						//Lets Increase Fund
						if($releaseDATE >= $todaysDATE)
						{
								//PH Growsssss
								$growperday = (($amntPH*1.5)/100);
								$addTodayGain = $incrPH + $growperday; //Normal grow for Normal PH
								
								//Referral Growsssss
								$growperday_referralBonus = (($amntPH*1.5)/100);
								$addTodayGain_referralBonus = $growperday_referralBonus + $referralBonus; //Normal grow for Normal PH
								
								$saveRfr_Grow = $con->prepare("UPDATE providehelp set referralBonus='$addTodayGain_referralBonus' where ID='$ID' AND wallet='Referral'");
								$saveRfr_Grow->execute();
								echo $ID;
								// echo "<br>$wallet ||" .$addTodayGain_referralBonus . "|| Per day: $growperday_referralBonus<br><br>";
								// echo "<br>$wallet ||" .$addTodayGain . "|| Per day: $growperday<br><br>";
							
						}
						
						if($status == "Unconfirmed")
						{
							$status = "<font color='red'><b>Unconfirmed<b></font>";
						}
						else if($status == "Confirmed")
						{
							$status = "<font color='green'><b>Confirmed<b></font>";
						}
						// echo $phID ."<br>";
						?>
							<td><?php echo $phID;?></td>
							<td><?php echo $status;?></td>
							<td><?php echo $createDATE;?></td>
							<td><?php echo $releaseDATE;?></td>
							<td><?php echo $wallet;?></td>
							<td><b><?php echo number_format($amntPH);?>NGN</b></td>
							<td><b><?php if(empty($incrPH)){echo $referralBonus;}else{ echo number_format($incrPH)."NGN";}?></b></td>
							
							<?php if($pid == 1) { ?> <th><?php if(empty($leftOver)){echo "";}else{ echo number_format($leftOver)."NGN";}?></th> <?php }?>
							</tr>
						<?php
					}
				}
				
				?>
			 
		
					</table>
			
		</div>
	</div>
	
	
	
	<!-- footer -->

	
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
include "ph.php";
?>					

</body>
<!-- //Body -->
</html>