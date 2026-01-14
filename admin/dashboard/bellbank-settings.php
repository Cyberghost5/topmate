<div class="row">
    <div class="col-12">
        <div class="box">
            <div class="box-header with-border d-flex align-items-center justify-content-between">
                <h4 class="box-title">Bellbank API</h4>

                <div>
                    <a class="btn btn-info btn-sm btn-rounded text-white ml-2" href="configurations">
                        <i class="fa fa-plug" aria-hidden="true"></i> Back
                    </a>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <form method="post" class="form-submit">
                    <div class="form-group">
                        <label for="bellbankApiToken" class="control-label">UnitedApi API Key</label>
                        <div class="">
                            <input type="password" name="bellbankApiToken" 
                                   value="<?php echo $controller->getConfigValue($data, 'bellbankApiToken'); ?>" 
                                   class="form-control" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bellbankChargesType" class="control-label">Topup Charges Type</label>
                        <div class="">
                            <select name="bellbankChargesType" class="form-control" required="required">
                                <?php if ($controller->getConfigValue($data, "bellbankChargesType") == "flat"): ?>
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
                        <label for="bellbankCharges" class="control-label">Wallet Topup Charges</label>
                        <div class="">
                            <input type="text" name="bellbankCharges" 
                                   pattern="^\d*(\.\d{0,3})?$" 
                                   value="<?php echo $controller->getConfigValue($data, 'bellbankCharges'); ?>" 
                                   class="form-control" required="required">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bellbankStatus" class="control-label">Bellbank Activation</label>
                        <div class="">
                            <select name="bellbankStatus" class="form-control" required="required">
                                <?php if ($controller->getConfigValue($data, "bellbankStatus") == "On"): ?>
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
                            <button type="submit" name="update-bellbank-config" 
                                    class="btn btn-info btn-submit">
                                <i class="fa fa-save" aria-hidden="true"></i> Update Details
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
</div>
