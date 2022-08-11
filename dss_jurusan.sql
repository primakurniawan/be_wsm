-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2022 at 04:50 PM
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
(10, 5, 'Ganesha Operation Binjai', 'Jl. Jendral Sudirman No.63ABC, Binjai, Kec. Binjai Kota, Kota Binjai, Sumatera Utara 20711', 98.48748413978518, 3.613647665445839),
(11, 5, 'Ganesha Operation T.B Simatupang Pinang Baris Medan', 'JL. T.B Simatupan Kompler Ruko Perumahan Palem Mas, Sunggal, Kec. Medan Sunggal, Kota Medan, Sumatera Utara 20127', 98.61346319426066, 3.596409981016524),
(12, 5, 'Ganesha Operation A.R Hakim Medan', 'Jl. Arief Rahman Hakim No.153 C, Sukaramai I, Kec. Medan Area, Kota Medan, Sumatera Utara 20216', 98.70210167151905, 3.5743230585297514),
(13, 5, 'Ganesha Operation Abdullah Lubis 23 Medan', 'Jl. Abdullah Lubis No.23, Darat, Kec. Medan Baru, Kota Medan, Sumatera Utara 20153', 98.6627088963452, 3.5767307800056316),
(14, 5, 'Ganesha Operation Tembung Medan', 'Jl. Besar Tembung No.36, Hutan, Kec. Percut Sei Tuan, Kabupaten Deli Serdang, Sumatera Utara 20371', 98.74338593643593, 3.604589750578306),
(15, 5, 'Ganesha Operation', 'Jl. H.M. Yamin No. 253 C, Sei Kera Hilir I, Kec. Medan Perjuangan, Kota Medan, Sumatera Utara 20222', 98.70357248012026, 3.5993104691677678),
(16, 5, 'Ganesha Operation Hayam Wuruk Medan', 'Jl. Hayam Wuruk No.7ABC, Petisah Hulu, Kec. Medan Baru, Kota Medan, Sumatera Utara 20153', 98.66461930983625, 3.5815405550566517),
(17, 5, 'Ganesha Operation K.L. Yos Sudarso 85 A Medan', 'Jl. Kol. Yos Sudarso No.85-A, Glugur Kota, Kec. Medan Bar., Kota Medan, Sumatera Utara 20226', 98.67331751169054, 3.6128167401687694),
(18, 5, 'Ganesha Operation Kapten Muslim 72 Medan', 'Komplek Griya Riatur Indah, JL. KAPTEN MUSLIM KOMPLEK GRIYA RIATUR INDAH BLOK A. 72 A, Helvetia Tim., Kec. Medan Helvetia, Kota Medan, Sumatera Utara 20117', 98.64535775401784, 3.6067838642875873),
(19, 5, 'Ganesha Operation Karya Wisata Medan', 'Jalan Karya Wisata No.38 CD, Pangkalan Masyhur, Kec. Medan Johor, Kota Medan, Sumatera Utara 20144', 98.66283796750882, 3.5379359652272147),
(20, 5, 'Ganesha Operation MH.Thamrin Medan', 'JL. M.H Thamrin Simpang, Jl. Malaka No.101, Pandau Hilir, Kec. Medan Perjuangan, Kota Medan, Sumatera Utara 20232', 98.68897355216365, 3.593361422708376),
(21, 5, 'Lembaga Bimbingan Belajar Ganesha Operation Marelan', 'Jl. Marelan Raya No.146, Rengas Pulau, Kec. Medan Marelan, Kota Medan, Sumatera Utara 20255', 98.65892465401794, 3.7041509257936394),
(22, 5, 'Ganesha Operation Pancing Medan', 'Jl. Williem Iskandar No.106, Bantan Tim., Kec. Medan Tembung, Kota Medan, Sumatera Utara 20222', 98.70572193492477, 3.6083711072542077),
(23, 5, 'Ganesha Operation Panglima Denai Medan', 'Jl. Panglima Denai No.132 D, A M P L A S, Kec. Medan Amplas, Kota Medan, Sumatera Utara 20229', 98.71515072927328, 3.55068295523705),
(24, 5, 'Ganesha Operation Setia Budi 121-A Medan', 'Jl. Setia Budi No.121 A, Tj. Sari, Kec. Medan Selayang, Kota Medan, Sumatera Utara 20132', 98.63462483867255, 3.5583129441805563),
(25, 5, 'Ganesha Operation Sisingamangaraja 365 A-C Medan', 'Jl. Sisingamangaraja No.365B, Siti Rejo I, Kec. Medan Kota, Kota Medan, Sumatera Utara 20216', 98.69521163867249, 3.554758936730469),
(26, 5, 'Ganesha Operation T.B Simatupang Pinang Baris Medan', 'JL. T.B Simatupan Kompler Ruko Perumahan Palem Mas, Sunggal, Kec. Medan Sunggal, Kota Medan, Sumatera Utara 20127', 98.61206843867258, 3.588229253485552);

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

--
-- Dumping data for table `kursus`
--

INSERT INTO `kursus` (`id`, `nama`) VALUES
(5, 'Ganesha Operation');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_subkriteria_jurusan`
--

CREATE TABLE `nilai_subkriteria_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `id_subkriteria` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
