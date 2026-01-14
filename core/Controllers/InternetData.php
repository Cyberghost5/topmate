<?php

    class InternetData extends ApiAccess{
        
         private $adminModel;

    public function __construct() {
        parent::__construct();
        require_once __DIR__ . '/../Models/AdminModel.php'; // Adjust path as needed
        $this->adminModel = new AdminModel();
    }

    public function getDataTypeMappings($returnData = false) {
        $mappings = $this->adminModel->getDataTypeMappings();
        
        if ($returnData) {
            return $mappings;
        } else {
            echo json_encode(["status" => "success", "data" => $mappings]);
            return;
        }
    }
        

         //Purchase Data
		public function purchaseData($body,$networkDetails,$datagroup,$actualPlanId){

			$response = array();
            $details=$this->model->getApiDetails();

           //Check Data Group Type
            if($datagroup == "SME"){$name="Sme"; $thenetworkId=$networkDetails["smeId"];} 
            if($datagroup == "Gifting"){$name="Gifting"; $thenetworkId=$networkDetails["giftingId"];} 
            if($datagroup == "Corporate"){$name ="Corporate"; $thenetworkId=$networkDetails["corporateId"]; }
            if($datagroup == "Sme2"){$name="Sme2"; $thenetworkId=$networkDetails["sme2Id"];}
            if($datagroup == "Coupon"){$name="Coupon"; $thenetworkId=$networkDetails["couponId"];}
            if($datagroup == "Awoof"){$name="data"; $thenetworkId=$networkDetails["dataId"];}
            
            
            //Get Api Key Details
            $networkname = strtolower($networkDetails["network"]);
            $host = self::getConfigValue($details,$networkname.$name."Provider");
            $apiKey = self::getConfigValue($details,$networkname.$name."Api");
        
            //Check If API Is Is Using N3TData Or Bilalsubs
            if(strpos($host, 'n3tdata247') !== false){
                $hostuserurl="https://n3tdata247.com/api/user/";
                return $this->purchaseDataWithBasicLegitdataway($body,$host,$hostuserurl,$apiKey,$thenetworkId,$actualPlanId);
            }
            
             // Check If API Is Using SMEPlug
        if (strpos($host, 'smeplug') !== false) {
            return $this->purchaseDataWithSmeplug($body, $host, $apiKey, $thenetworkId, $actualPlanId);
        }

            if(strpos($host, 'n3tdata') !== false){
                $hostuserurl="https://n3tdata.com/api/user/";
                return $this->purchaseDataWithBasicLegitdataway($body,$host,$hostuserurl,$apiKey,$thenetworkId,$actualPlanId);
            }
            
           if(strpos($host, 'legitdataway') !== false){
               $hostuserurl="https://legitdataway.com/api/user/";
                return $this->purchaseDataWithBasicLegitdataway($body,$host,$hostuserurl,$apiKey,$thenetworkId,$actualPlanId);
            }
            
            if(strpos($host, 'myaabaxztech') !== false){
               $hostuserurl="https://myaabaxztech.com/api/user/";
                return $this->purchaseDataWithBasicLegitdataway($body,$host,$hostuserurl,$apiKey,$thenetworkId,$actualPlanId);
            }
            
            if(strpos($host, 'autopilot') !== false) {
            return $this->purchaseDataWithAutopilot($body, $host, $apiKey, $thenetworkId, $actualPlanId, $datagroup);
        }
            
           if(strpos($host, 'azaravtu') !== false){
                return $this->purchaseDataWithAzaravtu($body,$host,$apiKey,$thenetworkId,$actualPlanId,$networkDetails["network"]);
        }
        
           if(strpos($host, 'billpluse') !== false){
     
                return $this->purchaseDataWithBillpluse($body,$host,$apiKey,$thenetworkId,$actualPlanId,$networkDetails["network"]);
        }
        
        
        
        
            
            // ------------------------------------------
            //  Purchase Data
            // ------------------------------------------
            
            if($body->ported_number == "false"){$ported_number="false";} else{$ported_number="true";}

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
                "mobile_number": "'.$body->phone.'",
                "Ported_number":"true",
                "request-id" : "'.$body->ref.'",
                "plan": "'.$actualPlanId.'"
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
                file_put_contents("data_error_log2.txt",json_encode($response)." ".$err." ".$host);
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
            
            file_put_contents("dataresponse.txt",$exereq);

            if($result->Status=='successful' || $result->Status=='success'){
                $response["status"] = "success";
                if(isset($result->api_response)){$response["true_response"] = $result->api_response; }
            }
            elseif($result->Status=='processing' || $result->Status=='process'){
                $response["status"] = "processing";
                if(isset($result->true_response)){$response["true_response"] = $result->true_response;}
                file_put_contents("data_processing_log.txt",json_encode($result));
            }
            elseif($result->Status=='failed'){
                $response["status"] = "fail";
                $response["msg"] = "Network Error, Please Try Again Later";
                if(isset($result->api_response)){$response["true_response"] = $result->api_response; }
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Server/Network Error";
                if(isset($result->api_response)){$response["true_response"] = $result->api_response; }
                file_put_contents("data_error_log.txt",json_encode($result));
            }
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


            return $response;
		}

        //Purchase Data
		public function purchaseDataWithBasicAuthentication($body,$host,$hostuserurl,$apiKey,$thenetworkId,$actualPlanId){

			$response = array();
            

            // ------------------------------------------
            //  Get User Access Token
            // ------------------------------------------
            
            if($body->ported_number == "false"){$ported_number=false;} else{$ported_number=true;}

            $curlA = curl_init();
            curl_setopt_array($curlA, array(
                CURLOPT_URL => $hostuserurl,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'GET',
                CURLOPT_HTTPHEADER => array(
                    'Content-Type: application/json',
                    "Authorization: Basic  $apiKey"
                ),
            ));
        
            $exereqA = curl_exec($curlA);
            $err = curl_error($curlA);
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error"; //.$err;
                curl_close($curlA);
                return $response;
            }
            $resultA=json_decode($exereqA);
            $apiKey=$resultA->AccessToken;
            curl_close($curlA);
            
        
            // ------------------------------------------
            //  Purchase Data
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
                "phone": "'.$body->phone.'",
                "bypass":true,
                "request-id" : "'.$body->ref.'",
                "data_plan": "'.$actualPlanId.'"
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
                file_put_contents("basic_error_log2.txt",json_encode($response));
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
            
            file_put_contents("dataresponse.txt",$exereq);

            if($result->Status=='successful' || $result->Status=='success'){
                $response["status"] = "success";
                if(isset($result->api_response)){$response["true_response"] = $result->api_response; }
            }
            elseif($result->Status=='processing' || $result->Status=='process'){
                $response["status"] = "processing";
                if(isset($result->true_response)){$response["true_response"] = $result->true_response;}
                file_put_contents("data_processing_log.txt",json_encode($result));
            }
            elseif($result->Status=='failed'){
                $response["status"] = "fail";
                $response["msg"] = "Network Error, Please Try Again Later";
                if(isset($result->api_response)){$response["true_response"] = $result->api_response; }
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Server/Network Error";
                if(isset($result->api_response)){$response["true_response"] = $result->api_response; }
                file_put_contents("data_error_log.txt",json_encode($result));
            }
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

            return $response;
		}
		
	public function purchaseDataWithBasicLegitdataway($body,$host,$hostuserurl,$apiKey,$thenetworkId,$actualPlanId){
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
                $response["msg"] = "Server Connection Error"; //.$err;
                $response["api_response_log"]=json_encode($response)." : ".$err;
                curl_close($curlA);
                return $response;
            }
            $resultA=json_decode($exereqA);
            $apiKey=$resultA->AccessToken;
            curl_close($curlA);
        
            
            // ------------------------------------------
            //  Purchase Data
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
                "phone": "'.$body->phone.'",
                "bypass":true,
                "request-id" : "'.$body->ref.'",
                "data_plan": "'.$actualPlanId.'"
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
                file_put_contents("basic_error_log2.txt",json_encode($response));
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
                if(isset($result->message)){$response["true_response"] = $result->message;}
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
                file_put_contents("basic_data_fail_log.txt",json_encode($result));
            }
            elseif($apiStatus == 'processing' || $apiStatus == 'process'){
                $response["status"] = "processing";
                file_put_contents("basic_data_processing_log.txt",json_encode($result));
            }
            elseif($apiStatus == 'pending'){
                $response["status"] = "processing";
                file_put_contents("basic_data_processing_log.txt",json_encode($result));
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Transaction Failed, Please Try Again Later";
                //Log Error On Server
                file_put_contents("basic_data_fail_log.txt",json_encode($result));
            }

            return $response;
		}
		
		public function getAutopilotDataTypes($host, $apiKey, $networkId) {
        $response = array();
        
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://autopilotng.com/api/live/v1/load/data-types",
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
            file_put_contents("autopilot_datatypes_error_log.txt", json_encode($response));
            curl_close($curl);
            return $response;
        }

        $result = json_decode($exereq);
        curl_close($curl);

        if($result->status === true && $result->code === 200) {
            $response["status"] = "success";
            $response["data_types"] = array_map(function($product) {
                return $product->name;
            }, $result->data->product);
            // Log available data types for debugging
            file_put_contents("autopilot_available_datatypes.txt", "Network ID: $networkId\n" . json_encode($response["data_types"]) . "\n", FILE_APPEND);
        } else {
            $response["status"] = "fail";
            $response["msg"] = "Failed to fetch data types";
            file_put_contents("autopilot_datatypes_error_log.txt", json_encode($result));
        }

        return $response;
    }

    // public function purchaseDataWithAutopilot($body, $host, $apiKey, $networkId, $planId, $dataType = null) {
    //     $response = array();
        
    //     // Blacklist check
    //     $blacklistedNumbers = [
    //         "08068112413","08065652000","08060606060","08060005000","08060007000",
    //         "08060009000","08060008000","08068686868","08030009000","08035900000",
    //         "09030003000","08030004000","07037739773","08035559000","07060006000",
    //         "08068111133","07035098859","08105836464","08060004000","08069690000",
    //         "09031113333","09031113222","08065659000","07035357000","08065653000",
    //         "08068100022","08038885000","08068200011","08108135250","07030007000",
    //         "07035000111","07041111963","07040401111","08030002000","07035114739",
    //         "08064160863","08069009000","08065000900","07041111966"
    //     ];

    //     if (in_array($body->phone, $blacklistedNumbers)) {
    //         $response["status"] = "fail";
    //         $response["msg"] = "Phone number is blacklisted";
    //         return $response;
    //     }

    //     // Map your datagroup to Autopilot data types
    //     $dataTypeMap = [
    //         "SME" => "AIRTEL AWOOF GIFTING",
    //         "Gifting" => "DIRECT GIFTING",  // Adjust based on actual Autopilot values
    //         "SME2" => "SME",  // Assuming SME2 is still SME
    //         "DataShare" => "SNS",  // Adjust if needed
    //         "AwoofData" => "AWUF",  // Adjust if needed
    //         "Corporate" => "CORPORATE GIFTING"
    //     ];

    //     // Use provided dataType or map it; fetch types if still null
    //     if(!$dataType || !isset($dataTypeMap[$dataType])) {
    //         $dataTypesResponse = $this->getAutopilotDataTypes($host, $apiKey, $networkId);
    //         if($dataTypesResponse["status"] === "success" && !empty($dataTypesResponse["data_types"])) {
    //             // If provided dataType exists in response, use it; otherwise use mapped or first available
    //             $availableTypes = $dataTypesResponse["data_types"];
    //             $mappedType = $dataType ? ($dataTypeMap[$dataType] ?? $dataType) : null;
    //             $dataType = in_array($mappedType, $availableTypes) ? $mappedType : $availableTypes[0];
    //         } else {
    //             $response["status"] = "fail";
    //             $response["msg"] = "Failed to determine data type";
    //             return $response;
    //         }
    //     } else {
    //         $dataType = $dataTypeMap[$dataType];
    //     }

    //     // Log the selected dataType for debugging
    //     file_put_contents("autopilot_selected_datatype.txt", "Selected dataType: $dataType for networkId: $networkId\n", FILE_APPEND);

    //     // Purchase Data
    //     $curl = curl_init();
    //     curl_setopt_array($curl, array(
    //         CURLOPT_URL => "https://autopilotng.com/api/live/v1/data",
    //         CURLOPT_RETURNTRANSFER => true,
    //         CURLOPT_ENCODING => '',
    //         CURLOPT_MAXREDIRS => 10,
    //         CURLOPT_TIMEOUT => 0,
    //         CURLOPT_FOLLOWLOCATION => true,
    //         CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    //         CURLOPT_CUSTOMREQUEST => 'POST',
    //         CURLOPT_POSTFIELDS => json_encode([
    //             "networkId" => $networkId,
    //             "dataType" => $dataType,
    //             "planId" => $planId,
    //             "phone" => $body->phone,
    //             "reference" => date('YmdHis')."D".time(),
    //         ]),
    //         CURLOPT_HTTPHEADER => array(
    //             'Content-Type: application/json',
    //             'Accept: application/json',
    //             "Authorization: Bearer $apiKey"
    //         ),
    //     ));

    //     $exereq = curl_exec($curl);
    //     $err = curl_error($curl);
        
    //     if($err){
    //         $response["status"] = "fail";
    //         $response["msg"] = "Server Connection Error: " . $err;
    //         file_put_contents("autopilot_error_log.txt", json_encode($response));
    //         curl_close($curl);
    //         return $response;
    //     }

    //     $result = json_decode($exereq);
    //     curl_close($curl);

    //     $response["api_response_log"] = $exereq;

    //     if($result->status === true && $result->code === 200) {
    //         $response["status"] = "success";
    //         $response["true_response"] = $result->data->message;
    //         file_put_contents("autopilot_success_log.txt", json_encode($result));
    //     } else {
    //         $response["status"] = "fail";
    //         $response["msg"] = $result->data->message ?? "Server/Network Error";
    //         file_put_contents("autopilot_error_log.txt", json_encode($result));
    //     }

    //     return $response;
    // }
    
    public function purchaseDataWithAutopilot($body, $host, $apiKey, $networkId, $planId, $dataType = null) {
        $response = array("msg" => ""); // Always initialize msg
        
        $blacklistedNumbers = [
            "08068112413","08065652000","08060606060","08060005000","08060007000",
            "08060009000","08060008000","08068686868","08030009000","08035900000",
            "09030003000","08030004000","07037739773","08035559000","07060006000",
            "08068111133","07035098859","08105836464","08060004000","08069690000",
            "09031113333","09031113222","08065659000","07035357000","08065653000",
            "08068100022","08038885000","08068200011","08108135250","07030007000",
            "07035000111","07041111963","07040401111","08030002000","07035114739",
            "08064160863","08069009000","08065000900","07041111966"
        ];

        if (in_array($body->phone, $blacklistedNumbers)) {
            $response["status"] = "fail";
            $response["msg"] = "Phone number is blacklisted";
            return $response;
        }

        $mappings = $this->getDataTypeMappings(true);
        $dataTypeMap = [];
        foreach ($mappings as $mapping) {
            $dataTypeMap[$mapping->data_type] = $mapping->mapped_value;
        }

        if (!$dataType || !isset($dataTypeMap[$dataType])) {
            $dataTypesResponse = $this->getAutopilotDataTypes($host, $apiKey, $networkId);
            if ($dataTypesResponse["status"] === "success" && !empty($dataTypesResponse["data_types"])) {
                $availableTypes = $dataTypesResponse["data_types"];
                $mappedType = $dataType ? ($dataTypeMap[$dataType] ?? $dataType) : null;
                $dataType = in_array($mappedType, $availableTypes) ? $mappedType : $availableTypes[0];
            } else {
                $response["status"] = "fail";
                $response["msg"] = "Failed to determine data type";
                return $response;
            }
        } else {
            $dataType = $dataTypeMap[$dataType];
        }

        file_put_contents("autopilot_selected_datatype.txt", "Selected dataType: $dataType for networkId: $networkId\n", FILE_APPEND);

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://autopilotng.com/api/live/v1/data",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode([
                "networkId" => $networkId,
                "dataType" => $dataType,
                "planId" => $planId,
                "phone" => $body->phone,
                "reference" => date('YmdHis')."D".time(),
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
            file_put_contents("autopilot_error_log.txt", json_encode($response));
            curl_close($curl);
            return $response;
        }

        $result = json_decode($exereq);
        curl_close($curl);

        $response["api_response_log"] = $exereq;

        if ($result->status === true && $result->code === 200) {
            $response["status"] = "success";
            $response["true_response"] = $result->data->message;
            $response["msg"] = "Data purchase successful";
            file_put_contents("autopilot_success_log.txt", json_encode($result));
        } else {
            $response["status"] = "fail";
            $response["msg"] = $result->data->message ?? "Server/Network Error";
            file_put_contents("autopilot_error_log.txt", json_encode($result));
        }

        return $response;
    }

       
		
			//Purchase Airtime
		public function purchaseDataSimhost($body,$network,$dataplan,$apiKey){

			$host = "https://simhostng.com/api/sms/";
            $callbackUrl ="https://motekdata.com/webhook/hostmasterresponse/";
            
            if($network == 1){
                $message="";
                if($dataplan == 1){$message ="SMEB ".$body->phone." 500 5818";}
                if($dataplan == 2){$message ="SMEC ".$body->phone." 1000 5818";}
                if($dataplan == 3){$message ="SMED ".$body->phone." 2000 5818";}
                if($dataplan == 4){$message ="SMEF ".$body->phone." 3000 5818";}
                if($dataplan == 5){$message ="SMEE ".$body->phone." 5000 5818";}
                if($dataplan == 6){$message ="SMEG ".$body->phone." 10000 5818";}
                $message=urlencode($message);
                $network = "MOMTNBPVR"; $sim=1; $number="131"; 
            }
            
            $postfields="?apikey=$apiKey&server=$network&sim=$sim&ref=$body->ref&number=$number&message=$message";
            $host.=$postfields;
            
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
            CURLOPT_POSTFIELDS => array(
                "apikey" => $apiKey,
                "server" => $network,
                "sim" => $sim,
                "number" => $number,
                "message" => $message,
                "ref" => $body->ref
            ),
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
            ),
            ));

            $exereq = curl_exec($curl);

            $err = curl_error($curl);
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error: ".$err;
                file_put_contents("data_simhost_error_logo2.txt",json_encode($response));
                curl_close($curl);
                return $response;
            }

            $result=json_decode($exereq);
            curl_close($curl);

            if($result->data[0]->response == "Ok"){
                $response["status"] = "processing";
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Server/Network Error";
                file_put_contents("data_simhost_error_logo.txt",json_encode($result).":".$host.":".$exereq);
            }

            return $response;
		}
		
		
		//Purchase Data From Azaravtu
		public function purchaseDataWithAzaravtu($body,$host,$apiKey,$thenetworkId,$actualPlanId,$networkname){

			$response = array();
            

            // ------------------------------------------
            //  Purchase Data
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
                "network_id": "'.$thenetworkId.'",
                "number": "'.$body->phone.'",
                "pin":"5027",
                "id": "'.$actualPlanId.'"
            }',
            
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json',
                "Authorization: Bearer $apiKey"
            ),
            ));

            $exereq = curl_exec($curl);
            $err = curl_error($curl);
            
            if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error"; //.$err;
                file_put_contents("basic_error_log2.txt",json_encode($response));
                curl_close($curl);
                return $response;
            }

            $result=json_decode($exereq);
            curl_close($curl);
            

            if($result->status=='success'){
                $response["status"] = "success";
                if(isset($result->remark)){$response["true_response"] = $networkname." ".$body->phone.": ".$result->remark;}
            }
            elseif($result->status=='pending'){
                $response["status"] = "processing";
                if(isset($result->remark)){$response["true_response"] = $networkname." ".$body->phone.": ".$result->remark;}
                file_put_contents("data_processing_log.txt",json_encode($result));
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Server/Network Error";
                if(isset($result->remark)){$response["true_response"] = $networkname." ".$body->phone.": ".$result->remark;}
                file_put_contents("basic_data_error_log.txt",json_encode($result));
            }

            return $response;
		}

        	//Purchase Data From Billpluse
		public function purchaseDataWithBillpluse($body,$host,$apiKey,$thenetworkId,$actualPlanId,$networkname){

			$response = array();
            

            // ------------------------------------------
            //  Purchase Data
            // ------------------------------------------
             $curl = curl_init();

             curl_setopt_array($curl, [
             CURLOPT_URL => $host,
             CURLOPT_RETURNTRANSFER => true,
             CURLOPT_ENCODING => "",
             CURLOPT_MAXREDIRS => 10,
             CURLOPT_TIMEOUT => 30,
             CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
             CURLOPT_CUSTOMREQUEST => "POST",
             CURLOPT_POSTFIELDS => json_encode([
                'mobile' => $body->phone,
                'plan' => $actualPlanId,
                'network' => $thenetworkId,
                'bypass' =>  'true'
                ]),
             CURLOPT_HTTPHEADER => [
                 "accept: application/json",
                 "authorization: Bearer $apiKey",
                 "content-type: application/json"
                 ],
             ]);

           $res = curl_exec($curl);
           $err = curl_error($curl);
           curl_close($curl);
          if($err){
                $response["status"] = "fail";
                $response["msg"] = "Server Connection Error"; //.$err;
                file_put_contents("bp_error_log2.txt",json_encode($err));
                curl_close($curl);
                return $response;
            }

$result=json_decode($res);

             file_put_contents("bpslog.txt",json_encode($result));

            if($result->status=='success'){
                $response["status"] = "success";
                if(isset($result->remark)){$response["true_response"] = $networkname." ".$body->phone.": ".$result->remark;}
            }
            elseif($result->status=='pending'){
                $response["status"] = "processing";
                if(isset($result->remark)){$response["true_response"] = $networkname." ".$body->phone.": ".$result->remark;}
                file_put_contents("data_processing_log.txt",json_encode($result));
            }
            else{
                $response["status"] = "fail";
                $response["msg"] = "Server/Network Error: $result->message";
                if(isset($result->message)){$response["true_response"] = $networkname." ".$body->phone.": ".$result->message;}
                file_put_contents("basic_data_error_log.txt",json_encode($result));
            }

            return $response;
		}

        
         public function purchaseDataWithSmeplug($body, $host, $apiKey, $thenetworkId, $actualPlanId) {
        $response = array();

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://smeplug.ng/api/v1/data/purchase",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode([
                "network_id" => $thenetworkId,
                "plan_id" => $actualPlanId,
                "phone" => $body->phone,
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
            file_put_contents("smeplug_error_log.txt", json_encode($response));
            curl_close($curl);
            return $response;
        }

        $result = json_decode($exereq);
        curl_close($curl);

        $response["api_response_log"] = $exereq;
        file_put_contents("smeplug_response_log.txt", json_encode($result));

        if (isset($result->status) && $result->status === true) {
            $response["status"] = "success";
            if (isset($result->data->msg)) {
                $response["true_response"] = $result->data->msg;
            }
            $response["msg"] = "Data purchase successful";
            file_put_contents("smeplug_success_log.txt", json_encode($result));
        } elseif (isset($result->data->current_status) && in_array($result->data->current_status, ['pending', 'processing'])) {
            $response["status"] = "processing";
            $response["true_response"] = $result->data->current_status;
            file_put_contents("smeplug_processing_log.txt", json_encode($result));
        } else {
            $response["status"] = "fail";
            $response["msg"] = isset($result->message) ? $result->message : "Server/Network Error";
            if (isset($result->message) && (strpos($result->message, 'balance') !== false || strpos($result->message, 'insufficient') !== false)) {
                $response["msg"] = "Unable To Complete Transaction: Please Report To Admin. Error Code BB.";
            }
            file_put_contents("smeplug_error_log.txt", json_encode($result));
        }

        return $response;
    }

    }

?>
        
        

