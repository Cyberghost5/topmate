<!-- Page content start here-->
<head>
    <style>
        .cardy {
            background-color: <?php echo $sitecolor; ?>;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Added shadow */
            width: 100%;
            padding: 20px;
            position: relative;
        }
        .transaction-history {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 12px;
            color: #ffffff;
            cursor: pointer;
        }
        .avbal {
            position: absolute;
            top: 10px;
            font-size: 12px;
            color: #ffffff;
            cursor: pointer;
        }
        .balance-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 20px;
        }
        .balance {
            color: #ffffff;
            font-size: 24px;
        }
        .add-money button {
            background-color: white;
            color: <?php echo $sitecolor; ?>;
            border: none;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 14px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
    <style>
        .float {
            position: fixed;
            width: 60px;
            height: 60px;
            bottom: 80px;
            right: 0px;
            background-color: #25d366;
            color: #FFF;
            border-radius: 50px 0px 0px 50px;
            text-align: center;
            font-size: 30px;
            box-shadow: 2px 2px 3px #999;
            z-index: 100;
        }
        .my-float {
            margin-top: 15px;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <a href="https://wa.link/zl59oa" class="float" target="_blank">
        <i class="fa fa-whatsapp my-float"></i>
    </a>
</head>
<body>

        <div class="page-content header-clear-medium">

    <div class="card card-style" data-card-height="170" style="background-image:url(../../assets/img/bg/cover8.jpg); border-bottom-left-radius: 1rem !important; border-bottom-right-radius: 1rem !important;">
        <div class="rounded-0 mb-3 mt-0" 
         style="opacity:0.9; background-color:<?php echo $sitecolor; ?>; 
        border-bottom-left-radius: 1rem !important; border-bottom-right-radius: 1rem !important;">
            <div class="card-body pt-0 mt-4 mb-5 text-left">
                <div class="d-flex justify-content-between align-content-center">
                    <div>
                        <h1 class=" font-15 color-white mb-0">Hi, <?php echo $data->sFname. " " . $data->sLname.  " (".$controller->formatUserType($profileDetails->sType).")"; ?></h1>
                        <h2 class="font-20 mt-0 color-white">

                            <span id="hideEyeDiv" style="display:none;">&#8358;<?php echo number_format($data->sWallet); ?></span>
                            <span id="openEyeDiv">&#8358; *********</span>

                            <span id="hideEye"><i class="fa fa-eye-slash" style="margin-left:20px;" aria-hidden="true"></i></span>
                            <span id="openEye" style="display:none; margin-left:20px;"><i class="fa fa-eye" aria-hidden="true"></i></span>

                        </h2>
                        <h2 class=" font-15 color-white">Commission: &#8358;<?php echo $data->sRefWallet; ?></h2>
                    </div>

                    <div class="mt-4">
                        <h2 class="color-white"><ion-icon name="wallet-outline" class="font-50" style="opacity: 0.7;"></ion-icon></h2>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <div class="content card" style="margin-top:-70px; border-radius: 1rem !important;">

        <div class="mt-0">

            <div class="d-flex justify-content-center align-content-center m-2">


                <a href="fund-wallet" class="btn btn-lg d-flex justify-content-center align-item-center font-11" style="width:100%; padding:10px; border:2px solid #ffffff; border-radius:1rem; background-color:<?php echo $sitecolor; ?>;">
                    <ion-icon name="add-circle" class="font-18"></ion-icon> <b class="ps-1">Add Money</b>
                </a>


                <a href="contact-us" class="btn btn-lg d-flex justify-content-center align-items-center font-11" style="width:100%; padding:10px; border:2px solid #ffffff; border-radius:1rem; background-color:<?php echo $sitecolor; ?>;">
                    <ion-icon name="logo-whatsapp" class="font-18"></ion-icon> <b class="ps-1">Contact Us</b>
                </a>

            </div>

        </div>
    </div>
    
        
  <div class="card card-style mt-0 mb-5" style="height: 50px;">
               <div class="card-center ">
                    <div class="d-flex">
                    <h5 style="background:<?php echo $sitecolor; ?>; color:#ffffff; padding:9px;  margin-right:5px;"><i class="fa fa-bullhorn"></i> </h5>
                    <marquee direction="left" scrollamount="5" style="background:#f2f2f2; padding:3px; border-radius:5rem;">
                        <h5 class="py-2">
                    <?php echo $data4->message;?>
                        </h5>
                    </marquee>
                </div>
               </div>
            </div>
    
     <div class="content mt-n4">
        <div class="mb-3">
            <p class="mt-5 mb-2 text-dark"><b>What Would You Like To Do Today?</b></p>
        </div>

        <div class="d-flex justify-content-between align-content-center mb-2">

            <a href="buy-airtime" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-left:0px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-phone font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Airtime</b></p>
            </a>

            <a href="buy-data" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-wifi font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Data</b></p>
            </a>

            <a href="cable-tv" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-tv font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Tv</b></p>
            </a>

            <a href="electricity" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-right:0px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-bolt font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Electricity</b></p>
            </a>

        </div>
         <div class="d-flex justify-content-between align-content-center mb-2">


            <a href="exam-pins" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-left:0px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-graduation-cap font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Education</b></p>
            </a>

            <a href="verify-nin" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-print font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Print NIN</b></p>
            </a>
            
            <a href="verify-bvn" id="BVN" data-menu="verify-bvn"  class="card text-center shadow-l" style="width:100% ; margin:6px; margin-right:0px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-fingerprint font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Print BVN</b></p>
            </a>
            
            <a href="https://wa.link/s1wbqj" id="cac" data-menu="cac"  class="card text-center shadow-l" style="width:100% ; margin:6px; margin-right:0px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-certificate font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>CAC Reg</b></p>
            </a>
             
        </div>

        <div class="d-flex justify-content-between align-content-center mb-2">


            <a href="statistics" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-left:0px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-chart-bar font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Statistics</b></p>
            </a>

            <a href="recharge-pin" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-print font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Recharge Pin</b></p>
            </a>

            

            <a href="profile" id="status" data-menu="profile" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-right:0px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-code font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>API Access</b></p>
            </a>

            <a href="#" class="card text-center shadow-l" style="width:100% ; margin:6px; margin-top:-5px;">
                <span class="icon pt-2" style="color:<?php echo $sitecolor; ?>;">
                    <i class="fa fa-mobile font-20"></i>
                </span>
                <p class="mb-2 pt-0 font-10"><b>Get App</b></p>
            </a>


        </div>
        
    </div>

    

    <div class="mt-0 splide single-slider slider-no-arrows slider-no-dots splide--loop splide--ltr splide--draggable is-active mb-1" id="single-slider-1" style="visibility: visible;">
        <div class="splide__arrows"><button class="splide__arrow splide__arrow--prev" type="button" aria-controls="single-slider-1-track" aria-label="Go to last slide"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40" height="40">
                    <path d="m15.5 0.932-4.3 4.38 14.5 14.6-14.5 14.5 4.3 4.4 14.6-14.6 4.4-4.3-4.4-4.4-14.6-14.6z"></path>
                </svg></button><button class="splide__arrow splide__arrow--next" type="button" aria-controls="single-slider-1-track" aria-label="Next slide"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40" height="40">
                    <path d="m15.5 0.932-4.3 4.38 14.5 14.6-14.5 14.5 4.3 4.4 14.6-14.6 4.4-4.3-4.4-4.4-14.6-14.6z"></path>
                </svg></button></div>
        <div class="splide__track col-lg-6 col-md-6" id="single-slider-1-track">
            <div class="splide__list" id="single-slider-1-list" style="transform: translateX(-624px);">

                <div class="splide__slide splide__slide--clone" aria-hidden="true" tabindex="-1" style="width: 450px;">
                    <div class="card card-style bg-20" data-card-height="130" style="height: 130px;">
                        <img class="img-fluid" style="height: 130px;" src="../../assets/img/ads/ads1.png" />
                    </div>
                </div>

                <div class="splide__slide" id="single-slider-1-slide02" aria-hidden="true" tabindex="-1" style="width: 450px;">
                    <div class="card card-style bg-20" data-card-height="130" style="height: 130px;">
                        <img class="img-fluid" style="height: 130px;" src="../../assets/img/ads/ads2.png" />
                    </div>
                </div>

                <div class="splide__slide" id="single-slider-1-slide03" aria-hidden="true" tabindex="-1" style="width: 450px;">
                    <div class="card card-style bg-20" data-card-height="130" style="height: 130px;">
                        <img class="img-fluid" style="height: 130px;" src="../../assets/img/ads/ads3.png" />
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>    <!-- Page content ends here-->