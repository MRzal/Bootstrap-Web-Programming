<?php

include "../koneksi.php";

$NIM 				= $_POST["NIM"];
$Nama_Mahasiswa		= $_POST["Nama_Mahasiswa"];
$Tanggal_Lahir		= $_POST["Tanggal_Lahir"];
$JK					= $_POST["JK"];
$No_Telp			= $_POST["No_Telp"];
$Alamat				= $_POST["Alamat"];
$Ekstrakurikuler	= $_POST["Ekstrakurikuler"];

if($edit = mysqli_query($konek, "UPDATE Siswa SET Nama_Mahasiswa='$Nama_Mahasiswa', Tanggal_Lahir='$Tanggal_Lahir', JK='$JK', 
	No_Telp='$No_Telp', Alamat='$Alamat', Ekstrakurikuler='$Ekstrakurikuler' WHERE NIM='$NIM'")){
		header("Location: mahasiswa.php");
		exit();
	}
die("Terdapat Kesalahan : ".mysqli_error($konek));

?>