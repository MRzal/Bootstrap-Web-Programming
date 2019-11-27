				<thead>
					<tr>
						<th>Id User</th>
						<th>Username</th>
						<th>Usergroup</th>
						<th>Password</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$queryuser = mysqli_query ($konek, "SELECT Id_User, Username, Id_Usergroup_User, Nama_Usergroup, Password FROM user INNER JOIN usergroup ON Id_Usergroup_User=Id_Usergroup");
						if($queryuser == false){
							die ("Terjadi Kesalahan : ". mysqli_error($konek));
						}
						while ($user = mysqli_fetch_array ($queryuser)){
							
							echo "
								<tr>
									<td>$user[Id_User]</td>
									<td>$user[Username]</td>
									<td>$user[Nama_Usergroup]</td>
									<td>$user[Password]</td>
									<td>
								";
								if($user["Id_User"]==$_SESSION["Id_User"]){
									echo "
										<a href='#'>Disable</a>";
								}else{
									echo "
									<a href='#' onClick='confirm_delete(\"user_delete.php?Id_User=$user[Id_User]\")'>Delete</a> |
									<a href='#' class='open_modal' id='$user[Id_User]'>Edit</a>";
								}
							echo
								"
									</td>
								</tr>";
						}
					?>
				</tbody>