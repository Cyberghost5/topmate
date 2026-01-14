<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
    <title>Register - <?php echo $sitename; ?></title>
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
        
        /* Registration Form Styles */
        .reg-form {
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
        
        .reg-form.active {
            bottom: 0;
        }
        
        .reg-form-header {
            margin-bottom: 30px;
            position: relative;
        }
        
        .reg-form-header h2 {
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
        
        .input-style input, .input-style select {
            width: 100%;
            padding: 15px 15px 15px 45px !important;
            border: 1px solid #ddd;
            border-radius: 8px !important;
            font-size: 16px;
            background-color: #fafafa !important;
            font-weight: 500;
        }
        
        .input-style input:focus, .input-style select:focus {
            background-color: #ffffff !important;
            border-color: #008c46;
            box-shadow: 0 0 0 2px rgba(0,140,70,0.2);
        }
        
        .form-navigation {
            text-align: right;
            margin-bottom: 20px;
        }
        
        .form-navigation a {
            color: #008c46;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
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
        
        /* Custom select dropdown arrow */
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
        }
    </style>
</head>

<body class="theme-light">

    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='https://embed.tawk.to/663a28b307f59932ab3cf507/1ht9iu04u';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
    </script>
    <!--End of Tawk.to Script-->
    
    <div id="preloader"><div class="spinner-border color-highlight" role="status"></div></div>
    
    <div id="page">
        <div class="container">
            <div class="user-top text-center">
                <img src="../../assets/images/icons/user-smile.png">
            </div>
            
            <div class="logo">
                <h1><?php echo strtoupper($sitename); ?></h1>
            </div>
            
            <div class="welcome-message">
                <h1>REGISTER</h1>
                <p>Create your <?php echo $sitename; ?> account</p>
            </div>
            
            <?php 
            if($data->registrationEnable=="off"){
                ?>
                <div class="alert alert-danger" role="alert">
                    Registration is currently closed on this portal. Check back after some time!
                </div>
                <?php
            }
            ?>
            
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
            
            <button class="action-btn" id="regBtn">Register Now</button>
            
            <div class="links">
                <a href="../login/">Already have an account?</a>
            </div>
        </div>
        
        <!-- Registration Form -->
        <div class="overlay" id="overlay"></div>
        
        <div class="reg-form" id="regFormContainer">
            <div class="reg-form-header">
                <h2>Create Account</h2>
                <button class="close-btn" id="closeRegBtn">×</button>
            </div>
            
            <form id="reg-form" method="post">
                <div id="regDiv">
                    <div class="input-style">
                        <i class="fas fa-user"></i>
                        <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name" required />
                    </div>
                    
                    <div class="input-style">
                        <i class="fas fa-user"></i>
                        <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name" required />
                    </div>
                    
                    <div class="input-style">
                        <i class="fas fa-phone"></i>
                        <input type="number" class="form-control" id="phone" name="phone" placeholder="Phone Number" required readonly />
                    </div>
                    
                    <div class="input-style">
                        <i class="fas fa-at"></i>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" readonly />
                    </div>
                    
                    <input id="account" name="account" type="hidden" value="1" />
                    
                    <button type="button" id="next-btn" class="action-btn">
                        Continue
                    </button>
                </div>

                <div id="nextregDiv" style="display:none;">
                    <div class="input-style">
                        <i class="fas fa-map-marker-alt"></i>
                        <select class="form-control" id="state" name="state" required>
                            <option value="" selected disabled>Select State</option>
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
                    
                    <div class="input-style">
                        <i class="fas fa-lock"></i>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required readonly />
                    </div>
                    
                    <div class="input-style">
                        <i class="fas fa-lock"></i>
                        <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Confirm Password" required readonly />
                    </div>
                    
                    <div class="input-style">
                        <i class="fas fa-key"></i>
                        <input type="number" class="form-control" id="transpin" name="transpin" placeholder="Transaction Pin" required />
                    </div>
                    
                    <div class="input-style">
                        <i class="fas fa-user-plus"></i>
                        <input type="number" value="<?php if(isset($_GET["referral"])): echo $_GET["referral"]; endif; ?>" class="form-control" id="referal" name="referal" placeholder="Referral ID" />
                    </div>
                    
                    <button type="submit" id="submit-btn" class="submit-btn">
                        Complete Registration
                    </button>
                </div>
                
                <div class="form-navigation mt-4">
                    <a href="../login/">Already have an account? Sign in</a>
                </div>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../assets/scripts/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="../assets/scripts/custom.js"></script>

    <script type="text/javascript">
    $(document).ready(function(){
        // Initialize with registration form hidden
        $("#regFormContainer").hide();
        $("#overlay").hide();
        
        // Toggle registration form
        $("#regBtn").click(function(){
            $("#regFormContainer").addClass("active");
            $("#overlay").addClass("active");
            $("#regFormContainer").show();
        });
        
        $("#closeRegBtn, #overlay").click(function(){
            $("#regFormContainer").removeClass("active");
            $("#overlay").removeClass("active");
            setTimeout(function(){
                $("#regFormContainer").hide();
            }, 300);
        });
        
        //Enable Form Input
        $("#email").click(function(){$(this).removeAttr("readonly"); });
        $("#phone").click(function(){$(this).removeAttr("readonly"); });
        $("#password").click(function(){$(this).removeAttr("readonly"); });
        $("#cpassword").click(function(){$(this).removeAttr("readonly"); });

        //Next Btn
        $("#next-btn").click(function(){
            
            $msg="";
            
            $('#next-btn').removeClass("gradient-highlight");
            $('#next-btn').addClass("btn-secondary");
            $('#next-btn').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Processing ...');
                
            
            if($("#account").val() == "" || $("#account").val() == " "){$msg="Please Select Account Type.";}
            if($("#email").val() == "" || $("#email").val() == " "){$msg="Please Enter Email.";}
            if($("#phone").val() == "" || $("#phone").val() == " "){$msg="Please Enter Phone Number.";}
            if($("#lname").val() == "" || $("#lname").val() == " "){$msg="Please Enter Last Name.";}
            if($("#fname").val() == "" || $("#fname").val() == " "){$msg="Please Enter First Name.";}
            
            

            if($msg != ""){
                
                swal("Alert!!",$msg,"info");

                $('#next-btn').removeClass("btn-secondary");
                $('#next-btn').addClass("gradient-highlight");
                $('#next-btn').html("Continue");
                
                return;
            }

            $("#regDiv").hide();
            $("#nextregDiv").show();

        });


        //Registration Form
        $('#reg-form').submit(function(e){
                e.preventDefault();
                $msg=""; 
                if($("#password").val().length > 15){$msg="Password should not be more than 15 character.";}
                if($("#password").val().length < 8){$msg="Password should be at least 8 character.";}
               
                if($("#password").val() == $("#phone").val()){$msg="You can't use your phone number as password.";}
                if($("#password").val() == "" || $("#password").val() == " "){$msg="Please Enter Password.";}
                if($("#state").val() == "" || $("#state").val() == " "){$msg="Please Select State.";}
                if(($("#password").val()) != ($("#cpassword").val())){$msg="Password Is Different From Confirm Password.";}
                if($("#transpin").val().length != 5){$msg="Please enter a 5 digit pin";}

                if($msg != ""){swal("Alert!!",$msg,"info");  $msg=""; return; }
                
                $('#submit-btn').removeClass("gradient-highlight");
                $('#submit-btn').addClass("btn-secondary");
                $('#submit-btn').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Processing ...');
                
                $.ajax({
                    url:'../home/includes/route.php?register',
                    data: new FormData($(this)[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    method: 'POST',
                    type: 'POST',
                    success:function(resp){
                        
                        resp = JSON.parse(resp);

                        if(resp.status == "success"){
                            swal('Alert!!',"Registration Succesful","success");
                            setTimeout(function(){
                                location.replace('../home/')
                            },1000);
                        }
                        else{
                            swal('Alert!!',resp.msg,"error");
                            $("#nextregDiv").hide(); $("#regDiv").show();
                       }

                       $('#submit-btn').removeClass("btn-secondary");
                       $('#submit-btn').addClass("gradient-highlight");
                       $('#submit-btn').html("Register");

                       $('#next-btn').removeClass("btn-secondary");
                       $('#next-btn').addClass("gradient-highlight");
                       $('#next-btn').html("Register");

                    }
                })
            });
    });
    </script>
</body>
</html>