<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Blaze Sub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #0a0c80 0%, #0a0c80 100%);
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
        
        .login-container {
            background-color: white;
            width: 100%;
            max-width: 350px;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .fingerprint {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
            cursor: pointer;
        }
        
        .fingerprint-icon {
            width: 50px;
            height: 50px;
            background-color: #f1f3f4;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
            transition: all 0.2s ease-in-out;
            border: 1px solid #e2e8f0;
        }
        
        .fingerprint-icon:hover {
            background-color: #c6f6d5;
            border-color: #0a0c80;
        }
        
        .fingerprint-icon i {
            font-size: 24px;
            color: #5f6368;
        }
        
        .fingerprint-text {
            font-size: 14px;
            color: #5f6368;
            font-weight: 500;
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
        
        .input-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .input-group label {
            display: block;
            font-size: 14px;
            color: #5f6368;
            margin-bottom: 8px;
            font-weight: 500;
        }
        
        .input-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #dadce0;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            background-color: #f7fafc;
            transition: all 0.2s ease-in-out;
        }
        
        .input-group input:focus {
            border-color: #0a0c80;
            box-shadow: 0 0 0 3px rgba(72, 187, 120, 0.2);
        }
        
        .input-group input::placeholder {
            color: #a0aec0;
            opacity: 0.7;
        }
        
        .form-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
        }
        
        .remember-me input {
            margin-right: 0.5rem;
            accent-color: #0a0c80;
        }
        
        .remember-me label {
            font-size: 14px;
            color: #5f6368;
            cursor: pointer;
        }
        
        .forgot-link {
            font-size: 14px;
        }
        
        .forgot-link a {
            color: #0a0c80;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease-in-out;
        }
        
        .forgot-link a:hover {
            text-decoration: underline;
        }
        
        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #0a0c80;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-btn:hover {
            background-color: #38a169;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        
        .btn-icon {
            margin-right: 0.5rem;
        }
        
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 12px;
            color: rgba(255,255,255,0.7);
            width: 100%;
            max-width: 350px;
        }
        
        .switch-account {
            margin-top: 10px;
            font-size: 13px;
        }
        
        .switch-account a {
            color: white;
            text-decoration: none;
            font-weight: 500;
        }
        
        .find-agents {
            display: inline-block;
            margin-top: 20px;
            color: white;
            font-size: 14px;
            text-decoration: none;
            font-weight: 500;
        }

        /* Notification System */
        .notification-container {
            position: fixed;
            top: 20px;
            right: 20px;
            width: 350px;
            max-width: 90%;
            z-index: 9999;
        }

        .notification {
            position: relative;
            padding: 15px 20px;
            margin-bottom: 15px;
            border-radius: 5px;
            color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            display: flex;
            align-items: center;
            overflow: hidden;
            transform: translateX(400px);
            opacity: 0;
            transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        .notification.show {
            transform: translateX(0);
            opacity: 1;
        }

        .notification.success {
            background: linear-gradient(135deg, #38a169 0%, #0a0c80 100%);
            border-left: 4px solid #2f855a;
        }

        .notification.error {
            background: linear-gradient(135deg, #e53e3e 0%, #f56565 100%);
            border-left: 4px solid #c53030;
        }

        .notification.warning {
            background: linear-gradient(135deg, #dd6b20 0%, #ed8936 100%);
            border-left: 4px solid #c05621;
        }

        .notification.info {
            background: linear-gradient(135deg, #3182ce 0%, #4299e1 100%);
            border-left: 4px solid #2b6cb0;
        }

        .notification-icon {
            font-size: 24px;
            margin-right: 15px;
            flex-shrink: 0;
        }

        .notification-content {
            flex-grow: 1;
        }

        .notification-title {
            font-weight: 600;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .notification-message {
            font-size: 14px;
            line-height: 1.4;
        }

        .notification-close {
            margin-left: 15px;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.2s;
            flex-shrink: 0;
        }

        .notification-close:hover {
            opacity: 1;
        }

        .notification-progress {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 3px;
            width: 100%;
            background: rgba(255, 255, 255, 0.3);
        }

        .notification-progress-bar {
            height: 100%;
            background: white;
            width: 100%;
            animation: progressBar linear forwards;
        }

        @keyframes progressBar {
            0% { width: 100%; }
            100% { width: 0%; }
        }

        /* Fingerprint Modal */
        .fingerprint-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 10000;
            justify-content: center;
            align-items: center;
        }

        .fingerprint-modal.show {
            display: flex;
        }

        .fingerprint-modal-content {
            background: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            transform: translateY(100px);
            opacity: 0;
            transition: all 0.3s ease-out;
            margin: 20px;
        }

        .fingerprint-modal.show .fingerprint-modal-content {
            transform: translateY(0);
            opacity: 1;
        }

        .fingerprint-modal-icon {
            font-size: 60px;
            color: #0a0c80;
            margin-bottom: 20px;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .fingerprint-modal-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #2d3748;
        }

        .fingerprint-modal-text {
            color: #4a5568;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        /* Dark mode support */
        @media (prefers-color-scheme: dark) {
            .login-container {
                background: #1a202c;
            }

            .input-group input {
                background-color: #2d3748;
                color: white;
                border-color: #4a5568;
            }

            .input-group input::placeholder {
                color: #a0aec0;
            }

            .input-group label {
                color: #e2e8f0;
            }

            .fingerprint-icon {
                background-color: #2d3748;
                border-color: #4a5568;
            }

            .fingerprint-icon i {
                color: #a0aec0;
            }

            .fingerprint-text {
                color: #a0aec0;
            }

            .or-divider {
                color: #718096;
            }

            .or-divider::before,
            .or-divider::after {
                border-bottom-color: #4a5568;
            }

            .remember-me label {
                color: #e2e8f0;
            }
        }
    </style>
</head>
<body>
    <!-- Notification Container -->
    <div class="notification-container" id="notification-container"></div>

    <!-- Fingerprint Modal -->
    <div class="fingerprint-modal" id="fingerprint-modal">
        <div class="fingerprint-modal-content">
            <div class="fingerprint-modal-icon">
                <i class="fas fa-fingerprint"></i>
            </div>
            <h3 class="fingerprint-modal-title">Fingerprint Authentication</h3>
            <p class="fingerprint-modal-text">Please place your finger on the sensor</p>
        </div>
    </div>

   <div class="header">
    <div class="logo-container">
        <!-- Logo with image path added -->
        <div class="logo">
            <img src="/../assets/img/favicon.png" alt="Blaze Sub Logo" class="logo-img">
            
        </div>
    <!--    <div class="subtitle"><h4>Your Unique Online Store For Digital Needs App</h4></div>-->
    <!--    <div class="powered-by"><b>Powered by API.databservices</b></div>-->
    <!--</div>-->
</div>
    
    <div class="greeting" id="accountname"></div>
    
    <div class="login-container">
        <div class="fingerprint" id="fingerprint-btn">
            <div class="fingerprint-icon">
                <i class="fas fa-fingerprint"></i>
            </div>
            <div class="fingerprint-text">Unlock with your fingerprint</div>
        </div>
        
        <div class="or-divider">or</div>
        
        <form id="login-form" method="post">
            <div class="input-group" id="phonediv">
                <label for="phonelogin" class="form-label">Phone Number</label>
                <input type="text" name="phone" id="phonelogin" class="form-control" 
                       placeholder="Enter your phone number" required>
            </div>

            <div class="input-group">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" id="password" class="form-control" 
                       placeholder="Enter your password" required>
            </div>

            <div class="form-footer">
                <div class="remember-me">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember me</label>
                </div>
                <div class="forgot-link">
                    <a href="../recovery/">Forgot password?</a>
                </div>
            </div>

            <button type="submit" class="login-btn" id="loginbtn">
                <i class="fas fa-sign-in-alt btn-icon"></i> Login
            </button>
        </form>
    </div>
    
    <div class="footer">
        <div class="switch-account" id="switchAccountContainer" style="display:none;">
            Not <span id="displayPhone"></span>? <a href="javascript:showNumber();">CLICK HERE</a>
        </div>
        <div>
            Don't have an account? <a href="../register/" style="color:white;">Sign up</a>
        </div>
        <a href="https://wa.link/bb965w" class="find-agents">Find Help</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function(){
        // Set greeting based on time of day
        setGreeting();
        
        // Check saved credentials
        checkIfPhoneNumberSaved();

        // Enable inputs on click
        $("#phonelogin, #password").click(function(){
            $(this).removeAttr("readonly");
        });

        // Fingerprint button click handler
        $("#fingerprint-btn").click(function() {
            authenticateWithFingerprint();
        });

        // Form submission handler
        $('#login-form').on('submit', function(e){
            e.preventDefault();
            const $btn = $('#loginbtn');
            $btn.html('<i class="fas fa-spinner fa-spin btn-icon"></i> Logging In...').prop('disabled', true);

            // Get form data
            const formData = $(this).serialize();

            $.ajax({
                url: '../home/includes/route.php?login',
                method: 'POST',
                data: formData,
                dataType: 'json',
                success: function(response) {
                    if(response && response.status === "success") {
                        // Save credentials for fingerprint login
                        localStorage.setItem('savedPhone', $('#phonelogin').val());
                        localStorage.setItem('savedPassword', $('#password').val());
                        
                        // Save credentials if Remember me is checked
                        if($('#remember').is(':checked')) {
                            const phone = btoa(escape($('#phonelogin').val()));
                            const name = btoa(escape(response.name || "User"));
                            document.cookie = `loginPhone=${phone}; path=/; max-age=${30*24*60*60}; SameSite=Lax`;
                            document.cookie = `loginName=${name}; path=/; max-age=${30*24*60*60}; SameSite=Lax`;
                        }
                        
                        showNotification('success', 'Success!', 'Login successful');
                        setTimeout(() => window.location.href = '../home/', 1500);
                    } else {
                        const errorMsg = response && response.msg ? response.msg : "Login failed. Please check your credentials.";
                        showNotification('error', 'Error!', errorMsg);
                    }
                    $btn.html('<i class="fas fa-sign-in-alt btn-icon"></i> Login').prop('disabled', false);
                },
                error: function(xhr, status, error) {
                    let errorMsg = "Connection failed. Please try again.";
                    try {
                        const response = JSON.parse(xhr.responseText);
                        if(response && response.msg) {
                            errorMsg = response.msg;
                        }
                    } catch(e) {
                        console.error("Error parsing response:", e);
                    }
                    showNotification('error', 'Error!', errorMsg);
                    $btn.html('<i class="fas fa-sign-in-alt btn-icon"></i> Login').prop('disabled', false);
                }
            });
        });
    });

    function showNotification(type, title, message, duration = 5000) {
        const icons = {
            success: 'fa-check-circle',
            error: 'fa-exclamation-circle',
            warning: 'fa-exclamation-triangle',
            info: 'fa-info-circle'
        };
        
        const notification = $(`
            <div class="notification ${type}">
                <i class="fas ${icons[type]} notification-icon"></i>
                <div class="notification-content">
                    <div class="notification-title">${title}</div>
                    <div class="notification-message">${message}</div>
                </div>
                <div class="notification-close">
                    <i class="fas fa-times"></i>
                </div>
                <div class="notification-progress">
                    <div class="notification-progress-bar" style="animation-duration: ${duration/1000}s"></div>
                </div>
            </div>
        `);
        
        $('#notification-container').append(notification);
        
        // Show the notification
        setTimeout(() => {
            notification.addClass('show');
        }, 10);
        
        // Close button event
        notification.find('.notification-close').click(function() {
            closeNotification(notification);
        });
        
        // Auto-close after duration
        const timeout = setTimeout(() => {
            closeNotification(notification);
        }, duration);
        
        // Hover to pause auto-close
        notification.hover(
            function() {
                clearTimeout(timeout);
                notification.find('.notification-progress-bar').stop();
            },
            function() {
                const remainingWidth = notification.find('.notification-progress-bar').width() / notification.width();
                const remainingTime = remainingWidth * duration;
                
                const newTimeout = setTimeout(() => {
                    closeNotification(notification);
                }, remainingTime);
                
                notification.data('timeout', newTimeout);
                notification.find('.notification-progress-bar').animate({width: '0%'}, remainingTime, 'linear');
            }
        );
    }
    
    function closeNotification(notification) {
        notification.removeClass('show');
        setTimeout(() => {
            notification.remove();
        }, 400);
    }

    function setGreeting() {
        const hour = new Date().getHours();
        let greeting;
        
        if (hour < 12) {
            greeting = 'Good Morning';
        } else if (hour < 18) {
            greeting = 'Good Afternoon';
        } else {
            greeting = 'Good Evening';
        }
        
        // Get name from cookie if available
        var name = "";
        var savedName = getCookie("loginName");
        if(savedName) {
            try {
                name = `, ${atob(unescape(savedName))}!`;
            } catch(e) {
                console.error("Error decoding name:", e);
                name = "!";
            }
        } else {
            name = "!";
        }
        
        document.getElementById("accountname").textContent = greeting + name;
    }

    function authenticateWithFingerprint() {
        var savedPhone = localStorage.getItem('savedPhone');
        var savedPassword = localStorage.getItem('savedPassword');
        
        if(!savedPhone || !savedPassword) {
            showNotification('warning', 'No Saved Credentials', 'Please login with password first to enable fingerprint authentication');
            return;
        }
        
        // Show fingerprint modal
        const modal = document.getElementById('fingerprint-modal');
        modal.classList.add('show');
        
        // Simulate fingerprint scan (in a real app, this would be actual biometric authentication)
        setTimeout(() => {
            modal.classList.remove('show');
            setTimeout(() => {
                $("#phonelogin").val(savedPhone);
                $("#password").val(savedPassword);
                $("#login-form").submit();
            }, 300); // Match this with the CSS transition time
        }, 2000);
    }

    function checkIfPhoneNumberSaved() {
        const phone = atob(unescape(getCookie("loginPhone")));
        const name = atob(unescape(getCookie("loginName")));
        
        if(phone) {
            // Set the greeting with the user's name
            setGreeting();
            
            // Mask the phone number for display
            const maskedPhone = phone.substring(0, 2) + 'XXXXXX' + phone.substring(phone.length - 2);
            
            $("#phonelogin").val(maskedPhone).attr("readonly", true);
            $("#displayPhone").text(maskedPhone);
            $("#switchAccountContainer").show();
            
            // Add click handler to show full number when clicked
            $("#phonelogin").click(function() {
                showNumber();
            });
        }
    }

    function showNumber() {
        $("#phonelogin").val('').removeAttr('readonly');
        $("#switchAccountContainer").hide();
    }

    function getCookie(name) {
        const cookies = document.cookie.split(';');
        for(let cookie of cookies) {
            const [key, value] = cookie.trim().split('=');
            if(key === name) return value;
        }
        return "";
    }
    </script>
</body>
</html>