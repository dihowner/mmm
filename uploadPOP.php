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
	
	$getbank = rows("select * from bankaccount where participant='$pid'");
	
	//We need to redirect user to write letter of happiness
	$check_all= $con->prepare("Select * from merge_gh where gh_participantID='$pid' and status='Confirmed'");
	$check_all->execute();
	$check_allrow = rows("Select * from merge_gh where gh_participantID='$pid' and status='Confirmed'");
	for($i=1; $i<=$check_allrow; $i++)
	{
		$check_allINFO = $check_all->fetch(PDO::FETCH_ASSOC);
		$gh_letter = $check_allINFO['gh_letter'];
		$ghID = $check_allINFO['ghID'];
		if(empty($gh_letter))
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
		<script src="http://code.jquery.com/jquery-1.12.2.min.js"></script>
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
			<?php 
			if(isset($_GET["mergeID"]))
			{
				//Lets See if attachment is available
				$mergeID = $_GET["mergeID"];
				$getGH = $con->prepare("SELECT * FROM `merge_gh` where mergeID='$mergeID' and attachment=''");
				$getGH->execute();
				$getGH_row = rows("SELECT * FROM `merge_gh` where mergeID='$mergeID' and attachment=''");
				if($getGH_row == 0 )
				{
					redirect_to("dashboard");
					die();
				}
				else
				{
					$getGHInfo = $getGH->fetch(PDO::FETCH_ASSOC);
					$amountGH = $getGHInfo['amountGH'];
					$gh_participantID = $getGHInfo['gh_participantID'];
					//Participant name
					$getGH_user = $con->prepare("SELECT * FROM `participant` where pid='$gh_participantID'");
					$getGH_user->execute();
					$getGH_userinfo = $getGH_user->fetch(PDO::FETCH_ASSOC);
					$participant_name_rcv = ucwords($getGH_userinfo["name"]);
					
				?>
					
			
				<div class="col-md-12">
				
					<?php
					if(isset($_POST['upload_receipt']))
					{
						$filename = date('Y_m_d_h_s').'_'.$_FILES['file']['name'];
						$file_tmp_name = $_FILES['file']['tmp_name'];
						$file_size = $_FILES['file']['size'];
						$folder = 'images/attachment/';
						$joinfile = $folder.$filename;
						// echo $file_size;
						if($file_size > 2000000)
						{
							echo error('File is too large');
						}
						else
						{
							$movefile = move_uploaded_file($file_tmp_name, $joinfile);
							if($movefile == true)
							{
								$saveattachment = $con->prepare("update merge_gh set attachment='$filename', status='Upload' where mergeID='$mergeID'");
								if($saveattachment->execute())
								{
									echo success("Attachment successfully uploaded");
								?>
									<script>
										alert("Attachment uploaded, inform receiver to confirm your payment");
									</script>
								<?php
								}
								else
								{
									echo error("Uploading failed");
								}
							}
						}
					}
					?>
				
				
						<div class="form-group">
							<div class="panel panel-default img-upload">
								<div style="margin-left: 12px; margin-top: 2%">
									<div style="margin-left: 12px; margin-right: 12px;">
										Dear <b><?php echo ucwords($participant_name);?>,</b><br>
										<b>You consent that the payment of NGN<?php echo number_format(($amountGH),2);?> was successfully made to <?php echo ucwords($participant_name_rcv);?><br/>
											<br/><font color='red'>NOTE:</font> Uploading of fake proof of payment will lead to permanent blocking of your account
										</b><br/><br/>
									</div>
									
									<form method="post" enctype="multipart/form-data" id="uploadForm">
										<div style="margin-left: 12px; margin-right: 12px;">
										<input type="file" name="file" id="file" class='form-control input-lg' required/><br/>
										<font color="red" size='4px'>Maximum file upload is 2mb</font>
										</div>
										
										<br/>
										<div style="margin-left: 12px; margin-right: 12px;">
											<button name='upload_receipt' class='btn btn-success btn-lg'>
												<b><i class='fa fa-upload'></i>Upload Receipt</b>
											</button>
										</div>
									</form><br/><br/>
							
							</div>
							</div>
						</div>
						
					
				</div>
				<?php
				}
			}
			else
			{
				redirect_to('dashboard');
			}
			?>
			
			</div>
			
			
			 
			
		</div>
	</div>
	
	
	
	<!-- footer -->

	
	<div class="footer-w3layouts" style="margin-top: 5%">
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
	
    <script src="js/jquery.min.js"></script>
<script>
function filePreview(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#uploadForm + img').remove();
            $('#uploadForm').after('<img src="'+e.target.result+'" width="150px" height="100px"/>');
            //$('#uploadForm + embed').remove();
            //$('#uploadForm').after('<embed src="'+e.target.result+'" width="450" height="300">');
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#file").change(function () {
    filePreview(this);
});
</script>
	

</body>
<!-- //Body -->
</html>