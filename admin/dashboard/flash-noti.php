<div class="row">
    <div class="col-12">
    
                
        <div class="box">
            <div class="box-header with-border d-flex align-items-center justify-content-between">
              <h4 class="box-title">All Flash Notification</h4>
			  <a class="btn btn-success btn-rounded text-white" data-toggle="modal" data-target="#addNotification">
				  <i class="fa fa-plus" aria-hidden="true"></i> Add New
			  </a>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
				<div class="table-responsive">
				  <table id="example1" class="table table-sm table-bordered table-striped">
					<thead>
						<tr>
							<th>#</th>
			                <th>Suject</th>
			            
			                <th>Message</th>
			                <th>Action</th>
						</tr>
					</thead>
					<tbody>
					
					<?php 
                        $cnt=1; $results=$data[1];
                        if($results <> "" && $results <> 1){foreach($results as $result){   ?>
                        <tr>
                            <td><?php echo htmlentities($cnt);?></td>
                            <td><?php echo htmlentities($result->subject);?></td>
                            
                            <td><?php echo htmlentities($result->message);?></td>
                            <td>
                                <a href="#" onclick="deleteFlashNoti(<?php echo $result->msgId;?>)" class="btn btn-danger"><i class="fa fa-trash"></i></a> 
						                </td>
                            </tr>
                        <?php $cnt=$cnt+1;}} ?>
						
					</tbody>
					</table>
				</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
    </div>
</div>

<!-- Add Category Modal -->
<div class="modal fade" data-backdrop="false" id="addNotification" tabindex="-1">
				  <div class="modal-dialog modal-lg">
					<div class="modal-content border">
					  <div class="modal-header bg-info">
						<h5 class="modal-title">Add New Flash</h5>
					</div>
					  <div class="modal-body">
					  <form  method="post" class="form-submit">

                        <div class="form-group">
                            <label for="success" class="control-label">Title</label>
                            <div class="">
                            <input type="text" placeholder="Subject" name="subject" class="form-control" required="required" id="success">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="success" class="control-label">Flash Message</label>
                            <div class="">
                            <textarea rows="4" placeholder="Message" name="message" class="form-control" required="required" id="success"></textarea>
                            </div>
                        </div>

                       <div class="form-group">
                        <div class="d-flex justify-content-between">
                           <button type="submit" name="add-flash-noti" class="btn btn-info btn-submit"><i class="fa fa-plus" aria-hidden="true"></i> Add Flash Message</button>
						   <button type="button" class="btn btn-bold btn-pure btn-secondary" data-dismiss="modal">Close</button>
						</div>
                        </div>
                      </form>
					  </div>
					</div>
				  </div>
</div>
<!-- /.modal -->

<!-- Edit Category Modal -->
<div class="modal modal-fill fade" data-backdrop="false" id="editCategory" tabindex="-1">
				  <div class="modal-dialog">
					<div class="modal-content border">
					  <div class="modal-header bg-info">
						<h5 class="modal-title">Edit Category</h5>
					</div>
					  <div class="modal-body">
					  <form  method="post" class="form-submit">

                        <div class="form-group">
                            <label for="success" class="control-label">Category Name</label>
                            <div class="">
                            <input type="text" placeholder="Category" name="category" class="form-control" required="required" id="category">
                            <input type="hidden" name="catid" id="catid" />
                        </div>
                        </div>

                       <div class="form-group">
                        <div class="d-flex justify-content-between">
                           <button type="submit" name="update-faq" class="btn btn-info btn-submit"><i class="fa fa-save" aria-hidden="true"></i> Update Category</button>
						   <button type="button" class="btn btn-bold btn-pure btn-secondary" data-dismiss="modal">Close</button>
						</div>
                        </div>
                      </form>
					  </div>
					</div>
				  </div>
</div>
<!-- /.modal -->


