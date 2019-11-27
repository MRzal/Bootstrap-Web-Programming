<?php

include "../koneksi.php";

$Id_User	= $_GET["Id_User"];

$queryuser = mysqli_query($konek, "SELECT * FROM User WHERE Id_User='$Id_User'");
if($queryuser == false){
	die ("Terjadi Kesalahan : ". mysqli_error($konek));
}
while($user = mysqli_fetch_array($queryuser)){

?>
	
<!-- Modal Popup User -->
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">Edit User</h4>
					</div>

					<div class="modal-body">
						<form action="user_edit.php" name="modal_popup" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label>Id User</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-id-card"></i>
										</div>
										<input name="Id_User" type="" class="form-control" value="<?php echo $user["Id_User"]; ?>" readonly />
									</div>
							</div>

					<div class="modal-body">
						<form action="user_edit.php" name="modal_popup" enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label>Username</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-user"></i>
										</div>
										<input name="Username" type="text" class="form-control" value="<?php echo $user["Username"]; ?>"/>
									</div>
							</div>
							<div class="form-group">
								<label>Password</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-key"></i>
										</div>
										<input name="Password" type="text" class="form-control" value="<?php echo $user["Password"]; ?>">
									</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-success" type="submit">
									Save
								</button>
								<button type="reset" class="btn btn-danger"  data-dismiss="modal" aria-hidden="true">
									Cancel
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			
			
<?php
			}

?>