<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
    <title>Forgot Password - <?php echo $sitename; ?></title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/fonts/css/fontawesome-all.min.css">
    <link rel="manifest" href="../assets/scripts/_manifest.json?v=2.0" data-pwa-version="set_in_manifest_and_pwa_js">
    <link rel="apple-touch-icon" sizes="180x180" href="../../assets/img/favicon.png">
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }
        
        body {
            background-color: #008c46;
            color: #fff;
            height: 100vh;
        }
        
        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        
        .logo {
            margin-bottom: 30px;
            padding-top: 20px;
        }
        
        .logo h1 {
            font-size: 28px;
            font-weight: 800;
            color: #fff;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        }
        
        .logo p {
            font-size: 14px;
            color: rgba(255,255,255,0.8);
            margin-top: 5px;
        }
        
        .welcome-message {
            margin-bottom: 30px;
        }
        
        .welcome-message h1 {
            font-size: 24px;
            color: #fff;
            margin-bottom: 10px;
            font-weight: 700;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
        }
        
        .welcome-message p {
            font-size: 14px;
            color: rgba(255,255,255,0.9);
        }
        
        .options {
            margin-bottom: 40px;
        }
        
        .option {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
            padding: 15px;
            background-color: rgba(255,255,255,0.9);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            cursor: pointer;
            transition: transform 0.2s;
        }
        
        .option:hover {
            transform: translateY(-2px);
        }
        
        .option.whatsapp {
            border-left: 5px solid #25D366;
        }
        
        .option-text {
            flex-grow: 1;
            text-align: left;
            padding-left: 15px;
        }
        
        .option-text h3 {
            font-size: 16px;
            color: #333;
            font-weight: 600;
        }
        
        .option-text p {
            font-size: 12px;
            color: #666;
        }
        
        .action-btn {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #ff6b00;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: all 0.3s;
        }
        
        .action-btn:hover {
            background-color: #e05d00;
            transform: translateY(-1px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.25);
        }
        
        .links {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        
        .links a {
            color: #ffcc00;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.2s;
        }
        
        .links a:hover {
            color: #fff;
            text-decoration: underline;
        }
        
        /* Password Recovery Form Styles */
        .recovery-form {
            position: fixed;
            bottom: -100%;
            left: 0;
            width: 100%;
            background-color: white;
            border-radius: 20px 20px 0 0;
            padding: 30px 20px;
            box-shadow: 0 -5px 15px rgba(0,0,0,0.2);
            transition: bottom 0.3s ease-out;
            z-index: 100;
        }
        
        .recovery-form.active {
            bottom: 0;
        }
        
        .recovery-form-header {
            margin-bottom: 30px;
            position: relative;
        }
        
        .recovery-form-header h2 {
            font-size: 18px;
            color: #008c46;
            margin-bottom: 5px;
            font-weight: 700;
        }
        
        .close-btn {
            position: absolute;
            right: 0;
            top: 0;
            background: none;
            border: none;
            font-size: 24px;
            color: #666;
            cursor: pointer;
            font-weight: bold;
        }
        
        .input-style {
            position: relative;
            margin-bottom: 20px;
        }
        
        .input-style i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            z-index: 2;
        }
        
        .input-style input {
            width: 100%;
            padding: 15px 15px 15px 45px !important;
            border: 1px solid #ddd;
            border-radius: 8px !important;
            font-size: 16px;
            background-color: #fafafa !important;
            font-weight: 500;
        }
        
        .input-style input:focus {
            background-color: #ffffff !important;
            border-color: #008c46;
            box-shadow: 0 0 0 2px rgba(0,140,70,0.2);
        }
        
        .input-hint {
            font-size: 12px;
            color: #666;
            text-align: left;
            margin-top: -10px;
            margin-bottom: 15px;
            padding-left: 15px;
        }
        
        .form-navigation {
            text-align: center;
            margin-top: 20px;
        }
        
        .form-navigation a {
            color: #008c46;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            display: block;
            margin-bottom: 10px;
        }
        
        .submit-btn {
            width: 100%;
            padding: 15px;
            background-color: #ff6b00;
            color: white;
            border: none;
            border-radius: 8px !important;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: all 0.3s;
        }
        
        .submit-btn:hover {
            background-color: #e05d00;
            transform: translateY(-1px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.25);
        }
        
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 99;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s ease-out;
        }
        
        .overlay.active {
            opacity: 1;
            pointer-events: all;
        }
        
        .user-top img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            margin-bottom: 15px;
            border: 3px solid rgba(255,255,255,0.8);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        /* Status message at bottom */
        .status-message {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #333;
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.3s ease;
            max-width: 90%;
            text-align: center;
        }
        
        .status-message.show {
            opacity: 1;
        }
        
        .status-message.success {
            background-color: #4CAF50;
        }
        
        .status-message.error {
            background-color: #f44336;
        }
        
        /* Hidden forms */
        .form-section {
            display: none;
        }
        
        .form-section.active {
            display: block;
        }
    </style>
