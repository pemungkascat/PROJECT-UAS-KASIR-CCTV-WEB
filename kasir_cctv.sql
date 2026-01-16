
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `kasir_cctv`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int NOT NULL,
  `id_transaksi` int NOT NULL,
  `id_produk` int NOT NULL,
  `jumlah` int NOT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_produk`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 2, 700000.00),
(2, 1, 3, 1, 850000.00),
(3, 1, 4, 1, 750000.00),
(4, 2, 1, 2, 700000.00),
(5, 3, 2, 3, 1950000.00),
(6, 4, 1, 3, 1080000.00),
(7, 5, 1, 1, 360000.00),
(8, 5, 3, 1, 850000.00),
(9, 6, 2, 3, 1950000.00),
(10, 6, 5, 3, 1350000.00),
(11, 2, 1, 2, 700000.00),
(12, 8, 1, 2, 700000.00),
(13, 10, 1, 4, 1440000.00),
(14, 10, 3, 1, 850000.00),
(15, 10, 4, 2, 1500000.00),
(16, 11, 1, 1, 360000.00),
(17, 11, 3, 1, 850000.00);

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int NOT NULL,
  `nama_kasir` varchar(100) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama_kasir`, `telepon`) VALUES
(1, 'Ahmad Fauzi', '081299998888'),
(2, 'Siti Aminah', '081298765432'),
(5, 'Ahmad Fauzi', '081234567890'),
(6, 'Siti Aminah', '081298765432');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `telepon`, `alamat`, `email`) VALUES
(1, 'Budi Santoso', '085511223344', 'Jl. Sudirman No. 25, Jakarta', NULL),
(2, 'Ani Wijaya', '085577889900', 'Tangerang', NULL),
(4, 'catur pamungkas', '823814134', 'sukoharjo', NULL),
(5, 'hasan', '07643245678', 'sukoharjo', NULL),
(6, 'hasan m', '08334738212', 'sukoharjo', NULL),
(7, 'Ahmad Hasan Mustofa', '', '', NULL),
(8, 'Ahmad Hasan Mustofa', '08832736842', 'Ngunut, Sukoharjo', NULL),
(9, 'guguygygy', '08832736842', 'Karanganyar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_transaksi` int NOT NULL,
  `metode_pembayaran` enum('Tunai','Transfer','Debit','Kredit') DEFAULT NULL,
  `jumlah_uang_diterima` decimal(12,2) DEFAULT NULL,
  `kembalian` decimal(12,2) DEFAULT NULL,
  `status_pembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `metode_pembayaran`, `jumlah_uang_diterima`, `kembalian`, `status_pembayaran`) VALUES
(1, 1, 'Tunai', 2500000.00, 300000.00, NULL),
(2, 2, 'Tunai', 2000000.00, 500000.00, NULL),
(3, 3, 'Tunai', 1950000.00, 0.00, NULL),
(4, 4, 'Tunai', 1080000.00, 0.00, NULL),
(5, 5, 'Tunai', 1210000.00, 0.00, NULL),
(6, 6, 'Tunai', 3300000.00, 0.00, NULL),
(7, 2, 'Tunai', 2000000.00, 500000.00, NULL),
(9, 9, 'Tunai', 0.00, 0.00, NULL),
(10, 10, 'Tunai', 3790000.00, 0.00, NULL),
(11, 11, 'Tunai', 1210000.00, 0.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `harga` decimal(12,2) NOT NULL,
  `stok` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `merk`, `harga`, `stok`) VALUES
(1, 'CCTV Indoor 2MP Dome', 'Hikvision', 360000.00, 39),
(2, 'CCTV Outdoor 5MP Bullet', 'Dahua', 650000.00, 27),
(3, 'DVR 4 Channel 1080P', 'Hikvision', 850000.00, 7),
(4, 'Harddisk 1TB WD Purple', 'Western Digital', 750000.00, 13),
(5, 'Kabel Coaxial RG59 + Power (100m)', 'BNC', 450000.00, 10),
(6, 'C6N G1 4K ', 'Ezviz', 1000000.00, 20);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int NOT NULL,
  `id_kasir` int NOT NULL,
  `id_pelanggan` int NOT NULL,
  `tanggal_transaksi` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_bayar` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_kasir`, `id_pelanggan`, `tanggal_transaksi`, `total_bayar`) VALUES
(1, 1, 1, '2023-10-25 10:30:00', 2200000.00),
(2, 1, 1, '2026-01-16 10:33:31', 1500000.00),
(3, 1, 4, '2026-01-16 10:55:14', 1950000.00),
(4, 2, 2, '2026-01-16 10:57:46', 1080000.00),
(5, 1, 5, '2026-01-16 11:04:52', 1210000.00),
(6, 1, 6, '2026-01-16 11:07:27', 3300000.00),
(7, 1, 4, '2026-01-16 18:49:45', 1500000.00),
(8, 1, 1, '2026-01-16 18:58:09', 1500000.00),
(9, 5, 7, '2026-01-16 20:51:15', 0.00),
(10, 2, 8, '2026-01-16 20:51:49', 3790000.00),
(11, 2, 9, '2026-01-16 20:52:39', 1210000.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_laporan_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `v_laporan_transaksi` (
`id_transaksi` int
,`nama_pelanggan` varchar(100)
,`tanggal_transaksi` datetime
,`total_bayar` decimal(12,2)
);

-- --------------------------------------------------------

--
-- Structure for view `v_laporan_transaksi`
--
DROP TABLE IF EXISTS `v_laporan_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_laporan_transaksi`  AS SELECT `t`.`id_transaksi` AS `id_transaksi`, `p`.`nama_pelanggan` AS `nama_pelanggan`, `t`.`tanggal_transaksi` AS `tanggal_transaksi`, `t`.`total_bayar` AS `total_bayar` FROM (`transaksi` `t` join `pelanggan` `p` on((`t`.`id_pelanggan` = `p`.`id_pelanggan`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `fk_transaksi` (`id_transaksi`),
  ADD KEY `fk_produk` (`id_produk`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `uk_email` (`email`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `fk_pembayaran` (`id_transaksi`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_kasir` (`id_kasir`),
  ADD KEY `fk_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `fk_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_kasir` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`),
  ADD CONSTRAINT `fk_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
