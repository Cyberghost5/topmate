<?php

    class Airtime extends ApiAccess{

        //Purchase Airtime
		public function purchaseMyAirtime($body,$networkDetails){

            $details=$this->model->getApiDetails();
            
            $response = array();

            //Check Airtime Type
            if($body->airtime_type == "VTU"){$name="Vtu"; $thenetworkId=$networkDetails["vtuId"];} 
            else {$name ="Sharesell"; $thenetworkId=$networkDetails["sharesellId"]; }

            //Get Api Key Details
            $networkname = strtolower($networkDetails["network"]);
            $host = self::getConfigValue($details,$networkname.$name."Provider");
            $apiKey = self::getConfigValue($details,$networkname.$name."Key");

            
            //Check If API Is Is Using N3TData Or Bilalsubs
            if(strpos($host, 'n3tdata247') !== false){
                $hostuserurl="https://n3tdata247.com/api/user/";
                return $this->purchaseAirtimeWithBasicAuthentication($body,$host,$hostuserurl,$apiKey,$thenetworkId);
            }
            
            // Add Autopilot check
        if(strpos($host, 'autopilot') !== false) {
            return $this->purchaseAirtimeWithAutopilot($body, $host, $apiKey, $thenetworkId, $body->airtime_type);
        }
        
            // Check If API Is Using SMEPlug
        if (strpos($host, 'smeplug') !== false) {
            return $this->purchaseAirtimeWithSmeplug($body, $host, $apiKey, $thenetworkId);
        }

            if(strpos($host, 'n3tdata') !== false){
                $hostuserurl="https://n3tdata.com/api/user/";
                return $this->purchaseAirtimeWithBasicAuthentication($body,$host,$hostuserurl,$apiKey,$thenetworkId);
            }

            if(strpos($host, 'legitdataway') !== false){
                $hostuserurl="https://legitdataway.com/api/user/";
                return $this->purchaseAirtimeWithBasicAuthentication($body,$host,$hostuserurl,$apiKey,$thenetworkId);
            }

            if(strpos($host, 'bilalsadasub') !== false){
                $hostuserurl="https://bilalsadasub.com/api/user/";
                return $this->purchaseAirtimeWithBasicAuthentication($body,$host,$hostuserurl,$apiKey,$thenetworkId);
            }
            
            if(strpos($host, 'rabdata360') !== false){
                $hostuserurl="https://rabdata360.com/api/user/";
                return $this->purchaseAirtimeWithBasicAuthentication($body,$host,$hostuserurl,$apiKey,$thenetworkId);
            }

            if(strpos($host, 'vtpass') !== false){
                return $this->purchaseAirtimeWithVTPass($body,$host,$apiKey,$thenetworkId,$networkname);
            }

           if(strpos($host, 'topupbox.com') !== false){
                return $this->purchaseAirtimeFromTopupBox($body,$host,$apiKey,$thenetworkId,$networkname);
            }
            
            
            // ------------------------------------------
            //  Purchase Airtime
            // ------------------------------------------

            $curl = curl_init();
            curl_setopt_array($curl, array(
            CURLOPT_URL => $host,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
                "network": "'.$thenetworkId.'",
                "amount": "'.$body->amount.'",
                "mobile_number": "'.$body->phone.'",
                "Ported_number":true,
                "request-id" : "'.$body->ref.'",
                "airtime_type": "'.$body->airtime_type.'"
            }',
             
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                "Authorization: Token $apiKey"
            ),
            ));

            $exereq = curl_exec($curl);

            $err = curl_error($curl);
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Unable To Connect To Server, Please Try Again Later";
                $response["api_response_log"]=json_encode($response)." : ".$err;
                file_put_contents("airtime_connection_log.txt",$err);
                curl_close($curl);
                return $response;
            }

            $result=json_decode($exereq);
            curl_close($curl);

            //Log API Response To Database
            $response["api_response_log"]=$exereq;

            //Get API Status
            if(isset($result->Status)){$apiStatus = strtolower($result->Status);}
            elseif(isset($result->status)){$apiStatus = strtolower($result->status);}
            else{$apiStatus = "";}

            //Interpret Response

            if($apiStatus == 'successful' || $apiStatus == 'success'){
                $response["status"] = "success";
            }
            elseif($apiStatus == 'failed' || $apiStatus == 'fail'){
                $response["status"] = "fail";
                $response["msg"] = "Transaction Failed, Please Try Again Later";
                
                //If Server Returns Message, Capture It If Message Is Not About A Low Wallet Balance
                //If Server Returns Message, Capture It If Message Is Not About A Low Wallet Balance
                if(isset($result->msg)){
                    if(strpos($result->msg, 'balance') !== false || strpos($result->msg, 'insufficient') !== false){$response["msg"] ="Unable To Complete Transaction: Please Report To Admin. Error Code BB.";}
                    else{$response["msg"] = $result->msg;}
                }

                //If Server Returns Message, Capture It If Message Is Not About A Low Wallet Balance
                if(isset($result->error[0])){
                    if(strpos($result->error[0], 'balance') !== false || strpos($result->error[0], 'insufficient') !== false){$response["msg"] ="Unable To Complete Transaction: Please Report To Admin. Error Code BB.";}
                    else{$response["msg"] = $result->error[0];}
                }

                //Log Error On Server
                file_put_contents("airtime_fail_log.txt",json_encode($result));
            }
            elseif($apiStatus == 'processing' || $apiStatus == 'process'){
                $response["status"] = "processing";
                file_put_contents("airtime_processing_log.txt",json_encode($result));
            }
            elseif($apiStatus == 'pending'){
                $response["status"] = "processing";
                file_put_contents("airtime_processing_log.txt",json_encode($result));
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Transaction Failed, Please Try Again Later";
                //Log Error On Server
                file_put_contents("airtime_fail_log.txt",json_encode($result));
            }

            return $response;
		}

    public function getAutopilotAirtimeTypes($host, $apiKey, $networkId) {
        $response = array();
        
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL =>  "https://autopilotng.com/api/live/v1/load/airtime-types",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode([
                "networkId" => $networkId
            ]),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                'Accept: application/json',
                "Authorization: Bearer $apiKey"
            ),
        ));

        $exereq = curl_exec($curl);
        $err = curl_error($curl);
        
        if($err){
            $response["status"] = "fail";
            $response["msg"] = "Server Connection Error: " . $err;
            file_put_contents("autopilot_airtime_types_error_log.txt", json_encode($response));
            curl_close($curl);
            return $response;
        }

        $result = json_decode($exereq);
        curl_close($curl);

        if($result->status === true && $result->code === 200) {
            $response["status"] = "success";
            $response["airtime_types"] = array_map(function($product) {
                return $product->name;
            }, $result->data->product);
            // Log available airtime types for debugging
            file_put_contents("autopilot_available_airtime_types.txt", "Network ID: $networkId\n" . json_encode($response["airtime_types"]) . "\n", FILE_APPEND);
        } else {
            $response["status"] = "fail";
            $response["msg"] = "Failed to fetch airtime types";
            file_put_contents("autopilot_airtime_types_error_log.txt", json_encode($result));
        }

        return $response;
    }

 public function purchaseAirtimeWithAutopilot($body, $host, $apiKey, $networkId, $airtimeType = null) {
    $response = array();

    // Map your airtime_type to Autopilot airtime types
    $airtimeTypeMap = [
        "VTU" => "VTU",
        "Sharesell" => "SNS",  
    ];

    // Use provided airtimeType or map it; fetch types if still null or invalid
    if (!$airtimeType || !isset($airtimeTypeMap[$airtimeType])) {
        $airtimeTypesResponse = $this->getAutopilotAirtimeTypes($host, $apiKey, $networkId);
        if ($airtimeTypesResponse["status"] === "success" && !empty($airtimeTypesResponse["airtime_types"])) {
            $availableTypes = $airtimeTypesResponse["airtime_types"];
            $mappedType = $airtimeType ? ($airtimeTypeMap[$airtimeType] ?? $airtimeType) : null;
            $airtimeType = in_array($mappedType, $availableTypes) ? $mappedType : $availableTypes[0];
        } else {
            $response["status"] = "fail";
            $response["msg"] = "Failed to determine airtime type";
            return $response;
        }
    } else {
        $airtimeType = $airtimeTypeMap[$airtimeType];
    }

    // Log the selected airtimeType for debugging
    file_put_contents("autopilot_selected_airtime_type.txt", "Selected airtimeType: $airtimeType for networkId: $networkId\n", FILE_APPEND);

    // Ensure reference is between 25 and 30 characters
    $reference = $body->ref;
    $originalLength = strlen($reference);

    if ($originalLength < 25 || $originalLength > 30) {
        // Use a prefix and a shortened unique ID
        $prefix = "AIR_"; // 4 characters
        $uniquePart = substr(uniqid(), -8); // Last 8 chars of uniqid (e.g., "64f2a3b1")
        $timestamp = substr((string)time(), -6); // Last 6 digits of timestamp (e.g., "756767")
        
        // Build reference: prefix + original ref (trimmed) + unique parts
        $baseRef = $prefix . substr($reference, 0, 10); // Limit original ref to 10 chars
        $remainingLength = 30 - strlen($baseRef . $uniquePart . $timestamp); // Calculate space left
        $padding = str_pad("", max(0, $remainingLength), "0"); // Pad with zeros if needed
        
        $reference = $baseRef . $uniquePart . $padding . $timestamp;
        
        // Trim to 30 chars if still too long
        $reference = substr($reference, 0, 30);
        
        // Ensure minimum length (shouldn’t happen but as a safeguard)
        if (strlen($reference) < 25) {
            $reference = str_pad($reference, 25, "0");
        }
    }

    // Log the reference for debugging
    file_put_contents("autopilot_reference_log.txt", "Generated reference: $reference (length: " . strlen($reference) . ")\n", FILE_APPEND);

    $payload = [
        "networkId" => $networkId,
        "airtimeType" => $airtimeType,
        "amount" => $body->amount,
        "phone" => $body->phone,
        "reference" => $reference // Updated reference
    ];

    // Add quantity for SNS airtime type if applicable
    if (strtoupper($airtimeType) === "SNS") {
        $payload["quantity"] = "1"; // Default to 1 as per Autopilot spec
    }

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://autopilotng.com/api/live/v1/airtime",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => json_encode($payload),
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json',
            'Accept: application/json',
            "Authorization: Bearer $apiKey"
        ),
    ));

    $exereq = curl_exec($curl);
    $err = curl_error($curl);
    
    if ($err) {
        $response["status"] = "fail";
        $response["msg"] = "Server Connection Error: " . $err;
        $response["api_response_log"] = json_encode($response) . " : " . $err;
        file_put_contents("autopilot_airtime_error_log.txt", json_encode($response));
        curl_close($curl);
        return $response;
    }

    $result = json_decode($exereq);
    curl_close($curl);

    $response["api_response_log"] = $exereq;

    if ($result->status === true && $result->code === 200) {
        $response["status"] = "success";
        $response["true_response"] = $result->data->message;
        file_put_contents("autopilot_airtime_success_log.txt", json_encode($result));
    } else {
        $response["status"] = "fail";
        $response["msg"] = $result->data->message ?? "Server/Network Error";
        file_put_contents("autopilot_airtime_fail_log.txt", json_encode($result));
    }

    return $response;
}


        //Purchase Airtime
		public function purchaseAirtimeWithBasicAuthentication($body,$host,$hostuserurl,$apiKey,$thenetworkId){

			
            $response = array();
            
            // ------------------------------------------
            //  Get User Access Token
            // ------------------------------------------
            
            $curlA = curl_init();
                curl_setopt($curlA, CURLOPT_URL, $hostuserurl);
                curl_setopt($curlA, CURLOPT_POST, 1);
                curl_setopt($curlA, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt(
                   $curlA, CURLOPT_HTTPHEADER, [
                        "Authorization: Basic $apiKey",
                    ]
                );
            
            $exereqA = curl_exec($curlA);
            $err = curl_error($curlA);
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error ";
                $response["api_response_log"]=json_encode($response)." : ".$err;
                curl_close($curlA);
                return $response;
            }
            
            $resultA=json_decode($exereqA);
            $apiKey=$resultA->AccessToken;
            curl_close($curlA);
        
            
            // ------------------------------------------
            //  Purchase Airtime
            // ------------------------------------------
        
            $curl = curl_init();
            curl_setopt_array($curl, array(
            CURLOPT_URL => $host,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
                "network": "'.$thenetworkId.'",
                "amount": "'.$body->amount.'",
                "phone": "'.$body->phone.'",
                "bypass":true,
                "request-id" : "'.$body->ref.'",
                "plan_type": "'.$body->airtime_type.'"
            }',
            
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                "Authorization: Token $apiKey"
            ),
            ));

            $exereq = curl_exec($curl);

            $err = curl_error($curl);
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error"; //.$err;
                $response["api_response_log"]=json_encode($response)." : ".$err;
                file_put_contents("basic_airtime_error_log2.txt",json_encode($response));
                curl_close($curl);
                return $response;
            }

            $result=json_decode($exereq);
            curl_close($curl);

            //Log API Response To Database
            $response["api_response_log"]=$exereq;

             //Get API Status
             if(isset($result->Status)){$apiStatus = strtolower($result->Status);}
             elseif(isset($result->status)){$apiStatus = strtolower($result->status);}
             else{$apiStatus = "";}

             if($apiStatus == 'successful' || $apiStatus == 'success'){
                $response["status"] = "success";
            }
            elseif($apiStatus == 'failed' || $apiStatus == 'fail'){
                $response["status"] = "fail";
                $response["msg"] = "Transaction Failed, Please Try Again Later";
                
                //If Server Returns Message, Capture It If Message Is Not About A Low Wallet Balance
                if(isset($result->message)){
                    if(strpos($result->message, 'balance') !== false || strpos($result->message, 'insufficient') !== false){$response["msg"] ="Unable To Complete Transaction: Please Report To Admin. Error Code BB.";}
                    else{$response["msg"] = $result->message;}
                }

                //Log Error On Server
                file_put_contents("basic_airtime_fail_log.txt",json_encode($result));
            }
            elseif($apiStatus == 'processing' || $apiStatus == 'process'){
                $response["status"] = "processing";
                file_put_contents("basic_airtime_processing_log.txt",json_encode($result));
            }
            elseif($apiStatus == 'pending'){
                $response["status"] = "processing";
                file_put_contents("basic_airtime_processing_log.txt",json_encode($result));
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Transaction Failed, Please Try Again Later";
                //Log Error On Server
                file_put_contents("basic_airtime_fail_log.txt",json_encode($result));
            }

            return $response;
		}

        //VTPass Integration
		public function purchaseAirtimeWithVTPass($body,$host,$apiKey,$thenetworkId,$networkname){

			
            $response = array();
            
            
            // ------------------------------------------
            //  Purchase Airtime
            // ------------------------------------------
            
           
            $curl = curl_init();
            
            curl_setopt_array($curl, [
              CURLOPT_URL => "https://vtpass.com/api/pay",
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_ENCODING => "",
              CURLOPT_MAXREDIRS => 10,
              CURLOPT_FOLLOWLOCATION => true,
              CURLOPT_TIMEOUT => 30,
              CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
              CURLOPT_CUSTOMREQUEST => "POST",
              CURLOPT_POSTFIELDS => '{
                    "serviceID": "'.$networkname.'",
                    "amount": "'.$body->amount.'",
                    "phone": "'.$body->phone.'",
                    "bypass":true,
                    "request_id" : "'.$body->ref.'"
                }',
              CURLOPT_HTTPHEADER => [
               "Authorization: Basic $apiKey",
                "Content-Type: application/json"
              ],
            ]);
            
            $exereq = curl_exec($curl);

            $err = curl_error($curl);
            
            file_put_contents("tt_vtpass_airtime_error_log.txt",$exereq.$host);
            
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error"; //.$err;
                file_put_contents("vtpass_airtime_error_log2.txt",json_encode($response));
                curl_close($curl);
                return $response;
            }

            $result=json_decode($exereq);
            curl_close($curl);

            //Log API Response To Database
            $response["api_response_log"]=$exereq;

            if($result->code=='000' || $result->code=='099'){
                $response["status"] = "success";
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Server/Network Error";
                file_put_contents("vtpass_airtime_error_log.txt",json_encode($result));
            }

            return $response;
		}

        //Topupbox Integration
		public function purchaseAirtimeFromTopupBox($body,$host,$apiKey,$thenetworkId,$networkname){

			
            $response = array();
            
            
            // ------------------------------------------
            //  Purchase Airtime
            // ------------------------------------------
            
           
            $curl = curl_init();
            
            curl_setopt_array($curl, [
              CURLOPT_URL => "https://api.topupbox.com/services/api/v2/w1/recharge/".strtoupper($networkname)."/AIRTIME",
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_ENCODING => "",
              CURLOPT_MAXREDIRS => 10,
              CURLOPT_FOLLOWLOCATION => true,
              CURLOPT_TIMEOUT => 30,
              CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
              CURLOPT_CUSTOMREQUEST => "POST",
              CURLOPT_POSTFIELDS => '{
                    "amount": "'.$body->amount.'",
                    "beneficiary": "'.$body->phone.'",
                    "customer_reference" : "'.$body->ref.'"
                }',
              CURLOPT_HTTPHEADER => [
               "Authorization:$apiKey",
                "Content-Type:application/json"
              ],
            ]);
            
            $exereq = curl_exec($curl);

            $err = curl_error($curl);
            
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error"; //.$err;
                file_put_contents("topupbox_airtime_conn_log.txt",json_encode($response));
                $response["api_response_log"]=json_encode($response)." : ".$err;
                curl_close($curl);
                return $response;
            }

            $result=json_decode($exereq);
            curl_close($curl);
            
            //Log API Response To Database
            $response["api_response_log"]=$exereq;

            if($result->status=='2000' || $result->response <> null){
                $response["status"] = "success";
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Server Error: ".$result->message;
            }

            return $response;
		}

    public function purchaseAirtimeWithSmeplug($body, $host, $apiKey, $thenetworkId) {
        $response = array();

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://smeplug.ng/api/v1/airtime/purchase",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode([
                "network_id" => $thenetworkId,
                "phone" => $body->phone,
                "amount" => $body->amount,
                "customer_reference" => $body->ref
            ]),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                'Accept: application/json',
                "Authorization: Bearer $apiKey"
            ),
        ));

        $exereq = curl_exec($curl);
        $err = curl_error($curl);
        
        if ($err) {
            $response["status"] = "fail";
            $response["msg"] = "Server Connection Error: " . $err;
            $response["api_response_log"] = json_encode($response) . " : " . $err;
            file_put_contents("smeplug_airtime_error_log.txt", json_encode($response));
            curl_close($curl);
            return $response;
        }

        $result = json_decode($exereq);
        curl_close($curl);

        $response["api_response_log"] = $exereq;
        file_put_contents("smeplug_airtime_response_log.txt", json_encode($result));

        if (isset($result->status) && $result->status === true) {
            $response["status"] = "success";
            $response["msg"] = "Airtime purchase successful";
            if (isset($result->data->message)) {
                $response["true_response"] = $result->data->message;
            }
            file_put_contents("smeplug_airtime_success_log.txt", json_encode($result));
        } elseif (isset($result->data->current_status) && in_array($result->data->current_status, ['pending', 'processing'])) {
            $response["status"] = "processing";
            $response["true_response"] = $result->data->current_status;
            file_put_contents("smeplug_airtime_processing_log.txt", json_encode($result));
        } else {
            $response["status"] = "fail";
            $response["msg"] = isset($result->message) ? $result->message : "Server/Network Error";
            if (isset($result->message) && (strpos($result->message, 'balance') !== false || strpos($result->message, 'insufficient') !== false)) {
                $response["msg"] = "Unable To Complete Transaction: Please Report To Admin. Error Code BB.";
            }
            file_put_contents("smeplug_airtime_error_log.txt", json_encode($result));
        }

        return $response;
    }


    }

?>