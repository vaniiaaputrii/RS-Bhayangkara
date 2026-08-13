-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Agu 2026 pada 04.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_klinik_rs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `sip` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `id_poli`, `nama_dokter`, `sip`, `no_hp`) VALUES
(1, 1, 'dr. Ahmad Hidayat', 'SIP.100/UMUM/2025', '081234567801'),
(2, 2, 'drg. Rina Kartika', 'SIP.101/GIGI/2025', '081234567802'),
(3, 3, 'dr. Budi Santoso, Sp.PD', 'SIP.102/PD/2025', '081234567803'),
(4, 4, 'dr. Maya Indah, Sp.A', 'SIP.103/ANAK/2025', '081234567804');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `no_rm` varchar(15) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `gol_darah` varchar(3) DEFAULT '-',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`no_rm`, `nik`, `nama_pasien`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `no_hp`, `gol_darah`, `created_at`) VALUES
('RM-2026-0001', '3374011201980001', 'Eko Prasetyo', 'Semarang', '1998-01-12', 'L', 'Jl. Pemuda No. 45, Semarang', '085612345678', 'O', '2026-08-12 02:04:52'),
('RM-2026-0002', '3374025508000002', 'Dewi Lestari', 'Kendal', '2000-08-15', 'P', 'Jl. Gajah Mada No. 12, Semarang', '085687654321', 'A', '2026-08-12 02:04:52'),
('RM-2026-0003', '3374031003850003', 'Bambang Wijaya', 'Semarang', '1985-03-10', 'L', 'Jl. Pandanaran No. 88, Semarang', '081390123456', 'B', '2026-08-12 02:04:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(11) NOT NULL,
  `no_pendaftaran` varchar(50) DEFAULT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `nik_nrp` varchar(30) NOT NULL,
  `kategori` varchar(50) DEFAULT 'Masyarakat Umum',
  `pembayaran` varchar(50) DEFAULT 'Umum / Mandiri',
  `dokter_nama` varchar(150) DEFAULT NULL,
  `dokter` varchar(150) DEFAULT NULL,
  `tanggal_kunjungan` date DEFAULT NULL,
  `no_antrean` int(11) DEFAULT 1,
  `status` enum('Menunggu','Diproses','Selesai','Batal') DEFAULT 'Menunggu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id_pendaftaran`, `no_pendaftaran`, `nama_pasien`, `nik_nrp`, `kategori`, `pembayaran`, `dokter_nama`, `dokter`, `tanggal_kunjungan`, `no_antrean`, `status`, `created_at`) VALUES
(1, NULL, 'papa', '12312312312', 'Umum', 'Umum', 'dr. HENRY SANTOSO, Sp. PD (SPESIALIS PENYAKIT DALAM)', NULL, '2026-08-14', 0, 'Menunggu', '2026-08-12 02:47:28'),
(2, NULL, 'll', '12312312312', 'Umum', 'Umum', 'dr. KHUMAYROH RACHMAWATI BUANA, Sp.DVE (SPESIALIS KULIT, KELAMIN DAN KECANTIKAN)', NULL, '2026-08-26', 0, 'Menunggu', '2026-08-12 02:48:16'),
(3, NULL, 'santo', '12312312312', 'Umum', 'Umum', 'dr. NANUNG BUDI PRAKOSO, Sp. N (SPESIALIS SARAF)', NULL, '2026-08-21', 0, 'Menunggu', '2026-08-13 01:59:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(11) NOT NULL,
  `nomor_pengaduan` varchar(20) NOT NULL,
  `nama_pelapor` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `judul_pengaduan` varchar(150) NOT NULL,
  `isi_pengaduan` text NOT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `status` enum('pending','proses','selesai','ditolak') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id_poli` int(11) NOT NULL,
  `nama_poli` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `deskripsi`) VALUES
(1, 'Poli Umum', 'Layanan kesehatan umum dan pemeriksaan awal'),
(2, 'Poli Gigi', 'Layanan perawatan kesehatan gigi dan mulut'),
(3, 'Poli Penyakit Dalam', 'Pemeriksaan spesialis organ dalam'),
(4, 'Poli Anak', 'Layanan kesehatan khusus bayi dan anak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan_pengaduan`
--

CREATE TABLE `tanggapan_pengaduan` (
  `id` int(11) NOT NULL,
  `pengaduan_id` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `tanggapan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('admin','petugas','dokter') NOT NULL DEFAULT 'petugas',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHe1eB2g0WdGrkvdM084yP4R3GqT1H1Ote', 'Administrator Utama', 'admin', '2026-08-12 02:04:52'),
(2, 'petugas1', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHe1eB2g0WdGrkvdM084yP4R3GqT1H1Ote', 'Siti Rahmawati', 'petugas', '2026-08-12 02:04:52'),
(3, 'dr_ahmad', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHe1eB2g0WdGrkvdM084yP4R3GqT1H1Ote', 'dr. Ahmad Hidayat', 'dokter', '2026-08-12 02:04:52');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD UNIQUE KEY `sip` (`sip`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_rm`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `idx_pasien_nik` (`nik`),
  ADD KEY `idx_pasien_nama` (`nama_pasien`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_pengaduan` (`nomor_pengaduan`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indeks untuk tabel `tanggapan_pengaduan`
--
ALTER TABLE `tanggapan_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengaduan_id` (`pengaduan_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tanggapan_pengaduan`
--
ALTER TABLE `tanggapan_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tanggapan_pengaduan`
--
ALTER TABLE `tanggapan_pengaduan`
  ADD CONSTRAINT `tanggapan_pengaduan_ibfk_1` FOREIGN KEY (`pengaduan_id`) REFERENCES `pengaduan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
