<?php

include "../koneksi.php";

$Kode_Jurusan 			= $_POST["Kode_Jurusan"];
$Nama_Ekstrakurikuler	= $_POST["Nama_Ekstrakurikuler"];
$Kode_Jenjang_Jrs		= $_POST["Kode_Jenjang_Jrs"];

if($add = mysqli_query($konek, "INSERT INTO Ekstrakurikuler (Kode_Jurusan, Nama_Ekstrakurikuler, Kode_Jenjang_Jrs) VALUES ('$Kode_Jurusan', '$Nama_Ekstrakurikuler', '$Kode_Jenjang_Jrs')")){
	header("Location: jurusan.php");
	exit();
}
die ("Terdapat Kesalahan : ". mysqli_error($konek));

?>