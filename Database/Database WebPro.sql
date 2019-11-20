-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.34-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ids_akademik
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ ids_akademik;
USE ids_akademik;

--
-- Table structure for table `ids_akademik`.`ekstrakurikuler`
--

DROP TABLE IF EXISTS `ekstrakurikuler`;
CREATE TABLE `ekstrakurikuler` (
  `Kode_Jurusan` varchar(50) NOT NULL,
  `Nama_Ekstrakurikuler` varchar(50) DEFAULT NULL,
  `Kode_Jenjang_Jrs` varchar(50) NOT NULL,
  PRIMARY KEY (`Kode_Jurusan`),
  KEY `FK_jurusan_jenjang` (`Kode_Jenjang_Jrs`),
  CONSTRAINT `FK_jurusan_jenjang1` FOREIGN KEY (`Kode_Jenjang_Jrs`) REFERENCES `jenjang` (`Kode_Jenjang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`ekstrakurikuler`
--

/*!40000 ALTER TABLE `ekstrakurikuler` DISABLE KEYS */;
INSERT INTO `ekstrakurikuler` (`Kode_Jurusan`,`Nama_Ekstrakurikuler`,`Kode_Jenjang_Jrs`) VALUES 
 ('KE01','Pramuka','K1'),
 ('KE02','Paduan Suara','K4'),
 ('KE03','Tari','K4'),
 ('KE04','Seni Musik','K4'),
 ('KE05','Bola Voli','K4'),
 ('KE06','Qiroah','K4'),
 ('KE07','Hadroh','K4'),
 ('KE08','Palang Merah Remaja','K4'),
 ('KE09','Kaligrafi','K4'),
 ('KE10','Sepakbola','K4');
/*!40000 ALTER TABLE `ekstrakurikuler` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`guru`
--

DROP TABLE IF EXISTS `guru`;
CREATE TABLE `guru` (
  `NIP` varchar(50) NOT NULL,
  `Nama_Guru` varchar(50) DEFAULT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `JK` enum('L','P') NOT NULL,
  `No_Telp` varchar(50) NOT NULL,
  `Alamat` varchar(150) NOT NULL,
  PRIMARY KEY (`NIP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`guru`
--

/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
INSERT INTO `guru` (`NIP`,`Nama_Guru`,`Tanggal_Lahir`,`JK`,`No_Telp`,`Alamat`) VALUES 
 ('196203291989031001','Walimin','1962-03-29','L','083162993124','Banjarnegara'),
 ('196704251993031006','Budi Rahyono','1967-04-25','L','081654321876','Banjarnegara'),
 ('197001031992032002','Faizah Maryamah','1970-01-03','P','083678098654','Banjarnegara'),
 ('197201282007101001','Zaeni Adhar','1972-01-28','L','081327552441','Banjarnegara'),
 ('197206152007102001','Yuni Ekasari','1972-06-15','P','081345765098','Banjarnegara');
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal` (
  `Id_Jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `Kode_Matakuliah_Jadwal` varchar(50) NOT NULL,
  `NIP_Jadwal` varchar(50) NOT NULL,
  `Kode_Ruangan_Jadwal` varchar(50) NOT NULL,
  `Kode_Jurusan_Jadwal` varchar(50) NOT NULL,
  `Hari` varchar(50) NOT NULL,
  `Jam` varchar(11) NOT NULL,
  PRIMARY KEY (`Id_Jadwal`),
  KEY `FK_jadwal_dosen` (`NIP_Jadwal`),
  KEY `FK_jadwal_ruangan` (`Kode_Ruangan_Jadwal`),
  KEY `FK_jadwal_matakuliah` (`Kode_Matakuliah_Jadwal`),
  KEY `FK_jadwal_jurusan` (`Kode_Jurusan_Jadwal`),
  CONSTRAINT `FK_jadwal_dosen` FOREIGN KEY (`NIP_Jadwal`) REFERENCES `guru` (`NIP`),
  CONSTRAINT `FK_jadwal_jurusan` FOREIGN KEY (`Kode_Jurusan_Jadwal`) REFERENCES `ekstrakurikuler` (`Kode_Jurusan`),
  CONSTRAINT `FK_jadwal_matakuliah` FOREIGN KEY (`Kode_Matakuliah_Jadwal`) REFERENCES `matapelajaran` (`Kode_Matakuliah`),
  CONSTRAINT `FK_jadwal_ruangan` FOREIGN KEY (`Kode_Ruangan_Jadwal`) REFERENCES `ruangan` (`Kode_Ruangan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`jadwal`
--

/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
INSERT INTO `jadwal` (`Id_Jadwal`,`Kode_Matakuliah_Jadwal`,`NIP_Jadwal`,`Kode_Ruangan_Jadwal`,`Kode_Jurusan_Jadwal`,`Hari`,`Jam`) VALUES 
 (4,'MP03','196203291989031001','KR01','KE10','Senin','10:10-12:15');
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`jenjang`
--

DROP TABLE IF EXISTS `jenjang`;
CREATE TABLE `jenjang` (
  `Kode_Jenjang` varchar(50) NOT NULL,
  `Nama_Jenjang` varchar(50) NOT NULL,
  PRIMARY KEY (`Kode_Jenjang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`jenjang`
--

/*!40000 ALTER TABLE `jenjang` DISABLE KEYS */;
INSERT INTO `jenjang` (`Kode_Jenjang`,`Nama_Jenjang`) VALUES 
 ('K1','Kelas VII'),
 ('K2','Kelas VIII'),
 ('K3','Kelas IX'),
 ('K4','Semua Jenjang');
/*!40000 ALTER TABLE `jenjang` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`matapelajaran`
--

DROP TABLE IF EXISTS `matapelajaran`;
CREATE TABLE `matapelajaran` (
  `Kode_Matakuliah` varchar(50) NOT NULL,
  `Nama_Matakuliah` varchar(50) NOT NULL,
  `SKS` int(11) NOT NULL,
  PRIMARY KEY (`Kode_Matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`matapelajaran`
--

/*!40000 ALTER TABLE `matapelajaran` DISABLE KEYS */;
INSERT INTO `matapelajaran` (`Kode_Matakuliah`,`Nama_Matakuliah`,`SKS`) VALUES 
 ('MP01','Pendidikan Jasmani, Olahraga, dan Kesehatan',2),
 ('MP02','Seni Budaya',2),
 ('MP03','Matematika',3),
 ('MP04','Al Quran Hadits',2),
 ('MP05','Ilmu Pengetahuan Alam',3),
 ('MP06','Bahasa Indonesia',3),
 ('MP07','Pendidikan Pancasila dan Kewarganegaraan',2),
 ('MP08','Fiqih',2),
 ('MP09','Sejarah Kebudayaan Islam',2),
 ('MP10','Bahasa Inggris',3),
 ('MP11','Bahasa Arab',2),
 ('MP12','Ilmu Pengetahuan Sosial',2);
/*!40000 ALTER TABLE `matapelajaran` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`nilai`
--

DROP TABLE IF EXISTS `nilai`;
CREATE TABLE `nilai` (
  `Id_Nilai` int(11) NOT NULL AUTO_INCREMENT,
  `NIM_Nilai` varchar(50) NOT NULL,
  `Kode_Matakuliah_Nilai` varchar(50) NOT NULL,
  `Nilai` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Nilai`),
  KEY `FK_nilai_mahasiswa` (`NIM_Nilai`),
  KEY `FK_nilai_matakuliah` (`Kode_Matakuliah_Nilai`),
  CONSTRAINT `FK_nilai_mahasiswa` FOREIGN KEY (`NIM_Nilai`) REFERENCES `siswa` (`NIM`),
  CONSTRAINT `FK_nilai_matakuliah` FOREIGN KEY (`Kode_Matakuliah_Nilai`) REFERENCES `matapelajaran` (`Kode_Matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`nilai`
--

/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
INSERT INTO `nilai` (`Id_Nilai`,`NIM_Nilai`,`Kode_Matakuliah_Nilai`,`Nilai`) VALUES 
 (2,'1556','MP03','A'),
 (5,'1400','MP01','B');
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`ruangan`
--

DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan` (
  `Kode_Ruangan` varchar(50) NOT NULL,
  `Nama_Ruangan` varchar(50) NOT NULL,
  PRIMARY KEY (`Kode_Ruangan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`ruangan`
--

/*!40000 ALTER TABLE `ruangan` DISABLE KEYS */;
INSERT INTO `ruangan` (`Kode_Ruangan`,`Nama_Ruangan`) VALUES 
 ('KR01','Ruang A'),
 ('KR02','Ruang B'),
 ('KR03','Ruang C'),
 ('KR04','Ruang D'),
 ('KR05','Ruang E'),
 ('KR06','Ruang F'),
 ('KR07','Ruang G'),
 ('KR08','Ruang H'),
 ('KR09','Ruang I'),
 ('KR10','Ruang J');
/*!40000 ALTER TABLE `ruangan` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`siswa`
--

DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa` (
  `NIM` varchar(50) NOT NULL,
  `Nama_Mahasiswa` varchar(50) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `JK` enum('L','P') NOT NULL,
  `No_Telp` varchar(50) NOT NULL,
  `Alamat` varchar(150) NOT NULL,
  `Ekstrakurikuler` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NIM`),
  KEY `FK_mahasiswa_jurusan` (`Ekstrakurikuler`),
  CONSTRAINT `FK_mahasiswa_jurusan` FOREIGN KEY (`Ekstrakurikuler`) REFERENCES `ekstrakurikuler` (`Kode_Jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`siswa`
--

/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` (`NIM`,`Nama_Mahasiswa`,`Tanggal_Lahir`,`JK`,`No_Telp`,`Alamat`,`Ekstrakurikuler`) VALUES 
 ('1400','Alan Yoga Pratama','2002-07-15','L','081326728768','Mandiraja Kulom','KE06'),
 ('1401','Alea Mela Zaewani','2002-08-10','','081327552441','Merden','KE03'),
 ('1402','Amrizal Riyadi','2002-01-09','L','089663543217','Mandiraja Wetan','KE05'),
 ('1403','Deva Santana','2001-12-09','L','081327613839','Mandiraja Kulon','KE09'),
 ('1404','Elsa Dian Aprilianti','2001-11-11','P','082135823813','Kebakalan','KE01'),
 ('1405','Gunawan','2002-09-07','L','0813276566765','Mandiraja Kulon','KE05'),
 ('1556','Dany Pradana','2018-09-30','L','085098765543','Kebumen','KE10');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id_User` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Usergroup_User` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Foto` varchar(150) NOT NULL DEFAULT 'ids.jpg',
  PRIMARY KEY (`Id_User`),
  KEY `FK_user_usergroup` (`Id_Usergroup_User`),
  CONSTRAINT `FK_user_usergroup` FOREIGN KEY (`Id_Usergroup_User`) REFERENCES `usergroup` (`Id_Usergroup`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`Id_User`,`Id_Usergroup_User`,`Username`,`Password`,`Foto`) VALUES 
 (1,1,'admin','$2y$10$V7zDd2Fz3QBmWFz3UnZBM.vjDK.AOTTjIdssUY8rhcBjEEJrxY7ma','ids.jpg'),
 (29,2,'196203291989031001','$2y$10$Gn4UAJiLDg2KSWxUrWnuz.eh6M9gmGs/EaZKBFX44j0YZbI0pmmBO','ids.jpg'),
 (30,3,'1556','$2y$10$iF.kCG1MFanMZn8mM2QPPOan.xiD8PU45jy0QIuMTjES.JypWtzdW','ids.jpg'),
 (33,2,'196704251993031006','$2y$10$qEOmh4kRJnBP.sFV09fVPO8Fn94IIdhSUa2rW1smso0rZ5dBOk9sq','ids.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Table structure for table `ids_akademik`.`usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `Id_Usergroup` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Usergroup` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Usergroup`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ids_akademik`.`usergroup`
--

/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` (`Id_Usergroup`,`Nama_Usergroup`) VALUES 
 (1,'Administrator'),
 (2,'Guru'),
 (3,'Siswa');
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
