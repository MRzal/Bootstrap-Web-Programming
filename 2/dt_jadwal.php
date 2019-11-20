				<thead>
					<tr>
						<th>Mata Pelajaran</th>
						<th>Guru</th>
						<th>Ruangan</th>
						<th>Hari</th>
						<th>Jam</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$queryjadwal = mysqli_query ($konek, "SELECT Id_Jadwal, Kode_Matakuliah_Jadwal, NIP_Jadwal, Kode_Ruangan_Jadwal, Hari,
							Jam, Kode_Matakuliah, Nama_Matakuliah, NIP, Nama_Guru, Kode_Ruangan, Nama_Ruangan, Kode_Jurusan FROM jadwal 
							INNER JOIN Matapelajaran ON Kode_Matakuliah_Jadwal=Kode_Matakuliah
							INNER JOIN Guru ON NIP_Jadwal=NIP
							INNER JOIN ruangan ON Kode_Ruangan_Jadwal=Kode_Ruangan
							INNER JOIN Ekstrakurikuler ON Kode_Jurusan_Jadwal=Kode_Jurusan WHERE NIP_Jadwal='$_SESSION[Username]'");
						if($queryjadwal == false){
							die ("Terjadi Kesalahan : ". mysqli_error($konek));
						}
						while ($jadwal = mysqli_fetch_array ($queryjadwal)){
							
							echo "
								<tr>
									<td>$jadwal[Nama_Matakuliah]</td>
									<td>$jadwal[Nama_Guru]</td>
									<td>$jadwal[Nama_Ruangan]</td>
									<td>$jadwal[Hari]</td>
									<td>$jadwal[Jam]</td>
								</tr>";
						}
					?>
				</tbody>