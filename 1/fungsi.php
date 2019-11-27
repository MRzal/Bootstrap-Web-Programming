<?php 
	function connect_to_db(){
		$conn= mysqli_connect("localhost", "root", "", "kuliah");

		if($conn == false){
			echo mysqli_connect_error();
			die();
		} else {
			return $conn;
		}
    }
    
    function get_rekap_asal(){

		$conn = connect_to_db();
		$sql = "SELECT COUNT(*) as num, alamat FROM kuliah GROUP BY alamat";

		$query = mysqli_query($conn, $sql);
		$data = [];
		while($row = mysqli_fetch_array($query)){
			$data[$row['alamat']] = $row['num'];
		}

		$total = array_sum($data);
		foreach ($data as $alamat => $num) {
			$data[$alamat] = round($num*100/$total,2);
		}

		return $data;
    }
?>