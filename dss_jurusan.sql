-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2022 at 05:43 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dss_jurusan`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat_kursus`
--

CREATE TABLE `alamat_kursus` (
  `id` int(11) NOT NULL,
  `id_kursus` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `lon` double NOT NULL,
  `lat` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alamat_kursus`
--

INSERT INTO `alamat_kursus` (`id`, `id_kursus`, `nama`, `alamat`, `lon`, `lat`) VALUES
(2, 2, 'Ganesha Operation Babi', 'Jl. Jendral Sudirman No.63ABC, Binjai, Kec. Binjai Kota, Kota Binjai, Sumatera Utara 20711', 98.48679747805338, 3.613476345362867),
(9, 2, 'abalabal2', 'asdasda;jfd;lkfjldkg', 98.87879879871231, 3.98798767878);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id`, `nama`) VALUES
(1, 'Fakultas Ilmu Komputer dan Teknologi Informasi'),
(2, 'Fakultas Kedokteran'),
(3, 'Fakultas Hukum'),
(4, 'Fakultas Pertanian'),
(5, 'Fakultas Teknik'),
(6, 'Fakultas Ekonomi dan Bisnis'),
(7, 'Fakultas Ilmu Budaya'),
(8, 'Fakultas Matematika dan Ilmu Pengetahuan Alam'),
(9, 'Fakultas Ilmu Sosial dan Ilmu Politik'),
(10, 'Fakultas Kesehatan Masyarakat'),
(11, 'Fakultas Keperawatan'),
(12, 'Fakultas Psikologi'),
(13, 'Fakultas Farmasi'),
(14, 'Fakultas Kehutanan'),
(15, 'Fakultas Kedokteran Gigi'),
(18, 'fakultas si taik - taik ah');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_fakultas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama`, `id_fakultas`) VALUES
(1, 'Ilmu Komputer', 1),
(2, 'Teknologi Informasi', 1),
(3, 'Kedokteran', 2),
(5, 'Agroteknologi', 4),
(6, 'Agribisnis', 4),
(7, 'Teknologi Pangan', 4),
(8, 'Hukum', 1),
(9, 'Hukum', 1),
(10, 'Hukum', 1),
(11, 'Hukum', 1),
(12, 'Hukum', 1),
(13, 'undefined', 7),
(14, 'kedokteran', 2),
(18, 'undefined', 8),
(19, 'wqerwqer', 8),
(20, 'hukum terbaru', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`) VALUES
(1, 'nilai raport'),
(2, 'nilai tryout');

-- --------------------------------------------------------

--
-- Table structure for table `kursus`
--

CREATE TABLE `kursus` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kursus`
--

INSERT INTO `kursus` (`id`, `nama`) VALUES
(2, 'Abal - Abal'),
(4, 'anal2');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_subkriteria_jurusan`
--

CREATE TABLE `nilai_subkriteria_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `id_subkriteria` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai_subkriteria_jurusan`
--

