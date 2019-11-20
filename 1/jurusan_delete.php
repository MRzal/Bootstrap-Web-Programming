<?php

include "../koneksi.php";

$Kode_Jurusan	= $_GET["Kode_Jurusan"];

if($delete = mysqli_query($konek, "DELETE FROM Ekstrakurikuler WHERE Kode_Jurusan='$Kode_Jurusan'")){
	header("Location: jurusan.php");
	exit();
}
die("Terdapat Kesalahan : ". mysqli_error($konek));

?>