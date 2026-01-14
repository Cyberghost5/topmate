<?php if(isset($_SESSION['loginId'])){echo "<script>window.location.href='../home/';</script>"; } ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | API.databservices</title>
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
        
        .register-container {
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
        
        .input-group input, .input-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #dadce0;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
        }
        
        .input-group input:focus, .input-group select:focus {
            border-color: #0a0c80;
            box-shadow: 0 0 0 2px rgba(255,0,0,0.2);
        }
        
        .register-btn {
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
        
        .register-btn:hover {
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
    
    <div class="greeting">Create Your Account</div>
    
    <div class="register-container">
        <?php if(isset($data->registrationEnable) && $data->registrationEnable == "off"): ?>
            <div style="background-color: #fed7d7; color: #9b2c2c; padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem; font-size: 14px;">
                Registration is currently closed on this portal. Check back after some time!
            </div>
        <?php endif; ?>
        
        <form id="reg-form" method="post">
            <div id="regDiv">
                <div class="input-group">
                    <label>First Name</label>
                    <input type="text" name="fname" id="fname" placeholder="Enter your first name" required>
                </div>

                <div class="input-group">
                    <label>Last Name</label>
                    <input type="text" name="lname" id="lname" placeholder="Enter your last name" required>
                </div>

                <div class="input-group">
                    <label>Phone Number</label>
                    <input type="tel" name="phone" id="phone" placeholder="Enter your phone number" required readonly>
                </div>

                <div class="input-group">
                    <label>Email Address</label>
                    <input type="email" name="email" id="email" placeholder="Enter your email" readonly>
                </div>

                <input type="hidden" name="account" value="1">
                
                <button type="button" id="next-btn" class="register-btn">
                    Continue <i class="fas fa-arrow-right"></i>
                </button>
            </div>

            <div id="nextregDiv" style="display:none;">
                <div class="input-group">
                    <label>State</label>
                    <select name="state" id="state" required>
                        <option value="" selected disabled>Select your state</option>
                        <option value="Abuja FCT">Abuja FCT</option>
                        <option value="Abia">Abia</option>
                        <option value="Adamawa">Adamawa</option>
                        <option value="Akwa Ibom">Akwa Ibom</option>
                        <option value="Anambra">Anambra</option>
                        <option value="Bauchi">Bauchi</option>
                        <option value="Bayelsa">Bayelsa</option>
                        <option value="Benue">Benue</option>
                        <option value="Borno">Borno</option>
                        <option value="Cross River">Cross River</option>
                        <option value="Delta">Delta</option>
                        <option value="Ebonyi">Ebonyi</option>
                        <option value="Edo">Edo</option>
                        <option value="Ekiti">Ekiti</option>
                        <option value="Enugu">Enugu</option>
                        <option value="Gombe">Gombe</option>
                        <option value="Imo">Imo</option>
                        <option value="Jigawa">Jigawa</option>
                        <option value="Kaduna">Kaduna</option>
                        <option value="Kano">Kano</option>
                        <option value="Katsina">Katsina</option>
                        <option value="Kebbi">Kebbi</option>
                        <option value="Kogi">Kogi</option>
                        <option value="Kwara">Kwara</option>
                        <option value="Lagos">Lagos</option>
                        <option value="Nassarawa">Nassarawa</option>
                        <option value="Niger">Niger</option>
                        <option value="Ogun">Ogun</option>
                        <option value="Ondo">Ondo</option>
                        <option value="Osun">Osun</option>
                        <option value="Oyo">Oyo</option>
                        <option value="Plateau">Plateau</option>
                        <option value="Rivers">Rivers</option>
                        <option value="Sokoto">Sokoto</option>
                        <option value="Taraba">Taraba</option>
                        <option value="Yobe">Yobe</option>
                        <option value="Zamfara">Zamfara</option>
                    </select>
                </div>

                <div class="input-group">
                    <label>Password</label>
                    <input type="password" name="password" id="password" placeholder="Create a password" required readonly>
                    <div class="password-strength">
                        <div class="strength-meter" id="strength-meter"></div>
                    </div>
                    <div class="password-requirements">
                        <div class="requirement" id="req-length"><i class="fas fa-circle"></i> At least 8 characters</div>
                    </div>
                </div>

                <div class="input-group">
                    <label>Confirm Password</label>
                    <input type="password" name="cpassword" id="cpassword" placeholder="Confirm your password" required readonly>
                </div>

                <div class="input-group">
                    <label>Transaction Pin (5 digits)</label>
                    <input type="password" name="transpin" id="transpin" placeholder="Enter a 5-digit transaction pin" required inputmode="numeric" maxlength="5">
                    <div class="password-requirements" style="margin-top: 0.5rem;">
                        <div class="requirement" id="req-pin-length"><i class="fas fa-circle"></i> Exactly 5 digits</div>
                        <div class="requirement" id="req-pin-sequence"><i class="fas fa-circle"></i> Not a simple sequence</div>
                        <div class="requirement" id="req-pin-repeats"><i class="fas fa-circle"></i> Not all the same digit</div>
                    </div>
                </div>

                <div class="input-group">
                    <label>Referral Code (optional)</label>
                    <input type="text" name="referal" id="referal" placeholder="Enter referral code if any" value="<?php echo isset($_GET['referral']) ? htmlspecialchars($_GET['referral']) : ''; ?>">
                </div>
                
                <button type="submit" id="submit-btn" class="register-btn">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
            </div>
        </form>
    </div>
    
    <div class="footer">
        <div>
            Already have an account? <a href="../login/" style="color:white;">Sign in</a>
        </div>
        <a href="https://wa.link/bb965w" style="color:white; display:inline-block; margin-top:20px;">Find Help</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    $(document).ready(function(){
        // Enable form inputs on click
        $("#email").click(function(){ $(this).removeAttr("readonly"); });
        $("#phone").click(function(){ $(this).removeAttr("readonly"); });
        $("#password").click(function(){ $(this).removeAttr("readonly"); });
        $("#cpassword").click(function(){ $(this).removeAttr("readonly"); });

        // Password strength checker
        $("#password").on("input", function() {
            const password = $(this).val();
            let strength = 0;
            
            // Check password length
            if (password.length >= 8) {
                strength += 1;
                $("#req-length").addClass("valid");
            } else {
                $("#req-length").removeClass("valid");
            }
            
            // Update strength meter
            const meter = $("#strength-meter");
            if (strength <= 0) {
                meter.css("width", "20%").css("background", "#e53e3e");
            } else {
                meter.css("width", "100%").css("background", "#38a169");
            }
        });

        // Transaction pin validation
        $("#transpin").on("input", function() {
            const pin = $(this).val();
            
            // Check pin length
            if (pin.length === 5) {
                $("#req-pin-length").addClass("valid");
            } else {
                $("#req-pin-length").removeClass("valid");
            }
            
            // Check for simple sequences (12345, 54321, etc.)
            const isSequence = /^(?:12345|23456|34567|45678|56789|98765|87654|76543|65432|54321)$/.test(pin);
            if (!isSequence && pin.length === 5) {
                $("#req-pin-sequence").addClass("valid");
            } else {
                $("#req-pin-sequence").removeClass("valid");
            }
            
            // Check for repeated digits (11111, 22222, etc.)
            const isRepeated = /^(\d)\1{4}$/.test(pin);
            if (!isRepeated && pin.length === 5) {
                $("#req-pin-repeats").addClass("valid");
            } else {
                $("#req-pin-repeats").removeClass("valid");
            }
        });

        // Next button click handler
        $("#next-btn").click(function(){
            let msg = "";
            
            // Validate first step
            if ($("#fname").val().trim() === "") {
                msg = "Please enter your first name";
            } else if ($("#lname").val().trim() === "") {
                msg = "Please enter your last name";
            } else if ($("#phone").val().trim() === "") {
                msg = "Please enter your phone number";
            } else if (!/^\d{11}$/.test($("#phone").val().trim())) {
                msg = "Please enter a valid 11-digit phone number";
            } else if ($("#email").val().trim() === "") {
                msg = "Please enter your email address";
            } else if (!/^\S+@\S+\.\S+$/.test($("#email").val().trim())) {
                msg = "Please enter a valid email address";
            }
            
            if (msg !== "") {
                Swal.fire("Alert!", msg, "info");
                return;
            }
            
            // Show next step
            $("#regDiv").hide();
            $("#nextregDiv").show();
        });

        // Form submission handler
        $('#reg-form').submit(function(e){
            e.preventDefault();
            let msg = "";
            
            // Password validation
            const password = $("#password").val();
            if (password.length < 8) {
                msg = "Password must be at least 8 characters";
            } else if (password === $("#phone").val()) {
                msg = "Password cannot be the same as your phone number";
            } else if (password !== $("#cpassword").val()) {
                msg = "Passwords do not match";
            }
            
            // Transaction pin validation
            const transpin = $("#transpin").val();
            if (transpin.length !== 5) {
                msg = "Transaction pin must be exactly 5 digits";
            } else if (/^(?:12345|23456|34567|45678|56789|98765|87654|76543|65432|54321)$/.test(transpin)) {
                msg = "Transaction pin cannot be a simple sequence";
            } else if (/^(\d)\1{4}$/.test(transpin)) {
                msg = "Transaction pin cannot be all the same digit";
            } else if ($("#state").val() === null) {
                msg = "Please select your state";
            }
            
            if (msg !== "") {
                Swal.fire("Alert!", msg, "info");
                return;
            }
            
            // Submit form
            const $btn = $('#submit-btn');
            $btn.html('<i class="fas fa-spinner fa-spin"></i> Processing...').prop('disabled', true);
            
            $.ajax({
                url: '../home/includes/route.php?register',
                data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                success: function(resp) {
                    try {
                        resp = JSON.parse(resp);
                        if(resp.status === "success") {
                            Swal.fire("Success!", "Registration successful", "success");
                            setTimeout(() => window.location.href = '../home/', 1500);
                        } else {
                            Swal.fire("Error!", resp.msg || "Registration failed", "error");
                        }
                    } catch (e) {
                        Swal.fire("Error!", "An error occurred while processing your request", "error");
                    }
                    $btn.html('<i class="fas fa-user-plus"></i> Create Account').prop('disabled', false);
                },
                error: function() {
                    Swal.fire("Error!", "Connection failed. Please try again.", "error");
                    $btn.html('<i class="fas fa-user-plus"></i> Create Account').prop('disabled', false);
                }
            });
        });
    });
    </script>
</body>
</html>