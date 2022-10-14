<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  
  
  
      <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/font-awesome.min.css" />

	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>

	$(document).ready(function(){
		    var preloader = $('.preloader');
    $(window).load(function () {
        setTimeout(function(){
            $('.preloader').fadeOut('slow', function () {
            });
        },5000); // set the time herep
    }); 
});
</script>
  
</head>

<body>
<div class="preloader"><i class="fa fa-circle-o-notch fa-spin fa-2x"></i></div>
  <div class="login" style='margin-top: 100px'>
	<div class='alert alert-success'>dd</div>
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Log in</h2>

  <form class="login-container">
    <p><input type="email" placeholder="Enter Email Address"required></p>
    <p><input type="password" placeholder="Enter Password"required></p>
    <p><input type="submit" value="Log in"></p><br>
	<font size="3" color="#000" >Having problem logging in? <a href="">Reset Password</a> 
  </form>
</div>
  
</body>
</html>
