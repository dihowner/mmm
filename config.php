<?php

/*
Written By: OGUNDOWOLE RAHEEM OPEYEMI (Student of Mechatronic, Faculty of Engineering, The Polytechnic Ibadan.)

Post Held:  CEO / MD PEAK INTEGRATED SYSTEMS
 
Staffs & Teams: Mr Steve(java), Mr Seun(css), Mr Heywire, Mr Adeoluwa and my bozz (Irantiola).

Contact: 09033024846
		 08179653448
		 
Email: 	contact@peaksms.org
		support@peakintegratedsystems.com

Special Thanks to my lovely GF (KAZEEM AZEEZAT) for her support during and after the entire work of these webpage.

Our Motto: ..Making you a better you!!!

Quote: Never U believ in a word of a man, it only makes u not to achiev ur aim.

Greetings to fellow coders

Watch out for Peak Integrated Systems!!!
*/


error_reporting(-1);
ob_start();
session_start();
$timeout = 1800; //30minute
 if(isset($_SESSION['timeout'])) {
    // See if the number of seconds since the last
    // visit is larger than the timeout period.
    $duration = time() - (int)$_SESSION['timeout'];
    if($duration > $timeout) {
        // Destroy the session and restart it.
        session_destroy();
        session_start();
    }
}
 
// Update the timout field with the current time.
$_SESSION['timeout'] = time();


try
{
	$con = new PDO("mysql:host=localhost;dbname=ponzi_mmm", 'root', '');
	$con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
?>
	<script>
	alert("Could not connect to database, error submitted successfully to Log file");
	</script>
<?php
	file_put_contents("errorlog.txt", $e->getMessage(), FILE_APPEND);
}


//functions
if(!function_exists("query")){
	function query($query)
	{
		global $con;
		$q = $con->prepare($query);
		$r = $q->execute();
		$res = $q->fetch(PDO::FETCH_ASSOC);
		return $res;
	}
}


if(!function_exists("rows")){
	function rows($query)
	{
		global $con;
		$q = $con->prepare($query);
		$r = $q->execute();
		$count = $q->rowCount();
		return $count;
	}
}


if(!function_exists("redirect_to")){
	
	function redirect_to($link)
	{
		$redirect = header("Location:".$link);
		return $redirect;
	}
}


if(!function_exists("clean")){
	function clean($value)
	{
		global $con;
		$clean = mysqli_real_escape_string($con, trim(strip_tags($value)));
		return $clean;
	}
}

if(!function_exists("error")){
	function error($statement)
	{
		$error=  '<div class="alert alert-danger alert-dismissable" style="color: black; font-size: 18px; text-transform: uppercase; margin-bottom: 10%">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<b>'. $statement .'</b>
						</div>';
					
		return $error;
	}
}

if(!function_exists("success")){
	function success($statement)
	{
		$success=  '<div class="alert alert-success alert-dismissable" style="color: black; font-size: 18px; text-transform: uppercase; margin-bottom: 10%">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<b>'. $statement .'</b>
						</div>';
					
		return $success;
	}
}


if(isset($_SESSION["username"]))
{
	$username = $_SESSION["username"];
}
?>