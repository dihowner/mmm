<?php
require "config.php";

if(isset($username))
{
	// Lets use participant id as participant email address
	
	### Save Account
	$getuinfo = $con->prepare("SELECT * FROM `participant` where email='$username'");
	$getuinfo->execute();
	$ginfo = $getuinfo->fetch(PDO::FETCH_ASSOC);
	$pid = $ginfo['pid'];
	$participant_name = $ginfo['name'];
	
	$getbank = rows("select * from bankaccount where participant='$pid'");

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
								<h1><a class="navbar-brand" href="dashboard">Associate</a></h1>
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
									<li><a href="ticket" class="active"><i class='fa fa-pencil'></i> SUPPORT</a></li>
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
				<br/>
				
				<div class='col-md-12'>
					<div class='col-md-4'>
						<button class='btn btn-success btn-lg' id='CrtTicket'><b>Create Ticket</b></button>
						<br/><br/>
						<?php
						$allticket = $con->prepare("SELECT * FROM `ticket` where participant='$pid' order by tid desc");
						$allticket->execute();
						$allticket_row = rows("SELECT * FROM `ticket` where participant='$pid' order by tid desc");
						for($i=1; $i<=$allticket_row; $i++)
						{
							$allticketINFO = $allticket->fetch(PDO::FETCH_ASSOC);
							$tid = $allticketINFO['tid'];
							$subject = $allticketINFO['subject'];
							$replied = $allticketINFO['replied'];
						?>
							<a href='?view=<?php echo $tid;?>' style='color: red'><?php echo $subject;?> (<font color='blue'><?php echo $replied;?></font>)</a><br><br>
						<?php
						}
						?>
					</div>
					<div class='col-md-8'>
						<div class='ViewTicket' style='margin-top: 15px'>
						<?php
						if(isset($_GET['view']))
						{
							$view = $_GET['view'];
							
							//Get the msg INFO
							$search_ticket = $con->prepare("SELECT * FROM `ticket` where tid='$view'");
							$search_ticket->execute();
							$search_ticketINFO = $search_ticket->fetch(PDO::FETCH_ASSOC);
							$subject = $search_ticketINFO['subject'];
							$relatedIssue = $search_ticketINFO['relatedIssue'];
							$ticketmsg = nl2br($search_ticketINFO['ticketmsg']);
							$report_participant = $search_ticketINFO['report_participant'];
							$lock = $search_ticketINFO['locked'];
							$attachment = $search_ticketINFO['attachment'];
							if(empty($report_participant))
							{
							?>
								<b>Subject: <?php echo strtoupper($subject);?></b>
								<br/>
								<b>Related Issue: <?php echo strtoupper($relatedIssue);?></b>
								<br/><br/>
								<?php echo $ticketmsg;?>
								<br/><br/>
								<?php
								if(!empty($attachment))
								{
								?>
									Attachment: <a href='<?php echo $attachment;?>' target='_blank'>View Attachment</a>
								<?php
								}
								?>
								<br/><hr/>
							<?php
							}
							else
							{

							?>
								<b>Subject: <?php echo strtoupper($subject);?></b>
								<br/>
								<b>Related Issue: <?php echo strtoupper($relatedIssue);?></b>
								<br/><br/>
								<b>Participant Reported: <?php echo strtoupper($report_participant);?></b>
								<br/><br/>
								
								<?php echo $ticketmsg;?>
								<br/><br/>
								<?php
								if(!empty($attachment))
								{
								?>
									Attachment: <a href='<?php echo $attachment;?>' target='_blank'>View Attachment</a>
								<?php
								}
								?>
								<br/><hr/>
							<?php
							}
							if($lock == 0)
							{
						?>
							<textarea class='form-control' rows='6'></textarea>
							<br>
							<button class='btn btn-success'><b>Submit</b></button>
						<?php
							}
						}
						else if(isset($_GET["tid"]))
						{
							$tid = $_GET['tid'];
							if($tid == substr(md5('fakePOP'),0 -3))
							{
							?>
								<br>Please be sure that funds are not recieved before complaining and do not hesitate to inform sender before taking any action against him or her.
								<br/><br/>
								Ensure to attach your bank account statement along when creating a ticket.
								<br/><br/>
								<?php
								
								//SUbmit fake POP
								if(isset($_POST['submit_ticket_fakePOP']))
								{
									$subject = $_POST['subject'];
									$payee_participant_name = $_POST['participant_name']; 
									$complainerID = $_POST['participantID']; 
									$ticketmsg = $_POST['ticketmsg'];
									$attachment_name = 'Bankstatement'.$_FILES['attachment']['name'];
									$attachment_tmp = $_FILES['attachment']['tmp_name'];
									$savefile_tofolder = 'images/ticket_attachment/'.$attachment_name;
									$movefile = move_uploaded_file($attachment_tmp, $savefile_tofolder);
									if($movefile)
									{
										$saveTicket = $con->prepare("insert into ticket (subject, ticketmsg, participant, report_participant, attachment, relatedIssue) values ('$subject','$ticketmsg','$complainerID','$payee_participant_name','$savefile_tofolder', 'FAKE PROOF OF PAYMENT')");
										$saveTicket->execute();
									?>
										<div class='alert alert-success'><b>Your ticket has been created and will be treated accordingly.</b></div>
									<?php
									}
									else
									{
									?>
										<div class='alert alert-warning'><b>Unable to create ticket</b></div>
									<?php
									}
								}
								?>
							<form method='post' action='action' enctype='multipart/form-data'>
								<label>Subject: </label>
								<input type='text' class='form-control input-lg' name='subject' value='FAKE PROOF OF PAYMENT' disabled>
								<br>
								<label>Payee Name  <small>(Who is to pay You)</small>:</label>
								<input type='text' class='form-control input-lg' name='participant_name' autocomplete="off" required>
								<input type='hidden' class='form-control input-lg' name='participantID' value='<?php echo $pid;?>'>
								<br>
								<label>Message Content:</label>
								<textarea class='form-control' rows='8' name='ticketmsg' required></textarea>
								<br>
								<label>Attachment <small>(Your Bank Account Statement)</small>: </label>
								<br>
								<input type='file' class='form-control input-lg' name='attachment' required>
								<br>
								<font color='red'><b>Maximum file size is 2mb</b></font>
								<br>
								<button class='btn btn-success btn-lg' name='submit_ticket_fakePOP'>Submit Ticket</button>
							</form>
							<?php
							}
						}
						
						else
						{
						?>
						
						<!--Creating Ticket--->
						<?php
							if(isset($_POST['submit_ticket']))
							{
								$subject = $_POST['subject'];
								$relatedIssue = $_POST['relatedIssue'];
								$msg_content = $_POST['msg_content'];
								if(empty($attachment))
								{
									$saveTicket = $con->prepare("insert into ticket(subject, participant, ticketmsg, relatedIssue) values ('$subject', '$pid', '$msg_content', '$relatedIssue')"); 
									if($saveTicket->execute())
									{
									?>
										<div class='alert alert-success'><b>Your ticket has been created and will be treated accordingly.</b></div>
									<?php
									}
									else
									{
									?>
										<div class='alert alert-warning'><b>Unable to create ticket</b></div>
									<?php
									}
								}
								else
								{
									$attachment_name = $_FILES['attachment']['name'];
									$attachment_tmp = $_FILES['attachment']['tmp_name'];
									$savefile_tofolder = 'images/ticket_attachment/'.$attachment_name;
									$movefile = move_uploaded_file($attachment_tmp, $savefile_tofolder);
									if($movefile)
									{
										$saveTicket = $con->prepare("insert into ticket(subject, participant, ticketmsg, relatedIssue, attachment) values ('$subject', '$pid', '$msg_content', '$relatedIssue', '$savefile_tofolder')"); 
										$saveTicket->execute();
									?>
										<div class='alert alert-success'><b>Your ticket has been created and will be treated accordingly.</b></div>
									<?php
									}
									else
									{
									?>
										<div class='alert alert-warning'><b>Unable to create ticket</b></div>
									<?php
									}
								}
							}
						?>
						<br/><br/>
						<div id='CreateTICKET' style='display: none; margin-top: 15px;>
							<b>When creating a ticket, do ensure to have a genuine reason or proof about what you are complaining on as all issue will be treated strictly without any consideration base on your level in the community</b>
							<br><br>
							<form method='post' enctype='multipart/form-data'>
								<label>Subject</label>
								<input type='text' class='form-control input-lg' name='subject' autocomplete="off" required>
								<br>
								<label>Related Issue:</label>
								<select class='form-control input-lg' name='relatedIssue'>
									<?php
									$relatedIssue = $con->prepare('SELECT * FROM `relatedissue`');
									$relatedIssue->execute();
									for($i=1; $i<=rows('SELECT * FROM `relatedissue`'); $i++)
									{
										$optioninfo = $relatedIssue->fetch(PDO::FETCH_ASSOC);
										$option_issue = $optioninfo['option_issue'];
										echo $option_issue . '<br><br>';
									?>
										<option value='<?php echo strtoupper($option_issue);?>' required><?php echo strtoupper($option_issue);?></option>
									<?php
									}
									?>
								</select>
								<br>
								<label>Message Content:</label>
								<textarea class='form-control' rows='8' name='msg_content' required></textarea>
								<br>
								<label>Attachment <small>(Proof of complaint)</small>: </label>
								<br>
								<input type='file' class='form-control input-lg' name='attachment'>
								<br>
								<font color='red'><b>Maximum file size is 2mb</b></font>
								<br>
								<button class='btn btn-success btn-lg' name='submit_ticket'>Submit Ticket</button>
							</form>
						</div>
						<?php
						}
						?>
						<!--Creating Ticket--->
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br/><br/><br/><br/><br/><br/><br/><br/>
	
	
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
	
	
</body>
<!-- //Body -->
</html>