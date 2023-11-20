-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
<<<<<<< HEAD
-- Generation Time: Nov 10, 2023 at 07:37 AM
=======
-- Generation Time: Nov 20, 2023 at 07:50 AM
>>>>>>> 2854adb (database new)
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bahan`
--

CREATE TABLE `tbl_bahan` (
  `id_bahan` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `asal_bahan` varchar(50) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bahan`
--

INSERT INTO `tbl_bahan` (`id_bahan`, `nama`, `jumlah`, `satuan`, `tanggal`, `asal_bahan`, `keterangan`) VALUES
(1, 'Printer Epson P10', 2, 'buah', '2023-11-01', 'Kantor SAPD', 'ini printer bagus');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `foto_barang` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `nama_barang` varchar(50) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `sumber` varchar(100) NOT NULL,
  `spesifikasi` text NOT NULL,
  `kondisi_sebelum` varchar(30) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal_masuk` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `id_peminjaman`, `kode_barang`, `foto_barang`, `nama_barang`, `lokasi`, `sumber`, `spesifikasi`, `kondisi_sebelum`, `keterangan`, `tanggal_masuk`, `status`) VALUES
(198, 0, 50052101, '530840987_Bank BRI (Bank Rakyat Indonesia) Logo (PNG-1080p) - FileVector69.png', 'alsdpa-2', 'Lab DDK 1', 'BOS', 'apsdaoskd', 'Baik', 'askdaosd', '2023-11-04 23:10:57', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_distribusi`
--

CREATE TABLE `tbl_distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `nama_pengambil` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `nama_bahan` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `tgl_pengambilan` date NOT NULL,
  `asal_bahan` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_distribusi`
--

INSERT INTO `tbl_distribusi` (`id_distribusi`, `nama_pengambil`, `jabatan`, `nama_bahan`, `jumlah`, `satuan`, `tgl_pengambilan`, `asal_bahan`, `keterangan`) VALUES
(1, 'Junaidi', 'Guru Prod. Grafika ', 'Printer Epson P10', 2, 'buah', '2023-11-01', 'Kantor SAPD', 'ini printer bagus');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `jabatan` varchar(80) NOT NULL,
  `nip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_guru`
--

INSERT INTO `tbl_guru` (`id_guru`, `nama_guru`, `jabatan`, `nip`) VALUES
(3, 'Drs. Gunawan Dwiyono, S.ST., M.Pd', 'Kepala sekolah', '19670930 199512 1 002'),
(4, 'Sri Rahayu Ningsih, S.Pd.', 'Guru Desain Grafika (Perwajahan)', '19601103 198503 2 008'),
(5, 'Drs. Burhanudin.', 'Guru Simdig & PKK', '19601201 198303 1 01'),
(6, 'Dra. Kun Fadjarsari.', 'Guru Bahasa Indonesi', '19621117 198703 2 014'),
(7, 'Dra. Wiwik Niarti.', 'Guru Bahasa Inggris', '19621214 199203 2 004'),
(8, 'Drs. I Wayan Sunarya A, MM.', 'Guru Prod. Grafika (DDG)', '19621231 198703 1 154'),
(9, 'Drs. Suhardi.', 'Guru PKn', '19630117 198903 1 010'),
(10, 'Chusniyah, S.Pd.', 'Guru Desain Grafika (SHK) & PKK', '19631202 199003 2 004'),
(11, 'Titi Suwasti, S.Pd., M.Pd', 'Guru Prod. Kreatif & KWU', '19650508 198903 2 011'),
(12, 'M. Lahmudi, S.Pd.', 'Guru Prod. Grafika (TC) & Prod. Grafika (PC)', '19690209 199203 1 004'),
(13, 'Sumijah, S.Pd., M.Si.', 'Guru BP/BK', '19700210 199802 2 009'),
(14, 'Pramudjijo, S.Pd.', 'Guru Prod. Grafika (Peny. Graf)', '19591228 199203 1 002'),
(15, 'Drs. Hari Wahjono.', 'Guru BP/BK', '19600714 198803 1 012'),
(16, 'Drs. Sugeng Hariadi.', 'Guru PJOK', '19620310 199412 1 001'),
(17, 'Dra. Kiswati.', 'Guru Prod. Kreatif & KWU', '19620412 198902 2 002'),
(18, 'Drs. Eko Dewa Sukayanto.', 'Guru PJOK', '19640602 198903 1 019'),
(19, 'Dra. Kusrini Tri Wahyuni.', 'Guru BP/BK', '19651116 199903 2 002'),
(20, 'M. Eru Martyanto, S.Pd.', 'Guru Desain Grafika (FR & PAC) & PKK', '19660324 199203 1 010'),
(21, 'Eko Budi Iswanto, S.Pd.', 'Guru Prod. Grafika (Penye. Graf.)', '19690412 199203 1 015'),
(22, 'Rini Soesilowati, S.Pd.', 'Guru Desain Grafika (SHK)', '19700825 199303 2 005'),
(23, 'Wageyanto, S.Pd., M.Pd.', 'Guru Prod. Grafika (TC) & Prod. Grafika (PC)', '19701102 199303 1 001'),
(24, 'Drs. Edi Prasetyono', 'Guru Desain Grafika (DDG)', '19610402 199303 1 003'),
(25, 'Sri Iswahyuni, S.Pd', 'Guru Kimia', '19640518 199302 2 001'),
(26, 'Drs. Masyhudi', 'Guru PAI', '19660325 200312 1 006'),
(27, 'Drs. Nurcholiq', 'Guru PAI', '19660428 199802 1 001'),
(28, 'Esti Sukorini Rahayu', 'Guru Kimia', '19660630 199001 2 002'),
(29, 'N. Dyah Hartati, S.Kom', 'Guru Multimedia (DGP)', '19730428 200312 2 004'),
(30, 'Edy Sugeng Priyono, SIP', 'Guru Desain Graf.', '19590815 198603 1 022'),
(31, 'Dra. Umi Sa adah', 'Guru Prod. Kreatif & KWU', '19621229 200012 2 001'),
(32, 'Dra. Sujarwati', 'Guru Matematika', '19630531 200801 2 001'),
(33, 'Drs. Agus Putanto', 'Guru PKn', '19630813 200012 1 001'),
(34, 'Drs. Dharmadi', 'Guru Bahasa Indonesia', '19640223 200801 1 002'),
(35, 'Drs. Fadil Arif', 'Guru Matematika & Multimedia (DDG)', '19641018 198603 1 012'),
(36, 'Supaat, S.Pd.', 'Guru Prod. Grafika (PKK)', '19650720 198510 1 001'),
(37, 'Anang Priyono, S.Pd', 'Guru Prod. Grafika (CT) & Prod. Grafika (PC)', '19660413 198603 1 010'),
(38, 'Drs. Moch. Imron', 'Guru Simdig', '19671103 200312 1 003'),
(39, 'Dra. Siti Munawaroh', 'Guru PAI', '19671229 200501 2 006'),
(40, 'I Wayan Setiady, S.Pd.', 'Guru Matematika', '19680429 200501 1 006'),
(41, 'Mad Iskandar, S.Pd.', 'Guru PJOK', '19681213 200003 1 004'),
(42, 'Santie Ardienie, M.Pd.', 'Guru Bhs Indonesia', '19721209 200604 2 019'),
(43, 'Rindi Astuti, SE, M.Pd.', 'Guru Prod. Logistik (PP), Prod. Logistik (PKK), PKK, DDG', '19761201 200801 2 023'),
(44, 'Dwi Ratnaningsih, M.Pd.', 'Guru Matematika', '19801010 200604 2 051'),
(45, 'Muhammad Asrofi, M.Pd.', 'Guru Fisika & Pemrograman Dasar', '19810328 200604 1 013'),
(46, 'Naniek, S.Pd', 'Guru Kimia', '19820128 200604 2 017'),
(47, 'Puguh Hartono, S.Pd.	', 'Guru Fisika', '19820128 200604 2 017'),
(48, 'Budi Cahyono,S.Pd.', 'Guru Seni Budaya', '19720404 200903 1 002'),
(49, 'Taufik Priolaksono,S.Kom., M.Pd.', 'Guru Prod. TKJ (KJD)', '19721210 200604 1 018'),
(50, 'Atik Rahmawati,S.Pd.', 'Guru Simulasi Digital & DDG MM', '19740401 200903 2 001'),
(51, 'Achmad Syaifudin, S.Sn.', 'Guru Desain Grafika (DG)', '19760113 200604 1 011	'),
(52, 'Tisna Hestiningtyas, S.Pd.', 'Guru Sejarah', '19770121 201101 2 004'),
(53, 'Wahyu Rosita Dewi,S.S, M.Pd.', 'Guru B. Inggris & Perhotelan (KIP)', '19770209 200903 2 003'),
(54, 'Oktavia Eko Susanti, S.Pd.', 'Guru Fisika', '19781005 201001 2 014'),
(55, 'Wuryandaru,S.Pd.', 'Guru Seni Budaya', '19790818 200903 1 003'),
(56, 'Iba Mardhatama, S.Sn', 'Guru Multimedia(TA 2D & 3D)', '19800118 201001 1 010'),
(57, 'Muhammad Muchlisin, M.Pd', 'Guru Multimedia(TA 2D & 3D), & Sistem Komputer', '19800316 201001 1 012'),
(58, 'Dwi Nurhayati, S.Pd.', 'Guru Bahasa Inggris', '19810525 201101 2 005'),
(59, 'Agus Purnomo, M.Pd.	', 'Guru Bhs Indonesia', '19810704 201101 1 005'),
(60, 'Moh. Mahmudi, S.Kom, M.Pd.', 'Guru Pemrog. Berorientasi Objek, Basis Data', '19830514 201001 1 018'),
(61, 'Dewi Rohmah, M.Pd', 'Guru Bhs Indonesia', '19830619 201001 2 014'),
(62, 'Aulia Dian Puspita H, S.Si.', 'Guru Matematika & Prod. Perhotelan 26 (SHKK)', '19850922 201001 2 021'),
(63, 'Anis Soviana, M.Pd.', 'Guru Bahasa Inggris', '19860203 201001 2 019'),
(64, 'Dian Maya Sari, S.Pd.', 'Guru Matematika & Sistem Komputer', '19860528 201101 2 011'),
(65, 'Stefanus Candra W., S.Sn', 'Guru Multimedia (DGP) & Multimedia ( TA 2D & 3D)', '19781114 201403 1 001'),
(66, 'Yulia Tania Vabelay, S.Sn.', 'Guru Dasar-Dasar Kreativitas, Tinjauan Seni, & PKK', '19820730 201403 2 001'),
(67, 'Eko Wahyudi, S.Pd', 'Guru Mekatronika (TKBdGT), CAE, & PPPM', '19850323 201403 1 001	'),
(68, 'Sundari, S.Pd', 'Guru Kalkulasi Grafika', '19880427 201403 2 001'),
(69, 'M. Nurul Ansory, S.Pd.', 'Guru Fisika', '19720416 201407 1 001'),
(70, 'Teguh Santoso, S.Pd.', 'Guru Bahasa Inggris & DDG MM', '19730628 201407 1 001'),
(71, 'Ismawati, S.Pd.', 'Guru Matematika & Sistem Komputer', '19761115 201407 2 002'),
(72, 'Triyudi Yudawan, S.Pd', 'Guru Bahasa Inggris', '19780105 201407 1 003'),
(73, 'Dhanang Fitra R., S.Si, MT', 'Guru RPL (Pemrograman Web & Perangkat Bergerak)', '19810805 201407 1 003'),
(74, 'Kurnianingdyas Dwi A, S.Si', 'Guru Matematika & Prod. Perhotelan (KPW)', '19801227 201407 2 005'),
(75, 'Septi Retno Desi P., S.Pd.', 'Guru P. Dasar, Sistem Komputer & Basis Data', '19910901 201903 2 024'),
(76, 'Muhammad Iqbal, S.Pd.	', 'Guru Prod. TKJ (TJBL) & Prod. TKJ (ASJ)', '19940521 201903 1 008'),
(77, 'Suci Lestari, S.Pd.', 'Guru Videografi, Animasi 2D, & Digital Processing', '19960204 201903 2 003'),
(78, 'Dian Retno Yuliati, A.Md.', 'Guru Pemrog. Dasar, PKK, & Sistem Komputer', '19770708 201407 2 004'),
(79, 'Yacobus Sutrisna, S.Ag', 'Guru Agama Katolik', '-'),
(80, 'Moch.Trisna W., S.Pd.', 'Guru Prod. Grafika (PPP) & PLIP', '1199/329'),
(81, 'Moch. Harijono, ST', 'Guru PLIP, PAC dan FR', '148/146'),
(82, 'Sri Rahayu Ambarwati, S.Pd.', 'Guru Sejarah', '1201/329'),
(83, 'Drs. Suharyono', 'Guru PKn', '1202/329'),
(84, 'Salwa Erisa, S.Pd.', 'Guru Bahasa Inggris', '154/146'),
(85, 'Iin Sulistyowati, S.Pd.', 'Guru Bhs Indonesia', '161/146'),
(86, 'Nungky Kusuma D., S.Si.', 'Guru Matematika', '177/146'),
(87, 'Samsul Arif, S.Pd.', 'Guru Prod. Grafika (TC) & Prod. Grafika (PC)', '1204/329'),
(88, 'R. Ahmad Murtada, S.Pd.', 'Guru Bhs Indonesia', '189/146'),
(89, 'M. Rizki Fadillah, S.Kom.', 'Guru PLIP, PPP, & Simdig', '191/146'),
(90, 'Yogi Dian Arinugroho, S.Pd.', 'Guru Bahasa Inggris', '190/146'),
(91, 'Sujarwo Setiyono, S.Pd.', 'Guru Kalkulasi Grafika', '1206/329'),
(92, 'Dominggus S, S.Ag', 'Guru Agama Kristen', '-'),
(93, 'Zaroh Wiraswastika, S.Sn', 'Guru Sketsa & Dasar Seni Rupa', '211/146'),
(94, 'Noviar Dyah S., S.Sn', 'Guru Digital Processing, Animasi 2D, & Animasi 3D', '198/146'),
(95, 'Riska Ingtyas Mangesti, MT', 'Guru Gambar Teknik, Prod. Logistik (LGMD), & Simdig', '205/146'),
(96, 'Yayuk Sriwahyuni, S.Pd.', 'Guru BP/BK', '164/146'),
(97, 'Sulastri, S.Ag', 'Guru Agama Hindu', '-'),
(98, 'Eka Aristiani, A.Md', 'Guru FR & DDG', '210/146'),
(99, 'Budhi Prasetyo, A.Md	', 'Guru Prod. Grafika (DDG) & Prod. Grafika (PC)', '206/146'),
(100, 'Mita Arfiandani, M.Pd', 'Guru Bhs Indonesia & Bhs Daerah', '223/146'),
(101, 'Beny Iswahyudi, S.Kom', 'Guru Desain Grafis', '260/146'),
(102, 'Kesi Widhiati, S.Pd.', 'Guru Matematika', '148/146'),
(103, 'Budi Utomo, S.T.', 'Guru Prod. TKJ (AIJ)', '261/146'),
(104, 'Qomaruddin, M.Pd', 'Guru PAI', '284/146'),
(105, 'Igit Agus Sara, S.Pd.', 'Guru PJOK MM', '262/146'),
(106, 'Dwi Setyorini, S.Sn', 'Guru Multimedia (DDG) & PKK', '263/146'),
(107, 'Mawardi, S.Pd.', 'Guru Seni Budaya', '267/146'),
(108, 'Sandi Arianto, S.Sn', 'Guru Gambar & Animasi 2D', '279/146'),
(109, 'Hanif Hubbuddin A, S.Pd', 'Guru Bhs Indonesia & Bhs Daerah', '1207/329'),
(110, 'Kismiaji, S.Sn', 'Guru Multimedia (PKK)', '1208/329'),
(111, 'Idin Yulias Prayogo, S.Pd.', 'Guru PJOK', '1211/329'),
(112, 'Ika Fitri Mustikasari, S.Sn.', 'Desaik Grafika (SHK), PKK & Simdig', '1212/329'),
(113, 'Achmad Cholis Mustofa, M.PdI', 'Guru PAI', '1214/329'),
(114, 'Sulaimah, S.PdI.', 'Guru PAI', '1213/329'),
(115, 'Novi Ardiana, S.Pd.', 'Guru Sejarah', '1215/329'),
(116, 'Yezinta Dewimaharani, S.Pd', 'Guru Prod. TKJ (KJD), Prod. TKJ (TLJ) & PKK', '1217/329'),
(117, 'Selly Afrilia Sani, S.PdI.', 'Guru PAI', '1222/329'),
(118, 'Indrawan Wahyu, S.Pd.', 'Guru Sejarah', '1218/329'),
(119, 'Sotya Renaningwibi S, S.Pd.', 'Guru Prod. TKJ (KJD)', '1223/329'),
(120, 'Anggreani Tyas Sari, S.Pd.', 'Guru PPL & Pemrog. Berorientasi 27 Objek', '1224/329'),
(121, 'Drs. Hariono', 'Guru Pend. Agama Budha', '-'),
(122, 'Sarti, S.Pd.', 'Guru PKn', '-'),
(123, 'Mochamad Satrio, S.Pd', 'Guru Mekatronika (TPMdM),', '-'),
(124, 'Rafsanjaya Mahaputra, S.Pd', 'Guru Multimedia (TA 2D 3D) & PKK', '-'),
(125, 'Rahmanto Junaidi, ST	', 'Guru Logistik (PMDSK), Logistik (MHE), Logistik (Pergudangan) & Logistik (PDAG)', '-'),
(126, 'Muchlis Hardianto, SE', 'Desain Grafika (DDG)', '-');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jdl_pengajuan`
--

CREATE TABLE `tbl_jdl_pengajuan` (
  `id_judul` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nodok` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_jdl_pengajuan`
--

INSERT INTO `tbl_jdl_pengajuan` (`id_judul`, `nama`, `nodok`) VALUES
(26, 'Pengajuan Inventaris', '123123124212312');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Bahan'),
(8, 'Alat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id_log` int(11) NOT NULL,
  `id_user` varchar(50) NOT NULL,
  `aktivitas` varchar(255) NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`id_log`, `id_user`, `aktivitas`, `waktu`, `is_deleted`) VALUES
