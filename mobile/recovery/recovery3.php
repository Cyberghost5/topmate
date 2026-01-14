<?php if(isset($_SESSION['loginId'])){echo "<script>window.location.href='../home/';</script>"; } ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | API.databservices</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        
        body {
            background-color: #0a0c80;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 10px;
        }
        
        .logo-img {
        max-width: 150px; /* Default logo width */
        height: auto; /* Maintain aspect ratio */
        vertical-align: middle; /* Align properly with text */
        margin-right: 10px; /* Space between logo and text */
    }
    
    /* Optional size variations */
    .logo-img.small {
        max-width: 100px;
    }
    
    .logo-img.medium {
        max-width: 150px;
    }
    
    .logo-img.large {
        max-width: 200px;
    }
    
    /* For responsive control */
    @media (max-width: 768px) {
        .logo-img {
            max-width: 120px;
        }
    }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: white;
            letter-spacing: 1px;
            margin-bottom: 5px;
        }
        
        .subtitle {
            font-size: 14px;
            color: rgba(255,255,255,0.8);
            margin-bottom: 3px;
        }
        
        .powered-by {
            font-size: 12px;
            color: rgba(255,255,255,0.6);
            margin-bottom: 30px;
        }
        
        .greeting {
            font-size: 18px;
            font-weight: bold;
            color: white;
            margin-bottom: 30px;
            text-align: center;
        }
        
        .recovery-container {
            background-color: white;
            width: 100%;
            max-width: 350px;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .input-group {
            margin-bottom: 20px;
        }
        
        .input-group label {
            display: block;
            font-size: 14px;
            color: #5f6368;
            margin-bottom: 8px;
        }
        
        .input-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #dadce0;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
        }
        
        .input-group input:focus {
            border-color: #0a0c80;
            box-shadow: 0 0 0 2px rgba(255,0,0,0.2);
        }
        
        .recovery-btn {
            width: 100%;
            padding: 12px;
            background-color: #0a0c80;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .recovery-btn:hover {
            background-color: #cc0000;
        }
        
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 12px;
            color: rgba(255,255,255,0.7);
            width: 100%;
            max-width: 350px;
        }
        
        /* Password strength indicator */
        .password-strength {
            height: 4px;
            background: #e2e8f0;
            margin-top: 0.5rem;
            border-radius: 2px;
            overflow: hidden;
        }

        .strength-meter {
            height: 100%;
            width: 0;
            background: #e53e3e;
            transition: width 0.3s ease;
        }

        .password-requirements {
            margin-top: 0.5rem;
            font-size: 12px;
            color: #5f6368;
        }

        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 0.25rem;
        }

        .requirement i {
            margin-right: 0.5rem;
            font-size: 0.6rem;
        }

        .requirement.valid {
            color: #0a0c80;
        }

        .requirement.valid i {
            color: #0a0c80;
        }
        
        .or-divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
            color: #9aa0a6;
            font-size: 14px;
        }
        
        .or-divider::before,
        .or-divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #dadce0;
            margin: 0 10px;
        }
    </style>
</head>
<body>
     <div class="header">
    <div class="logo-container">
        <!-- Logo with image path added -->
        <div class="logo">
            <img src="https://api.databservices.com.ng/assets/img/databs.jpg" alt="API.databservices Logo" class="logo-img">
            
        </div>
        <div class="subtitle"><h4>Your Unique Online Store For Digital Needs App</h4></div>
        <div class="powered-by"><b>Powered by API.databservices</b></div>
    </div>
