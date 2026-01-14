<?php 
// Retrieve charges from controller
$charges1 = $controller->getConfigValue($data, "CACcharge1"); 
$charges2 = $controller->getConfigValue($data, "CACcharge2"); 
$submittedBusinesses = !empty($data2) ? $data2 : null;
?>
<div class="page-content header-clear-medium">
    <div class="card card-style">
        <div class="content">
            <div class="text-center mb-3"><img src="../../assets/images/cac.png" width="50" alt="Company Logo" /></div>
            <p class="text-center mb-0 font-600 color-highlight">Register Your Business With CAC </p>
            <h1 class="text-center mb-3">CAC Registration</h1>
            
            <div class="mt-5">
                <form method="post" enctype="multipart/form-data" class="contactForm the-submit-form" id="registrationForm">
                    <fieldset>
                        <!-- Certificate Type -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="certType" class="color-theme opacity-80 font-700 font-12">Certificate Type</label>
                            <select id="certType" name="certType" required>
                                <option value="" disabled selected>Certificate Type</option>
                                <option value="biz" charge="<?php echo $charges1; ?>">
                                    Business Name (<?php echo "N" . number_format($charges1); ?>)
                                </option>
                                <option value="limited" charge="<?php echo $charges2; ?>">
                                    Limited Liability (<?php echo "N" . number_format($charges2); ?>)
                                </option>
                            </select>
                            <span><i class="fa fa-chevron-down"></i></span>
                            <i class="fa fa-check disabled valid color-green-dark"></i>
                            <i class="fa fa-check disabled invalid color-red-dark"></i>
                            <em></em>
                        </div>
                        
                        <!-- Business Name 1 -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="comp_name" class="color-theme opacity-80 font-700 font-12">Business Name 1</label>
                            <input type="text" id="comp_name" name="comp_name" placeholder="Business Name 1" class="round-small" required />
                        </div>

                        <!-- Business Name 2 -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="alt_comp_name" class="color-theme opacity-80 font-700 font-12">Business Name 2</label>
                            <input type="text" id="alt_comp_name" name="alt_comp_name" placeholder="Business Name 2" class="round-small" required />
                        </div>

                        <!-- Company Address -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="comp_addr" class="color-theme opacity-80 font-700 font-12">Company Address</label>
                            <input type="text" id="comp_addr" name="comp_addr" placeholder="Company Address" class="round-small" required />
                        </div>

                        <!-- Residential Address -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="res_addr" class="color-theme opacity-80 font-700 font-12">Residential Address</label>
                            <input type="text" id="res_addr" name="res_addr" placeholder="Residential Address" class="round-small" required />
                        </div>

                        <!-- Nature of Business -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="bus_nature" class="color-theme opacity-80 font-700 font-12">Nature of Business</label>
                            <input type="text" id="bus_nature" name="bus_nature" placeholder="Nature of Business" class="round-small" required />
                        </div>

                        <!-- Share Capital -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="share_cap" class="color-theme opacity-80 font-700 font-12">Share Capital</label>
                            <input type="text" id="share_cap" name="share_cap" placeholder="Share Capital" class="round-small" />
                        </div>

                        <!-- ID Card of Directors -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="dir_id_card" class="color-theme opacity-80 font-700 font-12">ID Card of Directors</label>
                            <input type="file" id="dir_id_card" name="dir_id_card" class="round-small form-control" accept="image/*" required />
                        </div>

                        <!-- Passport Photograph -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="passport_photo" class="color-theme opacity-80 font-700 font-12">Passport Photograph</label>
                            <input type="file" id="passport_photo" name="passport_photo" class="round-small form-control" accept="image/*" required />
                        </div>

                        <!-- Phone Number -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="phone_num" class="color-theme opacity-80 font-700 font-12">Phone Number</label>
                            <input type="number" id="phone_num" name="phone_num" placeholder="Phone Number" class="round-small" required />
                        </div>

                        <!-- Email Address -->
                        <div class="input-style input-style-always-active has-borders validate-field">
                            <label for="email" class="color-theme opacity-80 font-700 font-12">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="Email Address" class="round-small" required />
                        </div>

                        <!-- Submit Button -->
                        <div class="form-button">
                            <button type="submit" name="register-business" style="width: 100%;" class="the-form-btn btn btn-full btn-l font-600 font-15 gradient-highlight mt-4 rounded-s">
                                Submit Details
                            </button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

        <!-- Submitted Businesses -->
        <div class="container m-3">
            <div class="center btn btn-success mb-5">Submitted Businesses</div>
            <?php if ($submittedBusinesses): ?>
                <?php foreach ($submittedBusinesses as $list): 
                    // Determine the certificate type
                    $type = $list->certType == "biz" ? "Business Name Registration" : "Limited Liability Registration";
                    $statusClass = strtolower($list->status) === 'pending' ? 'text-primary' : (strtolower($list->status) === 'rejected' ? 'text-danger' : 'text-success');
                ?>
                <div class="d-flex">
                    <div class="align-self-center">
                        <span class="icon icon-s gradient-green color-white rounded-sm shadow-xxl">
                            <img src="../../assets/images/cac.png" style="width:50px; height:50px;" alt="CAC Logo" /> 
                        </span>
                    </div>
                    <div class="align-self-center">
                        <h6 class="ps-3 font-12 mt-3 color-theme opacity-70">
                            <b><?php echo $type; ?></b><br>
                            <?php echo $list->comp_name; ?>, <?php echo $list->alt_comp_name; ?>
                        </h6>
                    </div>
                    <div class="ms-auto text-end align-self-center">
                        <h5 class="font-15 font-700 d-block mb-n1 <?php echo $statusClass; ?>">
                            <?php echo $list->status; ?>
                        </h5>
                        <span class="color-green-dark font-10">
                            <?php echo $controller->formatDate2($list->submit_date); ?> 
                            <i class="fa fa-check-circle"></i>
                        </span>
                    </div>
                </div> 
                <p class="text-danger"><b>PROCESS: Your CAC is <?php echo $list->status; ?>: </b> <?php echo $list->note; ?>.</p>
                <div class="divider my-3"></div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>No submitted businesses found.</p>
            <?php endif; ?>
        </div>
    </div>
</div>
