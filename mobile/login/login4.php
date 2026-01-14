<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
    <title>Login - <?php echo $sitename; ?></title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/fonts/css/fontawesome-all.min.css">
    <link rel="manifest" href="../assets/scripts/_manifest.json?v=2.0" data-pwa-version="set_in_manifest_and_pwa_js">
    <link rel="apple-touch-icon" sizes="180x180" href="../../assets/img/favicon.png">
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png" />
    <?php if(isset($_SESSION['loginId'])){echo "<script>window.location.href='../home/';</script>"; } ?>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }
        
        body {
            background-color: #008c46; /* New green background */
            color: #fff; /* Default text color changed to white */
            height: 100vh;
            /* Background image section - replace with your image path */
            /* background-image: url("../../assets/img/bg/your-background-image.jpg"); */
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
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
            font-weight: 800; /* Bolder font */
            color: #fff; /* White text */
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
        
        /* Button Styles */
        .login-btn {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #ff6b00; /* Vibrant orange */
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
        
        .login-btn:hover {
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
            color: #ffcc00; /* Bright yellow */
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.2s;
        }
        
        .links a:hover {
            color: #fff;
            text-decoration: underline;
        }
        
        /* Login Form Styles */
        .login-form {
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
        
        .login-form.active {
            bottom: 0;
        }
        
        .login-form-header {
            margin-bottom: 30px;
            position: relative;
        }
        
        .login-form-header h2 {
            font-size: 18px;
            color: #008c46; /* Matching green */
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
        
        .forgot-password {
            text-align: right;
            margin-bottom: 20px;
        }
        
        .forgot-password a {
            color: #008c46;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }
        
        .submit-btn {
            width: 100%;
            padding: 15px;
            background-color: #ff6b00; /* Vibrant orange */
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
    </style>
</head>

<body class="theme-light">

    <div id="page">
        <div class="container">
            <div class="user-top text-center">
                <img src="../../assets/images/icons/user-smile.png">
            </div>
            
            <div class="logo">
                <h1><?php echo strtoupper($sitename); ?></h1>
            </div>
            
            <div class="welcome-message">
                <h1>LOGIN</h1>
                <p id="accountname">Welcome To <?php echo $sitename; ?></p>
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
            
            <button class="login-btn" id="loginBtn">Login</button>
            
            <div class="links">
                <a href="../recovery/">Forget Password?</a>
                <a href="../register/">Create Account</a>
            </div>
        </div>
        
        <!-- Login Form -->
        <div class="overlay" id="overlay"></div>
        
        <div class="login-form" id="loginFormContainer">
            <div class="login-form-header">
                <h2>Sign in</h2>
                <button class="close-btn" id="closeLoginBtn">×</button>
            </div>
            
            <form id="login-form" method="post">
                <div class="input-style" id="phonediv">
                    <i class="fa fa-phone"></i>
                    <input type="number" class="form-control" id="phonelogin" name="phone" placeholder="Phone Number" required />
                    <label for="phone" style="color: #008c46;">Phone</label>
                    <em>(required)</em>
                </div>
                
                <div class="input-style">
                    <i class="fa fa-lock"></i>
                    <input type="password" class="form-control" id="passwordlogin" name="password" placeholder="Password" required />
                    <label for="password" style="color: #008c46;">Password</label>
                    <em>(required)</em>
                </div>
                
                <div class="forgot-password">
                    <a href="../recovery/">Forgot password?</a>
                </div>
                
                <button type="submit" id="submit-btn" class="submit-btn">
                    Login
                </button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript">
    $("document").ready(function(){
        // Initialize with login form hidden
        $("#loginFormContainer").hide();
        $("#overlay").hide();
        
        // Toggle login form
        $("#loginBtn").click(function(){
            $("#loginFormContainer").addClass("active");
            $("#overlay").addClass("active");
            $("#loginFormContainer").show();
        });
        
        $("#closeLoginBtn, #overlay").click(function(){
            $("#loginFormContainer").removeClass("active");
            $("#overlay").removeClass("active");
            setTimeout(function(){
                $("#loginFormContainer").hide();
            }, 300);
        });
        
        //Save Phone Number
        checkIfPhoneNumberSaved();

        //Enable Form Input
        $("#phonelogin").click(function(){$(this).removeAttr("readonly"); });
        $("#passwordlogin").click(function(){$(this).removeAttr("readonly"); });

        //Registration Form
        $('#login-form').submit(function(e){
                e.preventDefault()
                $('#submit-btn').html('<i class="fa fa-spinner fa-spin" aria-hidden="true"></i> Processing ...');
                
                $.ajax({
                    url:'../home/includes/route.php?login',
                    data: new FormData($(this)[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    method: 'POST',
                    type: 'POST',
                    success:function(resp){
                        
                        resp = JSON.parse(resp);

                        if(resp.status == "success"){
                            swal('Alert!!',"Login Succesfull","success");
                            setTimeout(function(){
                                location.replace('../home/')
                            },1000)
                        }
                        else{
                            swal('Alert!!',resp.msg,"error");
                        }

                    $('#submit-btn').html("<b>Login</b>");
                    }
                })
            });
    });

    function checkIfPhoneNumberSaved() {
        $phone = atob(unescape(getCookie("loginPhone")));
        $name = atob(unescape(getCookie("loginName")));
        if($phone != null && $phone != ""){
            let msg='<p class="mb-3"><a href="javascript:showNumber();"><b class="mb-3" style="color: #ffcc00;"> Login With Another Account?</b></a></p>';
            $("#accountname").after(msg);
            $("#accountname").append(" "+$name+"!");
            $("#phonediv").hide();
            $("#phonelogin").val($phone);
        }
    }

    function showNumber(){
        $("#phonediv").show();
    }
     
    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
        }
        return "";
    }
    </script>
</body>
</html>