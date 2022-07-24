-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2022 pada 21.24
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

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
-- Struktur dari tabel `subkriteria`
--

CREATE TABLE `subkriteria` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_kriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `subkriteria`
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
(36, 'B. Indonesia', 1),
(37, 'B. Inggris', 1),
(38, 'Matematika', 1),
(39, 'Fisika', 1),
(40, 'Kimia', 1),
(41, 'Biologi', 1),
(42, 'Matematika Peminatan', 1),
(43, 'Ekonomi', 1),
(44, 'Sejarah', 1),
(45, 'Geografi', 1),
(46, 'Sosiologi', 1),
(47, 'Pendidikan Kewarganegaraan', 1),
(48, 'Seni Budaya dan Keterampilan', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipe` (`id_kriteria`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `subkriteria`
--
ALTER TABLE `subkriteria`
  ADD CONSTRAINT `subkriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