</head>

<body class="theme-light">

    <!-- Status message container -->
    <div class="status-message" id="statusMessage"></div>

    <div id="page">
        <div class="container">
            <div class="user-top text-center">
                <img src="../../assets/images/icons/user-smile.png">
            </div>
            
            <div class="logo">
                <h1><?php echo strtoupper($sitename); ?></h1>
            </div>
            
            <div class="welcome-message">
                <h1>FORGOT PASSWORD</h1>
                <p id="msgcon">Recover your <?php echo $sitename; ?> account</p>
            </div>
            
            <div class="options">
                <div class="option whatsapp" onclick="window.location.href='https://wa.me/2348026970599'">
                    <div class="option-icon">
                        <i class="fab fa-whatsapp" style="color: #25D366; font-size: 24px;"></i>
                    </div>
                    <div class="option-text">
                        <h3>WhatsApp Support</h3>
                        <p>Chat with us on WhatsApp</p>
                    </div>
                </div>
            </div>
            
            <button class="action-btn" id="recoveryBtn">Recover Password</button>
            
            <div class="links">
                <a href="../login/">Remember your password? Sign in</a>
                <a href="../register/">Don't have an account? Sign up</a>
            </div>
        </div>
        
        <!-- Password Recovery Form -->
        <div class="overlay" id="overlay"></div>
        
        <div class="recovery-form" id="recoveryFormContainer">
            <div class="recovery-form-header">
                <h2>Password Recovery</h2>
                <button class="close-btn" id="closeRecoveryBtn">×</button>
            </div>
            
            <!-- Email Form -->
            <form id="emailCon" class="form-section active" method="post">
                <div class="input-style">
                    <i class="fas fa-at"></i>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required readonly />
                </div>
                
                <button type="submit" id="submit-btn" class="submit-btn">
                    Recover Password
                </button>
                
                <div class="form-navigation">
                    <a href="../login/">Remember your password? Sign in</a>
                    <a href="../register/">Don't have an account? Sign up</a>
                </div>
            </form>
            
            <!-- Verification Code Form -->
            <form id="verCon" class="form-section" method="post">
                <div class="input-style">
                    <i class="fas fa-barcode"></i>
                    <input type="number" class="form-control" id="vercode" name="code" placeholder="Verification Code" required />
                </div>
                <input type="hidden" name="email" id="veremail" />
                
                <button type="submit" id="submit-btn2" class="submit-btn">
                    Verify Code
                </button>
                
                <div class="form-navigation">
                    <a href="../login/">Remember your password? Sign in</a>
                    <a href="../register/">Don't have an account? Sign up</a>
                </div>
            </form>
            
            <!-- New Password Form -->
            <form id="keyCon" class="form-section" method="post">
                <div class="input-style">
                    <i class="fas fa-lock"></i>
                    <input type="password" class="form-control" id="password" name="password" placeholder="New Password" required readonly />
                </div>
                <div class="input-hint">
                    Password must contain: uppercase, lowercase, number, and special character
                </div>
                
                <div class="input-style">
                    <i class="fas fa-lock"></i>
                    <input type="password" class="form-control" id="password2" name="password2" placeholder="Confirm Password" required readonly />
                </div>
                
                <input type="hidden" id="keyemail" name="email" />
                <input type="hidden" id="keycode" name="code" />
                
                <button type="submit" id="submit-btn3" class="submit-btn">
                    Update Password
                </button>
                
                <div class="form-navigation">
                    <a href="../login/">Remember your password? Sign in</a>
                    <a href="../register/">Don't have an account? Sign up</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script type="text/javascript">
    $(document).ready(function(){
        // Show status message at bottom
        function showStatusMessage(message, isSuccess) {
            const statusMessage = $('#statusMessage');
            statusMessage.text(message);
            statusMessage.removeClass('success error');
            statusMessage.addClass(isSuccess ? 'success' : 'error');
            statusMessage.addClass('show');
            
            setTimeout(function() {
                statusMessage.removeClass('show');
            }, 3000);
        }
        
        // Initialize with recovery form hidden
        $("#recoveryFormContainer").hide();
        $("#overlay").hide();
        
        // Toggle recovery form
        $("#recoveryBtn").click(function(){
            $("#recoveryFormContainer").addClass("active");
            $("#overlay").addClass("active");
            $("#recoveryFormContainer").show();
            // Reset to email form when opened
            $(".form-section").removeClass("active");
            $("#emailCon").addClass("active");
            $("#msgcon").text("Enter the email associated with your account");
        });
        
        $("#closeRecoveryBtn, #overlay").click(function(){
            $("#recoveryFormContainer").removeClass("active");
            $("#overlay").removeClass("active");
            setTimeout(function(){
                $("#recoveryFormContainer").hide();
            }, 300);
        });
        
        //Enable Form Input
        $("#email").click(function(){$(this).removeAttr("readonly"); });
        $("#password").click(function(){$(this).removeAttr("readonly"); });
        $("#password2").click(function(){$(this).removeAttr("readonly"); });

        // Validate password strength
        function validatePassword(password) {
            const hasUpperCase = /[A-Z]/.test(password);
            const hasLowerCase = /[a-z]/.test(password);
            const hasNumbers = /\d/.test(password);
            const hasSpecialChars = /[!@#$%^&*(),.?":{}|<>]/.test(password);
            return hasUpperCase && hasLowerCase && hasNumbers && hasSpecialChars;
        }

        //Check If Email Exist And Send Verification Code
        $('#emailCon').submit(function(e){
            e.preventDefault();
            $('#submit-btn').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Processing...');
            $('#submit-btn').prop('disabled', true);
            
            $.ajax({
                url:'../home/includes/route.php?get-user-code',
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                success:function(resp){
                    if(resp == 0){
                        showStatusMessage("Verification code sent to your email", true);
                        $("#emailCon").removeClass("active");
                        $("#verCon").addClass("active");
                        $("#veremail").val($("#email").val());
                        $("#msgcon").text("Enter the verification code sent to your email");
                    } else if(resp == 1){
                        showStatusMessage("Email not found - please verify and try again", false);
                    } else {
                        showStatusMessage("Error - please contact customer support", false);
                    }

                    $('#submit-btn').html("Recover Password");
                    $('#submit-btn').prop('disabled', false);
                }
            });
        });

        //Verify Email Code And Allow Password Update
        $('#verCon').submit(function(e){
            e.preventDefault();
            $('#submit-btn2').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Processing...');
            $('#submit-btn2').prop('disabled', true);
            
            $.ajax({
                url:'../home/includes/route.php?verify-user-code',
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                success:function(resp){
                    if(resp == 0){
                        showStatusMessage("Code verified - set your new password", true);
                        $("#verCon").removeClass("active");
                        $("#keyCon").addClass("active");
                        $("#keyemail").val($("#email").val());
                        $("#keycode").val($("#vercode").val());
                        $("#msgcon").text("Create a new password for your account");
                    } else if(resp == 1){
                        showStatusMessage("Incorrect code - please try again", false);
                    } else {
                        showStatusMessage("Error - please contact customer support", false);
                    }

                    $('#submit-btn2').html("Verify Code");
                    $('#submit-btn2').prop('disabled', false);
                }
            });
        });

        //Update User Password
        $('#keyCon').submit(function(e){
            e.preventDefault();
            
            //Validate Password
            const password = $("#password").val();
            $msg = "";
            
            if (!validatePassword(password)) {
                $msg = "Password must include uppercase, lowercase, number, and special character";
            }
            else if(password != $("#password2").val()) {
                $msg = "Passwords don't match";
            }
            else if(password.length > 15) {
                $msg = "Password should be 15 characters or less";
            }
            else if(password.length < 8) {
                $msg = "Password should be at least 8 characters";
            }

            if($msg != ""){
                showStatusMessage($msg, false);
                return;
            }

            $('#submit-btn3').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Processing...');
            $('#submit-btn3').prop('disabled', true);
            
            $.ajax({
                url:'../home/includes/route.php?update-user-pass',
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                success:function(resp){
                    if(resp == 0){
                        showStatusMessage("Password updated successfully!", true);
                        $('#submit-btn3').css('background-color', '#4CAF50');
                        $('#submit-btn3').html('<i class="fa fa-check"></i> Success');
                        setTimeout(function(){
                            location.href = '../login/';
                        }, 1500);
                    } else if(resp == 1){
                        showStatusMessage("Failed to update password - please try again", false);
                    } else {
                        showStatusMessage("Error - please contact customer support", false);
                    }

                    $('#submit-btn3').prop('disabled', false);
                }
            });
        });
    });
    </script>
</body>
</html>