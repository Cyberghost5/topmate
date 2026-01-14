

<div class="d-flex justify-content-between">
    <a class="btn btn-success btn-block mr-2" href="api-setting">General Setting</a> 
    <a class="btn btn-primary btn-block ml-2 mt-0" href="monnify-setting">Monnify Setting</a>
	 <a class="btn btn-warning btn-block ml-2 mt-0" href="billstack-setting">Billstack Setting</a>
    <a class="btn btn-info btn-block ml-4 mt-0" href="paystack-setting">Paystack Setting</a>
</div>
<hr/>
<div class="row">
<div class="col-12">
    
    <div class="box">
        <div class="box-header with-border">
          <h4 class="box-title">Billstack API Settings</h4>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
        <form  method="post" class="form-submit">
                    
                <div class="form-group">
                    <label for="success" class="control-label">Billstack Public Key</label>
                    <div class="">
                    <input type="text" name="billstackPublicKey" value="<?php echo $controller->getConfigValue($data,"billstackPublicKey"); ?>" class="form-control" required="required">
                    </div>
                </div>
                <div class="form-group">
                    <label for="success" class="control-label">Billstack Secret Key</label>
                    <div class="">
                    <input type="text" name="billstackSecretKey" value="<?php echo $controller->getConfigValue($data,"billstackSecretKey"); ?>" class="form-control" required="required">
                    </div>
                </div>
               
                <div class="form-group">
                    <label for="success" class="control-label">Wallet Topup Charges (In Percentage %)</label>
                    <div class="">
                    <input type="text" name="billstackCharges" pattern="^\d*(\.\d{0,3})?$" value="<?php echo $controller->getConfigValue($data,"billstackCharges"); ?>" class="form-control" required="required">
                    </div>
                </div>
                
                
                  <div class="form-group">
                    <label for="success" class="control-label">Topup Charges Type</label>
                    <div class="">
                        <select name="billstackChargesType" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"billstackChargesType") == "flat"): ?>
                            <option value="flat" selected>Flat Rate</option>
                            <option value="per">Percentage</option>
                        <?php else: ?>
                            <option value="flat">Flat Rate</option>
                            <option value="per" selected>Percentage</option>
                        <?php endif; ?>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="success" class="control-label">Billstack Activation</label>
                    <div class="">
                        <select name="billstackStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"billstackStatus") == "On"): ?>
                            <option value="On" selected>On</option>
                            <option value="Off">Off</option>
                        <?php else: ?>
                            <option value="On">On</option>
                            <option value="Off" selected>Off</option>
                        <?php endif; ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="success" class="control-label">9BSB Bank Activation</label>
                    <div class="">
                        <select name="billstack9PSBStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"billstack9PSBStatus") == "On"): ?>
                            <option value="On" selected>On</option>
                            <option value="Off">Off</option>
                        <?php else: ?>
                            <option value="On">On</option>
                            <option value="Off" selected>Off</option>
                        <?php endif; ?>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="success" class="control-label">Palmpay Activation</label>
                    <div class="">
                        <select name="billstackPalmpayStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"billstackPalmpayStatus") == "On"): ?>
                            <option value="On" selected>On</option>
                            <option value="Off">Off</option>
                        <?php else: ?>
                            <option value="On">On</option>
                            <option value="Off" selected>Off</option>
                        <?php endif; ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="success" class="control-label">SAFEHAVEN Activation</label>
                    <div class="">
                        <select name="billstackSHStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"billstackSHStatus") == "On"): ?>
                            <option value="On" selected>On</option>
                            <option value="Off">Off</option>
                        <?php else: ?>
                            <option value="On">On</option>
                            <option value="Off" selected>Off</option>
                        <?php endif; ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="success" class="control-label">Bankly Bank Activation</label>
                    <div class="">
                        <select name="billstackBanklyStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"billstackBanklyStatus") == "On"): ?>
                            <option value="On" selected>On</option>
                            <option value="Off">Off</option>
                        <?php else: ?>
                            <option value="On">On</option>
                            <option value="Off" selected>Off</option>
                        <?php endif; ?>
                        </select>
                    </div>
                </div>

                 

                <div class="form-group">
                    <div class="">
                       <button type="submit" name="update-billstack-config" class="btn btn-info btn-submit"><i class="fa fa-save" aria-hidden="true"></i> Update Details</button>
                    </div>
                </div>
        </form>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
</div>
</div>



