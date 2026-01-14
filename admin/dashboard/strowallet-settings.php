<div class="row">
<div class="col-12">
    
    <div class="box">
        <div class="box-header with-border d-flex align-items-center justify-content-between">
            <h4 class="box-title">Strowallet API</h4>

            <div>
                        <a class="btn btn-info btn-sm btn-rounded text-white ml-2" href="configurations">
                            <i class="fa fa-plug" aria-hidden="true"></i> Back
                        </a>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
        <form  method="post" class="form-submit">
                    
                <div class="form-group">
                    <label for="success" class="control-label">Strowallet Public Key </label>
                    <div class="">
                    <input type="text" name="strowalletPublicKey" value="<?php echo $controller->getConfigValue($data,"strowalletPublicKey"); ?>" class="form-control" required="required">
                    </div>
                </div>
               
               
                <div class="form-group">
                    <label for="success" class="control-label">Topup Charges Type</label>
                    <div class="">
                        <select name="strowalletChargesType" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"strowalletChargesType") == "flat"): ?>
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
                    <label for="success" class="control-label">Wallet Topup Charges</label>
                    <div class="">
                    <input type="text" name="strowalletCharges" pattern="^\d*(\.\d{0,3})?$" value="<?php echo $controller->getConfigValue($data,"strowalletCharges"); ?>" class="form-control" required="required">
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="success" class="control-label">Site Webhook URL</label>
                    <div class="">
                    <input type="text" name="strowalletWebhookUrl" value="<?php echo $controller->getConfigValue($data,"strowalletWebhookUrl"); ?>" class="form-control" required="required">
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="success" class="control-label">Strowallet Activation</label>
                    <div class="">
                        <select name="strowalletStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"strowalletStatus") == "On"): ?>
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
                    <label for="success" class="control-label">Paga Activation</label>
                    <div class="">
                        <select name="pagaStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"pagaStatus") == "On"): ?>
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
                    <label for="success" class="control-label">Bankly Activation</label>
                    <div class="">
                        <select name="banklyStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"banklyStatus") == "On"): ?>
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
                    <label for="success" class="control-label">Safehaven Activation</label>
                    <div class="">
                        <select name="safehavenStatus" class="form-control" required="required">
                        <?php if($controller->getConfigValue($data,"safehavenStatus") == "On"): ?>
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
                       <button type="submit" name="update-strowallet-config" class="btn btn-info btn-submit"><i class="fa fa-save" aria-hidden="true"></i> Update Details</button>
                    </div>
                </div>
        </form>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
</div>
</div>