(1, 'Admin1', 'Input data <b>3 x Printer Epson P10</b> di tabel <b>Barang<b>', '2023-November-01 09:15:37', 0),
(2, 'Admin1', 'Delete data <b>Printer Epson P10-1</b> di tabel <b>Barang<b>', '2023-November-01 09:16:39', 0),
(3, 'Admin1', 'Delete data <b>Printer Epson P10-2</b> di tabel <b>Barang<b>', '2023-November-01 09:16:41', 0),
(4, 'Admin1', 'Input data <b>3 x manuk</b> di tabel <b>Barang<b>', '2023-November-01 09:17:07', 0),
(5, 'Admin1', 'Delete data <b>manuk-1</b> di tabel <b>Barang<b>', '2023-November-01 09:20:21', 0),
(6, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 09:31:50', 0),
(7, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 09:32:18', 0),
(8, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 11:03:11', 0),
(9, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 12:54:54', 0),
(10, 'Admin1', 'Delete data <b>manuk-2</b> di tabel <b>Barang<b>', '2023-November-01 12:57:14', 0),
(11, 'Admin1', 'Input data <b>21 x Laptop 10osdoal</b> di tabel <b>Barang<b>', '2023-November-01 12:57:39', 0),
(12, 'Admin1', 'Delete data <b>Laptop 10osdoal-1</b> di tabel <b>Barang<b>', '2023-November-01 13:23:54', 0),
(13, 'Admin1', 'Input data <b>2 x Laptop</b> di tabel <b>Barang<b>', '2023-November-01 13:26:08', 0),
(14, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 13:27:26', 0),
(15, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 13:28:17', 0),
(16, 'Admin1', 'Delete data <b>Laptop-21</b> di tabel <b>Barang<b>', '2023-November-01 13:44:24', 0),
(17, 'Admin1', 'Input data <b>13 x Laptop</b> di tabel <b>Barang<b>', '2023-November-01 13:44:51', 0),
(18, 'Admin1', 'Nama Siswa <b>ABHINAYA REI AHMAD SYAFAWI</b> Meminjam Barang <b>Laptop-1</b>', '2023-November-01 13:45:17', 0),
(19, 'Admin1', '', '', 0),
(20, 'Admin1', 'Menghapus Pinjaman <b>Laptop-1</b> dari Siswa <b>ABHINAYA REI AHMAD SYAFAWI</b> ', '2023-November-01 13:45:40', 0),
(21, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 13:46:11', 0),
(22, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-01 13:47:17', 0),
(23, 'Admin1', 'Delete data <b>Laptop-10</b> di tabel <b>Barang<b>', '2023-November-01 13:47:37', 0),
(24, 'Admin1', 'Delete data <b>Laptop-11</b> di tabel <b>Barang<b>', '2023-November-01 13:47:41', 0),
(25, 'Admin1', 'Delete data <b>Laptop-12</b> di tabel <b>Barang<b>', '2023-November-01 13:47:45', 0),
(26, 'Admin1', 'Delete data <b>Laptop-9</b> di tabel <b>Barang<b>', '2023-November-01 13:47:48', 0),
(27, 'Admin1', 'Delete data <b>Laptop-8</b> di tabel <b>Barang<b>', '2023-November-01 13:47:52', 0),
(28, 'Admin1', 'Delete data <b>Laptop-7</b> di tabel <b>Barang<b>', '2023-November-01 13:47:55', 0),
(29, 'Admin1', 'Delete data <b>Laptop-6</b> di tabel <b>Barang<b>', '2023-November-01 13:47:57', 0),
(30, 'Admin1', 'Delete data <b>Laptop-5</b> di tabel <b>Barang<b>', '2023-November-01 13:48:03', 0),
(31, 'Admin1', 'Input data <b>3 x LAN</b> di tabel <b>Barang<b>', '2023-November-01 13:48:38', 0),
(32, 'Admin1', 'Input data <b>3 x LAPTOP</b> di tabel <b>Barang<b>', '2023-November-01 13:50:36', 0),
(33, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 09:25:01', 0),
(34, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 09:25:30', 0),
(35, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 09:34:27', 0),
(36, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 09:34:44', 0),
(37, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 09:35:44', 0),
(38, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 09:35:52', 0),
(39, '', 'Insert data barang <b>VGA-2</b> di tabel <b>Barang</b>', '2023-November-02 10:26:11', 0),
(40, '', 'Insert data barang <b>dildo-2</b> di tabel <b>Barang</b>', '2023-November-02 14:09:26', 0),
(41, '', 'Delete data <b>dildo-1</b> di tabel <b>Barang<b>', '2023-November-02 14:11:09', 0),
(42, '', 'Delete data <b>dildo-2</b> di tabel <b>Barang<b>', '2023-November-02 14:11:13', 0),
(43, 'Admin1', 'Insert data barang <b>valen-2</b> di tabel <b>Barang</b>', '2023-November-02 14:13:17', 0),
(44, 'Admin1', 'Delete data <b>valen-2</b> di tabel <b>Barang<b>', '2023-November-02 14:13:27', 0),
(45, 'Admin1', 'Delete data <b>valen-2</b> di tabel <b>Barang<b>', '2023-November-02 14:13:31', 0),
(46, 'Admin1', 'Delete data <b>valen-1</b> di tabel <b>Barang<b>', '2023-November-02 14:13:35', 0),
(47, 'Admin1', 'Delete data <b>valen-1</b> di tabel <b>Barang<b>', '2023-November-02 14:14:51', 0),
(48, 'Admin1', 'Delete data <b>VGA-2</b> di tabel <b>Barang<b>', '2023-November-02 14:14:54', 0),
(49, 'Admin1', 'Insert data barang <b>KONTPL-3</b> di tabel <b>Barang</b>', '2023-November-02 20:15:44', 0),
(50, 'Admin1', 'Delete data <b>KONTPL-1</b> di tabel <b>Barang<b>', '2023-November-02 20:16:10', 0),
(51, 'Admin1', 'Delete data <b>KONTPL-2</b> di tabel <b>Barang<b>', '2023-November-02 20:16:14', 0),
(52, 'Admin1', 'Delete data <b>KONTPL-3</b> di tabel <b>Barang<b>', '2023-November-02 20:16:18', 0),
(53, 'Admin1', 'Insert data barang <b>asu-2</b> di tabel <b>Barang</b>', '2023-November-02 20:20:01', 0),
(54, 'Admin1', 'Delete data <b>asu-1</b> di tabel <b>Barang<b>', '2023-November-02 20:36:39', 0),
(55, 'Admin1', 'Delete data <b>asu-2</b> di tabel <b>Barang<b>', '2023-November-02 20:36:42', 0),
(56, 'Admin1', 'Insert data barang <b>asdoo-3</b> di tabel <b>Barang</b>', '2023-November-02 20:37:17', 0),
(57, 'Admin1', 'Delete data <b>asdoo-1</b> di tabel <b>Barang<b>', '2023-November-02 20:46:47', 0),
(58, 'Admin1', 'Delete data <b>asdoo-2</b> di tabel <b>Barang<b>', '2023-November-02 20:46:56', 0),
(59, 'Admin1', 'Delete data <b>asdoo-3</b> di tabel <b>Barang<b>', '2023-November-02 20:47:00', 0),
(60, 'Admin1', 'Insert data barang <b>iiikkasd-3</b> di tabel <b>Barang</b>', '2023-November-02 20:47:31', 0),
(61, 'Admin1', 'Delete data <b>iiikkasd-3</b> di tabel <b>Barang<b>', '2023-November-02 20:47:35', 0),
(62, 'Admin1', 'Delete data <b>iiikkasd-2</b> di tabel <b>Barang<b>', '2023-November-02 20:47:40', 0),
(63, 'Admin1', 'Delete data <b>iiikkasd-1</b> di tabel <b>Barang<b>', '2023-November-02 20:47:43', 0),
(64, 'Admin1', 'Delete data <b>VGA-1</b> di tabel <b>Barang<b>', '2023-November-02 20:49:41', 0),
(65, 'Admin1', 'Insert data barang <b>faskd-2</b> di tabel <b>Barang</b>', '2023-November-02 20:50:47', 0),
(66, 'Admin1', 'Delete data <b>faskd-1</b> di tabel <b>Barang<b>', '2023-November-02 20:50:51', 0),
(67, 'Admin1', 'Delete data <b>faskd-2</b> di tabel <b>Barang<b>', '2023-November-02 20:50:58', 0),
(68, 'Admin1', 'Insert data barang <b>tes-2</b> di tabel <b>Barang</b>', '2023-November-02 20:52:28', 0),
(69, 'Admin1', 'Delete data <b>tes-2</b> di tabel <b>Barang<b>', '2023-November-02 20:52:32', 0),
(70, 'Admin1', 'Delete data <b>tes-1</b> di tabel <b>Barang<b>', '2023-November-02 20:54:17', 0),
(71, 'Admin1', 'Insert data barang <b>poasd-2</b> di tabel <b>Barang</b>', '2023-November-02 20:55:24', 0),
(72, 'Admin1', 'Delete data <b>poasd-1</b> di tabel <b>Barang<b>', '2023-November-02 20:55:28', 0),
(73, 'Admin1', 'Nama Siswa <b>ECCA PUTRI LESTARI</b> Meminjam Barang <b>LAPTOP-2</b>', '2023-November-02 21:03:23', 0),
(74, 'Admin1', '', '', 0),
(75, 'Admin1', 'Delete data <b>LAPTOP-2</b> di tabel <b>Barang<b>', '2023-November-02 21:13:19', 0),
(76, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 21:39:09', 0),
(77, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-02 21:39:31', 0),
(78, 'Admin1', 'Delete data <b>poasd-2</b> di tabel <b>Barang<b>', '2023-November-03 09:37:10', 0),
(79, 'Admin1', 'Insert data barang <b>asi-2</b> di tabel <b>Barang</b>', '2023-November-03 09:43:23', 0),
(80, 'Admin1', 'Delete data <b>asi-1</b> di tabel <b>Barang<b>', '2023-November-03 09:49:58', 0),
(81, 'Admin1', 'Insert data barang <b>aisjid-2</b> di tabel <b>Barang</b>', '2023-November-03 09:51:17', 0),
(82, 'Admin1', 'Delete data <b>aisjid-2</b> di tabel <b>Barang<b>', '2023-November-03 09:54:27', 0),
(83, 'Admin1', 'Delete data <b>aisjid-1</b> di tabel <b>Barang<b>', '2023-November-03 09:55:17', 0),
(84, 'Admin1', 'Insert data barang <b>asdasd-1</b> di tabel <b>Barang</b>', '2023-November-03 09:56:08', 0),
(85, 'Admin1', 'Delete data <b>asdasd-1</b> di tabel <b>Barang<b>', '2023-November-03 09:56:12', 0),
(86, 'Admin1', 'Insert data barang <b>asdas-3</b> di tabel <b>Barang</b>', '2023-November-03 09:58:04', 0),
(87, 'Admin1', 'Delete data <b>asdas-1</b> di tabel <b>Barang<b>', '2023-November-03 10:01:21', 0),
(88, 'Admin1', 'Delete data <b>asdas-2</b> di tabel <b>Barang<b>', '2023-November-03 10:01:26', 0),
(89, 'Admin1', 'Delete data <b>asdas-3</b> di tabel <b>Barang<b>', '2023-November-03 10:01:30', 0),
(90, 'Admin1', 'Insert data barang <b>asdasda-2</b> di tabel <b>Barang</b>', '2023-November-03 10:02:18', 0),
(91, 'Admin1', 'Delete data <b>asdasda-1</b> di tabel <b>Barang<b>', '2023-November-03 10:02:20', 0),
(92, 'Admin1', 'Delete data <b>asdasda-2</b> di tabel <b>Barang<b>', '2023-November-03 10:02:23', 0),
(93, 'Admin1', 'Insert data barang <b>asdasd-3</b> di tabel <b>Barang</b>', '2023-November-03 10:03:27', 0),
(94, 'Admin1', 'Delete data <b>asdasd-1</b> di tabel <b>Barang<b>', '2023-November-03 10:03:29', 0),
(95, 'Admin1', 'Delete data <b>asdasd-2</b> di tabel <b>Barang<b>', '2023-November-03 10:03:31', 0),
(96, 'Admin1', 'Delete data <b>asdasd-3</b> di tabel <b>Barang<b>', '2023-November-03 10:03:33', 0),
(97, 'Admin1', 'Delete data <b>LAPTOP-꧓</b> di tabel <b>Barang<b>', '2023-November-03 10:03:57', 0),
(98, 'Admin1', 'Insert data barang <b>asdasd-2</b> di tabel <b>Barang</b>', '2023-November-03 10:05:50', 0),
(99, 'Admin1', 'Delete data <b>asdasd-1</b> di tabel <b>Barang<b>', '2023-November-03 10:05:54', 0),
(100, 'Admin1', 'Delete data <b>asdasd-2</b> di tabel <b>Barang<b>', '2023-November-03 10:05:56', 0),
(101, 'Admin1', 'Insert data barang <b>asdasd-1</b> di tabel <b>Barang</b>', '2023-November-03 10:06:31', 0),
(102, 'Admin1', 'Delete data <b>asdasd-1</b> di tabel <b>Barang<b>', '2023-November-03 10:06:34', 0),
(103, 'Admin1', 'Insert data barang <b>asdasd-3</b> di tabel <b>Barang</b>', '2023-November-03 10:53:20', 0),
(104, 'Admin1', 'Delete data <b>asdasd-1</b> di tabel <b>Barang<b>', '2023-November-03 10:53:43', 0),
(105, 'Admin1', 'Delete data <b>asdasd-2</b> di tabel <b>Barang<b>', '2023-November-03 10:53:46', 0),
(106, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa<b>', '2023-November-03 12:38:39', 0),
(107, 'Admin1', 'Nama Siswa <b>AZKA AZKIYA PUTRI ALYA</b> Meminjam Barang <b>asdasd-3</b>', '2023-November-03 12:38:54', 0),
(108, 'Admin1', '', '', 0),
(109, 'Admin1', 'Menghapus Pinjaman <b>asdasd-3</b> dari Siswa <b>AZKA AZKIYA PUTRI ALYA</b> ', '2023-November-03 12:39:10', 0),
(110, 'Admin1', 'Delete data <b>asdasd-3</b> di tabel <b>Barang<b>', '2023-November-03 12:39:33', 0),
(111, 'Admin1', 'Insert data barang <b>asd-3</b> di tabel <b>Barang</b>', '2023-November-03 12:39:52', 0),
(112, 'Admin1', 'Nama Siswa <b>ANDIKA BAYU PRATAMA</b> Meminjam Barang <b>asd-1</b>', '2023-November-03 12:41:06', 0),
(113, 'Admin1', '', '', 0),
(114, 'Admin1', 'Delete data <b>asd-1</b> di tabel <b>Barang<b>', '2023-November-04 22:01:51', 0),
(115, 'Admin1', 'Delete data <b>asd-1</b> di tabel <b>Barang<b>', '2023-November-04 22:01:54', 0),
(116, 'Admin1', 'Delete data <b>asd-3</b> di tabel <b>Barang<b>', '2023-November-04 22:01:56', 0),
(117, 'Admin1', 'Insert data barang <b>ais-2</b> di tabel <b>Barang</b>', '2023-November-04 22:22:07', 0),
(118, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa</b>', '2023-November-04 22:25:42', 0),
(119, 'Admin1', 'Delete data <b>ais-1</b> di tabel <b>Barang<b>', '2023-November-04 22:26:05', 0),
(120, 'Admin1', 'Delete data <b>ais-2</b> di tabel <b>Barang<b>', '2023-November-04 22:26:08', 0),
(121, 'Admin1', 'Insert data barang <b>fa0sd-2</b> di tabel <b>Barang</b>', '2023-November-04 22:28:35', 0),
(122, 'Admin1', 'Edit data <b></b> di tabel <b>Siswa</b>', '2023-November-04 22:28:44', 0),
(123, 'Admin1', 'Delete data <b>fa0sd-1</b> di tabel <b>Barang<b>', '2023-November-04 22:29:34', 0),
(124, 'Admin1', 'Delete data <b>fa0sd-2</b> di tabel <b>Barang<b>', '2023-November-04 22:47:48', 0),
(125, 'Admin1', 'Insert data barang <b>apsdlpl-1</b> di tabel <b>Barang</b>', '2023-November-04 22:48:26', 0),
(126, '', 'Edit Profil <b></b>', '2023-November-04 22:49:31', 0),
(127, 'Admin1', 'Delete data <b>apsdlpl-1</b> di tabel <b>Barang<b>', '2023-November-04 22:50:39', 0),
(128, 'Admin1', 'Insert data barang <b>oafjaksd-1</b> di tabel <b>Barang</b>', '2023-November-04 22:51:31', 0),
(129, 'Admin1', 'Edit Profil <b></b>', '2023-November-04 22:52:38', 0),
(130, 'Admin1', 'Insert data barang <b>daosdaskd-1</b> di tabel <b>Barang</b>', '2023-November-04 22:53:54', 0),
(131, 'Admin1', 'Edit Profil <b></b>', '2023-November-04 22:54:05', 0),
(132, 'Admin1', 'Delete data <b>daosdaskd-1</b> di tabel <b>Barang<b>', '2023-November-04 22:55:01', 0),
(133, 'Admin1', 'Delete data <b>kontol</b> di tabel <b>Barang<b>', '2023-November-04 22:55:03', 0),
(134, 'Admin1', 'Insert data barang <b>Kontrol-3</b> di tabel <b>Barang</b>', '2023-November-04 23:08:46', 0),
(135, 'Admin1', 'Delete data <b>Kontrol-1</b> di tabel <b>Barang<b>', '2023-November-04 23:10:11', 0),
(136, 'Admin1', 'Delete data <b>Kontrol-2</b> di tabel <b>Barang<b>', '2023-November-04 23:10:14', 0),
(137, 'Admin1', 'Delete data <b>Kontrol-3</b> di tabel <b>Barang<b>', '2023-November-04 23:10:16', 0),
(138, 'Admin1', 'Insert data barang <b>asidas-3</b> di tabel <b>Barang</b>', '2023-November-04 23:10:37', 0),
(139, 'Admin1', 'Delete data <b>asidas-1</b> di tabel <b>Barang<b>', '2023-November-04 23:10:50', 0),
(140, 'Admin1', 'Delete data <b>asidas-2</b> di tabel <b>Barang<b>', '2023-November-04 23:10:54', 0),
(141, 'Admin1', 'Delete data <b>asidas-3</b> di tabel <b>Barang<b>', '2023-November-04 23:10:57', 0),
(142, 'Admin1', 'Insert data barang <b>alsdpa-2</b> di tabel <b>Barang</b>', '2023-November-04 23:11:24', 0),
(143, 'Admin1', 'Delete data <b>alsdpa-1</b> di tabel <b>Barang<b>', '2023-November-04 23:12:10', 0),
(144, 'Admin1', 'Delete Admin <b>valenca</b>', '2023-November-10 13:30:32', 0),
(145, 'Admin1', 'Input Admin <b>user1</b>', '2023-November-10 13:30:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_luar_sekolah`
--

CREATE TABLE `tbl_luar_sekolah` (
  `id_luar_sekolah` int(11) NOT NULL,
  `nama_peminjam` varchar(50) NOT NULL,
  `no_identitas` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `id_barang` int(11) NOT NULL,
  `waktu_pinjam` datetime NOT NULL DEFAULT current_timestamp(),
  `waktu_kembali` datetime NOT NULL DEFAULT current_timestamp(),
  `kondisi_sebelum` varchar(10) NOT NULL,
  `kondisi_sesudah` varchar(15) NOT NULL,
  `is_confirmed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_peminjaman`
--

CREATE TABLE `tbl_peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_barang` varchar(150) NOT NULL,
  `id_siswa` varchar(255) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `waktu_pinjam` datetime NOT NULL,
  `waktu_kembali` datetime NOT NULL,
  `kondisi_sebelum` varchar(50) NOT NULL,
  `kondisi_sesudah` varchar(50) NOT NULL,
  `is_confirmed` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_peminjaman`
--

INSERT INTO `tbl_peminjaman` (`id_peminjaman`, `id_barang`, `id_siswa`, `id_guru`, `waktu_pinjam`, `waktu_kembali`, `kondisi_sebelum`, `kondisi_sesudah`, `is_confirmed`) VALUES
(77, '136', '32', 0, '2023-11-02 21:02:20', '2023-11-16 00:03:00', 'Baik', 'Rusak', 1),
(79, '181', '23', 0, '2023-11-03 12:40:37', '2023-11-03 12:41:00', 'Baik', 'Rusak', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengajuan`
--

CREATE TABLE `tbl_pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `id_judul` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `spek` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `total_harga` int(40) NOT NULL,
  `untuk` varchar(255) NOT NULL,
  `urgensi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pengajuan`
--

INSERT INTO `tbl_pengajuan` (`id_pengajuan`, `id_judul`, `nama`, `spek`, `jumlah`, `satuan`, `harga`, `total_harga`, `untuk`, `urgensi`) VALUES
(31, 26, 'HDMI', 'sadasda', 4, 'biji', 12132, 48528, 'sembarang', 'Mendesak');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `nama_sarpras` varchar(50) NOT NULL,
  `nip_sarpras` varchar(50) NOT NULL,
  `nama_kepsek` varchar(50) NOT NULL,
  `nip_kepsek` varchar(50) NOT NULL,
  `nama_kabeng` varchar(255) NOT NULL,
  `nip_kabeng` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`nama_sarpras`, `nip_sarpras`, `nama_kepsek`, `nip_kepsek`, `nama_kabeng`, `nip_kabeng`) VALUES
('Puguh Hartono, S.Pd.', '19700315 200312 1 009', 'Drs. Gunawan Dwiyono, S.ST., M.Pd', '19670930 199512 1 002', 'Suci Lestari, S.Pd', '19960204 201903 2 003');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `jurusan` varchar(15) NOT NULL,
  `abjad` varchar(10) NOT NULL,
  `nis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`id_siswa`, `nama_siswa`, `kelas`, `jurusan`, `abjad`, `nis`) VALUES
(20, 'ABHINAYA REI AHMAD SYAFAWI', 'X', 'Animasi', 'A', '25225 / 1510 . 127'),
(21, 'AHMAD RIDWAN MAULANA', 'X', 'Animasi', 'A', '25226 / 1511 . 127'),
(22, 'ANANDA RIZKY PUTRA PAMUNGKAS', 'X', 'Animasi', 'A', '25227 / 1512 . 127'),
(23, 'ANDIKA BAYU PRATAMA', 'X', 'Animasi', 'A', '25228 / 1513 . 127'),
(24, 'ANISA ARBI ASA AULIA', 'X', 'Animasi', 'A', '25229 / 1514 . 127'),
(25, 'ASYA FARAH AZZAHRA', 'X', 'Animasi', 'A', '25230 / 1515 . 127'),
(26, 'AYASHA ALMA KHAIRUNNISA', 'X', 'Animasi', 'A', '25231 / 1516 . 127'),
(27, 'AZKA AZKIYA PUTRI ALYA', 'X', 'Animasi', 'A', '25232 / 1517 . 127'),
(28, 'AZKA HAURA', 'X', 'Animasi', 'A', '25233 / 1518 . 127'),
(29, 'CANIA RAMADHANI', 'X', 'Animasi', 'A', '25234 / 1519 . 127'),
(30, 'CHALSIA MAYANG SARI', 'X', 'Animasi', 'A', '25235 / 1520 . 127'),
(31, 'DEVI AMALLIA SAPUTRI', 'X', 'Animasi', 'A', '25236 / 1521 . 127'),
(32, 'ECCA PUTRI LESTARI', 'X', 'Animasi', 'A', '25237 / 1522 . 127'),
(33, 'FAIZ ALDILA ROMADHON', 'X', 'Animasi', 'A', '25238 / 1523 . 127'),
(34, 'FARIS FIRMANSYAH', 'X', 'Animasi', 'A', '25239 / 1524 . 127'),
(35, 'FARIDDUDIN ATTAR', 'X', 'Animasi', 'A', '25240 / 1525 . 127'),
(36, 'HAIFANI CHITA HANDYALEVI ', 'X', 'Animasi', 'A', '25241 / 1526 . 127'),
(37, 'HAURA LATIFA FARRAS', 'X', 'Animasi', 'A', '25242 / 1527 . 127 '),
(38, 'INAYAH PUTRI', 'X', 'Animasi', 'A', '25243 / 1528 . 127'),
(39, 'MOCHAMMAD RIFQI KHOIRUDIN', 'X', 'Animasi', 'A', '25244 / 1529 . 127'),
(40, 'MOHAMMAD ALDY HABBIBIE', 'X', 'Animasi', 'A', '25245 / 1530 . 127'),
(41, 'MUHAMMAD IBTISAM MAGRIBI', 'X', 'Animasi', 'A', '25246 / 1531 . 127'),
(42, 'NABILA KANIA ASTRIVIANI', 'X', 'Animasi', 'A', '25247 / 1532 . 127'),
(43, 'NASYWAA YULISA ELFIRA', 'X', 'Animasi', 'A', '25248 / 1533 . 127'),
(44, 'PRAMUDITA PARAMESWARA', 'X', 'Animasi', 'A', '25249 / 1534 . 127'),
(45, 'RADITYA OKTALYON JUMANTARA ATMAJA', 'X', 'Animasi', 'A', '25220 / 1535 . 127'),
(46, 'RICKO AFRIZAL DIKDAYA', 'X', 'Animasi', 'A', '25251 / 1536 . 127'),
(47, 'RIZQI FARADILA SANDY', 'X', 'Animasi', 'A', '25252 / 1537 . 127'),
(48, 'RUIZ ZACHDIN', 'X', 'Animasi', 'A', '25253 / 1538 . 127'),
(49, 'SEKAR ANANDITA DEWI', 'X', 'Animasi', 'A', '25254 / 1539 / 127'),
(50, 'SHAKIRA SAHWAHITA', 'X', 'Animasi', 'A', '25255 / 1540 . 127'),
(51, 'SHILA APRILIA PUTRI NUGROHO', 'X', 'Animasi', 'A', '25256 / 1541 . 127'),
(52, 'TSANA SHAZIA JASMINE RAHARJO', 'X', 'Animasi', 'A', '25257 / 1542 . 127'),
(53, 'TSANIA AYU PRAHAPSARI', 'X', 'Animasi', 'A', '25258 / 1543 . 127'),
(54, 'WICHITA MARSAA AQIL', 'X', 'Animasi', 'A', '25259 / 1544 . 127'),
(55, 'YUSUF BAIHAQI', 'X', 'Animasi', 'A', '25260 / 1545 . 127'),
(56, 'ABIMANYU GATHAN ALVARO', 'X', 'Animasi', 'B', '25261 / 1546 . 127'),
(57, 'ADI SYAPUTRA WIJIARTHA', 'X', 'Animasi', 'B', '25262 / 1547 . 127'),
(58, 'ADZWAN RIVI SANTOSO', 'X', 'Animasi', 'B', '25263 / 1548 . 127'),
(59, 'AKHTAR DZAKWAN', 'X', 'Animasi', 'B', '25264 / 1549 . 127'),
(60, 'ALVINO RULIANZA MUHAMMAD', 'X', 'Animasi', 'B', '25265 / 1550 . 127'),
(61, 'ANDIKA ACHMAD DHIYAUDDIN ALAZMI', 'X', 'Animasi', 'B', '25266 / 1551 . 127'),
(62, 'ARLA HAVIZA ARINDA HASIB', 'X', 'Animasi', 'B', '25267 / 1552 . 127'),
(63, 'AURELLIA EGLESSIAS NURYAHYA RAHMAN', 'X', 'Animasi', 'B', '25268 / 1553 . 127'),
(64, 'CATUR DANU SATRIYO PAMUNGKAS', 'X', 'Animasi', 'B', '25269 / 1554 . 127'),
(65, 'DAVA ADYTIYA SAPUTRA', 'X', 'Animasi', 'B', '25270 / 1555 . 127'),
(66, 'DESEMBRIAR BAGAS AREMANSYAH', 'X', 'Animasi', 'B', '25271 / 1556 . 127'),
(67, 'DHANIA PUTRI PERMANA', 'X', 'Animasi', 'B', '25272 / 1557 . 127'),
(68, 'DURRANI SABRINA ASFA', 'X', 'Animasi', 'B', '25273 / 1558 . 127'),
(69, 'ELVARA SALSABILAH', 'X', 'Animasi', 'B', '25274 / 1559 . 127'),
(70, 'GELYA CALISTA NAFLAH BEFANI', 'X', 'Animasi', 'B', '25275 / 1560 . 127'),
(71, 'HERCINDIO RAYHAN BUDI PRATHAMA', 'X', 'Animasi', 'B', '25276 / 1561 . 127'),
(72, 'JIDAN ADIJAYA', 'X', 'Animasi', 'B', '25277 / 1562 . 127'),
(73, 'LILA AYU PUTRI FEBRIANI', 'X', 'Animasi', 'B', '25278 / 1563 . 127'),
(74, 'MADDY SETYO RENDIKA', 'X', 'Animasi', 'B', '25279 / 1564 . 127'),
(75, 'MERISA DWI WULANDARI YANUAR', 'X', 'Animasi', 'B', '25280 / 1565 . 127'),
(76, 'MOCH DWI ANDRIANSYAH', 'X', 'Animasi', 'B', '25281 / 1566 . 127'),
(77, 'MOCHAMMAD FAREL FIRMANSYAH', 'X', 'Animasi', 'B', '25282 / 1567 . 127'),
(78, 'MUHAMAD AGUNG FIRMANSYAH', 'X', 'Animasi', 'B', '25283 / 1568 . 127'),
(79, 'MUHAMMAD ALAIKA BITTUQO', 'X', 'Animasi', 'B', '25284 / 1569 . 127'),
(80, 'MUHAMMAD RIANDY WAHYU ROMADHON', 'X', 'Animasi', 'B', '25285 / 1570 . 127'),
(81, 'RACHEL CRISNATASYA', 'X', 'Animasi', 'B', '25286 / 1571 . 127'),
(82, 'RAJUAN RAFI PUTRA SUWANTO', 'X', 'Animasi', 'B', '25287 / 1572 . 127'),
(83, 'RIZKY PRASTYA ADJI', 'X', 'Animasi', 'B', '25288 / 1573 . 127'),
(84, 'SALAISYA ZAHIRA PUTRI NABILA', 'X', 'Animasi', 'B', '25289 / 1574 . 127'),
(85, 'SHABIRA AQHIEL HERNANDA PUTRI', 'X', 'Animasi', 'B', '25290 / 1575 . 127'),
(86, 'SHIFA PUTRI MAULIDYA', 'X', 'Animasi', 'B', '25291 / 1576 . 127'),
(87, 'SYERA AISHARISMA MAHARANI', 'X', 'Animasi', 'B', '25292 / 1577 . 127'),
(88, 'YUDA PUTRA PRATAMA', 'X', 'Animasi', 'B', '25293 / 1578 . 127'),
(89, 'ZAHRA AMELIA', 'X', 'Animasi', 'B', '25294 / 1579 . 127'),
(90, 'ZAENAB MIFTAKHUL KARBELANI', 'X', 'Animasi', 'B', '25295 / 1580 . 127'),
(91, 'ACHMAD ADITYA', 'X', 'Animasi', 'C', '25296 / 1581 . 127'),
(92, 'ADITYA DWI RIZKY RAMADHAN', 'X', 'Animasi', 'C', '25297 / 1582 . 127'),
(93, 'AILEEN CARELIA WIDI GAYNELL THEOPHANIA', 'X', 'Animasi', 'C', '25298 / 1583 . 127'),
(94, 'ALBYAN MAULANA IZHA', 'X', 'Animasi', 'C', '25299 / 1584 . 127'),
(95, 'AMANDA WIBOWO PUTRI', 'X', 'Animasi', 'C', '25300 / 1585 . 127'),
(96, 'ANINNATUS SHOLIHA', 'X', 'Animasi', 'C', '25301 / 1586 . 127'),
(97, 'AULIA PUAN PRAMUDHITA', 'X', 'Animasi', 'C', '25302 / 1587 . 127'),
(98, 'BAGAS RINGGA HADY SAPUTRA', 'X', 'Animasi', 'C', '25303 / 1588 . 127'),
(99, 'CHELSEA MAURA SIONO', 'X', 'Animasi', 'C', '25304 / 1589 . 127'),
(100, 'DAVAN DWI PRASTYO', 'X', 'Animasi', 'C', '25305 / 1590 . 127'),
(101, 'DEWITA SITI AZRIVAH', 'X', 'Animasi', 'C', '25306 / 1591 . 127'),
(102, 'DICKY THUFAIL RAFI SENA', 'X', 'Animasi', 'C', '25307 / 1592 . 127'),
(103, 'ELQUEENA AISHAFIRA SHAFA', 'X', 'Animasi', 'C', '25308 / 1593 . 127'),
(104, 'FARREL AURELIO SETYA BASWARA ', 'X', 'Animasi', 'C', '25309 / 1594 . 127'),
(105, 'HANIFAH ALTHAFUNNISA', 'X', 'Animasi', 'C', '25310 / 1595 . 127'),
(106, 'IRHAM FAIZ WIBOWO', 'X', 'Animasi', 'C', '25311 / 1596 . 127'),
(107, 'KELVIN MUJI SETYA WIJAYA', 'X', 'Animasi', 'C', '25312 / 1597 . 127'),
(108, 'LINGGAR ADITYA FERNANDO', 'X', 'Animasi', 'C', '25313 / 1598 . 127'),
(109, 'MARCELINO AHMAD BAYU SYAHPUTRA', 'X', 'Animasi', 'C', '25314 / 1599 . 127'),
(110, 'MOCH ASWAN RAMADHANI', 'X', 'Animasi', 'C', '25315 / 1600 . 127'),
(111, 'MOCH RAFI SATRYO', 'X', 'Animasi', 'C', '25316 / 1601 . 127'),
(112, 'MOHAMMAD RAKA ABIDZAR', 'X', 'Animasi', 'C', '25317 / 1602 . 127 '),
(113, 'MUHAMMAD AGUNG GHONY ILHAM HABIBI', 'X', 'Animasi', 'C', '25318 / 1603 . 127'),
(114, 'MUHAMMAD ANDI CAHYONO', 'X', 'Animasi', 'C', '25319 / 1604 . 127'),
(115, 'MUHAMMAD RAKHA TSAQIF MARANGGRAPUTRA', 'X', 'Animasi', 'C', '25320 / 1605 . 127'),
(116, 'MUHAMMAD RIZAL ZAHMI ', 'X', 'Animasi', 'C', '25321 / 1606 . 127'),
(117, 'NAVY HAFISH ADINNANSYAH WIBISONO', 'X', 'Animasi', 'C', '25322 / 1607 . 127'),
(118, 'RAFEL BIRAMA WINARNO', 'X', 'Animasi', 'C', '25323 / 1608 . 127'),
(119, 'SAFINATUR ROHMAH', 'X', 'Animasi', 'C', '25324 / 1609 . 127'),
(120, 'SEFIRA NOVIA RARA INDAHYANI', 'X', 'Animasi', 'C', '25325 / 1610 . 127'),
(121, 'SHERINDA SENDANG KINASIH', 'X', 'Animasi', 'C', '25326 / 1611 . 127'),
(122, 'SHIKANARA DIANDRA VAREMANITA', 'X', 'Animasi', 'C', '25327 / 1612 . 127'),
(123, 'SITI INDAH WASTUTI', 'X', 'Animasi', 'C', '25328 / 1613 . 127'),
(124, 'YOGA PANJI PANGESTU', 'X', 'Animasi', 'C', '25329 / 1614 . 127'),
(125, 'ZAZKYA SYAFARA NOFRA HADINDA', 'X', 'Animasi', 'C', '25330 / 1615 . 127'),
(126, 'ABIYYU DZAKY SHOFWAN', 'XI', 'Animasi', 'A', '24326 / 1404 . 127'),
(127, 'ARDIANSYAH PANDU ARLIYADI', 'XI', 'Animasi', 'A', '24327 / 1405 . 127'),
(128, 'ARINA HASNA AULIA', 'XI', 'Animasi', 'A', '24328 / 1406 . 127'),
(129, 'ARNETTA NANDA PRAMUDIA', 'XI', 'Animasi', 'A', '24329 / 1407 . 127'),
(130, 'AXELLE JAUZA WIDI PRATAMA', 'XI', 'Animasi', 'A', '24330 / 1408 . 127'),
(131, 'BILQIS PUTRI GIKA VALENCIA', 'XI', 'Animasi', 'A', '24331 / 1409 . 127'),
(132, 'DEVEN KHRISNA PUTRA KUSUMA', 'XI', 'Animasi', 'A', '24334 / 1412 . 127'),
(133, 'DHOZER MARQUESH SUGIARTO', 'XI', 'Animasi', 'A', '24335 / 1413 . 127'),
(134, 'DIRGA EKA RAMADHANI', 'XI', 'Animasi', 'A', '24336 / 1414 . 127'),
(135, 'DZAKYA RAHMA ARHEANSYAH', 'XI', 'Animasi', 'A', '24337 / 1415 . 127'),
(136, 'IAN IMMANUEL SUSILO', 'XI', 'Animasi', 'A', '24338 / 1416 . 127'),
(137, 'KHUROIDATUN NADZIFAH', 'XI', 'Animasi', 'A', '24339 / 1417 . 127'),
(138, 'KINAN NUR HIASATI', 'XI', 'Animasi', 'A', '24340 / 1418 . 127'),
(139, 'LARASHATI TORIQO ISLAMI', 'XI', 'Animasi', 'A', '24341 / 1419 . 127'),
(140, 'MUHAMAD ZAKLY HAKIM', 'XI', 'Animasi', 'A', '24342 / 1420 . 127'),
(141, 'MUHAMMAD FARREL NUR ALIF', 'XI', 'Animasi', 'A', '24343 / 1421 . 127'),
(142, 'MUHAMMAD IQBAL AZZAHIR', 'XI', 'Animasi', 'A', '24344 / 1422 . 127'),
(143, 'MUHAMMAD YAQDHAN RAFIF B', 'XI', 'Animasi', 'A', '24345 / 1423 . 127'),
(144, 'NABILA HAYA AGUSTIN', 'XI', 'Animasi', 'A', '24346 / 1424 . 127'),
(145, 'NAJWA AURORA MAHSYA', 'XI', 'Animasi', 'A', '24347 / 1425 . 127'),
(146, 'NATAKA JURO BALAKOSA', 'XI', 'Animasi', 'A', '24348 / 1426 . 127'),
(147, 'NATANIA ZAHRA WAHYU CAHYANI', 'XI', 'Animasi', 'A', '24349 / 1427 . 127'),
(148, 'NAYLA PUTRI RAMADHANI', 'XI', 'Animasi', 'A', '24350 / 1428 . 127'),
(149, 'RAFFAN AHMAD AUFAL BAHRI', 'XI', 'Animasi', 'A', '24351 / 1429 . 127'),
(150, 'RASYA RAHMADANI PUTRI', 'XI', 'Animasi', 'A', '24352 / 1430 . 127'),
(151, 'ROIS GIZA MUSTHOFA AL ISLAMI', 'XI', 'Animasi', 'A', '24353 / 1431 . 127'),
(152, 'SABRINA EKA PRATIWI', 'XI', 'Animasi', 'A', '24355 / 1433 . 127'),
(153, 'SALSABILA SAFIRA CANDRAWATI', 'XI', 'Animasi', 'A', '24356 / 1434 . 127'),
(154, 'SELLYRA MELODIS CAVALERA', 'XII', 'Animasi', 'A', '24357 / 1435 . 127'),
(155, 'SHEVA ISMA WICAKSANA', 'XI', 'Animasi', 'A', '24358 / 1436 . 127'),
(156, 'SUKMA RENDRA FATAHILLAH', 'XI', 'Animasi', 'A', '24359 / 1437 . 127'),
(157, 'SYAHRUL RAMADHAN', 'XI', 'Animasi', 'A', '24360 / 1438 . 127'),
(158, 'ADITYA CRISHNA PRADANA', 'XI', 'Animasi', 'B', '24361 / 1439 . 127'),
(159, 'AMALIA AZKIYAH', 'XI', 'Animasi', 'B', '24362 / 1440 . 127'),
(160, 'ANDINNI CITRAHANNA HAPSARI', 'XI', 'Animasi', 'B', '24363 / 1441 . 127'),
(161, 'ANNISA NANDA PRATIWI', 'XI', 'Animasi', 'B', '24364 / 1442 . 127'),
(162, 'APRILIA RIZKI ISTIQOMAH', 'XI', 'Animasi', 'B', '24365 / 1443 . 127'),
(163, 'AQILAH LUQMANUL HAKIM', 'XI', 'Animasi', 'B', '24366 / 1444 . 127'),
(164, 'ARZHO ALPUTRA NDOEN', 'XI', 'Animasi', 'B', '24368 / 1446 . 127'),
(165, 'DIANDRINA ARISKA PUTRI', 'XI', 'Animasi', 'B', '24369 / 1447 . 127'),
(166, 'ERIKA NOVIA ARDIANI', 'XI', 'Animasi', 'B', '24370 / 1448 . 127'),
(167, 'FAHRIEL WAHYUHADIST SYAHPUTRA', 'XI', 'Animasi', 'B', '24371 / 1449 . 127'),
(168, 'FAJARUL RAUFIZZAT NURIAWAN PUTRO', 'XI', 'Animasi', 'B', '24372 / 1450 . 127'),
(169, 'FANDI FEBRIANSYAH', 'XI', 'Animasi', 'B', '24373 / 1451 . 127'),
(170, 'FIO JUAN PRASETYA', 'XI', 'Animasi', 'B', '24374 / 1452 . 127'),
(171, 'GENIUZ GZA DJAUZIYYA', 'XI', 'Animasi', 'B', '24375 / 1453 . 127'),
(172, 'HAIDAR RAFI', 'XI', 'Animasi', 'B', '24376 / 1454 . 127'),
(173, 'JENICA ZAHRA VALIDIA', 'XI', 'Animasi', 'B', '24377 / 1455 . 127'),
(174, 'MOCH FEBRIYAN ZAKARIA', 'XI', 'Animasi', 'B', '24379 / 1457 . 127'),
(175, 'MOCH. AQHDAN AFIZ', 'XI', 'Animasi', 'B', '24380 / 1458 . 127'),
(176, 'MOCHAMAD RAFI PRATAMA', 'XI', 'Animasi', 'B', '24381 / 1459 . 127'),
(177, 'MOCHAMMAD DIXIE TANDYAN PRIBADI', 'XI', 'Animasi', 'B', '24382 / 1460 . 127'),
(178, 'MUHAMAD DYLAN SYAH PUTRA', 'XI', 'Animasi', 'B', '24383 / 1461 . 127	'),
(179, 'MUHAMMAD AKHTAR RAFI', 'XI', 'Animasi', 'B', '24384 / 1462 . 127'),
(180, 'NADIA AULIA RAHMA', 'XI', 'Animasi', 'B', '24385 / 1463 . 127'),
(181, 'NADILA NURAINI', 'XI', 'Animasi', 'B', '24386 / 1464 . 127'),
(182, 'NAFIS ABIYYU BASTIAN', 'XI', 'Animasi', 'B', '24387 / 1465 . 127'),
(183, 'NAYLA ARASHY KAMAL', 'XI', 'Animasi', 'B', '24388 / 1466 . 127'),
(184, 'ORIEZA AULIA DZIKRI', 'XI', 'Animasi', 'B', '24389 / 1467 . 127'),
(185, 'OVILIA BUNGA CITRA LAUDYA', 'XI', 'Animasi', 'B', '24390 / 1468 . 127'),
(186, 'RIZKY KHARISMA INDAH HAPSARI', 'XI', 'Animasi', 'B', '24393 / 1471 . 127'),
(187, 'SASKIA LAILI RAMADHANI', 'XI', 'Animasi', 'B', '24394 / 1472 . 127'),
(188, 'ACHMAD DWI DHARMAWAN H.', 'XI', 'Animasi', 'C', '24396 / 1474 . 127'),
(189, 'ADDIANA NAYLA PUTRI AMANI', 'XI', 'Animasi', 'C', '24397 / 1475 . 127'),
(190, 'AL FARREL ENZO FAHRIZA', 'XI', 'Animasi', 'C', '24398 / 1476 . 127'),
(191, 'ALLISYA RENA NATHANIYA', 'XI', 'Animasi', 'C', '24400 / 1478 . 127'),
(192, 'ANABEL TSAMIRA AZIZ', 'XI', 'Animasi', 'C', '24401 / 1479 . 127'),
(193, 'ANDIKA EKA SAPUTRA', 'XI', 'Animasi', 'C', '24402 / 1480 . 127'),
(194, 'ARTETA PUTRA YUDHA', 'XI', 'Animasi', 'C', '24403 / 1481 . 127'),
(195, 'ARVIN NADHIF FIRMANSYAH', 'XI', 'Animasi', 'C', '24404 / 1482 . 127'),
(196, 'BINTAR AGUNG TRIANTORO', 'XI', 'Animasi', 'C', '24405 / 1483 . 127'),
(197, 'CHARLENE AMALINA HUWAIDA', 'XI', 'Animasi', 'C', '24406 / 1484 . 127'),
(198, 'FARHAN CHANDRA PUTRA SANTOSO', 'XI', 'Animasi', 'C', '24407 / 1485 . 127'),
(199, 'FATIH MUHAMMAD ROGHIB', 'XI', 'Animasi', 'C', '24408 / 1486 . 127'),
(200, 'FIRMAN ABDUL AZIZ', 'XI', 'Animasi', 'C', '24409 / 1487 . 127'),
(201, 'FRANYOSA FEBY JECONIAH', 'XI', 'Animasi', 'C', '24410 / 1488 . 127'),
(202, 'GALERY CAHYANING ROMADHON', 'XI', 'Animasi', 'C', '24411 / 1489 . 127'),
(203, 'GANDHES WANODYANING WIGATI', 'XI', 'Animasi', 'C', '24412 / 1490 . 127'),
(204, 'KEISHA RAMADHANI NARARIA PUTRI', 'XI', 'Animasi', 'C', '24413 / 1491 . 127'),
(205, 'KEVIN ARLIANTO PUTRA', 'XI', 'Animasi', 'C', '24414 / 1492 . 127'),
(206, 'LYUSIVA AYUNDA FADESA', 'XI', 'Animasi', 'C', '24415 / 1493 . 127'),
(207, 'M. HAFIZ HIDAYTULLOH', 'XI', 'Animasi', 'C', '24416 / 1494 . 127'),
(208, 'MOHAMAD YOSI ADITIA', 'XI', 'Animasi', 'C', '24418 / 1496 . 127'),
(209, 'NADIRA WURYANDARI SYARIFAH', 'XI', 'Animasi', 'C', '24419 / 1497 . 127'),
(210, 'NADYA BINTANG ANDIRA', 'XI', 'Animasi', 'C', '24420 / 1498 . 127'),
(211, 'NAFIZ AL KALIFI', 'XI', 'Animasi', 'C', '24421 / 1499 . 127'),
(212, 'NAILAH ZHAFIRAH PUTRI', 'XI', 'Animasi', 'C', '24422 / 1500 . 127'),
(213, 'NAJWA KAISAURA NUR RAVIKI', 'XI', 'Animasi', 'C', '24423 / 1501 . 127'),
(214, 'NAVIOLA SAFA KYETA', 'XI', 'Animasi', 'C', '24424 / 1502 . 127'),
(215, 'PURUSHOTTAMA', 'XI', 'Animasi', 'C', '24425 / 1503 . 127'),
(216, 'RAHMA NUR AZIZA', 'XI', 'Animasi', 'C', '24426 / 1504 . 127'),
(217, 'SALSABILA MAFULA ZASKIA', 'XI', 'Animasi', 'C', '24427 / 1505 . 127'),
(218, 'TRI SAYOGO YUWONO', 'XI', 'Animasi', 'C', '24428 / 1506 . 127'),
(219, 'ULFIAH FITRIASIH WARDHANA', 'XI', 'Animasi', 'C', '24429 / 1507 . 127'),
(220, 'VARELL PANDU HARDI WINATA', 'XI', 'Animasi', 'C', '24430 / 1508 . 127'),
(221, 'ACHMAD RIZKI', 'XII', 'Animasi', 'A', '22448 / 1303 . 128'),
(222, 'ADE CHRISTIAN PUTRA SETYAWAN ASTRO', 'XII', 'Animasi', 'A', '22449 / 1304 . 128'),
(223, 'ADIMAS FEBRIAN RACHMAN', 'XII', 'Animasi', 'A', '22450 / 1305 . 128'),
(224, 'AYU AGUSTIN WULANDARI', 'XII', 'Animasi', 'A', '22451 / 1306 . 128'),
(225, 'AZ ZAKY AL ASKARI', 'XII', 'Animasi', 'A', '22452 / 1307 . 128'),
(226, 'DAVINA NAJWA MICHELLE FEBRIANT', 'XII', 'Animasi', 'A', '22453 / 1308 . 128'),
(227, 'DEVINA ANGELIA AGATHA', 'XII', 'Animasi', 'A', '22454 / 1309 . 128'),
(228, 'DEVITA PUTRI ANANTA USMAN', 'XII', 'Animasi', 'A', '22455 / 1310 . 128'),
(229, 'ElSA SASI RAMADHANI', 'XII', 'Animasi', 'A', '22456 / 1311 . 128'),
(230, 'FARELLINO KEVIN FIRDIANSYAH', 'XII', 'Animasi', 'A', '22457 / 1312 . 128'),
(231, 'FARISKA IZZA ZAHIRA', 'XII', 'Animasi', 'A', '22458 / 1313 . 128'),
(232, 'FARIZAL NUGRAHA', 'XII', 'Animasi', 'A', '22459 / 1314 . 128'),
(233, 'FITRI AYU WULAN SARI', 'XII', 'Animasi', 'A', '22460 / 1315 . 128'),
(234, 'GALIH PRADIPA PURBOWANTO', 'XII', 'Animasi', 'A', '22461 / 1316 . 128'),
(235, 'HELMY AMINUDIN', 'XII', 'Animasi', 'A', '22463 / 1318 . 128'),
(236, 'LILIS LESTARI', 'XII', 'Animasi', 'A', '22465 / 1320 . 128'),
(237, 'M. ADRIAN PRATAMA', 'XII', 'Animasi', 'A', '22466 / 1321 . 128'),
(238, 'MELANIE ISMI HAMIDAH', 'XII', 'Animasi', 'A', '22467 / 1322 . 128'),
(239, 'MOH FAJAR SANDI', 'XII', 'Animasi', 'A', '22469 / 1324 . 128'),
(240, 'MOHAMMAD DZAELANI', 'XII', 'Animasi', 'A', '22470 / 1325 . 128'),
(241, 'MUHAMMAD RAFEL ALFARIZAL', 'XII', 'Animasi', 'A', '22471 / 1326 . 128'),
(242, 'MUHAMMAD RAUF ', 'XII', 'Animasi', 'A', '22472 / 1327 . 128'),
(243, 'MUJTABA MAHDAVI', 'XII', 'Animasi', 'A', '22473 / 1328 . 128'),
(244, 'NADHIFA SATIA SALOKO', 'XII', 'Animasi', 'A', '22474 / 1329 . 128'),
(245, 'NASHITA AURELLIA MEIKA PUTRI NURDHITA', 'XII', 'Animasi', 'A', '22475 / 1330 . 128'),
(246, 'NAYLA GHEA ANANDA', 'XII', 'Animasi', 'A', '22476 / 1331 . 128'),
(247, 'RADITYA FERDINAND HIZKIA', 'XII', 'Animasi', 'A', '22477 / 1332 . 128'),
(248, 'RADITYA NAUFAL AL ROSYID', 'XII', 'Animasi', 'A', '22478 / 1333 . 128'),
(249, 'RIANDANA DARMAWAN', 'XII', 'Animasi', 'A', '21590 / 1224 . 128'),
(250, 'RIVA CINDI AYU LESTARI', 'XII', 'Animasi', 'A', '21629 / 1263 . 128	'),
(251, 'SOFIA TINA ARIELLA', 'XII', 'Animasi', 'A', '22479 / 1334 . 128'),
(252, 'VIGO STEVE GONZALES', 'XII', 'Animasi', 'A', '22480 / 1335 . 128'),
(253, 'ZULFA NAILURROHMAH', 'XII', 'Animasi', 'A', '22481 / 1336 . 128'),
(254, 'ABEL AURELIA THALITHA', 'XII', 'Animasi', 'B', '22482 / 1337 . 128'),
(255, 'AISHA LUNA RATIMAYA', 'XII', 'Animasi', 'B', '22483 / 1338 . 128'),
(256, 'AKHMAD SHAFAR ARDIANO', 'XII', 'Animasi', 'B', '22484 / 1339 . 128'),
(257, 'ANDELLA MARETYA WAHYULANDA', 'XII', 'Animasi', 'B', '22485 / 1340 . 128'),
(258, 'ANESTA YUSTITIA', 'XII', 'Animasi', 'B', '22486 / 1341 .	128'),
(259, 'BINAR ILHAM MAULANA FANDI SETYAWAN', 'XII', 'Animasi', 'B', '22487 / 1342 . 128'),
(260, 'DAVA TANTO TRI WIJAYA', 'XII', 'Animasi', 'B', '22488 / 1343 . 128'),
(261, 'DICKY DWI ARDIANSYAH', 'XII', 'Animasi', 'B', '22489 / 1344 . 128'),
(262, 'DIMAS SATRIA MAULANA', 'XII', 'Animasi', 'B', '22490 / 1345 . 128'),
(263, 'DWI ARTIKA SARI', 'XII', 'Animasi', 'B', '22491 / 1346 . 128'),
(264, 'DWI NOVITA SARI', 'XII', 'Animasi', 'B', '22492 / 1347 . 128'),
(265, 'FEBRIANI DWI PERMATASARI', 'XII', 'Animasi', 'B', '22493 / 1348 . 128'),
(266, 'FIBRI AYU MAHARANI', 'XII', 'Animasi', 'B', '22494 / 1349 .	128'),
(267, 'FITRI SURYANING ANGGRAENI', 'XII', 'Animasi', 'B', '22495 / 1350 .	128'),
(268, 'GHARIZA TADAYYUN M', 'XII', 'Animasi', 'B', '22496 / 1351 . 128'),
(269, 'HILDA AMALIA', 'XII', 'Animasi', 'B', '22497 / 1352 . 128'),
(270, 'IAN ADI ANDRI DIVA PRATAMA', 'XII', 'Animasi', 'B', '22498 / 1353 . 128'),
(271, 'JASMINE SUKMA ISLAMI', 'XII', 'Animasi', 'B', '22499 / 1354 . 128'),
(272, 'KEVIN BAEYUNG WAHYUDI AJI', 'XII', 'Animasi', 'B', '22500 / 1355 . 128'),
(273, 'MOCHAMAD ARIEL R', 'XII', 'Animasi', 'B', '22501 / 1356 . 128'),
(274, 'MOHAMMAD MARCELL WITOELAR', 'XII', 'Animasi', 'B', '22502 / 1357 . 128'),
(275, 'MUHAMMAD DARYL SAPUTRA', 'XII', 'Animasi', 'B', '22503 / 1358 . 128'),
(276, 'NAISA DWI INDRIANI', 'XII', 'Animasi', 'B', '22504 / 1359 .	128'),
(277, 'NANSYE PRISCILLA TAMBUWUN', 'XII', 'Animasi', 'B', '22505 / 1360 . 128	'),
(278, 'NARENDRA ADHINE FIANDRA PUTRA', 'XII', 'Animasi', 'B', '22506 / 1361 . 128'),
(279, 'RAFAEL NICANDRO SEPTARINO', 'XII', 'Animasi', 'B', '22507 / 1362 . 128'),
(280, 'RAYFANZA DIMAS ISLAMI', 'XII', 'Animasi', 'B', '22508 / 1363 . 128'),
(281, 'REHAN ULUL ALBAB ', 'XII', 'Animasi', 'B', '22509 / 1364 . 128'),
(282, 'RHEO PAKSI ARDADEDHALI', 'XII', 'Animasi', 'B', '22510 / 1365 . 128'),
(283, 'RIFDA NURHALIZA ALIEF', 'XII', 'Animasi', 'B', '22511 / 1366 . 128'),
(284, 'SURYA BAHRUZAHDI', 'XII', 'Animasi', 'B', '22512 / 1367 .	128'),
(285, 'SYAREEFA CHEFFALUNA RAMADHANIA', 'XII', 'Animasi', 'B', '22513 / 1368 . 128'),
(286, 'VERO RAYA KAUTSAR', 'XII', 'Animasi', 'B', '22514 / 1369 . 128'),
(287, 'YOAN REGA REYNATA', 'XII', 'Animasi', 'B', '22515 / 1370 . 128'),
(288, 'ADAM RISVIARDO', 'XII', 'Animasi', 'C', '22517 / 1372 . 128'),
(289, 'ALMIRA AMAZEVA MARDYSAINS', 'XII', 'Animasi', 'C', '22518 / 1373 . 128'),
(290, 'AULIA VIANDA', 'XII', 'Animasi', 'C', '22519 / 1374 .	128'),
(291, 'AYU DYA CITRA NABILA', 'XII', 'Animasi', 'C', '22520 / 1375 . 128'),
(292, 'BASYASYAH DHIWA AQILLAH', 'XII', 'Animasi', 'C', '22521 / 1376 . 128'),
(293, 'DAVINA FAIZAH RAHMA', 'XII', 'Animasi', 'C', '22522 / 1377 . 128'),
(294, 'DZAKY ZAKARIA DARMAYITNO', 'XII', 'Animasi', 'C', '22523 / 1378 . 128'),
(295, 'ELIEZER DOVA PUTRA HANDOKO', 'XII', 'Animasi', 'C', '22524 / 1379 .	128'),
(296, 'ERSAN HIDAYAT', 'XII', 'Animasi', 'C', '22525 / 1380 . 128	'),
(297, 'FEBRYAN DENATA', 'XII', 'Animasi', 'C', '22526 / 1381 . 128'),
(298, 'FIDAH INTAN PAVITA ', 'XII', 'Animasi', 'C', '22527 / 1382 . 128'),
(299, 'KIRANAYA AURELIA MAIA EFENDI', 'XII', 'Animasi', 'C', '22528 / 1383 . 128'),
(300, 'KRISNA RADITYA PUTRA WAHYUDI', 'XII', 'Animasi', 'C', '22529 / 1384 . 128'),
(301, 'LILIS LINDASARI', 'XII', 'Animasi', 'C', '22530 / 1385 . 128'),
(302, 'MOCHAMAD NOR KHOLID', 'XII', 'Animasi', 'C', '22531 / 1386 . 128'),
(303, 'MOCHAMAD RIZKI PRASTIYO', 'XII', 'Animasi', 'C', '22532 / 1387 . 128'),
(304, 'MUHAMMAD SYAHRUL RAMADHAN', 'XII', 'Animasi', 'C', '22533 / 1388 . 128'),
(305, 'MUHAMMAD ZAQHLUL FAHREZY', 'XII', 'Animasi', 'C', '22534 / 1389 . 128'),
(306, 'NABILA DWI WILUJENG ', 'XII', 'Animasi', 'C', '22535 / 1390 . 128'),
(307, 'NABILA INDRIANINGTYAS', 'XII', 'Animasi', 'C', '22536 / 1391 . 128'),
(308, 'NADILA NUR RAMADHANI', 'XII', 'Animasi', 'C', '22537 / 1392 . 128'),
(309, 'NASYWA SYAFIQOH ARIEFIANTI', 'XII', 'Animasi', 'C', '22538 / 1393 . 128'),
(310, 'NATALIA FLOURENTIN MERSHELIA BUPU', 'XII', 'Animasi', 'C', '22539 / 1394 . 128'),
(311, 'RAMADHAN FARRAS ALFARIZI', 'XII', 'Animasi', 'C', '22540 / 1395 . 128'),
(312, 'RAYFIRMAHN BETHAMIDZI SUDARMADI', 'XII', 'Animasi', 'C', '22541 / 1396 . 128'),
(313, 'REYNALDO LOIS MARCELINO', 'XII', 'Animasi', 'C', '22542 / 1397 . 128'),
(314, 'RIFKY ADITYA SURYAWAN', 'XII', 'Animasi', 'C', '21628 / 1262 . 128'),
(315, 'RIJALUL IBAD', 'XII', 'Animasi', 'C', '22543 / 1398 . 128'),
(316, 'RIO BALADIN SYAFANI', 'XII', 'Animasi', 'C', '22544 / 1399 . 128'),
(317, 'SATYA PORNAMA ROZAQI', 'XII', 'Animasi', 'C', '22545 / 1400 .	128'),
(318, 'SAVA MAHAWIRA AIDYN', 'XII', 'Animasi', 'C', '22546 / 1401 . 128'),
(319, 'SHOFI AKIFAH ROCHIMA PUTRI ', 'XII', 'Animasi', 'C', '22547 / 1402 .	128'),
(320, 'TIERI HENRY APRILLINO BUDI PRATAMA', 'XII', 'Animasi', 'C', '22548 / 1403 . 128'),
(321, 'GARCIA FERNANDA VALENCA ARCHADEA', 'XI', 'RPL', 'B', '25230 / 1515 . 127');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `role` varchar(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto_profil` varchar(255) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `role`, `username`, `password`, `foto_profil`) VALUES
(32, '1', 'Admin1', 'cefdf4d318ba7a86c0f1dde04d57f6f1', '944607389_qrcode.png'),
(40, '0', 'user1', '948a59427042b5cbfcecd7421b8fd570', 'default.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bahan`
--
ALTER TABLE `tbl_bahan`
  ADD PRIMARY KEY (`id_bahan`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tbl_distribusi`
--
ALTER TABLE `tbl_distribusi`
  ADD PRIMARY KEY (`id_distribusi`);

--
-- Indexes for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tbl_jdl_pengajuan`
--
ALTER TABLE `tbl_jdl_pengajuan`
  ADD PRIMARY KEY (`id_judul`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `tbl_luar_sekolah`
--
ALTER TABLE `tbl_luar_sekolah`
  ADD PRIMARY KEY (`id_luar_sekolah`);

--
-- Indexes for table `tbl_peminjaman`
--
ALTER TABLE `tbl_peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indexes for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bahan`
--
ALTER TABLE `tbl_bahan`
  MODIFY `id_bahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `tbl_distribusi`
--
ALTER TABLE `tbl_distribusi`
  MODIFY `id_distribusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `tbl_jdl_pengajuan`
--
ALTER TABLE `tbl_jdl_pengajuan`
  MODIFY `id_judul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `tbl_luar_sekolah`
--
ALTER TABLE `tbl_luar_sekolah`
  MODIFY `id_luar_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_peminjaman`
--
ALTER TABLE `tbl_peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `tbl_pengajuan`
--
ALTER TABLE `tbl_pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
