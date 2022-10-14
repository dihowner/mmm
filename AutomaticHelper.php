<?php

/**
 * Created by PhpStorm.
 * User: Lexy
 * Date: 06/04/2017
 * Time: 03:02 AM
 */

//_once "../config.php";

class AutomaticHelper
{
    private $connection;
    private $loggedVariable;
    private $phArray = array();
    private $ghArray = array();
    private $ghAmountPerLoop;
    private $correctBanlance;
    private $phBalance;


    public function __construct()
    {
        global $con;
        global $username;
        $this->connection = $con;
        //$this->loggedVariable = $username;
    }

    private function searchUserID($username){
        $res = $this->connection->prepare("SELECT * FROM participant WHERE email = '{$username}'");
        $result = $res->execute();
        $fetchResult = $res->fetch(PDO::FETCH_ASSOC);
        while ($row = $fetchResult){
            return $row['pid'];
        }
        return true;
    }

    public function userPHUnconfirmed($col){
        $result = $this->connection->prepare("SELECT * FROM providehelp WHERE participantID = :col1 AND status = :col2 AND wallet = :col5 AND (merge = :col3 OR merge = :col4)");
        $result->bindValue(':col1',$this->searchUserID($this->loggedVariable));
        $result->bindValue(':col2','Unconfirmed');
        $result->bindValue(':col3','NO');
        $result->bindValue(':col4','partial');
        $result->bindValue(':col5','45% Increment');
        $result->setFetchMode(PDO::FETCH_ASSOC);
        $result->execute();
        if ($result->rowCount() < 1){
            return false;
        }else {
            while ($row = $result->fetch()) {
                array_push($this->phArray,array(
                   "PHID" => $row['phID'],
                    "participantID" => $row['participantID'],
                    "amountPH" => $row['amntPH'],
                    "phBalance" => $row['balance']
                ));
            }
            return true;
        }
    }

    public function getPHAmountID(){
        $work = $this->connection->prepare("SELECT * FROM gethelp WHERE user_status = 'active' AND (merge = 'NO' OR merge = 'partial') AND participantID <> :pID ORDER BY ID ASC LIMIT 1");
        $work->bindValue(':pID',$this->searchUserID($this->loggedVariable));
        $work->setFetchMode(PDO::FETCH_ASSOC);
        $work->execute();
        if ($work->rowCount() < 1){
            return false;
        }else{
            while ($row = $work->fetch()){
                $rows = $row;
            }
        }
        return $rows;
    }


    private function loadGHIntoArray(){
        $result = $this->connection->query("SELECT * FROM gethelp WHERE user_status = 'active' AND (merge = 'NO' or merge = 'partial') LIMIT 1");
        $result->setFetchMode(PDO::FETCH_ASSOC);
        $result->execute();
        if ($result->rowCount() < 1){
            return false;
        }else {
            while ($row = $result->fetch()) {
                array_push($this->ghArray,array(
                    "ID" => $row['ID'],
                    //"GHID" => $row['ghID'],
                    //"participantID" => $row['participantID'],
                    //"amountGH" => $row['amountGH'],
                    //"ghBalance" => $row['balance']
                ));
            }
            return true;
        }
    }

