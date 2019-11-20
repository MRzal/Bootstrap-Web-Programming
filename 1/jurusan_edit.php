<?php

include "../koneksi.php";

$Kode_Jurusan			= $_POST["Kode_Jurusan"];
$Nama_Ekstrakurikuler	= $_POST["Nama_Ekstrakurikuler"];
$Kode_Jenjang_Jrs		= $_POST["Kode_Jenjang_Jrs"];

if($edit = mysqli_query($konek, "UPDATE Ekstrakurikuler SET Nama_Ekstrakurikuler='$Nama_Ekstrakurikuler', Kode_Jenjang_Jrs='$Kode_Jenjang_Jrs' WHERE Kode_Jurusan='$Kode_Jurusan'")){
	header("Location: jurusan.php");
	exit();
}
die ("Terdapat Kesalahan : ". mysqli_error($konek));

?>