INSERT INTO `nilai_subkriteria_jurusan` (`id_jurusan`, `id_subkriteria`, `nilai`) VALUES
(1, 1, 4),
(1, 2, 3),
(1, 3, 2),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 9, 5),
(3, 1, 4),
(3, 2, 4),
(3, 3, 4),
(3, 4, 5),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 5),
(5, 1, 3),
(5, 2, 4),
(5, 3, 5),
(5, 4, 1),
(5, 5, 2),
(5, 6, 1),
(5, 7, 3),
(5, 8, 5),
(5, 9, 3),
(6, 1, 2),
(6, 2, 3),
(6, 3, 2),
(6, 4, 1),
(6, 5, 4),
(6, 6, 5),
(6, 7, 3),
(6, 8, 2),
(6, 9, 4),
(7, 1, 3),
(7, 2, 1),
(7, 3, 3),
(7, 4, 2),
(7, 5, 4),
(7, 6, 3),
(7, 7, 2),
(7, 8, 4),
(7, 9, 2),
(10, 1, 1),
(10, 2, 1),
(10, 3, 1),
(10, 4, 1),
(10, 5, 5),
(10, 6, 5),
(10, 7, 5),
(10, 8, 5),
(10, 9, 5),
(12, 1, 3),
(12, 2, 3),
(12, 3, 3),
(12, 4, 3),
(12, 5, 3),
(12, 6, 3),
(12, 7, 5),
(12, 8, 5),
(12, 9, 5),
(14, 1, 5),
(14, 2, 4),
(14, 3, 4),
(14, 4, 5),
(14, 5, 4),
(14, 6, 3),
(14, 7, 4),
(14, 8, 3),
(14, 9, 4),
(14, 11, 3),
(19, 1, 5),
(19, 2, 3),
(19, 3, 5),
(19, 4, 1),
(19, 5, 1),
(19, 6, 1),
(19, 7, 1),
(19, 8, 3),
(19, 9, 5),
(19, 11, 3),
(20, 1, 1),
(20, 2, 1),
(20, 3, 1),
(20, 4, 1),
(20, 5, 5),
(20, 6, 5),
(20, 7, 5),
(20, 8, 5),
(20, 9, 4),
(20, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE `parameter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nilai` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id`, `nama`, `nilai`, `id_kriteria`) VALUES
(1, 'nilai 0%-20%', 1, 2),
(3, 'nilai 40%-60%', 3, 2),
(4, 'nilai 60%-80%', 4, 2),
(5, 'nilai 80%-100%', 5, 2),
(6, 'nilai rata-rata dibawah 76', 1, 1),
(7, 'nilai rata-rata 76-82', 2, 1),
(8, 'nilai rata-rata 83-88', 3, 1),
(9, 'nilai rata-rata 89-94', 4, 1),
(10, 'nilai rata-rata 95-100', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subkriteria`
--

CREATE TABLE `subkriteria` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_kriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subkriteria`
--

INSERT INTO `subkriteria` (`id`, `nama`, `id_kriteria`) VALUES
(1, 'Matematika Peminatan', 2),
(2, 'Fisika', 2),
(3, 'Kimia', 2),
(4, 'Biologi', 2),
(5, 'Geografi', 2),
(6, 'Sejarah', 2),
(7, 'Sosiologi', 2),
(8, 'Ekonomi', 2),
(9, 'TPS', 2),
(11, 'UKTul', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alamat_kursus`
--
ALTER TABLE `alamat_kursus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kursus` (`id_kursus`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kursus`
--
ALTER TABLE `kursus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_subkriteria_jurusan`
--
ALTER TABLE `nilai_subkriteria_jurusan`
  ADD KEY `id_kriteria` (`id_subkriteria`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipe` (`id_kriteria`);

--
-- Indexes for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipe` (`id_kriteria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alamat_kursus`
--
ALTER TABLE `alamat_kursus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kursus`
--
ALTER TABLE `kursus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parameter`
--
ALTER TABLE `parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat_kursus`
--
ALTER TABLE `alamat_kursus`
  ADD CONSTRAINT `alamat_kursus_ibfk_1` FOREIGN KEY (`id_kursus`) REFERENCES `kursus` (`id`);

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id`);

--
-- Constraints for table `nilai_subkriteria_jurusan`
--
ALTER TABLE `nilai_subkriteria_jurusan`
  ADD CONSTRAINT `nilai_subkriteria_jurusan_ibfk_1` FOREIGN KEY (`id_subkriteria`) REFERENCES `subkriteria` (`id`),
  ADD CONSTRAINT `nilai_subkriteria_jurusan_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id`);

--
-- Constraints for table `parameter`
--
ALTER TABLE `parameter`
  ADD CONSTRAINT `parameter_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id`);

--
-- Constraints for table `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD CONSTRAINT `subkriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
