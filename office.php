<?php
require "config.php";
if(isset($username))
{
	session_unset($username);
	session_destroy();
}
else
{
	session_destroy();
}
?>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>PERSONAL OFFICE</title>
  
  
  
      <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="js/pns.js"></script>

  <script>
  
	$(document).ready(function(){
		    var preloader = $('.preloader');
    $(window).load(function () {
        setTimeout(function(){
            $('.preloader').fadeOut('slow', function () {
            });
        },0000); // set the time here
    }); 
});
  </script>
  
</head>

<body>

	<div class="preloader"><i class="fa fa-circle-o-notch fa-spin fa-2x"></i></div>
  <div class="login" style='margin-top: 100px'>
	<div id='result'></div>
  <div class="login-triangle"></div>
  
  <h2 class="login-header"><b>PERSONAL OFFICE</b></h2>

  <form class="login-container" method="post" id="gLogin">
    <p><input type="email" name="ptc_email_addr" id="ptc_email_addr" placeholder="Enter Email Address" 	required autofocus autocomplete="off"></p>
    <p><input type="password" name="ptc_password" id="ptc_password" placeholder="Enter Password" required  autocomplete="off"></p>
    <p><input type="submit" value="Log in" id="loginPO"></p>
	<font size="3" color="#000">Having problem logging in? <a href="">Reset Password</a> 
  </form>
</div>

</body>
</html>
