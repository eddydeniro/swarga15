# Host: localhost  (Version 5.5.5-10.1.38-MariaDB)
# Date: 2019-12-17 16:07:05
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "agama"
#

DROP TABLE IF EXISTS `agama`;
CREATE TABLE `agama` (
  `id_agama` varchar(10) NOT NULL,
  `nama_agama` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_agama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "agama"
#

INSERT INTO `agama` VALUES ('A1','Islam',1),('A2','Kristen',1),('A3','Katholik',1),('A4','Hindu',1),('A5','Budha',1),('A6','Konghucu',1);

#
# Structure for table "dokumen"
#

DROP TABLE IF EXISTS `dokumen`;
CREATE TABLE `dokumen` (
  `id_dokumen` varchar(30) NOT NULL,
  `nama_dokumen` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_dokumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "dokumen"
#

INSERT INTO `dokumen` VALUES ('D','E-KTP',1);

#
# Structure for table "file"
#

DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id_dokumen` varchar(30) DEFAULT NULL,
  `nik` varchar(30) DEFAULT NULL,
  `file` text,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "file"
#


#
# Structure for table "hak_akses"
#

DROP TABLE IF EXISTS `hak_akses`;
CREATE TABLE `hak_akses` (
  `id_akses` varchar(10) NOT NULL,
  `nama_akses` varchar(20) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_akses`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "hak_akses"
#

INSERT INTO `hak_akses` VALUES ('akses01','admin',1),('akses04','penduduk',1);

#
# Structure for table "hak_akses_user"
#

DROP TABLE IF EXISTS `hak_akses_user`;
CREATE TABLE `hak_akses_user` (
  `nik` varchar(15) NOT NULL,
  `id_akses` varchar(10) NOT NULL,
  KEY `hak_akses_user` (`id_akses`),
  CONSTRAINT `hak_akses_user` FOREIGN KEY (`id_akses`) REFERENCES `hak_akses` (`id_akses`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "hak_akses_user"
#

INSERT INTO `hak_akses_user` VALUES ('123451','akses04'),('123451','akses01');

#
# Structure for table "kk"
#

DROP TABLE IF EXISTS `kk`;
CREATE TABLE `kk` (
  `id_kk` varchar(10) DEFAULT NULL,
  `no_kk` varchar(50) NOT NULL DEFAULT '',
  `alamat` varchar(30) DEFAULT NULL,
  `desa` varchar(30) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kabupaten` varchar(30) DEFAULT NULL,
  `kode_pos` varchar(10) DEFAULT NULL,
  `provinsi` varchar(30) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `kepala_keluarga` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`no_kk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "kk"
#

INSERT INTO `kk` VALUES ('1','12341','BLOK N N0. 31','LAKSANAMEKAR','PADALARANG','BANDUNG BARAT','40553','JAWA BARAT','05','015','123451','1');

#
# Structure for table "klasifikasi"
#

DROP TABLE IF EXISTS `klasifikasi`;
CREATE TABLE `klasifikasi` (
  `id_klasifikasi` varchar(10) NOT NULL DEFAULT '',
  `nama_klasifikasi` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_klasifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "klasifikasi"
#

INSERT INTO `klasifikasi` VALUES ('K1','Anak - Anak',1),('K2','Remaja',1),('K3','Dewasa',1),('K4','Lansia',1);

#
# Structure for table "klasifikasi_dokumen"
#

DROP TABLE IF EXISTS `klasifikasi_dokumen`;
CREATE TABLE `klasifikasi_dokumen` (
  `id_klasifikasi` varchar(5) NOT NULL,
  `id_dokumen` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "klasifikasi_dokumen"
#


#
# Structure for table "online"
#

DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `id_online` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(15) NOT NULL,
  `waktu` varchar(25) NOT NULL,
  PRIMARY KEY (`id_online`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "online"
#


#
# Structure for table "penduduk"
#

DROP TABLE IF EXISTS `penduduk`;
CREATE TABLE `penduduk` (
  `nik` varchar(100) NOT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` varchar(10) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `golongan_darah` varchar(5) DEFAULT NULL,
  `pekerjaan` text,
  `pendidikan` varchar(10) NOT NULL,
  `status_perkawinan` enum('KAWIN','BELUM KAWIN') NOT NULL,
  `kewarganegaraan` varchar(50) DEFAULT NULL,
  `id_agama` varchar(30) DEFAULT NULL,
  `id_klasifikasi` varchar(20) NOT NULL,
  `no_kk` varchar(50) DEFAULT NULL,
  `foto` text,
  `about` text,
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`nik`),
  KEY `penduduk` (`id_agama`),
  CONSTRAINT `penduduk` FOREIGN KEY (`id_agama`) REFERENCES `agama` (`id_agama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "penduduk"
#

INSERT INTO `penduduk` VALUES ('123451','TEDI HIMAWAN','BANDUNG','14-06-1975','L','A','Lainnya','D4/S1','KAWIN','WNI','A1','K3','12341','uray.jpg','','admin','YWRtaW4=',0);

#
# Structure for table "pesan"
#

DROP TABLE IF EXISTS `pesan`;
CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(15) NOT NULL,
  `pesan` text NOT NULL,
  `waktu` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pesan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Data for table "pesan"
#

INSERT INTO `pesan` VALUES (1,'123451','tes','17-12-2019  14:17'),(2,'123451',' [nangis]','17-12-2019  14:17'),(3,'123451',' [ketawa]','17-12-2019  14:17');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `hak_akses` enum('admin','warga') NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "user"
#

