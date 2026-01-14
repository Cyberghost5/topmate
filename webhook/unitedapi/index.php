<?php
// UnitedAPI Webhook Notification

// Auto Load Classes
require_once("../autoloader.php");
require_once("../../core/helpers/vendor/autoload.php");
header('Content-Type: application/json');
date_default_timezone_set('Africa/Lagos');

// Set log file path
$logFile = '../../webhook/unitedapi/logfile.log';

// Function to log messages
function logMessage($message) {
    global $logFile;
    $timestamp = date("Y-m-d H:i:s");
    file_put_contents($logFile, "[$timestamp] $message\n", FILE_APPEND);
}

// Get raw POST body
$payload = file_get_contents("php://input");

// Get signature from header
$receivedSignature = $_SERVER['HTTP_X_API_SIGNATURE'] ?? '';

// Your API key (fetch securely from environment/config)
$apiKey = '9ABCb8Bed3C13p3FzADC7G1ohCCcnIyAqiA9r2ABBfAAm4C2xbE3tBC60C5v1741485048'; 

// Verify the signature
function verifyWebhookSignature($payload, $receivedSignature, $apiKey) {
    $computedHash = hash_hmac('sha512', $payload, $apiKey);
    return hash_equals($computedHash, $receivedSignature);
}

if (!verifyWebhookSignature($payload, $receivedSignature, $apiKey)) {
    http_response_code(403);
    logMessage("Invalid webhook signature");
    die("Invalid webhook signature");
}

// Decode payload
$res = json_decode($payload);

$event = $res->event ?? '';
$transactionData = $res ?? null;

// Log received payload
logMessage("Received Payload: " . json_encode($res));

// Validate event type and transaction data
if ($event === "collection" && $transactionData) {
    $reference = $transactionData->sessionId ?? '';
    $amount = (float)($transactionData->amountReceived ?? 0);
    $merchant_reference = $transactionData->externalReference ?? '';
    $payer_name = trim($transactionData->sourceAccountName ?? '');
    
    // Extract the virtual account number
    $account_number = $transactionData->virtualAccount ?? '';

    // Log transaction details
    logMessage("Processing Payment Notification - Reference: $reference, Amount: $amount, Payer: $payer_name, Virtual Account: $account_number");

    $controller = new ApiAccess;

    // Query for user details based on the virtual account number
    $check = $controller->verifyUnitedapiRef($account_number, '', $payload);

    // Log verification result
    logMessage("User Verification Result: " . json_encode($check));

    if ($check->status === "success") {
        $userid = $check->userid;
        $userbalance = $check->balance;
        $email = $check->useremail;
        $charges = (float)$check->charges;
        $chargestype = $check->chargestype;

        // Calculate amount to save based on charge type
        if ($chargestype === "flat") {
            $amounttosave = $amount - $charges;
            $chargesText = "N" . $charges;
        } else {
            $amounttosave = $amount - ($amount * ($charges / 100));
            $chargesText = $charges . "%";
        }

        // Log calculated amounts
        logMessage("Calculated Amount to Save: $amounttosave, Charges: $chargesText");

        $servicename = "Wallet Topup";
        $servicedesc = "Wallet funding of N{$amount} via UnitedAPI virtual account transfer with a service charge of $chargesText. Wallet credited with N{$amounttosave}";
        $transactionReference = "UNITEDAPI_{$reference}";

        // Record transaction
        $result = $controller->recordUnitedapiTransaction($userid, $servicename, $servicedesc, $amounttosave, $userbalance, $transactionReference, "0");

        // Log transaction result
        logMessage("Transaction Recorded with Reference: $transactionReference, Result: $result");

        // Send email notification
        $controller->sendEmailNotification($servicename, $servicedesc, $email);

        logMessage("Email notification sent to: $email");

        echo "Success";
        http_response_code(200);
        exit();
    } else {
        logMessage("User verification failed for virtual account: $account_number");
        echo "User not found";
        http_response_code(404);
        exit();
    }
} else {
    logMessage("Invalid Payload received: " . json_encode($res));
    echo "Invalid Payload";
    http_response_code(400);
    exit();
}
?>
