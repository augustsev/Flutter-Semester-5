-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Okt 2024 pada 16.57
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutterapi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `registerakun`
--

CREATE TABLE `registerakun` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `psw` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `registerakun`
--

INSERT INTO `registerakun` (`id`, `username`, `email`, `psw`) VALUES
(1, '', '', '$2y$10$px8wIJFY/uMa3qvsJw8p4eTbFiULA0Z3hCcwXB8hfwzglX68na8eO'),
(2, '', '', '$2y$10$DxW5F3nHLIWUQ5EZnWb8p.np..SnqkPw/MnKSxVT4GHV/n/ffY2Q.'),
(3, 'admin', 'admincek123@gmail.com', '$2y$10$2zpjiSIqHqPB./XJHdbAGeFTX32mF6BdyCQbM.KGGflUNLbZIaes.'),
(4, 'agus', 'agus123@gmail.com', '$2y$10$byFneYFw4PjeCTzf4TDtDO0aq/JV121Uh1LnZUe60CBO7L1BJp.uO'),
(5, 'w', 're@gmail.com', '$2y$10$H7kXUOG/1ZBNW13N8VbMp.tQJTwDwvGKlHf0sfhcR7mBy2S1/5Hpi'),
(6, 'agus123', 'agus32@gmail.com', '$2y$10$5CvNT1gyVsLqJbEeF7PBd.Bg.2z5CI7rCseR2TF6OJNYFARbPAP9C'),
(7, 'w', 'w@gmail.com', '$2y$10$lvP2l.o9nCF7RZ08ktO5JeEkTvYmoiIZhTQ/M/qIIcDs6AmHpI2MO'),
(8, 'agus33', 'agus33@gmail.com', '$2y$10$UnU8esbGbM.TzfBjcFIpP./bKdn51K/dGfvBuO9JLuMeJ83kwgwpm'),
(9, 'jokowi', 'jokowijr@gmail.com', '$2y$10$fm3LLjJykBet2ckLjOmYUe5O3AvbHWA09IX0G6qFdifVgOyPg7cFu'),
(11, 'wewe', 'wewe@gmail.com', 'wewe00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `registerakun`
--
ALTER TABLE `registerakun`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `registerakun`
--
ALTER TABLE `registerakun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