    public function loopThroughAllGH(){
        try {
            $this->loadGHIntoArray();
            $ghArrayCount = count($this->ghArray);
            for ($i = 0; $i < $ghArrayCount; $i++) {
                if ($this->getResultOfGH($this->ghArray[$i]['ID'])['merge'] == 'NO') {
                    $this->updateGHBalance($this->ghArray[$i]['ID'], $this->getResultOfGH($this->ghArray[$i]['ID'])['amountGH']);
                }
                //$this->ghAmountPerLoop = $this->getResultOfGH($this->ghArray[$i]['ID'])["amountGH"];
                while ($this->getResultOfGH($this->ghArray[$i]['ID'])['merge'] == "partial") {

                    //this next line searches for the next PH user and stores his/her ID
                    $ph_id = $this->getPHByOrderID();
                    if (empty($ph_id) || $ph_id == false){
                        throw new Exception("No Ph User Found");
                    }
                    if ($this->getResultOfPH($ph_id, 'merge') == "NO") {
                        $this->updatePHBalance($this->getResultOfPH($ph_id, 'ID'), $this->getResultOfPH($ph_id, 'amntPH'));
                    }
                    $PHUserBalance = $this->getResultOfPH($ph_id, 'balance');
                    $GHUserBalance = $this->getResultOfGH($this->ghArray[$i]['ID'])["balance"];
                    $newBalance = $GHUserBalance - $PHUserBalance;
                    //echo $this->getResultOfPH($ph_id,'phID');
                    if ($newBalance > 0) {
                        $this->updateBalanceGreaterThanZero($newBalance, $this->getResultOfPH($ph_id, 'phID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["ghID"], $this->getResultOfPH($ph_id, 'participantID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["participantID"], $PHUserBalance, $this->getResultOfPH($ph_id, 'ID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["ID"]);
                    } elseif ($newBalance == 0) {
                        $this->updateBalanceEqualsZero($newBalance, $this->getResultOfPH($ph_id, 'phID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["ghID"], $this->getResultOfPH($ph_id, 'participantID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["participantID"], $PHUserBalance, $this->getResultOfPH($ph_id, 'ID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["ID"]);
                    } elseif ($newBalance < 0) {
                        $correctBal2 = abs($newBalance);
                        $this->updateBalanceLessThanZero($correctBal2, $this->getResultOfPH($ph_id, 'phID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["ghID"], $this->getResultOfPH($ph_id, 'participantID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["participantID"], $GHUserBalance, $this->getResultOfPH($ph_id, 'ID'), $this->getResultOfGH($this->ghArray[$i]['ID'])["ID"]);
                    }
                    // }while ($this->getResultOfGH($this->ghArray[$i]['ID'])['merge'] == "partial");
                    // }while (true);
                }
            }
        }catch (Exception $exception){
            $log = $exception->getMessage();
        }
    }

    private function getPHByOrderID(){
        try {
            // $this->connection->beginTransaction();
			$time = time();
            $res = $this->connection->query("SELECT * FROM providehelp WHERE status = 'Unconfirmed' AND wallet='45% Increment' AND (merge = 'NO' OR merge = 'partial') ORDER BY ID ASC LIMIT 1");
            $res->setFetchMode(PDO::FETCH_ASSOC);
            $res->execute();
            if ($res->rowCount() < 1) {
                return false;
            } else {
                while ($row = $res->fetch()) {
                    $merge_hour = $row['merge_hour'];
					if($time >= $merge_hour)
					{
						return $row['ID'];
					}
                }
                // $this->connection->commit();
                return true;
            }

        }catch (PDOException $e){
            // $this->connection->rollBack();
            die($e->getMessage());
        }
    }

    private function getResultOfPH($idd,$col){
        $res = $this->connection->prepare("SELECT * FROM providehelp WHERE ID = :phdd AND wallet ='45% Increment'");
        $res->bindValue(":phdd",$idd);
        $res->setFetchMode(PDO::FETCH_ASSOC);
        $res->execute();
        if ($res->rowCount() < 1){
            return false;
        }else{
            while ($row = $res->fetch()){
                return $row[$col];
            }
            return true;
        }
    }

    private function getResultOfGH($id){
        $res = $this->connection->prepare("SELECT * FROM gethelp WHERE ID = :ghid LIMIT 1");
        $res->bindValue(':ghid',$id);
        $res->setFetchMode(PDO::FETCH_ASSOC);
        $res->execute();
        if ($res->rowCount() < 1){
            return false;
        }else{
            return $res->fetch();
        }
    }

    private function updateGHBalance($id, $bal){
        $res = $this->connection->prepare("UPDATE gethelp SET balance = :bal, merge = 'partial' WHERE ID = :ghid");
        $res->bindValue(':bal',$bal);
        $res->bindValue(':ghid',$id);
        $res->setFetchMode(PDO::FETCH_ASSOC);
        $res->execute();
        if ($res->rowCount() < 1){
            return false;
        }else{
            return true;
        }
    }

    private function updatePHBalance($id, $bal){
        $res = $this->connection->prepare("UPDATE providehelp SET balance = :bal, merge = 'partial' WHERE ID = :phid AND wallet ='45% Increment'");
        $res->bindValue(':bal',$bal);
        $res->bindValue(':phid',$id);
        $res->setFetchMode(PDO::FETCH_ASSOC);
        $res->execute();
        if ($res->rowCount() < 1){
            return false;
        }else{
            return true;
        }
    }

    //if the remaining balance of GH is greater than 0
    private function updateBalanceGreaterThanZero($correctBal,$phID,$ghID,$partID,$gHpartID,$amountToPH,$phIDD,$ghIDD){
        $todaysDay =  date('D'); //Mon?
        $dateMerge = date('d.m.Y H:i');
        $merge_time_forph = date('d.m.Y h:i A');
        $timer = date('h:00 A');

        if($todaysDay == 'Mon' || $todaysDay == 'Tue'  || $todaysDay == 'Wed'  || $todaysDay == 'Thu')
        {
            $dateMerge_expires =  date('M d, Y H:i:00', strtotime('+50 hours')); //still 12hours to pay normal day
        }
        else if($todaysDay == 'Fri' || $todaysDay == 'Sat' || $todaysDay == 'Sun')
        {
            $dateMerge_expires =  date('M d, Y H:i:00', strtotime('+74 hours')); //still 72hours to pay on Friday
        }
		

        try{
			
			
			$senderid = 'GIVERCYCLER';
			
			//Lets get participant PH email address
			$phUser = $this->connection->prepare("select * from participant where pid='$partID'");
			$phUser->execute();
			$phUserInfo = $phUser->fetch(PDO::FETCH_ASSOC);
			$ph_email  = $phUserInfo['email'];
			$participant_name  = strtoupper($phUserInfo['name']);
			$ph_mobile  = $phUserInfo['mobile'];
			
			
			//Lets get participant receiver info
			$ghUser = $this->connection->prepare("select * from participant where pid='$gHpartID'");
			$ghUser->execute();
			$ghUserInfo = $ghUser->fetch(PDO::FETCH_ASSOC);
			$gh_email  = $ghUserInfo['email'];
			$receiver_name  = strtoupper($ghUserInfo['name']);
			$gh_mobile  = $ghUserInfo['mobile'];
			
			$email_fee = number_format(($amountToPH),2);
			$ph_message = str_replace(" ", "%20", "You have been merged to provide help of N$email_fee. Pls login to confirm");
			$gh_message = str_replace(" ", "%20", "You have been merged to get help of N$email_fee. Pls login to confirm");
			$sender_api =  "http://developers.cloudsms.com.ng/api.php?userid=24779922&password=XR_PJxtL&type=0&destination=$ph_mobile&sender=$senderid&message=$ph_message";
			file_get_contents($sender_api);
			$receiver_api =  "http://developers.cloudsms.com.ng/api.php?userid=24779922&password=XR_PJxtL&type=0&destination=$gh_mobile&sender=$senderid&message=$gh_message";
			file_get_contents($receiver_api);
				
			
        // $this->connection->beginTransaction();

        $ins = $this->connection->prepare("update providehelp set balance = :col1, merge= :col2 where ID = :phID AND wallet ='45% Increment'");
        $ins->bindValue(':col1', '0');
        $ins->bindValue(':col2','complete');
        $ins->bindValue(':phID',$phIDD);

        if($ins->execute()) {
            $ins->closeCursor();
            // Lets merge participant since we have someone to collect the balance
            $merge_save = $this->connection->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires, attachment, status, time_upload, auto_confirm, gh_letter) values ('$phID', '$ghID', '$partID', '$gHpartID', '$amountToPH', '$dateMerge', '$dateMerge_expires', '', '', '', '', '')");
            $merge_save->execute();

            $merge_save->closeCursor();

            // Update GH
            $updateGH = $this->connection->prepare("update gethelp set merge='partial', balance='$correctBal' where ID='$ghIDD'");
            $updateGH->execute();
            $updateGH->closeCursor();

			//Email Aspect for person to pay
			// set content type header for html email
			$headers  = 'MIME-Version: 1.0' . "\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
			// set additional headers
			$headers .= 'From: You have Been Merged To Provide Help..... <no-reply@giverscycler.com>' . "\r\n".'X-Mailer: PHP/' . phpversion();
			$ph_subject = "You have Been Merged To Provide Help.....";
			$ph_body= "<html>
		<head>
			<title>REQUEST TO ASSIST $receiver_name</title>
		</head>
		<body><div>
	<div style='font-family:arial;border:2px solid #c0c0c0;padding:15px;border-radius:5px;'>
	<div style='font-size:22px;color:darkblue;font-weight:bold;'>PH REQUEST ORDER GIVERSCYCLER</div>
		<br>
	Dear Participant $participant_name!
	 <br>
	You have been merged to provide help of <font color='red'><b>&#8358;$email_fee</b></font> to $receiver_name. Please login to your personal office for the details.
	 <br><br>
	 <font color='red'><b><u>NOTE:</u></b></font>
	 <br>
	 1. Contact the receiver to make sure he/she is willing to confirm your payment.
	 <br>
	 2. Payment should be made only to the banking details provided by the system as we will not be responsible for payment made outside the details.
	 <br>
	 3. Report any <b>CYBER BEGGARS</b> to the Administrator

	 <br><br>
	 
	After making your payment, click on <b>UPLOAD POP</b> to upload your proof of payment.
	 <br>
	Payment must be made before <b>$dateMerge_expires</b> and endeavor to upload your proof of payment.
	 <br> <br>
	 
	Thank You!
	</div></div></body></html>";

							
							//Email Aspect for person to recieve
			
			// set content type header for html email
			$headers_2  = 'MIME-Version: 1.0' . "\r\n";
			$headers_2 .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
			// set additional headers
			$headers_2 .= 'From: you have been paired to receive...  <no-reply@giverscycler.com>' . "\r\n".'X-Mailer: PHP/' . phpversion();
			
			$gh_subject = "Dear $receiver_name, you have been paired to receive...";
			$gh_body= "<html>
		<head>
			<title>Dear $receiver_name, you have been paired to receive...</title>
		</head>
		<body><div>
	<div style='font-family:arial;border:2px solid #c0c0c0;padding:15px;border-radius:5px;'>
	<div style='font-size:22px;color:darkblue;font-weight:bold;'>GH Request GIVERSCYCLER</div>
		<br>
	Hello $receiver_name,
	 <br>
	System has paired you to receive help of <font color='red'><b>&#8358;$email_fee</b></font>.  
	<br>For details, please log on into your account for the list of members paired to pay you.
	 <br> <br>

	Thank You!
	</div></div></body></html>";

				mail($ph_email, $ph_subject, $ph_body, $headers);
				mail($gh_email, $gh_subject, $gh_body, $headers_2);
				
            // $this->connection->commit();
        }

        }catch (PDOException $e){
            // $this->connection->rollBack();
            die($e->getMessage());
        }
    }

    //if the remaining balance of GH is equal to 0
    private function updateBalanceEqualsZero($correctBal,$phID,$ghID,$partID,$gHpartID,$amountToPH,$phIDD,$ghIDD){
        $todaysDay =  date('D'); //Mon?
        $dateMerge = date('d.m.Y H:i');
        $merge_time_forph = date('d.m.Y h:i A');
        $timer = date('h:00 A');

        if($todaysDay == 'Mon' || $todaysDay == 'Tue'  || $todaysDay == 'Wed'  || $todaysDay == 'Thu')
        {
            $dateMerge_expires =  date('M d, Y H:i:00', strtotime('+50 hours')); //still 12hours to pay normal day
        }
        else if($todaysDay == 'Fri' || $todaysDay == 'Sat' || $todaysDay == 'Sun')
        {
            $dateMerge_expires =  date('M d, Y H:i:00', strtotime('+74 hours')); //still 72hours to pay on Friday
        }

        try {

			
			$senderid = 'GIVERCYCLER';
			//Lets get participant PH email address
			$phUser = $this->connection->prepare("select * from participant where pid='$partID'");
			$phUser->execute();
			$phUserInfo = $phUser->fetch(PDO::FETCH_ASSOC);
			$ph_email  = $phUserInfo['email'];
			$participant_name  = strtoupper($phUserInfo['name']);
			$ph_mobile  = $phUserInfo['mobile'];
			
			
			//Lets get participant receiver info
			$ghUser = $this->connection->prepare("select * from participant where pid='$gHpartID'");
			$ghUser->execute();
			$ghUserInfo = $ghUser->fetch(PDO::FETCH_ASSOC);
			$gh_email  = $ghUserInfo['email'];
			$receiver_name  = strtoupper($ghUserInfo['name']);
			$gh_mobile  = $ghUserInfo['mobile'];
			
			$email_fee = number_format(($amountToPH),2);
			$ph_message = str_replace(" ", "%20", "You have been merged to provide help of N$email_fee. Pls login to confirm");
			$gh_message = str_replace(" ", "%20", "You have been merged to get help of N$email_fee. Pls login to confirm");
			$sender_api =  "http://developers.cloudsms.com.ng/api.php?userid=24779922&password=XR_PJxtL&type=0&destination=$ph_mobile&sender=$senderid&message=$ph_message";
			file_get_contents($sender_api);
			$receiver_api =  "http://developers.cloudsms.com.ng/api.php?userid=24779922&password=XR_PJxtL&type=0&destination=$gh_mobile&sender=$senderid&message=$gh_message";
			file_get_contents($receiver_api);
				
			
			
            // $this->connection->beginTransaction();

            $ins = $this->connection->prepare("update providehelp set balance = :col1, merge= :col2 where ID = :phID AND wallet ='45% Increment'");
            $ins->bindValue(':col1', $correctBal);
            $ins->bindValue(':col2', 'complete');
            $ins->bindValue(':phID', $phIDD);

            if ($ins->execute()) {
                $ins->closeCursor();
                // Lets merge participant since we have someone to collect the balance
                $merge_save = $this->connection->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires, attachment, status, time_upload, auto_confirm, gh_letter) values ('$phID', '$ghID', '$partID', '$gHpartID', '$amountToPH', '$dateMerge', '$dateMerge_expires', '', '', '', '', '')");
                $merge_save->execute();

                $merge_save->closeCursor();

                // Update GH
                $updateGH = $this->connection->prepare("update gethelp set merge='YES', balance='$correctBal' where ID='$ghIDD'");
                $updateGH->execute();

                $updateGH->closeCursor();

			//Email Aspect for person to pay
			// set content type header for html email
			$headers  = 'MIME-Version: 1.0' . "\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
			// set additional headers
			$headers .= 'From: You have Been Merged To Provide Help..... <no-reply@giverscycler.com>' . "\r\n".'X-Mailer: PHP/' . phpversion();
			$ph_subject = "You have Been Merged To Provide Help.....";
			$ph_body= "<html>
		<head>
			<title>REQUEST TO ASSIST $receiver_name</title>
		</head>
		<body><div>
	<div style='font-family:arial;border:2px solid #c0c0c0;padding:15px;border-radius:5px;'>
	<div style='font-size:22px;color:darkblue;font-weight:bold;'>PH REQUEST ORDER GIVERSCYCLER</div>
		<br>
	Dear Participant $participant_name!
	 <br>
	You have been merged to provide help of <font color='red'><b>&#8358;$email_fee</b></font> to $receiver_name. Please login to your personal office for the details.
	 <br><br>
	 <font color='red'><b><u>NOTE:</u></b></font>
	 <br>
	 1. Contact the receiver to make sure he/she is willing to confirm your payment.
	 <br>
	 2. Payment should be made only to the banking details provided by the system as we will not be responsible for payment made outside the details.
	 <br>
	 3. Report any <b>CYBER BEGGARS</b> to the Administrator

	 <br><br>
	 
	After making your payment, click on <b>UPLOAD POP</b> to upload your proof of payment.
	 <br>
	Payment must be made before <b>$dateMerge_expires</b> and endeavor to upload your proof of payment.
	 <br> <br>
	 
	Thank You!
	</div></div></body></html>";

							
							//Email Aspect for person to recieve
			
			// set content type header for html email
			$headers_2  = 'MIME-Version: 1.0' . "\r\n";
			$headers_2 .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
			// set additional headers
			$headers_2 .= 'From: you have been paired to receive...  <no-reply@giverscycler.com>' . "\r\n".'X-Mailer: PHP/' . phpversion();
			
			$gh_subject = "Dear $receiver_name, you have been paired to receive...";
			$gh_body= "<html>
		<head>
			<title>Dear $receiver_name, you have been paired to receive...</title>
		</head>
		<body><div>
	<div style='font-family:arial;border:2px solid #c0c0c0;padding:15px;border-radius:5px;'>
	<div style='font-size:22px;color:darkblue;font-weight:bold;'>GH Request GIVERSCYCLER</div>
		<br>
	Hello $receiver_name,
	 <br>
	System has paired you to receive help of <font color='red'><b>&#8358;$email_fee</b></font>.  
	<br>For details, please log on into your account for the list of members paired to pay you.
	 <br> <br>

	Thank You!
	</div></div></body></html>";

							mail($ph_email, $ph_subject, $ph_body, $headers);
							mail($gh_email, $gh_subject, $gh_body, $headers_2);
							
                // $this->connection->commit();
            }
        }catch (PDOException $e){
            // $this->connection->rollBack();
            die($e->getMessage());
        }
    }

    //if the remaining balance of GH is less than 0
    private function updateBalanceLessThanZero($correctBal,$phID,$ghID,$partID,$gHpartID,$amountToGH,$phIDD,$ghIDD){
        $todaysDay =  date('D'); //Mon?
        $dateMerge = date('d.m.Y H:i');
        $merge_time_forph = date('d.m.Y h:i A');
        $timer = date('h:00 A');

        if($todaysDay == 'Mon' || $todaysDay == 'Tue'  || $todaysDay == 'Wed'  || $todaysDay == 'Thu')
        {
            $dateMerge_expires =  date('M d, Y H:i:00', strtotime('+50 hours')); //still 12hours to pay normal day
        }
        else if($todaysDay == 'Fri' || $todaysDay == 'Sat' || $todaysDay == 'Sun')
        {
            $dateMerge_expires =  date('M d, Y H:i:00', strtotime('+74 hours')); //still 72hours to pay on Friday
        }

        try {
           // $this->connection->beginTransaction();
			
			
			$senderid = 'GIVERCYCLER';
			//Lets get participant PH email address
			$phUser = $this->connection->prepare("select * from participant where pid='$partID'");
			$phUser->execute();
			$phUserInfo = $phUser->fetch(PDO::FETCH_ASSOC);
			$ph_email  = $phUserInfo['email'];
			$participant_name  = strtoupper($phUserInfo['name']);
			$ph_mobile  = $phUserInfo['mobile'];
			
			
			//Lets get participant receiver info
			$ghUser = $this->connection->prepare("select * from participant where pid='$gHpartID'");
			$ghUser->execute();
			$ghUserInfo = $ghUser->fetch(PDO::FETCH_ASSOC);
			$gh_email  = $ghUserInfo['email'];
			$receiver_name  = strtoupper($ghUserInfo['name']);
			$gh_mobile  = $ghUserInfo['mobile'];
			
			$email_fee = number_format(($amountToGH),2);
			$ph_message = str_replace(" ", "%20", "You have been merged to provide help of N$email_fee. Pls login to confirm");
			$gh_message = str_replace(" ", "%20", "You have been merged to get help of N$email_fee. Pls login to confirm");
			$sender_api =  "http://developers.cloudsms.com.ng/api.php?userid=24779922&password=XR_PJxtL&type=0&destination=$ph_mobile&sender=$senderid&message=$ph_message";
			file_get_contents($sender_api);
			$receiver_api =  "http://developers.cloudsms.com.ng/api.php?userid=24779922&password=XR_PJxtL&type=0&destination=$gh_mobile&sender=$senderid&message=$gh_message";
			file_get_contents($receiver_api);
				
            $ins = $this->connection->prepare("update providehelp set balance = :col1, merge= :col2 where ID = :phID");
            $ins->bindValue(':col1', $correctBal);
            $ins->bindValue(':col2', 'partial');
            $ins->bindValue(':phID', $phIDD);

            if ($ins->execute()) {
                $ins->closeCursor();
                // Lets merge participant since we have someone to collect the balance
                $merge_save = $this->connection->prepare("Insert into merge_gh (phID, ghID, participantID, gh_participantID, amountGH, dateMerge, dateMerge_expires, attachment, status, time_upload, auto_confirm, gh_letter) values ('$phID', '$ghID', '$partID', '$gHpartID', '$amountToGH', '$dateMerge', '$dateMerge_expires', '', '', '', '', '')");
                $merge_save->execute();

                $merge_save->closeCursor();

                // Update GH
                $updateGH = $this->connection->prepare("update gethelp set merge='YES', balance='0' where ID='$ghIDD'");
                $updateGH->execute();
                $updateGH->closeCursor();

				
			//Email Aspect for person to pay
			// set content type header for html email
			$headers  = 'MIME-Version: 1.0' . "\r\n";
			$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
			// set additional headers
			$headers .= 'From: You have Been Merged To Provide Help..... <no-reply@giverscycler.com>' . "\r\n".'X-Mailer: PHP/' . phpversion();
			$ph_subject = "You have Been Merged To Provide Help.....";
			$ph_body= "<html>
		<head>
			<title>REQUEST TO ASSIST $receiver_name</title>
		</head>
		<body><div>
	<div style='font-family:arial;border:2px solid #c0c0c0;padding:15px;border-radius:5px;'>
	<div style='font-size:22px;color:darkblue;font-weight:bold;'>PH REQUEST ORDER GIVERSCYCLER</div>
		<br>
	Dear Participant $participant_name!
	 <br>
	You have been merged to provide help of <font color='red'><b>&#8358;$email_fee</b></font> to $receiver_name. Please login to your personal office for the details.
	 <br><br>
	 <font color='red'><b><u>NOTE:</u></b></font>
	 <br>
	 1. Contact the receiver to make sure he/she is willing to confirm your payment.
	 <br>
	 2. Payment should be made only to the banking details provided by the system as we will not be responsible for payment made outside the details.
	 <br>
	 3. Report any <b>CYBER BEGGARS</b> to the Administrator

	 <br><br>
	 
	After making your payment, click on <b>UPLOAD POP</b> to upload your proof of payment.
	 <br>
	Payment must be made before <b>$dateMerge_expires</b> and endeavor to upload your proof of payment.
	 <br> <br>
	 
	Thank You!
	</div></div></body></html>";

							
							//Email Aspect for person to recieve
			
			// set content type header for html email
			$headers_2  = 'MIME-Version: 1.0' . "\r\n";
			$headers_2 .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
			// set additional headers
			$headers_2 .= 'From: you have been paired to receive...  <no-reply@giverscycler.com>' . "\r\n".'X-Mailer: PHP/' . phpversion();
			
			$gh_subject = "Dear $receiver_name, you have been paired to receive...";
			$gh_body= "<html>
		<head>
			<title>Dear $receiver_name, you have been paired to receive...</title>
		</head>
		<body><div>
	<div style='font-family:arial;border:2px solid #c0c0c0;padding:15px;border-radius:5px;'>
	<div style='font-size:22px;color:darkblue;font-weight:bold;'>GH Request GIVERSCYCLER</div>
		<br>
	Hello $receiver_name,
	 <br>
	System has paired you to receive help of <font color='red'><b>&#8358;$email_fee</b></font>.  
	<br>For details, please log on into your account for the list of members paired to pay you.
	 <br> <br>

	Thank You!
	</div></div></body></html>";

					mail($ph_email, $ph_subject, $ph_body, $headers);
					mail($gh_email, $gh_subject, $gh_body, $headers_2);
					
                // $this->connection->commit();
            }
        }catch (PDOException $e){
            // $this->connection->rollBack();
            die($e->getMessage());
        }
    }


}