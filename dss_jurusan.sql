-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2022 at 08:23 PM
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
(36, 'Saintek', 2),
(37, 'Soshum', 3),
(38, 'mak jreng', 18);

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
(2, 'Nilai Tryout UTBK'),
(6, 'Minat & Bakat'),
(7, 'Uang Kuliat Tunggal '),
(9, 'Akreditasi');

-- --------------------------------------------------------

--
-- Table structure for table `kursus`
--

CREATE TABLE `kursus` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(36, 1, 5),
(36, 2, 5),
(36, 3, 5),
(36, 4, 5),
(36, 5, 1),
(36, 6, 1),
(36, 7, 1),
(36, 8, 1),
(36, 9, 1),
(36, 25, 1),
(36, 26, 1),
(36, 27, 1),
(36, 28, 1),
(36, 29, 1),
(36, 30, 1),
(36, 31, 1),
(36, 32, 1),
(36, 33, 1),
(36, 34, 1),
(36, 35, 1),
(36, 36, 1),
(36, 37, 1),
(36, 38, 1),
(36, 39, 5),
(36, 40, 5),
(36, 41, 5),
(36, 42, 5),
(36, 43, 1),
(36, 44, 1),
(36, 45, 1),
(36, 46, 1),
(36, 47, 1),
(36, 48, 1),
(37, 1, 1),
(37, 2, 1),
(37, 3, 1),
(37, 4, 1),
(37, 5, 5),
(37, 6, 5),
(37, 7, 5),
(37, 8, 5),
(37, 9, 1),
(37, 25, 1),
(37, 26, 1),
(37, 27, 1),
(37, 28, 1),
(37, 29, 1),
(37, 30, 1),
(37, 31, 1),
(37, 32, 1),
(37, 33, 1),
(37, 34, 1),
(37, 35, 1),
(37, 36, 1),
(37, 37, 1),
(37, 38, 1),
(37, 39, 1),
(37, 40, 1),
(37, 41, 1),
(37, 42, 1),
(37, 43, 5),
(37, 44, 5),
(37, 45, 5),
(37, 46, 5),
(37, 47, 1),
(37, 48, 1),
(38, 1, 1),
(38, 2, 1),
(38, 3, 1),
(38, 4, 1),
(38, 5, 1),
(38, 6, 1),
(38, 7, 1),
(38, 8, 1),
(38, 9, 3),
(38, 25, 2),
(38, 26, 1),
(38, 27, 1),
(38, 28, 2),
(38, 29, 1),
(38, 30, 3),
(38, 31, 3),
(38, 32, 2),
(38, 33, 2),
(38, 34, 2),
(38, 35, 5),
(38, 36, 4),
(38, 37, 1),
(38, 38, 1),
(38, 39, 1),
(38, 40, 1),
(38, 41, 1),
(38, 42, 1),
(38, 43, 1),
(38, 44, 1),
(38, 45, 1),
(38, 46, 1),
(38, 47, 5),
(38, 48, 1),
(38, 49, 2);

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
(3, 'nilai 21%-40%', 2, 2),
(4, 'nilai 41%-60%', 3, 2),
(5, 'nilai 61%-80%', 4, 2),
(13, 'Berminat', 2, 6),
(14, 'Tidak Berminat', 1, 6),
(15, 'nilai 91%-100%', 5, 2),
(16, 'Sangat Minat', 3, 6),
(25, 'Rp. 500.000', 8, 7),
(26, 'Rp. 1.000.000', 7, 7),
(27, 'Rp. 2.000.000 - Rp. 2.400.000', 6, 7),
(28, 'Rp. 2.500.000 - Rp. 4.000.000', 5, 7),
(29, 'Rp. 3.000.000 - Rp. 5.500.000', 4, 7),
(30, 'Rp. 3.500.000 - Rp. 7.000.000', 3, 7),
(31, 'Rp. 4.000.000 - Rp. 8.500.000', 2, 7),
(32, 'Rp. 5.000.000 - Rp. 10.000.000', 1, 7),
(39, 'Akreditasi C', 1, 9),
(40, 'Akreditasi B', 2, 9),
(41, 'Akreditasi A', 3, 9);

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
(25, 'Melakukan Perhitungan dan memecahkan rumus', 6),
(26, 'Menggambar ilustrasi sesuatu/barang', 6),
(27, 'Pengembanggan teknologi baru ', 6),
(28, 'Mengekspresikan diri dengan kata-kata, musik, gambar', 6),
(29, 'Merawat orang yang terluka', 6),
(30, 'Menggetahui Fauna & Flora', 6),
(31, 'Berminat dalam Berdagang dan Bernegoisasi', 6),
(32, 'Membuat dan mengolah data', 6),
(33, 'Mengikuti Perkembangan Politik ', 6),
(34, 'Tertarik mengetahui karakter seseorang', 6),
(35, 'Uang Kuliah Tunggal', 7),
(49, 'Banyaknya relasi di kampus jurusan tersebut', 8),
(50, 'Akreditasi Kampus', 9);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kursus`
--
ALTER TABLE `kursus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parameter`
--
ALTER TABLE `parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
