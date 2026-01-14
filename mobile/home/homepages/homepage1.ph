 <!-- Page content start here-->
        <style>
    .right {
        float: right;
        align-items: center;
        padding-right: 15px;
    }

    .left {
        float: left;
        align-items: center;
        padding-right: 15px;
    }

    .h-btn {
        padding: 5px;
        font-size: small;
        border-radius: 50px;
        border: 1px solid white;
        text-decoration: none;
        text-align: center;
    }

    .item {
        flex: 1;
        text-align: center;
        color: #2babff;
        font-size: x-small;
    }
</style>

<!-- Page content starts here -->
<div class="page-content header-clear-medium">

    <div class="card card-style" data-card-height="190">
        <div class="card-top ps-3 pt-2">
            <div class="card-body pt-2 mt-1 mb-n2 text-left">

                <div class="d-flex justify-content-between align-content-center">
                    <div>
                       
                        <h1 class="font-16 color-white">Balance</h1>
                        <h2 class="font-18 pt-2 color-white">

                            <span id="hideEyeDiv" style="display:none;">&#8358;<?php echo number_format($data->sWallet); ?> </span>
                            <span id="openEyeDiv">&#8358; ***</span>

                            <span id="hideEye"><i class="fa fa-eye-slash" style="margin-left:20px;" aria-hidden="true"></i></span>
                            <span id="openEye" style="display:none; margin-left:20px;"><i class="fa fa-eye" aria-hidden="true"></i></span>

                        </h2>

                        <h2 class="font-12 color-white">Commission: &#8358;<?php echo number_format($data->sRefWallet); ?> </h2>
                        
                        
                    </div>
                    
                    

                   
                     <div class="mt-0">
                        <b class="text-white font-15">9PSB </b> <br><b class="text-white"><i class='fas fa-copy' onclick="copyToClipboard('<?php echo $data4->psb; ?>')"></i><?php echo $data4->psb; ?></b>
                  
                     <p class="mb-2 text-dark font-600 font-16"><b></b><?php echo $data4->psb; ?></p>
                     <div class="mt-1">
                        <b class="text-white font-14">palmpay </b> <br><b class="text-white"><i class='fas fa-copy' onclick="copyToClipboard('<?php echo $data->sAsfiyBank; ?>')"></i> <?php echo $data->sAsfiyBank; ?></b>
                    </div>
                    <div class="mt-1 mb-10">
                        <b class="text-white font-14">bankly </b> <br><b class="text-white"><i class='fas fa-copy' onclick="copyToClipboard('<?php echo $data->sBankNo; ?>')"></i> <?php echo $data->sBankNo; ?></b>
                    </div>
                    </div>
                  
                   
               
   </div>
     <div class="mt-3 ">
        <div class="d-flex justify-content-between">
        <div class="rounded-container">
            <a href="fund-wallet" class="h-btn item text-white font-10">
                <i class="fa fa-plus"></i><b> Deposit </b>
            </a>
        </div>
        
    </div>
</div>
</div>

</div>
<div class="card-overlay" style="background-image: linear-gradient(rgba(0, 0, 139, 0.8), rgba(0, 0, 139, 0.9)), url('/bg2.jpg'); background-size: cover;"></div>
</div> 
    <div class="d-flex">
                    <h5 style="background:<?php echo $sitecolor; ?>; color:#ffffff; padding:9px;  margin-right:5px;"> </h5>
                   
                </div>
              <!-- BILLSTACK 9PSB START-->
                    <?php if($controller->getConfigValue($data2,"billstack9PSBStatus") == "On"): ?>
                    <?php $billstackCharges = $controller->getConfigValue($data2,"billstackCharges"); 
                    $billstackChargesType = $controller->getConfigValue($data2,"billstackChargesType"); ?>
                    <?php $billstackChargesText = ($billstackChargesType == "flat") ? "N".$billstackCharges : $billstackCharges."%"; ?>
                    <?php if(empty($data4->psb)): ?>
                    <p class="mb-2 text-danger font-600 font-15">Get A 9PSB Account For Automated Transfer, Generate A Dedicated Account Number Now.
                    Funding Attracts <?php echo $billstackChargesText; ?> only.</p>
                        <form method="POST" id="psbform">
                        <button type="submit" class="btn btn-primary font-700 rounded-xl mt-3" 
                        name="generate_billstack_psb"   onclick="
                this.classList.replace('btn-primary', 'btn-secondary');
                this.innerHTML = '<i class=\'fa fa-spinner fa-spin\'></i> Processing ...';
                document.getElementById('psbform').submit();
            ">
                            Generate 9PSB Account</button>
                </form>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>99 Payment service Bank   </p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data4->psb; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of
                    <?php echo$billstackChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data4->psb; ?>')">
                        Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- KUDA BANK END -->
                    
                   
    <div class="card card-style mt-n3 notop">
        <div class="content mb-3 mt-3">
            <div class="row text-center mb-0">

                <a href="fund-wallet" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B">
                        <i class="fa fa-mobile font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Deposit</p>
                </a>

                 <a href="buy-data" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-wifi font-18 "></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Data</p>
                </a>

                <a href="referrals" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-tv font-18 "></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Refer and Earn</p>
                </a>

                <a href="https://wa.me/7026354996" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-bolt font-18 "></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Chat Admin</p>
                </a>

                <a href="exam-pins" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-graduation-cap font-18 "></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Exam Pins</p>
                </a>

                <a href="referrals" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-barcode font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Referrals</p>
                </a>

                <a href="more-services" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-print font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">more services</p>
                </a>

                <a href="https://hbi.com.ng/apk.apk" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-rocket font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Download  App</p>
                </a>

                <a href="recharge-pin" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-bullseye font-18 "></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Print Recharge card</p>
                </a>

                 <a href="https://edge.com.ng/calculator" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-credit-card font-18 "></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Calculator</p>
                </a>

                <a href="https://wa.me/2347026354996" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-retweet font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Airtime 2 Cash</p>
                </a>

                <a href="#agent-upgrade-modal" id="upgrade-agent-btn" data-menu="agent-upgrade-modal" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-user-secret font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Agent</p>
                </a>

              <a href="pricing" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-list font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Developer</p>
                </a>
                
                <a href="apidocumentation" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-code font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">API DOC</p>
                </a>
                
                <a href="status" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-spinner font-18"></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Status</p>
                </a>
                
                <a href="https://wa.me/2347026354996" class="col-3 mt-2">
                    <span class="icon icon-l shadow-l rounded-sm" style="background:#fff; color:#00008B; border: 1px solid #00008B;">
                        <i class="fa fa-check-circle font-18 "></i>
                    </span>
                    <p class="mb-0 pt-1 font-12">Own a Website </p>
                </a>

            </div>
        </div>
    </div>
 <a class="btn btn-success font-700 rounded-xl mt-3" href="https://wa.me/234<?php echo $data3->whatsapp; ?>">Contact Admin</a>
                </div>
            </div>
        </div>
    </div>
</div>
