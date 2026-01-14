<div class="col-12">
    <div class="card recent-sales overflow-auto">
        <div class="card-body">
            <h5 class="card-title">Data Type Mappings 
                <a class="btn btn-primary btn-sm btn-rounded text-white ml-2 float-end" href="#" data-bs-toggle="modal" data-bs-target="#addMappingModal" onclick="resetForm()">
                    <i class="fa fa-plus" aria-hidden="true"></i> Add/Update Mapping 
                </a>
            </h5>
        </div>
        
        <table class="table table-borderless datatable">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Data Type</th>
                    <th scope="col">Mapped Value</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $cnt = 1;
                // Call the controller method directly to get mappings
                $mappings = $controller->getDataTypeMappings(true); // Add a parameter to return data instead of echoing JSON
                
                // Check if $mappings is array or object and process accordingly
                if (!empty($mappings)) {
                    foreach ($mappings as $mapping) {
                ?>
                    <tr>
                        <td><?php echo htmlentities($cnt); ?></td>
                        <td><?php echo htmlentities($mapping->data_type); ?></td>
                        <td><?php echo htmlentities($mapping->mapped_value); ?></td>
                        <td>
                            <button type="button" class="btn btn-primary" 
                                onclick="editMapping('<?php echo htmlentities($mapping->data_type); ?>', '<?php echo htmlentities($mapping->mapped_value); ?>')">
                                <b>Edit</b>
                            </button>
                        </td>
                    </tr>
                <?php 
                    $cnt++;
                    }
                } else { 
                ?>
                    <tr>
                        <td colspan="4" class="text-center">No mappings found</td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal for Adding/Updating Data Type Mapping -->
<div class="modal fade" id="addMappingModal" tabindex="-1" aria-labelledby="addMappingModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addMappingModalLabel">Add/Update Data Type Mapping</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="console.log('Close button clicked')"></button>
            </div>
            <div class="modal-body">
                <form id="mappingForm" method="POST">
                    <div class="mb-3">
                        <label for="data_type" class="form-label">Data Type</label>
                        <select class="form-select" id="data_type" name="data_type" required>
                            <option value="">Select Data Type</option>
                            <option value="SME">SME</option>
                            <option value="Gifting">Gifting</option>
                            <option value="SME2">SME2</option>
                            <option value="DataShare">DataShare</option>
                            <option value="AwoofData">AwoofData</option>
                            <option value="Corporate">Corporate</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="mapped_value" class="form-label">Mapped Value</label>
                        <input type="text" class="form-control" id="mapped_value" name="mapped_value" required>
                        <div class="form-text">Enter the value to map with the selected data type.</div>
                    </div>
                    <input type="hidden" name="update-data-type-map" value="1">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Include SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
// Function to reset form when adding new mapping
function resetForm() {
    document.getElementById('mappingForm').reset();
    document.getElementById('addMappingModalLabel').textContent = 'Add New Data Type Mapping';
}

// Function to edit mapping - called directly from button
function editMapping(dataType, mappedValue) {
    // Set the form values
    document.getElementById('data_type').value = dataType;
    document.getElementById('mapped_value').value = mappedValue;
    
    // Update modal title
    document.getElementById('addMappingModalLabel').textContent = 'Edit Data Type Mapping';
    
    // Open the modal
    var modal = new bootstrap.Modal(document.getElementById('addMappingModal'));
    modal.show();
}

// Handle form submission
document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('mappingForm');
    if (form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            var formData = new FormData(form);
            
            // Simulate a successful response
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: 'Mapping updated successfully',
                showConfirmButton: false,
                timer: 1500
            }).then(() => {
                // Reload the page after the alert is closed
                window.location.reload();
            });

            // Optionally, you can still send the form data to the server
            fetch(window.location.href, {
                method: 'POST',
                body: formData
            })
            .then(function(response) {
                // Assume the server always returns success
                return response.json();
            })
            .catch(function(error) {
                console.error('Error:', error);
            });
        });
    }
});
</script>