</div>
    
    <div class="greeting">Reset Your Password</div>
    
    <div class="recovery-container">
        <form id="emailCon" method="post" style="display:block;">
            <div class="input-group">
                <label>Email Address</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required readonly>
            </div>
            
            <button type="submit" id="submit-btn" class="recovery-btn">
                <i class="fas fa-paper-plane"></i> Send Reset Code
            </button>
        </form>

        <form id="verCon" method="post" style="display:none;">
            <div class="input-group">
                <label>Verification Code</label>
                <input type="number" name="code" id="vercode" placeholder="Enter verification code" required>
            </div>
            <input type="hidden" name="email" id="veremail">
            
            <button type="submit" id="submit-btn2" class="recovery-btn">
                <i class="fas fa-check-circle"></i> Verify Code
            </button>
        </form>

        <form id="keyCon" style="display:none;">
            <div class="input-group">
                <label>New Password</label>
                <input type="password" name="password" id="password" placeholder="Create a new password" required readonly>
                <div class="password-strength">
                    <div class="strength-meter" id="strength-meter"></div>
                </div>
                <div class="password-requirements">
                    <div class="requirement" id="req-length"><i class="fas fa-circle"></i> At least 8 characters</div>
                    <div class="requirement" id="req-upper"><i class="fas fa-circle"></i> At least 1 uppercase letter</div>
                    <div class="requirement" id="req-lower"><i class="fas fa-circle"></i> At least 1 lowercase letter</div>
                    <div class="requirement" id="req-number"><i class="fas fa-circle"></i> At least 1 number</div>
                </div>
            </div>

            <div class="input-group">
                <label>Confirm Password</label>
                <input type="password" name="password2" id="password2" placeholder="Confirm your password" required readonly>
            </div>

            <input type="hidden" id="keyemail" name="email">
            <input type="hidden" id="keycode" name="code">
            
            <button type="submit" id="submit-btn3" class="recovery-btn">
                <i class="fas fa-sync-alt"></i> Update Password
            </button>
        </form>
    </div>
    
    <div class="footer">
        <div>
            Remember your password? <a href="../login/" style="color:white;">Sign in</a>
        </div>
        <a href="https://wa.link/bb965w" style="color:white; display:inline-block; margin-top:20px;">Find Help</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    $(document).ready(function(){
        // Enable form inputs on click
        $("#email").click(function(){ $(this).removeAttr("readonly"); });
        $("#password").click(function(){ $(this).removeAttr("readonly"); });
        $("#password2").click(function(){ $(this).removeAttr("readonly"); });

        // Password strength checker
        $("#password").on("input", function() {
            const password = $(this).val();
            let strength = 0;
            
            if (password.length >= 8) {
                strength += 1;
                $("#req-length").addClass("valid");
            } else {
                $("#req-length").removeClass("valid");
            }
            
            if (/[A-Z]/.test(password)) {
                strength += 1;
                $("#req-upper").addClass("valid");
            } else {
                $("#req-upper").removeClass("valid");
            }
            
            if (/[a-z]/.test(password)) {
                strength += 1;
                $("#req-lower").addClass("valid");
            } else {
                $("#req-lower").removeClass("valid");
            }
            
            if (/\d/.test(password)) {
                strength += 1;
                $("#req-number").addClass("valid");
            } else {
                $("#req-number").removeClass("valid");
            }
            
            const meter = $("#strength-meter");
            if (strength <= 1) {
                meter.css("width", "25%").css("background", "#e53e3e");
            } else if (strength <= 2) {
                meter.css("width", "50%").css("background", "#dd6b20");
            } else if (strength <= 3) {
                meter.css("width", "75%").css("background", "#d69e2e");
            } else {
                meter.css("width", "100%").css("background", "#38a169");
            }
        });

        // Check If Email Exists And Send Verification Code
        $('#emailCon').submit(function(e){
            e.preventDefault();
            const $btn = $('#submit-btn');
            $btn.html('<i class="fas fa-spinner fa-spin"></i> Sending...').prop('disabled', true);
            
            $.ajax({
                url: '../home/includes/route.php?get-user-code',
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                success: function(resp) {
                    if(resp == 0) {
                        Swal.fire('Success!', 'A verification code has been sent to your email. Please check your inbox.', 'success');
                        $("#emailCon").hide();
                        $("#verCon").show();
                        $("#veremail").val($("#email").val());
                    } else if(resp == 1) {
                        Swal.fire('Error!', 'Email not found. Please verify your email and try again.', 'error');
                    } else {
                        Swal.fire('Error!', 'Unknown error. Please contact support.', 'error');
                    }
                    $btn.html('<i class="fas fa-paper-plane"></i> Send Reset Code').prop('disabled', false);
                },
                error: function() {
                    Swal.fire('Error!', 'Connection failed. Please try again.', 'error');
                    $btn.html('<i class="fas fa-paper-plane"></i> Send Reset Code').prop('disabled', false);
                }
            });
        });

        // Verify Email Code
        $('#verCon').submit(function(e){
            e.preventDefault();
            const $btn = $('#submit-btn2');
            $btn.html('<i class="fas fa-spinner fa-spin"></i> Verifying...').prop('disabled', true);
            
            $.ajax({
                url: '../home/includes/route.php?verify-user-code',
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                success: function(resp) {
                    if(resp == 0) {
                        Swal.fire('Success!', 'Code verified. Please set your new password.', 'success');
                        $("#verCon").hide();
                        $("#keyCon").show();
                        $("#keyemail").val($("#email").val());
                        $("#keycode").val($("#vercode").val());
                    } else if(resp == 1) {
                        Swal.fire('Error!', 'Incorrect code. Please try again.', 'error');
                    } else {
                        Swal.fire('Error!', 'Unknown error. Please contact support.', 'error');
                    }
                    $btn.html('<i class="fas fa-check-circle"></i> Verify Code').prop('disabled', false);
                },
                error: function() {
                    Swal.fire('Error!', 'Connection failed. Please try again.', 'error');
                    $btn.html('<i class="fas fa-check-circle"></i> Verify Code').prop('disabled', false);
                }
            });
        });

        // Update User Password
        $('#keyCon').submit(function(e){
            e.preventDefault();
            const $btn = $('#submit-btn3');
            
            // Validate password
            let msg = "";
            if($("#password").val() !== $("#password2").val()) {
                msg = "Passwords don't match";
            } else if($("#password").val().length < 8) {
                msg = "Password must be at least 8 characters";
            } else if($("#password").val().length > 15) {
                msg = "Password should not exceed 15 characters";
            }
            
            if(msg) {
                Swal.fire('Alert!', msg, 'info');
                return;
            }
            
            $btn.html('<i class="fas fa-spinner fa-spin"></i> Updating...').prop('disabled', true);
            
            $.ajax({
                url: '../home/includes/route.php?update-user-pass',
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                success: function(resp) {
                    if(resp == 0) {
                        Swal.fire('Success!', 'Password updated successfully. You can now login with your new password.', 'success');
                        setTimeout(() => window.location.href = '../login/', 2000);
                    } else if(resp == 1) {
                        Swal.fire('Error!', 'Failed to update password. Please try again.', 'error');
                    } else {
                        Swal.fire('Error!', 'Unknown error. Please contact support.', 'error');
                    }
                    $btn.html('<i class="fas fa-sync-alt"></i> Update Password').prop('disabled', false);
                },
                error: function() {
                    Swal.fire('Error!', 'Connection failed. Please try again.', 'error');
                    $btn.html('<i class="fas fa-sync-alt"></i> Update Password').prop('disabled', false);
                }
            });
        });
    });
    </script>
</body>
</html>