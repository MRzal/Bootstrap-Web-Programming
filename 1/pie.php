	<center><div id="canvas-holder" style="width:30%" ></center>

	<div id="canvas-holder" style="width:100%;">
		<canvas id="chart-area"></canvas>
	</div>

	<?php

	$sql = "SELECT COUNT(*) as num, Alamat FROM siswa GROUP BY Alamat";

	$query = mysqli_query($konek, $sql);
	$data = [];
	while($row = mysqli_fetch_array($query)){
	$data[$row['Alamat']] = $row['num'];
	}

	$total = array_sum($data);
	foreach ($data as $alamat => $num) {
	$data[$alamat] = round($num*100/$total,2);
}
    
	$color = ['red', 'orange', 'yellow',  'green','blue', 'black'];
	$str_value = implode(",", array_values($data));

	$i = 0;
	foreach($data as $asal => $presentase){

	$str_color[] = "window.chartColors.".$color[$i];
	$str_kota[] = $asal;
	$i++;
	}
	?>
	
	<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
	<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
	<script>
		

		var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						<?= $str_value; ?>
					],
					backgroundColor: [
						<?= implode(",", $str_color); ?>
					],
					label: 'Dataset 1'
				}],
				labels: [
					'<?= implode("','", $str_kota); ?>'
				]
			},
			options: {
				responsive: true
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		};
	</script>



<!-- 
function get_rekap_asal()
{
    $konek = connect_to_db();
    $sql = "SELECT COUNT(*) as num,alamat from mahasiswa GROUP BY alamat";
    $query = mysqli_query($konek,$sql);

    $data = array();
    while($row = mysqli_fetch_array($query))
    {
        $data[$row['alamat']] = $row['num'];
    }

    $total = array_sum($data);
    foreach($data as $alamat => $num)
    {
        $data[$alamat] = round($num+100/$total,2);
    }
    return $data;
}
-->