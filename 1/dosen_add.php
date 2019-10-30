<?php
include "../koneksi.php";

$NIP 			= $_POST["NIP"];
$Nama_Guru	 	= $_POST["Nama_Guru"];
$Tanggal_Lahir 	= $_POST["Tanggal_Lahir"];
$JK 			= $_POST["JK"];
$Alamat 		= $_POST["Alamat"];
$No_Telp 		= $_POST["No_Telp"];

if ($add = mysqli_query($konek, "INSERT INTO Guru (NIP, Nama_Guru, Tanggal_Lahir, JK, Alamat, No_Telp) VALUES 
	('$NIP', '$Nama_Guru', '$Tanggal_Lahir', '$JK', '$Alamat', '$No_Telp')")){
		header("Location: dosen.php");
		exit();
	}
die ("Terdapat kesalahan : ". mysqli_error($konek));

?>