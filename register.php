<?php
require "config.php";

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
	<div class="w3l-banner">
		<div class="header">
		<!-- Top-Bar -->
				<div class="top-bar">
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
								<ul class="nav navbar-nav" style='width:60%; margin-top: -3px'>
									<li><a href="index">Home</a></li>
									<li><a href="">HOW IT WORKS</a></li>
									<li><a href="">TESTIMONIALS</a></li>
									<li><a class="active" href="register" target="_blank">CREATE ACCOUNT</a></li>
									<li><a href="office" target="_blank">LOGIN</a></li>
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
				<div class="col-md-7" style="margin-top: 105px; color: #fff; padding: 10px; border-radius: 5px;">	
					<h1 class="intro text-left">
                        <strong>HELP NAIJA - </strong> FINANCIAL <strong>HELP</strong> FOR ALL <strong>NIGERIANS</strong>
                    </h1>
					<!--<h1>FINANCIAL HELP FOR ALL <h2>NIGERIANS</h2>-->
					
					<ul class="feature-list-1">

                        <!-- FEATURE ROW -->
                        <li>
                            <div class="icon-container pull-left" style="margin-top: -1px">
                                <span class="fa fa-check"></span>
                            </div>
                            <p class="text-left">
                                Get 30% of your Money Every 10 days after Pairing
                            </p>
                        </li>

                        <li>
                            <div class="icon-container pull-left" style="margin-top: -1px">
                                <span class="fa fa-check"></span>
                            </div>
                            <p class="text-left">
								Minimum donation is NGN2000 	
                            </p>
                        </li>

                        <li>
                            <div class="icon-container pull-left" style="margin-top: -1px">
                                <span class="fa fa-check"></span>
                            </div>
                            <p class="text-left">
								Get 10% Referral Bonus on all Downline Earnings! 	
                            </p>
                        </li>

                        <li>
                            <div class="icon-container pull-left" style="margin-top: -1px">
                                <span class="fa fa-check"></span>
                            </div>
                            <p class="text-left">
								100% Get Help assurance after Providing Help	
                            </p>
                        </li>
						
                        <li>
                            <div class="icon-container pull-left" style="margin-top: -1px">
                                <span class="fa fa-check"></span>
                            </div>
                            <p class="text-left">
								Compact, Robust Personal Office	
                            </p>
                        </li>
						
                    </ul>
					
					
				</div>
				<div class="col-md-1"></div>
				
				<div class="col-md-3" style="margin-top: 105px; height: 150px; background: rgba(0, 0, 0, 0.5); padding: 10px; border-radius: 5px;">	
					<h3 class="quick-link">QUICK LINKS</h3>
					<button class="btn btn-success btn-lg"><b>REGISTER</b></button>
					<button class="btn btn-primary btn-lg" style="margin-left: 30px"><b>LOGIN</b></button>
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="wthree-welcome">
		<div class="container" align="center">
			<h3>LET's GET YOU STARTED!</h2>
				<p>You may register by filling in the form;<br/>
				Or you may ask any of your friend to help you.<br/><br/></p>
		
				<?php
				##PROCESSING..........
				for($i=1; $i<=10; $i++){
					$numb="0". mt_rand(11111,79654); 
				}
				
				if(isset($_POST["participant_reg"]))
				{
					$participant_name = strtolower($_POST["participant_name"]); // participant name
					$participant_email = strtolower($_POST["participant_email"]); //participant email address
					$participant_mobile = $_POST["participant_mobile"]; //participant mobile number
					$participant_pswd = substr(sha1("ponzi"),0,8).":".md5($_POST["participant_pswd"]); //Participant password
					$participant_rfr_email = $_POST["participant_rfr_email"]; // Referral Email Address
					$captcha = $_POST["captcha"]; // Captcha
					$re_captcha = $_POST["re_captcha"]; // Captcha Validation, it's hidden
					$check_registered_user = rows("SELECT * FROM `participant` where `email`='$participant_email'");
					$check_registered_name = rows("SELECT * FROM `participant` where `name`='$participant_name'");
					// echo $participant_pswd;
					if(isset($_GET['ref']))
					{
						$ref = $_GET['ref'];
						$getref = $con->prepare("select * from participant where email='$ref'");
						$getref->execute();
						$getrefinfo = $getref->fetch(PDO::FETCH_ASSOC);
						$refid = $getrefinfo['pid'];
					}
						
					if($re_captcha != $captcha)
					{
					?>
						<div class="alert alert-warning"><b>Incorrect captcha provided</b></div>
					<?php
					}
					else if($check_registered_user == 1)
					{	
					?>
						<div class="alert alert-warning"><b>Email address already exist!</b></div>
					<?php
					}
					else if($check_registered_name == 1)
					{	
					?>
						<div class="alert alert-warning"><b>Participant already exist!</b></div>
					<?php
					}
					else if($participant_rfr_email == $participant_email)
					{	
					?>
						<div class="alert alert-warning"><b>Sorry! You can't be a referral for your account</b></div>
					<?php
					}
					else
					{
						if(empty($participant_rfr_email))
						{
							$participant_rfr_email = "oluwatayoadeyemi@yahoo.com";
							
							### Save Account
							$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$participant_rfr_email'");
							$getuinfo->execute();
							$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
							$pid = $ginfo['pid'];
						
						
							$save_accnt = $con->prepare("INSERT INTO `participant` (name, mobile, password, email, invite) values ('$participant_name','$participant_mobile','$participant_pswd','$participant_email','$pid')");
							if($save_accnt->execute())
							{	
								$LastINSERTID = $con->lastInsertId(); //Stands for New User ID
								$save_downlines = $con->prepare("INSERT INTO `downline` (referralID, participantID) values ('$pid', $LastINSERTID)");
								$save_downlines->execute();
							
								redirect_to("success");
							}
							else
							{	
							?>
								<div class="alert alert-warning"><b>Registration failed! Please try again.</b></div>
							<?php
							}
						}
						else
						{
							
							### Save Account
							$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$participant_rfr_email'");
							$getuinfo->execute();
							$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
							$pid = $ginfo['pid'];
						
							$save_accnt = $con->prepare("INSERT INTO `participant` (name, mobile, password, email, invite) values ('$participant_name','$participant_mobile','$participant_pswd','$participant_email','$pid')");
							
							if($save_accnt->execute())
							{	
								$LastINSERTID = $con->lastInsertId(); //Stands for New User ID
								$save_downlines = $con->prepare("INSERT INTO `downline` (referralID, participantID) values ('$pid', $LastINSERTID)");
								$save_downlines->execute();
								
								redirect_to("success");
							}
							else
							{	
							?>
								<div class="alert alert-warning"><b>Registration failed! Please try again.</b></div>
							<?php
							}
						}
					}
					
					// echo $participant_pswd;
				}
				?>
			
				<form method="post">
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-5">
							<label style="margin-right: 40px">Name *:<br><small>(<i>Nickname is allowed</i>)</small></label>
						</div>
						<div class="col-md-7 input-group input-group-lg w3_w3layouts">
							<input class="form-control" placeholder="Enter name or nickname" type="text" name="participant_name" value="<?php if(isset($_POST["participant_name"])){echo $participant_name;}?>" required autocomplete="off">
						</div>
						<br><br><br>				
					</div>
					
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-5">
							<label style="margin-right: 40px">Email Address *:<br><small>(<i>for example: example@gmail.com</i>) </small></label>
						</div>
						<div class="col-md-7 input-group input-group-lg w3_w3layouts">
							<input class="form-control" placeholder="Enter email address" type="email" name="participant_email" value="<?php if(isset($_POST["participant_email"])){echo $participant_email;}?>" required autocomplete="off">
						</div>
						<br><br><br>		
					</div>
					
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-5">
							<label style="margin-right: 40px">Mobile *:<br><small>(<i>for example: 2348048379025</i>) </small></label>
						</div>
						<div class="col-md-7 input-group input-group-lg w3_w3layouts">
							<input class="form-control" placeholder="Enter mobile number" type="text" name="participant_mobile"  value="<?php if(isset($_POST["participant_mobile"])){echo $participant_mobile;}?>" required autocomplete="off">
						</div>
						<br><br><br>		
					</div>
					
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-5">
							<label style="margin-right: 40px">Password:<br><small>(<i>enter your password</i>) </small></label>
						</div>
						<div class="col-md-7 input-group input-group-lg w3_w3layouts">
							<input class="form-control" placeholder="Enter desired password" type="password" name="participant_pswd" required autocomplete="off">
						</div>
						<br><br><br>		
					</div>
					
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-5">
							<label style="margin-right: 40px">Invite:<br><small> (<i>ATTENTION! If you were invited by other participant, you should specify here the e-mail address of his/her account</i>)</small><br><br></label>
						</div>
						<div class="col-md-7 input-group input-group-lg w3_w3layouts">
							<?php
							if(isset($_GET['ref']))
							{
							?>
								<input class="form-control" placeholder="Referral's Email Address" type="text" value="<?php echo $_GET['ref'];?>" disabled>
							
							<?php
							}
							else
							{
							?>
								<input class="form-control" placeholder="Referral's Email Address" type="email" name="participant_rfr_email"  value="<?php if(isset($_POST["participant_rfr_email"])){echo $participant_rfr_email;}?>" autocomplete="off">
							<?php
							}
							?>
						</div>
						<br><br><br>		
					</div>
					
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-5">
							<label style="margin-right: 40px">Captcha:<br><small><i>Enter the code from the picture </i></small></label>
						</div>
						<div class="col-md-7 input-group input-group-lg w3_w3layouts">
							<input class="form-control" type="text" name="captcha" required autocomplete="off">
							<input class="form-control input-lg" type="hidden" name="re_captcha" value="<?php echo $numb;?>">
						</div>
						<br><br><br>		
					</div>
					
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-7"></div>
						<div class="col-md-3">
							<div style="background: #282723; color: #fff; padding: 5px; font-size: 30px; font-weight: 900">
								<i><?php echo $numb;?></i>
							</div>
						</div>
					</div>
					
					<div class="col-md-12 wthree-welcome-left" align="center">
						<div class="col-md-5">
							
						</div>
						<div class="col-md-7" style="margin-top: 20px; margin-left: -120px">
							<font color="#000" size="3px">Having read the WARNING , I am well aware fully of the risks. Being in sound mind, I have decided to become a member of MMM.				
						</div>
						<br><br><br>		
					</div>
					
					<div align="center" class="col-md-12">
						<div class="col-md-6"></div>
						<div class="col-md-6">
							<button class="btn btn-success btn-lg" name="participant_reg" id="participant_reg"><b>REGISTER IN SPAREFUND</b></button>
						</div>		
					</div>
				</form>
			
			<div class="clearfix"></div>
		</div>
	</div>
	
	
	<!-- footer -->

	
	<div class="footer-w3layouts">
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