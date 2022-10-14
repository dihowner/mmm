/***********
JQUERY AJAX BEHIND THE JOB
***********/

function validate(form) {
    //The key here is that you get all the "options[]" elements in an array
    var options = document.getElementsByName("options[]");
    
    if(options[0].checked==false && options[1].checked==false && options[2].checked==false) {
        alert('Please check at least one of the options.');
        return false;
    }
    return true;
}

$(document).ready(function(){
	var result = $("#result");
	var processing = $("#processing");

	$("#loginPO").click(function(PI) {
		PI.preventDefault();
		var gLogin = $("#gLogin").serialize();
		var ptc_email_addr = $("#ptc_email_addr").val();
		var ptc_password = $("#ptc_password").val();
		if(ptc_email_addr == "" || ptc_password == "")
		{
			alert("Email or Password data is missing");
			$("#ptc_email_addr").addClass("input-warning");
			$("#ptc_password").addClass("input-warning");
		}
		else
		{
			$("#ptc_email_addr").removeClass("input-warning");
			$("#ptc_password").removeClass("input-warning");
			$("#ptc_email_addr").prop("disabled", true);
			$("#ptc_password").prop("disabled", true);
			$.ajax(
			{
				url: "action.php?loginCLIENT",
				type: "post",
				data: gLogin,
				beforeSend: function(){
					result.addClass("alert alert-info").html("<font size='4px'><b><img src='images/loader.gif' width='40' height='30'> Authenticating Account</b></font>");
				},
				success: function(msg)
				{
					// result.html(msg);
					if(msg == 'wrong mail')
					{
						$("#ptc_email_addr").addClass("input-warning");
						$("#ptc_email_addr").prop("disabled", false);
						$("#ptc_password").prop("disabled", false);
						result.fadeOut(3000);
					}
					else if(msg == 'nouser')
					{
						$("#ptc_email_addr").prop("disabled", false);
						$("#ptc_password").prop("disabled", false);
						$("#loginPO").fadeIn(5000);
						result.html("<font size='4px'><b>Bad combination of username or password</b></font>");
						alert("Bad combination of username or password");
					}
					else
					{
						window.location.href= 'dashboard';
					}
				}
			});
		}
	});
	
		
	//Before Providing Help
	$("#ph_proceed").click(function(){
		// alert(12);
		if($('#ph_agree').is(':checked')){
			$("#provideHelp").hide();
			window.location.href="provide?desc=PH";
		}
		else
		{
			alert("You need to agree before proceeding");
		}
		
	});
	
		$('#accnt_number').keypress(function(key) {
		$("#accnt_number").numeric();
		// alert(12);
    });
	
	
	//Saving Account Details
	$("#saveAccnt").click(function(PI) {
		PI.preventDefault();
		var getAllBankINFO = $("#getAllBankINFO").serialize();
		var accnt_number = $("#accnt_number").val();
		var bank_name = $("#bank_name").val();
		var accnt_name = $("#accnt_name").val();
		
		if(accnt_number == "" || bank_name == "" || accnt_name == "")
		{
			alert("Please fill all field");
			
			//Providng a red border on input field 
			$("#bank_name").addClass("input-warning");
			$("#accnt_name").addClass("input-warning");
			$("#accnt_number").addClass("input-warning");
		}
		
		else
		{
			$("#bank_name").prop("disabled", true);
			$("#accnt_name").prop("disabled", true);
			$("#accnt_number").prop("disabled", true);
			
			//Removing a red border on input field 
			$("#bank_name").removeClass("input-warning");
			$("#accnt_name").removeClass("input-warning");
			$("#accnt_number").removeClass("input-warning");
			
			$.ajax({
				url: "action.php?SaveACCOUNT",
				type: "post",
				data: getAllBankINFO,
				beforeSend: function(){
					result.addClass("alert alert-info").html("<b>Please wait</b>");
				},
				success: function(msg){
					result.removeClass("alert alert-info");
					if(msg == "Account saved")
					{	
						alert("Account saved");
						$("#saveAccnt").prop("disabled", true);
						window.location.href="dashboard";
						
					}
					else if(msg == "Account number already exist")
					{
						alert("Account number already exist");
						window.location.href="account";
						
					}
					else if(msg == "Error in saving account details")
					{	
						alert("Error in saving account details");
						window.location.href="account";
					}
					else
					{	
						window.location.href="account";
					}
				}
				
			});
		}
		
	});
	
	
	//fetching bank account details 
	load_data = {'fetch':1};
	window.setInterval(function(){
	 $.post('action.php?FetchBANKAccount', load_data,  function(data) {
		$('.account_info').html(data);
		var scrolltoh = $('.account_info')[0].scrollHeight;
		$('.account_info').scrollTop(scrolltoh);
	 });
	}, 1000);
	
	
			$("#Go_PH").hide();
	//
	$("#provide_help_amount").keyup(function(e){
		var provide_help_amount = Math.round($(this).val());
		var data = "provide_help_amount="+provide_help_amount;
		if(provide_help_amount == "")
		{
			$("#result").hide();
			$("#Go_PH").hide();
		}
		
		else
		{
			$.ajax(
			{
				url: "action.php?ConvertAmount",
				type: "post",
				data: data,
				success: function(msg)
				{
					if(msg == "")
					{
						$("#Go_PH").hide();
					}
					else
					{
						$("#Go_PH").show();
						$("#result").show();
						$("#result").html(msg)
					}
				}
			});
		// result.html(provide_help_amount);
		}
	});
	
	$("#Go_PH").click(function(e){
		e.preventDefault();
		var provide_help_amount = $("#provide_help_amount").val();
		var data = "provide_help_amount="+provide_help_amount;
		// alert(provide_help_amount);
		$.ajax({
				url: "action.php?SavePH",
				type: "post",
				data: data,
				beforeSend: function(){
					processing.addClass("alert alert-info").html("<font size='4px'><b><img src='images/loader.gif' width='40' height='30'> Please wait</b></font>");
				},
				success: function(msg)
				{
					if(msg == "Saved")
					{
						alert("Your request has been saved");
						window.location.href="wallet";
					}
					else if(msg == "error_save_ph_order")
					{
						processing.html("<font size='4px'><b>"+msg+"</b></font>");
						alert("error_save_ph_order");
					}
					else
					{
						processing.html("<font size='4px'><b>"+msg+"</b></font>");
						alert(msg);
					}
				}
			});
		
	});
	
	
});