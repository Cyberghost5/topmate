<?php

    //Auto Load Classes
    require_once("../autoloader.php");
    require_once("../../core/helpers/vendor/autoload.php");
    header('Content-Type: application/json');
    date_default_timezone_set('Africa/Lagos');
    
    $headers = getallheaders();
    $response = array();
    $controller = new ApiAccess;
    
    $input = @file_get_contents("php://input");
    $res = json_decode($input, true);
   
    
   
   
    if (is_array($res) && isset($res["sessionId"])){
	

$sessionId = $res["sessionId"];//use
$accountNumber = $res["accountNumber"];//use
$tranRemarks = $res["tranRemarks"];
$transactionAmount = $res["transactionAmount"];//use
 $amount_paid = $res["settledAmount"];//use
$feeAmount = $res["feeAmount"];//use
$vatAmount = $res["vatAmount"];//use
$currency = $res["currency"];//use
$settlementId = $res["initiationTranRef"];//



$tranDateTime = $res["tranDateTime"];
 
 $sessionId= explode("-",$sessionId);
 $sessionId=trim($sessionId[0]);

 	file_put_contents("strwallet_data.txt",$input); 

          //Verify The Transaction
            $check=$controller->verifyStrowalletTransaction($accountNumber,$sessionId,$amount_paid);
    	file_put_contents("get_userid.txt",$check);
            $userid = $check["userid"];
            $userbalance = $check["balance"];
            //Get strowallet charges here
            $charges = $check["charges"];//in percent
            $chargesText =  $charges."%";
            $servicename = "Wallet Topup";
            $servicedesc = "Wallet funding of N{$amount_paid} via Strowallet bank transfer with a service charges of {$chargesText}";
          
           if($check["status"] == "success"){
                      
                        $amounttosave = (float) $amount_paid;
                       /* if($charges == 50 || $charges == "50"){
                            $amounttosave = $amounttosave - 50;
                        }
                        else{
                            $amounttosave = $amounttosave - ($amounttosave * ($charges/100)); 
                        }
                        */
                        $amounttosave = $amounttosave - ($amounttosave * ($charges/100)); 
                        $servicedesc.=". You wallet have been credited with $amounttosave";
                    
                        $result = $controller->recordMonnifyTransaction($userid,$servicename,$servicedesc,$amounttosave,$userbalance,$sessionId,"0");

                        //Send Email Notification
                        $message = $servicedesc . ". Your transaction reference is $sessionId";
                        $controller->sendEmailNotification($servicename,$message,$email);

                        echo "Success";
                        http_response_code(200);
                        exit();
        
	  }else{
           $servicename = "Wallet Topup";
                        $servicedesc = "Failed wallet funding of N{$amount_paid} via bank transfer.";
                        $result = $controller->recordMonnifyTransaction($userid,$servicename,$servicedesc,$amount_paid,$userbalance,$sessionId,"1");
                        echo "Fail";
                        http_response_code(400);
                        exit();
	  }
      
    }else{
        echo "UnAutorized";
        http_response_code(401);
        exit();

	}
    
?>