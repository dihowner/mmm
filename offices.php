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
	<script src="js/pns.js"></script>
	<script src="js/main.js"></script>
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
	
	$(document).ready(function(){
		    var preloader = $('.preloader');
    $(window).load(function () {
        setTimeout(function(){
            $('.preloader').fadeOut('slow', function () {
            });
        },5000); // set the time here
    }); 
});
</script>
<!--End-slider-script-->

</head>
<!-- //Head -->
<!-- Body -->
<body style="background:#87cefa">
	<div class="preloader"><i class="fa fa-circle-o-notch fa-spin fa-2x"></i></div>
	
	<div id="auth">
		<div class="container">
			<div class="form_wrap">
				<form method="post" id="gLogin">
					<div id="result" style='margin-top: -30px'></div>
						<font size="4px"><center><b>LOGIN TO PERSONAL OFFICE</b></center></font><br>
					<div class="col-md-12">
						<div class="col-md-4" style="margin-top: 10px">
							<b>Email Address:</b>
						</div>
						<div class="col-md-8">
						<input type="email" name="ptc_email_addr" id="ptc_email_addr" class="form-control input-lg" placeholder="Enter your email address" required autocomplete="off">
						</div>
						<br><br>
					</div>
					
					<div class="col-md-12">
						<div class="col-md-4">
							<b>Password:</b>
						</div>
						<div class="col-md-8">
						<input type="password" name="ptc_password" id="ptc_password" class="form-control input-lg" placeholder="Enter your password" required autocomplete="off">
						</div>
					</div>
				
					<div align="center" class="col-md-12" style="margin-top: 10px">
						<div class="col-md-4"></div>
						<div class="col-md-8">
							<button class="btn btn-success btn-lg" id="loginPO"><b>LOGIN TO PO</b></button>
						</div>		
					</div>
				</form>
				<font size="3" color="#000" >Having problem logging in? <a href="">Reset Password</a> 
			</div>
		</div>
	</div>


</body>
<!-- //Body -->
</html>