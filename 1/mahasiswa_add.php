<?php
include "../koneksi.php";

$NIM 				= $_POST["NIM"];
$Nama_Mahasiswa		= $_POST["Nama_Mahasiswa"];
$Tanggal_Lahir 		= $_POST["Tanggal_Lahir"];
$JK 				= $_POST["JK"];
$Alamat 			= $_POST["Alamat"];
$No_Telp 			= $_POST["No_Telp"];
$Ekstrakurikuler 	= $_POST["Ekstrakurikuler"];

if ($add = mysqli_query($konek, "INSERT INTO Siswa (NIM, Nama_Mahasiswa, Tanggal_Lahir, JK, Alamat, No_Telp, Ekstrakurikuler) VALUES 
	('$NIM', '$Nama_Mahasiswa', '$Tanggal_Lahir', '$JK', '$Alamat', '$No_Telp', '$Ekstrakurikuler')")){
		header("Location: mahasiswa.php");
		exit();
	}
die ("Terdapat kesalahan : ". mysqli_error($konek));

?>