-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2023 at 08:35 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(2, 'admin', '$2y$10$201zwiRiYZlowHg5XTri..CPDlgX4rhsJu3ICuJGfXlXk/QXKzWn.');

-- --------------------------------------------------------

--
-- Table structure for table `calonsiswa`
--

CREATE TABLE `calonsiswa` (
  `idsiswa` int(255) NOT NULL,
  `nis` int(30) NOT NULL,
  `namasiswa` varchar(60) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `asalsekolah` varchar(60) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `namaayah` varchar(60) NOT NULL,
  `pkayah` varchar(60) NOT NULL,
  `gajiayah` varchar(100) NOT NULL,
  `alamatayah` varchar(60) NOT NULL,
  `tlpayah` varchar(14) NOT NULL,
  `namaibu` varchar(60) NOT NULL,
  `pkibu` varchar(60) NOT NULL,
  `gajiibu` varchar(100) NOT NULL,
  `alamatibu` varchar(60) NOT NULL,
  `tlpibu` varchar(14) NOT NULL,
  `namawali` varchar(30) NOT NULL,
  `statuswali` varchar(20) NOT NULL,
  `tlpwali` varchar(14) NOT NULL,
  `status` int(1) NOT NULL,
  `tgl` date DEFAULT NULL,
  `bayardaftar` varchar(20) NOT NULL DEFAULT 'Belum Lunas',
  `bayarseragam` varchar(20) NOT NULL DEFAULT 'Belum Lunas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `calonsiswa`
--

INSERT INTO `calonsiswa` (`idsiswa`, `nis`, `namasiswa`, `jk`, `asalsekolah`, `alamat`, `namaayah`, `pkayah`, `gajiayah`, `alamatayah`, `tlpayah`, `namaibu`, `pkibu`, `gajiibu`, `alamatibu`, `tlpibu`, `namawali`, `statuswali`, `tlpwali`, `status`, `tgl`, `bayardaftar`, `bayarseragam`) VALUES
(16, 2147483647, 'Irma Dila Febrianti', 'Perempuan', 'SD Al Haromain', 'Ds. Temayang', 'Adbul Munthalib', 'Wiraswasta', '2.000.000-5.000.000', 'Ds. Temayang', '086717027502', 'Inayah', 'Ibu Rumah Tangga', '2.000.000-5.000.000', 'Kota Bojonegoro', '086717027502', '', '', '', 1, '2023-01-28', 'Belum Bayar', 'Belum Bayar'),
(17, 2147483647, 'Rania Zindand', 'Perempuan', 'SDN Kadipaten 1', 'Ds. Sumbang', 'Sutikno', 'Pegawai Bank BRI', '< 2.000.000', 'Ds. Sumbang', '086717027502', 'Endang Tri', 'Ibu rumah tangga', '< 2.000.000', 'Ds. Sumbang', '086717027502', '', '', '', 1, '2023-01-29', 'Belum Bayar', 'Belum Bayar'),
(18, 2147483647, 'Muhammad Rizal', 'Laki-laki', 'SD Kadipaten 3', 'Kota Bojonegoro', 'Adbul Mujib', 'Wiraswasta', '< 2.000.000', 'Bojonegoro', '086717027502', 'Inayah', 'Ibu Rumah Tangga', '< 2.000.000', 'Kota Bojonegoro', '086717027502', 'Kristiana', 'Kakak', '8712038897', 1, '2023-01-29', 'Belum Bayar', 'Belum Bayar');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pembayaran`
--

CREATE TABLE `jenis_pembayaran` (
  `id_jenis` int(20) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL,
  `nominal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_pembayaran`
--

INSERT INTO `jenis_pembayaran` (`id_jenis`, `nama_jenis`, `nominal`) VALUES
(3, 'Biaya Pendaftaran', 100000),
(4, 'Seragam Sekolah', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-06-23-023531', 'App\\Database\\Migrations\\CreateUserTable', 'default', 'App', 1674644045, 1),
(2, '2023-01-25-105227', 'App\\Database\\Migrations\\CreateUsersTable', 'default', 'App', 1674644045, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(20) NOT NULL,
  `tglbayar` date NOT NULL,
  `idsiswa` int(255) NOT NULL,
  `id_jenis` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `updatebayar2` AFTER DELETE ON `pembayaran` FOR EACH ROW BEGIN
DECLARE i INT;
  SET i = OLD.id_jenis;
IF(i = 3) THEN
    UPDATE calonsiswa SET bayardaftar = 'Belum Bayar' WHERE idsiswa = OLD.idsiswa;  
END if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatebayar4` AFTER DELETE ON `pembayaran` FOR EACH ROW BEGIN
DECLARE i INT;
  SET i = OLD.id_jenis;
IF(i = 4) THEN
    UPDATE calonsiswa SET bayarseragam = 'Belum Bayar' WHERE idsiswa = OLD.idsiswa;  
    END if;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calonsiswa`
--
ALTER TABLE `calonsiswa`
  ADD PRIMARY KEY (`idsiswa`);

--
-- Indexes for table `jenis_pembayaran`
--
ALTER TABLE `jenis_pembayaran`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `idsiswa` (`idsiswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `calonsiswa`
--
ALTER TABLE `calonsiswa`
  MODIFY `idsiswa` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jenis_pembayaran`
--
ALTER TABLE `jenis_pembayaran`
  MODIFY `id_jenis` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
