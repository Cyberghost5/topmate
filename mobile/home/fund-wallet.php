<div class="page-content header-clear-medium">
        
        
        <div class="card card-style bg-theme pb-0">
            <div class="content" id="tab-group-1">
                <div class="tab-controls tabs-small tabs-rounded" data-highlight="bg-highlight">
                    <a href="#" data-active data-bs-toggle="collapse" data-bs-target="#tab-1">Bank</a>
                    <a href="#" data-bs-toggle="collapse" data-bs-target="#tab-2">Card</a>
                    <a href="#" data-bs-toggle="collapse" data-bs-target="#tab-3">Manual</a>
                    
                </div>
                <div class="clearfix mb-3"></div>
                <div data-bs-parent="#tab-group-1" class="collapse show" id="tab-1">
                <div class="text-center">
                    <p class="text-center">
                        <span class="icon icon-l gradient-blue shadow-l rounded-sm">
                            <i class="fa fa-arrow-up font-30 color-white"></i>
                        </span>
                    </p>
                    <h4 class="text-primary">FUND WALLET</h4>
                    
			<!-- Bellbank BANK START-->
<?php if ($controller->getConfigValue($data2, "bellbankStatus") == "On"): ?>
    <?php 
    $bellbankCharges = $controller->getConfigValue($data2, "bellbankCharges"); 
    $bellbankChargesType = $controller->getConfigValue($data2, "bellbankChargesType"); 
    $bellbankChargesText = ($bellbankChargesType == "flat") ? "N".$bellbankCharges : $bellbankCharges."%"; 
    ?>
    <?php if (empty($data->sBellBank)): ?>
        <p class="mb-2 text-danger font-600 font-15">
            Get A BellBank Account For Automated Transfer. Generate A Dedicated Account Number Now. Funding Attracts <?php echo $bellbankChargesText; ?> only.
        </p>
        <form method="POST" id="bellbankform">
            <input type="hidden" name="generate-bellbank-account" value="YES" />
        </form>
        <button class="btn btn-primary font-700 rounded-xl mt-3" id="bellbankbtn" 
                onclick="
                    $('#bellbankbtn').removeClass('btn-primary'); 
                    $('#bellbankbtn').addClass('btn-secondary'); 
                    $('#bellbankbtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); 
                    $('#bellbankform').submit();
                ">
            Generate Account
        </button>
    <?php else: ?>
        <p class="mb-2 text-dark font-600 font-16">
            <b>Bank Name: </b> BellBank MFB
        </p>
        <p class="mb-2 text-dark font-600 font-16">
            <b>Account No: </b> <?php echo $data->sBellBank; ?>
        </p>
        <p class="mb-2 text-danger font-600 font-15">
            <b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $bellbankChargesText; ?> only.
        </p>
        <button class="btn btn-primary font-700 rounded-xl mt-3" 
                onclick="copyToClipboard('<?php echo $data->sBellBank; ?>')">
            Copy Account No
        </button>
    <?php endif; ?>
    <hr/>
<?php endif; ?>
<!-- Bellbank BANK END -->

                    
                     <!-- ASPFIY BANK START-->
                    <?php
                    
                    //print_r($data2);
                    //die();
                    
                    if($controller->getConfigValue($data2,"asfiyStatus") == "On"): ?>
                    <?php 
                    $asfiyCharges = $controller->getConfigValue($data2,"asfiyCharges");
                    $asfiyChargesType = $controller->getConfigValue($data2,"asfiyChargesType"); ?>
                    <?php $asfiyChargesText = ($asfiyChargesType == "flat") ? "N".$asfiyCharges : $asfiyCharges."%"; ?>
                    <?php if(empty($data->sPaga)): ?>
                        <p class="mb-2 text-danger font-600 font-15">Get A Palmpay Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $asfiyChargesText; ?> only.</p>
                        <form method="POST" id="aspfiyform1"><input type="hidden" name="generate-aspfiy-palmpay" value="YES" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="aspfiybtn1" onclick="$('#aspfiybtn1').removeClass('btn-primary'); $('#aspfiybtn1').addClass('btn-secondary'); $('#aspfiybtn1').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#aspfiyform1').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Palmpay Microfinance Bank</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sPaga; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $asfiyChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sPaga; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    
                    <?php
                    
                    //print_r($data2);
                    //die();
                    
                    if($controller->getConfigValue($data2,"asfiyStatus") == "On"): ?>
                    <?php 
                    $asfiyCharges = $controller->getConfigValue($data2,"asfiyCharges");
                    $asfiyChargesType = $controller->getConfigValue($data2,"asfiyChargesType"); ?>
                    <?php $asfiyChargesText = ($asfiyChargesType == "flat") ? "N".$asfiyCharges : $asfiyCharges."%"; ?>
                    <?php if(empty($data->sAsfiyBank)): ?>
                        <p class="mb-2 text-danger font-600 font-15">Get A Paga Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $asfiyChargesText; ?> only.</p>
                        <form method="POST" id="aspfiyform"><input type="hidden" name="generate-aspfiy-account" value="YES" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="aspfiybtn" onclick="$('#aspfiybtn').removeClass('btn-primary'); $('#aspfiybtn').addClass('btn-secondary'); $('#aspfiybtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#aspfiyform').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Paga Microfinance Bank</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sAsfiyBank; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $asfiyChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sAsfiyBank; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- KUDA BANK END -->
                                        
                    <!-- BILLSTACK BANK START -->
<?php if ($controller->getConfigValue($data2, "billstackStatus") === "On"): ?> 
    <?php 
        $billstackCharges = $controller->getConfigValue($data2, "billstackCharges"); 
        $billstackChargesType = $controller->getConfigValue($data2, "billstackChargesType"); 
        $billstackChargesText = ($billstackChargesType === "flat") ? "N" . $billstackCharges : $billstackCharges . "%"; 
    ?>

    <!-- Billstack Palmpay Bank Section -->
    <?php if ($controller->getConfigValue($data2, "billstackPalmpayStatus") === "On"): ?>
        
        <?php if (empty($data4->palmpay)): ?>
            <p class="mb-2 text-danger font-600 font-16">
                <b>Note:</b> You currently do not have a Palmpay generated account number. Please generate one.
            </p>
            <form method="POST" id="palmpayform">
                <input type="hidden" name="generate_billstack_palmpay" value="YES" />
            </form>
            
            <button class="btn btn-primary font-700 rounded-xl mt-3" id="palmpaybtn" onclick="
                this.classList.replace('btn-primary', 'btn-secondary');
                this.innerHTML = '<i class=\'fa fa-spinner fa-spin\'></i> Processing ...';
                document.getElementById('palmpayform').submit();
            ">Generate Palmpay</button>
        <?php else: ?>
            <div class="text-center">
                <div style="border-radius: 50%; width: 40px; height: 40px; overflow: hidden; display: inline-block;">
                    <img src="https://bizdataconnects.com.ng/mobile/assets/images/palmpay.jpg" alt="New" style="width: 100%; height: 100%; object-fit: cover;">
                </div>
                <p class="mb-2 text-dark font-600 font-16"><b>Bank Name:</b> Palmpay</p>
                <p class="mb-2 text-dark font-600 font-16"><b>Account No:</b> <?php echo htmlspecialchars($data4->palmpay); ?></p>
                <p class="mb-2 text-dark font-600 font-16"><b>Account Name:</b> Billstack/bizdataconnects-<?php echo htmlspecialchars($data->sFname); ?></p>
                <p class="mb-2 text-danger font-600 font-15"><b>Note:</b> Automated bank transfer attracts additional charges of <?php echo htmlspecialchars($billstackChargesText); ?> only.</p>
                <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo htmlspecialchars($data4->palmpay); ?>')">Copy Account No</button>
            </div>
        <?php endif; ?>
        
     
    <?php endif; ?>
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
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>9 Payment service Bank   </p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data4->psb; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of
                    <?php echo$billstackChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data4->psb; ?>')">
                        Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- KUDA BANK END -->
                    
                    
                    <!-- Safehaven START-->
                    <?php if($controller->getConfigValue($data2,"billstackSHStatus") == "On"): ?>
                    <?php $billstackCharges = $controller->getConfigValue($data2,"billstackCharges"); 
                    $billstackChargesType = $controller->getConfigValue($data2,"billstackChargesType"); ?>
                    <?php $billstackChargesText = ($billstackChargesType == "flat") ? "N".$billstackCharges : $billstackCharges."%"; ?>
                    <?php if(empty($data4->safehaven)): ?>
                    <p class="mb-2 text-danger font-600 font-15">Get A Safehaven Account For Automated Transfer, Generate A Dedicated Account Number Now.
                    Funding Attracts <?php echo $billstackChargesText; ?> only.</p>
                        <form method="POST" id="safehavenform">
                        <button type="submit" class="btn btn-primary font-700 rounded-xl mt-3" 
                        name="generate_billstack_safehaven"   onclick="
                this.classList.replace('btn-primary', 'btn-secondary');
                this.innerHTML = '<i class=\'fa fa-spinner fa-spin\'></i> Processing ...';
                document.getElementById('safehavenform').submit();
            ">
                            Generate Safehaven Account</button>
                </form>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Safehaven Bank </p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data4->safehaven; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of
                    <?php echo$billstackChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data4->safehaven; ?>')">
                        Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- safehaven END -->
                    
                 
                    
                       <!-- bANKLY START-->
                    <?php if($controller->getConfigValue($data2,"billstackBanklyStatus") == "On"): ?>
                    <?php $billstackCharges = $controller->getConfigValue($data2,"billstackCharges"); 
                    $billstackChargesType = $controller->getConfigValue($data2,"billstackChargesType"); ?>
                    <?php $billstackChargesText = ($billstackChargesType == "flat") ? "N".$billstackCharges : $billstackCharges."%"; ?>
                    <?php if(empty($data4->bankly)): ?>
                    <p class="mb-2 text-danger font-600 font-15">Get A Bankly Account For Automated Transfer, Generate A Dedicated Account Number Now.
                    Funding Attracts <?php echo $billstackChargesText; ?> only.</p>
                        <form method="POST" id="banklyform">
                        <button type="submit" class="btn btn-primary font-700 rounded-xl mt-3" name="generate_billstack_bankly"
                        id="banklybtn"  onclick="
                this.classList.replace('btn-primary', 'btn-secondary');
                this.innerHTML = '<i class=\'fa fa-spinner fa-spin\'></i> Processing ...';
                document.getElementById('banklyform').submit();"
                        >Generate Bankly Account</button>
                   </form>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Bankly Bank   </p>
                  
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data4->bankly; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of
                    <?php echo$billstackChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data4->bankly; ?>')">
                        Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- Bankly  END -->
    
    

<?php endif; ?>
<!-- BILLSTACK BANK END -->

              

                    <?php  if($profileDetails->sKycStatus <> "verified" && $siteSettings->kycShouldEnable == "yes"): ?>
                        

                        <div id="kycNoteBox" class="border" style="padding:20px;">
                            <img src="../../assets/images/icons/user-verify.png" style="width:50px; height:50px;" />

                            <p class="mb-0 font-600 color-highlight">KYC Verification</p>
                            <h1>Account Verification</h1>
                            <h6 class="color-highlight">Get A Dedicated Bank Account For Fast And Automatic Funding</h6>
                            <hr />
                            <p class="mb-1 font-600 text-danger">As Required By The Central Bank Of Nigeria (CBN), Before You Can Fund Your Wallet With A Virtual Account, We Would Need To Verify Your Identity Using Your NIN or BVN. This Process Is Automatic And You Would Be Able To Fund Your Wallet Once Verified.</p>
                            
                            <a href="kyc-verification" style="width: 100%;" class="the-form-btn btn btn-full btn-l font-600 font-15 gradient-highlight mt-4 rounded-s">
                                            Start Verification
                            </a>

                        </div>
                    <?php else: ?>
    
                <!-- PAYVESSEL BANK END -->
                                   <!-- KUDA BANK START-->
                    <?php if($controller->getConfigValue($data2,"kudaStatus") == "On"): ?>
                    <?php $kudaCharges = $controller->getConfigValue($data2,"kudaCharges"); $kudaChargesType = $controller->getConfigValue($data2,"kudaChargesType"); ?>
                    <?php $kudaChargesText = ($kudaChargesType == "flat") ? "N".$kudaCharges : $kudaCharges."%"; ?>
                    <?php if(empty($data->sKudaBank)): ?>
                        <p class="mb-2 text-danger font-600 font-15">Get A Kuda Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $kudaChargesText; ?> only.</p>
                        <form method="POST" id="kudaform"><input type="hidden" name="generate-kuda-account" value="YES" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="kudabtn" onclick="$('#kudabtn').removeClass('btn-primary'); $('#kudabtn').addClass('btn-secondary'); $('#kudabtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#kudaform').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Kuda Microfinance Bank</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sKudaBank; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $kudaChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sKudaBank; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- KUDA BANK END -->



                      <!-- PAYVESSEL BANK START-->
                  <?php if($controller->getConfigValue($data2,"payvesselStatus") == "On"): ?>
                  <?php $payvesCharges = $controller->getConfigValue($data2,"payvesselCharges"); 
                  $payvesChargesType = $controller->getConfigValue($data2,"payvesselChargesType"); 
                  $payvesChargesText = ($payvesChargesType == "flat") ? "N".$payvesCharges : $payvesCharges."%";?>
                  <?php $generatedAccountNumber = $controller->generatePayvesselDynamic();?> 
                 <?php  if($data->pVerify == "yes"): ?>
                 <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>9Payment Service Bank (9PSB)</p>
                 <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sPayvesselBank; ?></p>
                 <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $payvesChargesText; ?> only.</p>
                 <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sPayvesselBank; ?>')">Copy Account No</button>
                 <?php else: ?>

                 <?php if(empty($generatedAccountNumber)): ?>
                 <p class="mb-2 text-danger font-600 font-15">Get 9Payment Account. <?php echo $payvesChargesText; ?> Charge only.</p>
                 <p class="mb-2"><b>Note: </b> This is dynamic account and is a TEMPORARY account for funding, can only be used ONE TIME. <?php echo $payvesChargesText; ?> Charge only. <br> <a href="payvessel-verify" class="text-danger"> <b>[ Or Get Permanent 9Payment Account ]</b></a></p>
                 <form method="POST" id="payvesform"><input type="hidden" name="generate-payvessel-dynamic" value="YES" />
                 <input type="hidden" name="id" value="<?php echo $data->sId;?>" /></form>
                 <button class="btn btn-primary font-700 rounded-xl mt-3" id="payvesbtn" onclick="$('#payvesbtn').removeClass('btn-primary'); $('#payvesbtn').addClass('btn-secondary'); $('#payvesbtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#payvesform').submit();">Generate Account</button>
                 <?php else: ?>
                 
                 <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>9Payment Service Bank (9PSB)</p>
                 <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $generatedAccountNumber; ?></p>
                 <p class="mb-2"><b>Note: </b> Do not save this account as beneficiary, can only be used ONE TIME. <br> <a href="payvessel-verify" class="text-danger"> <b>[ Or Get Permanent 9Payment Account ]</b></a> </p>
                <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $generatedAccountNumber; ?>')">Copy Account No</button>
                <?php endif; ?><?php endif; ?><?php endif; ?><hr/>

      <div class="text-center ">
          
          
                
                    <!-- Paga START-->
                    <?php if($controller->getConfigValue($data2,"pagaStatus") == "On"): ?>
                    <?php $strowalletCharges = $controller->getConfigValue($data2,"strowalletCharges"); $strowalletChargesType = $controller->getConfigValue($data2,"strowalletChargesType"); ?>
                    <?php $strowalletChargesText = ($strowalletChargesType == "flat") ? "N".$strowalletCharges : $strowalletCharges."%"; ?>
                    <?php if(empty($data5->paga)): ?>
					<h2>Paga</h2>
                        <p class="mb-2 text-danger font-600 font-15">Get A Paga Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $strowalletChargesText; ?> only.</p>
                        <form method="POST" id="banklyform"><input type="hidden" name="generate-strowallet-account" value="paga" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="pagabtn" onclick="$('#pagabtn').removeClass('btn-primary'); $('#pagabtn').addClass('btn-secondary'); $('#pagabtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#banklyform').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Paga</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data5->paga; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $strowalletChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" 
					onclick="copyToClipboard('<?php echo $data5->paga; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- paga END -->
                    <!-- Bankly START-->
                    <?php if($controller->getConfigValue($data2,"banklyStatus") == "On"): ?>
                    <?php $strowalletCharges = $controller->getConfigValue($data2,"strowalletCharges"); $strowalletChargesType = $controller->getConfigValue($data2,"strowalletChargesType"); ?>
                    <?php $strowalletChargesText = ($strowalletChargesType == "flat") ? "N".$strowalletCharges : $strowalletCharges."%"; ?>
                    <?php if(empty($data5->bankly)): ?>
					<h2>Bankly</h2>
                        <p class="mb-2 text-danger font-600 font-15">Get A bankly Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $strowalletChargesText; ?> only.</p>
                        <form method="POST" id="banklyformStrowallet"><input type="hidden" name="generate-strowallet-account" value="bankly" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="banklybtn-strowallet" onclick="$('#banklybtn-strowallet').removeClass('btn-primary'); $('#banklybtn-strowallet').addClass('btn-secondary'); $('#banklybtn-strowallet').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#banklyformStrowallet').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>bankly MFB</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data5->bankly; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $strowalletChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" 
					onclick="copyToClipboard('<?php echo $data5->bankly; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- BANKLY END -->



<!-- safehaven START-->
                    <?php if($controller->getConfigValue($data2,"safehavenStatus") == "On"): ?>
                    <?php $strowalletCharges = $controller->getConfigValue($data2,"strowalletCharges"); $strowalletChargesType = $controller->getConfigValue($data2,"strowalletChargesType"); ?>
                    <?php $strowalletChargesText = ($strowalletChargesType == "flat") ? "N".$strowalletCharges : $strowalletCharges."%"; ?>
                    <?php if(empty($data5->safehaven)): ?>
					<h2>Safe Haven</h2>
                        <p class="mb-2 text-danger font-600 font-15">Get A Safe Haven Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $strowalletChargesText; ?> only.</p>
                        <form method="POST" id="banklyform"><input type="hidden" name="generate-strowallet-account" value="safehaven" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="safehavenbtn" onclick="$('#safehavenbtn').removeClass('btn-primary'); $('#safehavenbtn').addClass('btn-secondary'); $('#safehavenbtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#banklyform').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Safehaven MFB</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data5->safehaven; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $strowalletChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" 
					onclick="copyToClipboard('<?php echo $data5->safehaven; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- safehaven END -->



</div>


<?php 

?>


                    <!-- MONNIFY BANK START -->
                    <?php if($controller->getConfigValue($data2,"monifyStatus") == "On"): ?>
                        <?php $chargesText = $controller->getConfigValue($data2,"monifyCharges"); ?>
                        <?php if($chargesText == 50 || $chargesText == "50"){$chargesText = "N".$chargesText;} else {$chargesText = $chargesText."%";} ?>
                        <?php if($controller->getConfigValue($data2,"monifyGtStatus") == "On"): ?>
                        <?php if(empty($data->sGtBank)): ?>
                            <p class="mb-2 text-danger font-600 font-15">Get A GT Bank Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $chargesText; ?> only.</p>
                            <form method="POST" id="gtbankform"><input type="hidden" name="generate-gtbank-account" value="YES" /></form>
                            <button class="btn btn-primary font-700 rounded-xl mt-3" id="gtbankbtn" onclick="$('#gtbankbtn').removeClass('btn-primary'); $('#gtbankbtn').addClass('btn-secondary'); $('#gtbankbtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#gtbankform').submit();">Generate Account</button>
                        <?php else: ?>
                            <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>GT Bank</p>
                            <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sGtBank; ?></p>
                            <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $chargesText; ?> only.</p>
                            <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sGtBank; ?>')">Copy Account No</button>
                        <?php endif; ?>
                        <hr/>
                        <?php endif; if($controller->getConfigValue($data2,"monifyFeStatus") == "On"): ?>
                        <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Fidelity  Bank</p>
                        <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sFidelityBank; ?></p>
                        <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $chargesText; ?> only.</p>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sFidelityBank; ?>')">Copy Account No</button>
                        <hr/>
                        <?php endif; if($controller->getConfigValue($data2,"monifyMoStatus") == "On"): ?>
                        <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Moniepoint Bank</p>
                        <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sRolexBank; ?></p>
                        <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $chargesText; ?> only.</p>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sRolexBank; ?>')">Copy Account No</button>
                        <hr/>
                        <?php endif; if($controller->getConfigValue($data2,"monifyWeStatus") == "On"): ?>
                        <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: Wema Bank</p>
                        <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sBankNo; ?></p>
                        <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $chargesText; ?> only.</p>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sBankNo; ?>')">Copy Account No</button>
                        <hr/>
                        <?php endif; if($controller->getConfigValue($data2,"monifySaStatus") == "On"): ?>
                        <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Sterling Bank</p>
                        <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data->sSterlingBank; ?></p>
                        <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $chargesText; ?> only.</p>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data->sSterlingBank; ?>')">Copy Account No</button>
                        <?php endif; ?>
                    <?php endif; ?>
                    <!-- MONNIFY BANK END -->

                    <?php endif; ?>
                </div>
                
                <hr>
                
                    <?php  if(is_object($data4)){
    
//var_dump($data4);

?>

 <div class="text-center">
 
                    
                    
                    
                     </div>
<?php
    }else{
        
  ?>
   <!--   <div id="kycNoteBox" class="border" style="padding:20px;">
                            <img src="../../assets/images/icons/user-verify.png" style="width:50px; height:50px;" />

                            <p class="mb-0 font-600 color-highlight"></p>
                            <h1>Generate Virtual Accounts</h1>
                            <h6 class="color-highlight">Generate your Personal virtual account(s) to enable you fund your accounts
                            automatically and transact</h6>
                            <hr />
                         
                             <form method="POST">  
                           	 <button type="submit" name="get_billstack_accounts" style="width: 100%;" 
                           			   class="the-form-btn btn btn-full btn-l font-600 font-15 gradient-highlight mt-4 rounded-s">
                                          Generate account
                            </button>
                            </form>

                        </div>-->

  <?php
    }
    ?>
                </div>

                <div data-bs-parent="#tab-group-1" class="collapse" id="tab-2">
                        <div class="text-center">
                            <p class="text-center">
                                <span class="icon icon-l gradient-blue shadow-l rounded-sm">
                                    <i class="fa fa-arrow-up font-30 color-white"></i>
                                </span>
                            </p>
                            <h4 class="text-primary">FUND WALLET</h4>
                            <p class="mb-2 text-dark font-600 font-16">
                                Pay with card, bank transfer, ussd, or bank deposit. Secured by Paystack
                            </p>
                    
                        </div>
                        
                        <?php if($controller->getConfigValue($data2,"paystackStatus") == "On"): ?>
                        <form  method="post">
                        <div class="mt-5 mb-3">
                            
                            <div class="input-style has-borders no-icon input-style-always-active mb-4">
                                <input type="hidden" value="<?php echo $controller->getConfigValue($data2,"paystackCharges"); ?>" id="paystackcharges" name="paystackcharges" />
                                <input type="number" onkeyup="calculatePaystackCharges()" class="form-control" id="amount" name="amount" placeholder="Amount" required>
                                <label for="amount" class="color-highlight">Amount</label>
                                <em>(required)</em>
                            </div>
                            <div class="input-style has-borders no-icon input-style-always-active  mb-4">
                                <input type="text" class="form-control" id="charges" placeholder="Charges" readonly>
                                <label for="charges" class="color-highlight">Charges</label>
                                <em>(required)</em>
                            </div>
                            <div class="input-style has-borders no-icon input-style-always-active  mb-4">
                                <input type="text" class="form-control" id="amounttopay" placeholder="You Would Get" readonly>
                                <label for="amounttopay" class="color-highlight">You Would Get</label>
                                <em>(required)</em>
                            </div>

                            <input type="hidden" name="email" value="<?php echo $data->sEmail; ?>" />
                        </div>

                        <div class="text-center"><img src="../../assets/img/paystack.png" /></div>
                        <button type="submit" id="fund-with-paystack" name="fund-with-paystack" style="width: 100%;" class="btn btn-full btn-l font-600 font-15 gradient-highlight mt-4 rounded-s">
                                Pay Now
                        </button>
                        </form>
                        <?php else : ?>
                            <h3 class="text-center text-danger">Opps!! Paystack Payment Is Disabled, Please Contact Admin</h3>
                        <?php endif; ?>
                </div>

                <div data-bs-parent="#tab-group-1" class="collapse" id="tab-3">
                <div class="text-center">
                    <p class="text-center">
                        <span class="icon icon-l gradient-blue shadow-l rounded-sm">
                            <i class="fa fa-arrow-up font-30 color-white"></i>
                        </span>
                    </p>
                    <h4 class="text-primary">FUND WALLET</h4>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b><?php echo $data3->bankname; ?></p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account Name: </b><?php echo $data3->accountname; ?></p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data3->accountno; ?></p>
                    <button class="btn btn-primary form-control font-700 rounded-xl mt-3" onclick="copyToClipboard('<?php echo $data3->accountno; ?>')">Copy Account No</button>
                    <!--<button class="btn btn-success form-control font-700 rounded-xl mt-3" onclick="$('#manual-fund-div').toggle();">Click Here After Payment</button>-->
                    
                   <div class="border shadow mt-2" style="padding:10px; display:none;" id="manual-fund-div">
                        <form  method="post" id="manualfundform">
                        <div class="mt-5 mb-3">
                            
                            <div class="input-style has-borders no-icon input-style-always-active  mb-4">
                                <input type="number" class="form-control" name="payamount" placeholder="Amount Paid" required>
                                <label for="payamount" class="color-highlight">Amount Paid</label>
                                <em>(required)</em>
                            </div>
                            
                            <div class="input-style has-borders no-icon input-style-always-active  mb-4">
                                <input type="text" class="form-control" name="payaccount" placeholder="Account Name And Bank" required>
                                <label for="payaccount" class="color-highlight">Account Name And Bank</label>
                                <em>(required)</em>
                            </div>
                            
                            <div class="input-style has-borders no-icon input-style-always-active  mb-4">
                                <input type="text" class="form-control" name="paymethod" placeholder="Payment Method" required>
                                <label for="paymethod" class="color-highlight">Payment Method</label>
                                <em>(required)</em>
                            </div>
                           

                            <input type="hidden" name="email" value="<?php echo $data->sEmail; ?>" />
                        </div>

                        <button type="submit" id="manual-fund-btn" name="manual-fund-request" style="width: 100%;" class="btn btn-full btn-l font-600 font-15 gradient-highlight mt-4 rounded-s">
                               Send Funding Request
                        </button>
                        </form>
                   </div>
                   
                   <a class="btn btn-info form-control font-700 rounded-xl mt-3" href="https://wa.me/234<?php echo $data3->whatsapp; ?>">Contact Admin</a>
                    
                    
                </div>
                </div>
 <div data-bs-parent="#tab-group-1" class="collapse" id="tab-4">
<?php 

if($controller->getConfigValue($data2,"strowalletStatus") == "On"){
?>

      <div class="text-center ">
          
          
                
                    <!-- Paga START-->
                    <?php if($controller->getConfigValue($data2,"pagaStatus") == "On"): ?>
                    <?php $strowalletCharges = $controller->getConfigValue($data2,"strowalletCharges"); $strowalletChargesType = $controller->getConfigValue($data2,"strowalletChargesType"); ?>
                    <?php $strowalletChargesText = ($strowalletChargesType == "flat") ? "N".$strowalletCharges : $strowalletCharges."%"; ?>
                    <?php if(empty($data5->paga)): ?>
					<h2>Paga</h2>
                        <p class="mb-2 text-danger font-600 font-15">Get A Paga Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $strowalletChargesText; ?> only.</p>
                        <form method="POST" id="banklyform"><input type="hidden" name="generate-strowallet-account" value="paga" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="pagabtn" onclick="$('#pagabtn').removeClass('btn-primary'); $('#pagabtn').addClass('btn-secondary'); $('#pagabtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#banklyform').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Paga</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data5->paga; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $strowalletChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" 
					onclick="copyToClipboard('<?php echo $data5->paga; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- paga END -->
                    <!-- Bankly START-->
                    <?php if($controller->getConfigValue($data2,"banklyStatus") == "On"): ?>
                    <?php $strowalletCharges = $controller->getConfigValue($data2,"strowalletCharges"); $strowalletChargesType = $controller->getConfigValue($data2,"strowalletChargesType"); ?>
                    <?php $strowalletChargesText = ($strowalletChargesType == "flat") ? "N".$strowalletCharges : $strowalletCharges."%"; ?>
                    <?php if(empty($data5->bankly)): ?>
					<h2>Bankly</h2>
                        <p class="mb-2 text-danger font-600 font-15">Get A bankly Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $strowalletChargesText; ?> only.</p>
                        <form method="POST" id="banklyformStrowallet"><input type="hidden" name="generate-strowallet-account" value="bankly" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="banklybtn-strowallet" onclick="$('#banklybtn-strowallet').removeClass('btn-primary'); $('#banklybtn-strowallet').addClass('btn-secondary'); $('#banklybtn-strowallet').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#banklyformStrowallet').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>bankly MFB</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data5->bankly; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $strowalletChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" 
					onclick="copyToClipboard('<?php echo $data5->bankly; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- BANKLY END -->



<!-- safehaven START-->
                    <?php if($controller->getConfigValue($data2,"safehavenStatus") == "On"): ?>
                    <?php $strowalletCharges = $controller->getConfigValue($data2,"strowalletCharges"); $strowalletChargesType = $controller->getConfigValue($data2,"strowalletChargesType"); ?>
                    <?php $strowalletChargesText = ($strowalletChargesType == "flat") ? "N".$strowalletCharges : $strowalletCharges."%"; ?>
                    <?php if(empty($data5->safehaven)): ?>
					<h2>Safe Haven</h2>
                        <p class="mb-2 text-danger font-600 font-15">Get A Safe Haven Account For Automated Transfer, Generate A Dedicated Account Number Now. Funding Attracts <?php echo $strowalletChargesText; ?> only.</p>
                        <form method="POST" id="banklyform"><input type="hidden" name="generate-strowallet-account" value="safehaven" /></form>
                        <button class="btn btn-primary font-700 rounded-xl mt-3" id="safehavenbtn" onclick="$('#safehavenbtn').removeClass('btn-primary'); $('#safehavenbtn').addClass('btn-secondary'); $('#safehavenbtn').html('<i class=\'fa fa-spinner fa-spin\'></i> Processing ...'); $('#banklyform').submit();">Generate Account</button>
                    <?php else: ?>
                    <p class="mb-2 text-dark font-600 font-16"><b>Bank Name: </b>Safehaven MFB</p>
                    <p class="mb-2 text-dark font-600 font-16"><b>Account No: </b><?php echo $data5->safehaven; ?></p>
                    <p class="mb-2 text-danger font-600 font-15"><b>Note: </b> Automated bank transfer attracts additional charges of <?php echo $strowalletChargesText; ?> only.</p>
                    <button class="btn btn-primary font-700 rounded-xl mt-3" 
					onclick="copyToClipboard('<?php echo $data5->safehaven; ?>')">Copy Account No</button>
                    <?php endif; ?>
                    <hr/>
                    <?php endif; ?>
                    <!-- safehaven END -->



</div>


<?php 

}
?>

     </div>
                
                
            </div>
        </div> 

</div>

