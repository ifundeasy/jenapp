-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2014 at 07:33 AM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jen`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `id_bank` varchar(30) NOT NULL,
  `fk.id_city_official` varchar(30) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` enum('central','conventional','syariah') DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_bank`),
  KEY `fk.id_city_official` (`fk.id_city_official`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `bank`
--

TRUNCATE TABLE `bank`;
--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id_bank`, `fk.id_city_official`, `name`, `type`, `active`, `notes`) VALUES
('0557931f', '0e8913a2', 'Prima Master Bank', 'conventional', '1', ''),
('0935ff32', '43501c7e', 'Bank Artos Indonesia', 'conventional', '1', ''),
('095f9cb9', '0e8913a2', 'Bank Harda Internasional', 'conventional', '1', ''),
('0efc4e0c', '0e8913a2', 'Bank Kesejahteraan Ekonomi', 'conventional', '1', ''),
('0fb9f446', '0e8913a2', 'Bank Bukopin', 'conventional', '1', ''),
('1509febf', '0e8913a2', 'Bank Chinatrust Indonesia', 'conventional', '1', ''),
('168ef9ac', '0e8913a2', 'Mutiara Bank', 'conventional', '1', 'sebelum tanggal 16 September 2009 bernama "Bank Century"/"Bank CIC", penyertaan saham sementara oleh'),
('19777e80', '0e8913a2', 'Panin Bank Syariah', 'syariah', '1', 'dahulu bernama "Bank Harfa"'),
('19e92287', '0e8913a2', 'Bank KEB Indonesia', 'conventional', '1', ''),
('1c5f7d84', '0e8913a2', 'Bank Negara Indonesia', 'conventional', '1', ''),
('22937c88', '0e8913a2', 'Bank of America', 'conventional', '1', ''),
('26b233d0', '0e8913a2', 'Bank CIMB Niaga', 'conventional', '1', 'sebelum tanggal 15 Oktober 2008 bernama "Bank Niaga" dan "Bank Lippo'),
('277c8ca2', '43501c7e', 'Bank Himpunan Saudara 1906', 'conventional', '1', ''),
('29f34d46', '0e8913a2', 'Bank Dinar Indonesia', 'conventional', '1', ''),
('2bb62d0d', '0e8913a2', 'Bank UOB Indonesia', 'conventional', '1', 'sebelum tanggal 19 Mei 2011 bernama "Bank UOB Buana"/sebelumnya bernama "Bank Buana Indonesia"'),
('2df9a835', '0e8913a2', 'Bank Maybank Syariah Indonesia', 'syariah', '1', 'dahulu bernama "Bank Maybank Indocorp"'),
('30aa74ae', '5fe2f0f9', 'Bank Jatim', 'conventional', '1', ''),
('30e1bd1b', '4e6d7b17', 'Bank Mestika Dharma', 'conventional', '1', ''),
('3436b28e', '0e8913a2', 'Bank Mizuho Indonesia', 'conventional', '1', ''),
('3b3e5eb7', '0e8913a2', 'Bank Commonwealth', 'conventional', '1', ''),
('3e54fb75', '0e8913a2', 'Bank Rakyat Indonesia', 'conventional', '1', ''),
('3ef15222', '0e8913a2', 'Bank Yudha Bhakti', 'conventional', '1', ''),
('430dfcdb', '6fb0bf99', 'Bank Papua', 'conventional', '1', 'dahulu dikenal sebagai BPD Irian Jaya'),
('4961d751', '0e8913a2', 'Bank Victoria Internasional', 'conventional', '1', ''),
('4ae77df4', '0e8913a2', 'Bank Tabungan Negara', 'conventional', '1', ''),
('4c8cc3dd', '5fe2f0f9', 'Anglomas Internasional Bank', 'conventional', '1', ''),
('4cb48c6c', '0e8913a2', 'Bank DBS Indonesia', 'conventional', '1', ''),
('523bed16', '0e8913a2', 'Bank Hana', 'conventional', '1', 'sebelum tanggal 17 Maret 2008 bernama "Bank Bintang Manunggal"'),
('52929488', 'dab1b70b', 'Bank Kalsel', 'conventional', '1', ''),
('539bb5c1', '0e8913a2', 'Bank of China', 'conventional', '1', ''),
('543846c7', '0e8913a2', 'Bank Bumi Arta', 'conventional', '1', ''),
('54c442a3', '4c7bc3a4', 'Bank Lampung', 'conventional', '1', ''),
('5a3c00ac', '33379361', 'Bank Maluku', 'conventional', '1', ''),
('5ca0830c', '0e8913a2', 'Bank Artha Graha Internasional', 'conventional', '1', 'sebelum bulan Mei 2005 bernama "Bank Interpacific"'),
('5d2bc08d', '0e8913a2', 'Bank BRI Syariah', 'syariah', '1', 'dahulu bernama "Bank Jasa Arta"'),
('5e71774d', '0e8913a2', 'Bank Sumitomo Mitsui Indonesia', 'conventional', '1', ''),
('5eeba65a', '14976111', 'Bank Sumsel Babel', 'conventional', '1', 'dahulu dikenal sebagai Bank Sumsel'),
('610b69b5', 'ae3a79a2', 'Bank Riau Kepri', 'conventional', '1', 'dahulu dikenal sebagai Bank Riau'),
('636a42a1', '0e8913a2', 'HSBC', 'conventional', '1', ''),
('646d2b96', '0e8913a2', 'Bank Mitraniaga', 'conventional', '1', ''),
('6926233b', '43501c7e', 'Bank Bisnis Internasional', 'conventional', '1', ''),
('6d79262f', '0e8913a2', 'Bank Mega', 'conventional', '1', ''),
('6d844040', '0e8913a2', 'Bank Central Asia', 'conventional', '1', ''),
('70b6c7ff', '0e8913a2', 'Bank DKI', 'conventional', '1', ''),
('72df1085', '0e8913a2', 'Bank Mayora', 'conventional', '1', ''),
('79182346', '0e8913a2', 'Bank Muamalat Indonesia', 'syariah', '1', ''),
('803b4071', '0e8913a2', 'Deutsche Bank', 'conventional', '1', ''),
('8174d878', '0e8913a2', 'Bank of India Indonesia', 'conventional', '1', 'sebelum tanggal 17 November 2011 bernama "Bank Swadesi"'),
('8314df75', '0e8913a2', 'Bank ICBC Indonesia', 'conventional', '1', 'sebelumnya bernama "Bank Halim Indonesia"'),
('8990b63e', '0e8913a2', 'Bank Index Selindo', 'conventional', '1', ''),
('89d99485', '0e8913a2', 'Bank Syariah Mandiri', 'syariah', '1', ''),
('8ef3e5be', '3a15751d', 'Bank BPD DIY', 'conventional', '1', ''),
('906e7341', '43501c7e', 'Bank Fama Internasional', 'conventional', '1', ''),
('919e5c13', '0e8913a2', 'Bank Sinarmas', 'conventional', '1', 'sebelumnya bernama "Bank Shinta Indonesia"'),
('938af3eb', '0e8913a2', 'Bank Royal Indonesia', 'conventional', '1', ''),
('94740035', '0e8913a2', 'Bank BNP Paribas Indonesia', 'conventional', '1', ''),
('962a784d', '0e8913a2', 'Bank QNB Kesawan', 'conventional', '1', 'sebelum tanggal 12 Desember 2011 bernama "Bank Kesawan"'),
('985e82a9', '0e8913a2', 'The Bank of Tokyo-Mitsubishi UFJ', 'conventional', '1', ''),
('9977465c', '0e8913a2', 'Bank Pundi Indonesia', 'conventional', '1', 'sebelum tanggal 23 September 2010 bernama "Bank Eksekutif Internasional"'),
('9d67ae83', '0e8913a2', 'Bank Mayapada', 'conventional', '1', ''),
('9e4a89f9', '6799f6cf', 'Bank Sulsel', 'conventional', '1', ''),
('9fd6ab58', '0e8913a2', 'Bank Sinar Harapan Bali', 'conventional', '1', ''),
('a0030886', '0e8913a2', 'Bank Ganesha', 'conventional', '1', ''),
('a06ec1bb', '026fbfac', 'Bank Sulut', 'conventional', '1', ''),
('a3cf03f3', '5fe2f0f9', 'Bank Anda', 'conventional', '1', 'sebelumnya dikenal sebagai "Bank Antar Daerah"'),
('a4cd64fd', '742456e8', 'Bank Sahabat Purba Danarta', 'conventional', '1', 'sebelum tanggal 16 September 2009 bernama "Bank Purba Danarta"'),
('a7aa7b36', '43501c7e', 'Bank Nusantara Parahyangan', 'conventional', '1', ''),
('a7fd1ef7', '5c007383', 'Bank Bengkulu', 'conventional', '1', ''),
('a9a7621d', '0e8913a2', 'Bank Permata', 'conventional', '1', 'sebelum tanggal 18 Oktober 2002 bernama "Bank Bali"'),
('ac37df59', '4e6d7b17', 'Bank Sumut', 'conventional', '1', ''),
('ac4d262b', '0e8913a2', 'Bank Windu Kentjana International', 'conventional', '1', 'sebelum tanggal 7 Februari 2008 bernama "Bank Multicor"'),
('af06cd2c', '6fc49939', 'Bank Sultra', 'conventional', '1', ''),
('b303d5fb', '0e8913a2', 'JPMorgan Chase', 'conventional', '1', ''),
('b3c62ed1', '0e8913a2', 'Bank BNI Syariah', 'syariah', '1', ''),
('b44efea8', '0e8913a2', 'Bank ANZ Indonesia', 'conventional', '1', 'sebelum 12 Januari 2012 bernama "ANZ Panin Bank"'),
('b5717654', '0e8913a2', 'Bank Ina Perdana', 'conventional', '1', ''),
('b6850e97', '43501c7e', 'Bank Tabungan Pensiunan Nasional', 'conventional', '1', ''),
('b8709bb8', '0e8913a2', 'BCA Syariah', 'syariah', '1', 'dahulu bernama "Bank UIB"'),
('ba28a1a4', '140faf4c', 'Bank NTT', 'conventional', '1', ''),
('bab42ccb', '0e8913a2', 'Citibank', 'conventional', '1', ''),
('bb4f7a09', '0e8913a2', 'Bank Andara', 'conventional', '1', 'sebelum tanggal 30 Januari 2009 bernama "Bank Sri Partha"'),
('bcdecd9f', '0e8913a2', 'Bank Rabobank International Indonesia', 'conventional', '1', ''),
('becc96e1', '0e8913a2', 'Bank Agris', 'conventional', '1', 'sebelum 5 September 2008 bernama "Bank Finconesia"'),
('bf9975b1', '0e8913a2', 'Bank Metro Express', 'conventional', '1', ''),
('bfbf45d6', '1dddc137', 'Bank BPD Bali', 'conventional', '1', ''),
('c717a934', 'd9985e7c', 'Bank BPD Sulteng', 'conventional', '1', ''),
('ce83a50a', '0e8913a2', 'Standard Chartered', 'conventional', '1', ''),
('cef483dd', '0e8913a2', 'Bank Capital Indonesia', 'conventional', '1', ''),
('d0b240ae', '0e8913a2', 'Bank Maybank Indonesia', 'conventional', '1', 'sebelumnya bernama "Bank Internasional Indonesia"'),
('d0de5b92', '0e8913a2', 'Bank Resona Perdania', 'conventional', '1', ''),
('d1834a59', '0e8913a2', 'Bank OCBC NISP', 'conventional', '1', 'sebelum tanggal 7 Februari 2011 bernama "Bank NISP"'),
('d31ae76e', '0e8913a2', 'Bank Woori Indonesia', 'conventional', '1', 'sebelum bulan Februari 2002 bernama "Bank Hanvit Indonesia"'),
('d3c92a03', '0e8913a2', 'Bank Multi Arta Sentosa', 'conventional', '1', ''),
('d5ccb302', 'c20ab30f', 'Bank Kaltim', 'conventional', '1', ''),
('d686f392', '0e8913a2', 'Bank Victoria Syariah', 'syariah', '1', 'dahulu bernama "Bank Swaguna"'),
('d79a01e0', '0e8913a2', 'Bank Danamon Indonesia', 'conventional', '1', ''),
('da69cc39', '742456e8', 'Bank Jateng', 'conventional', '1', ''),
('de15f606', '0e8913a2', 'Bank of Amerika (Bofa)', 'syariah', '1', 'NYSE: BAC TYO: 8648, Bankofamerica.com kantor pusat Charlotte, Carolina Utara"'),
('de72552d', '0e8913a2', 'Bank Mandiri', 'conventional', '1', 'sebelum 1998 adalah Bank Dagang Negara , Bank Bumi Daya , Bank Exim , Bank Pembangunan Indonesia )'),
('deb86bc0', '0e8913a2', 'Bank BRI Agroniaga', 'conventional', '1', 'sebelumnya dikenal sebagai "Bank Agroniaga"'),
('e19af2ba', '0e8913a2', 'Bangkok Bank', 'conventional', '1', ''),
('e3bd48bb', '0e8913a2', 'Bank Nationalnobu', 'conventional', '1', 'sebelum tanggal 12 November 2008 bernama "Bank Alfindo Sejahtera"'),
('e539a6ee', '0e8913a2', 'Bank ICB Bumiputera', 'conventional', '1', 'sebelum tanggal 11 September 2009 bernama "Bank Bumiputera Indonesia"'),
('e61eba36', '0e8913a2', 'Bank Ekonomi Raharja', 'conventional', '1', ''),
('e6250339', 'b640eacd', 'Bank Jambi', 'conventional', '1', ''),
('e6aea942', '43501c7e', 'Bank BJB', 'conventional', '1', 'dahulu dikenal sebagai Bank Jabar atau Bank Jabar Banten atau BPD Jawa Barat.'),
('e775b461', '5fe2f0f9', 'Bank Maspion', 'conventional', '1', ''),
('e778e9a7', '09d8caca', 'Bank Kalbar', 'conventional', '1', ''),
('e77a426e', '0e8913a2', 'Bank Jasa Jakarta', 'conventional', '1', ''),
('e8d4559b', '70f5ca83', 'Bank Kalteng', 'conventional', '1', ''),
('ec14780d', 'f9001ba9', 'Bank BPD Aceh', 'conventional', '1', ''),
('ef2806bd', '0e8913a2', 'Panin Bank', 'conventional', '1', ''),
('f0474778', '5fe2f0f9', 'Centratama Nasional Bank', 'conventional', '1', ''),
('f38c9bc7', '0e8913a2', 'Bank Mega Syariah', 'syariah', '1', ''),
('f5baa157', '0e8913a2', 'Bank BJB Syariah', 'syariah', '1', ''),
('f771fd45', '0e8913a2', 'Bank SBI Indonesia', 'conventional', '1', 'sebelum tanggal 30 April 2009 bernama "Bank Indo Monex"'),
('fa58e950', '3bea358a', 'Bank Nagari', 'conventional', '1', ''),
('faa1412f', '0e8913a2', 'Bank Syariah Bukopin', 'syariah', '1', 'dahulu bernama "Bank Persyarikatan Indonesia"'),
('fbe02f2f', '0e8913a2', 'Bank Indonesia', 'central', '1', ''),
('fe79811f', '0e8913a2', 'Bank Sahabat Sampoerna', 'conventional', '1', ''),
('feef278a', '08a799e0', 'Bank NTB', 'conventional', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `id_branch` varchar(30) NOT NULL DEFAULT '',
  `fk.id_company` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_branch`),
  KEY `fk.id_company` (`fk.id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `branch`
--

TRUNCATE TABLE `branch`;
--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id_branch`, `fk.id_company`, `name`, `active`, `notes`) VALUES
('branch001', 'zenCorp', 'Suka Jadi', '1', ''),
('branch002', 'zenCorp', 'Cikutra', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id_city` varchar(30) NOT NULL DEFAULT '',
  `fk.id_state` varchar(30) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_city`),
  KEY `fk.id_state` (`fk.id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `city`
--

TRUNCATE TABLE `city`;
--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id_city`, `fk.id_state`, `name`, `active`, `notes`) VALUES
('005208d8', '53584149', 'Balikpapan', '1', '53'),
('026fbfac', '0ee2d159', 'Manado', '1', '81'),
('079351a9', '5bd5a405', 'Takengon', '1', '3'),
('07bbc032', '655ce4ed', 'Cianjur', '1', '27'),
('08a799e0', '6c009956', 'Mataram', '1', '65'),
('09d8caca', '42f23102', 'Pontianak', '1', '48'),
('0ace948f', '655ce4ed', 'Cirebon', '1', '29'),
('0c10f19d', 'ded0f8ed', 'Lubuklinggau', '1', '92'),
('0e8913a2', '655ce4ed', 'Jakarta', '1', '31'),
('140faf4c', 'd87534a2', 'Kupang', '1', '66'),
('14976111', 'ded0f8ed', 'Palembang', '1', '94'),
('1568742f', '47ce163d', 'Pasuruan', '1', '47'),
('1d6e756a', '5bd5a405', 'Lhokseumawe', '1', '11'),
('1dddc137', 'fd49b6c7', 'Denpasar', '1', '13'),
('1e4a4ccf', '0ee2d159', 'Tomohon', '1', '83'),
('1efacd2e', 'aa1d46a0', 'Pekalongan', '1', '36'),
('1f7e0ef3', '9308f6d2', 'Pangkal Pinang', '1', '14'),
('220f8789', '5bd5a405', 'Singkil', '1', '6'),
('2b9d134a', 'aa1d46a0', 'Magelang', '1', '37'),
('2e77a312', '42f23102', 'Singkawang', '1', '49'),
('2f08ddbd', 'ded0f8ed', 'Prabumulih', '1', '91'),
('33379361', 'fac1cda0', 'Ambon', '1', '60'),
('34db206c', '0ee2d159', 'Bitung', '1', '82'),
('35116c07', 'fac1cda0', 'Tidore', '1', '63'),
('3a15751d', '253841c9', 'Yogyakarta', '1', '102'),
('3bd59d20', 'fac1cda0', 'Ternate', '1', '62'),
('3bea358a', 'b2d3c1a8', 'Padang', '1', '86'),
('3fa4e200', '17c51680', 'Tebing Tinggi', '1', '101'),
('41d83d7c', '5bd5a405', 'Meulaboh', '1', '4'),
('43501c7e', '655ce4ed', 'Bandung', '1', '24'),
('46264741', '47ce163d', 'Probolinggo', '1', '39'),
('4878b817', 'b2d3c1a8', 'Bukittinggi', '1', '85'),
('4ad43cf2', 'fb31b68e', 'Metro', '1', '58'),
('4c7bc3a4', 'fb31b68e', 'Bandar Lampung', '1', '59'),
('4e4b340b', '47ce163d', 'Kediri', '1', '42'),
('4e6d7b17', '17c51680', 'Medan', '1', '99'),
('51a3fcec', '133dc4b4', 'Merauke', '1', '68'),
('53d5c0ab', '06900688', 'Bau-Bau', '1', '80'),
('55d988fc', '655ce4ed', 'Depok', '1', '30'),
('5c007383', '0267667a', 'Bengkulu', '1', '19'),
('5fe2f0f9', '47ce163d', 'Surabaya', '1', '45'),
('6771a588', '655ce4ed', 'Bogor', '1', '26'),
('6799f6cf', '6a132fde', 'Makassar', '1', '75'),
('69399c1a', '17c51680', 'Padang Sidempuan', '1', '98'),
('6bc88c2c', '43642366', 'Cilegon', '1', '18'),
('6d75759c', '5bd5a405', 'Sabang', '1', '2'),
('6fb0bf99', '133dc4b4', 'Jayapura', '1', '67'),
('6fc49939', '06900688', 'Kendari', '1', '79'),
('70f5ca83', 'ae63ba92', 'Palangkaraya', '1', '103'),
('722d2b31', '003c1ec9', 'Gorontalo', '1', '20'),
('731d4a81', '47ce163d', 'Blitar', '1', '41'),
('742456e8', 'aa1d46a0', 'Semarang', '1', '33'),
('756fa824', 'aa1d46a0', 'Purwokerto', '1', '34'),
('7764819d', 'aa1d46a0', 'Salatiga', '1', '35'),
('7e89c5ae', 'b2d3c1a8', 'Pariaman', '1', '88'),
('815e4bb1', '43642366', 'South Tangerang', '1', '16'),
('83c3493c', '6a132fde', 'Palopo', '1', '76'),
('86670a1a', '655ce4ed', 'Sukabumi', '1', '23'),
('95e75629', '655ce4ed', 'Bekasi', '1', '25'),
('98bf8ceb', '53584149', 'Bontang', '1', '55'),
('9cbc7655', '5bd5a405', 'Tapaktuan', '1', '5'),
('9e0ce0cb', '6c009956', 'Bima', '1', '64'),
('9e8fb4a1', '5bd5a405', 'Sigli', '1', '7'),
('9f3fe61e', '47ce163d', 'Madiun', '1', '43'),
('a0d41c90', '6a132fde', 'Pare-Pare', '1', '77'),
('a26aa509', 'c24548e6', 'Manokwari', '1', '70'),
('a49414f9', '17c51680', 'Tanjung Balai', '1', '97'),
('a989beb3', '17c51680', 'Pematang Siantar', '1', '95'),
('aa730902', '2041084a', 'Tanjung Pinang', '1', '71'),
('aad3b0cf', '2041084a', 'Batam', '1', '73'),
('aba13030', '47ce163d', 'Malang', '1', '44'),
('ae3a79a2', '2041084a', 'Pekanbaru', '1', '72'),
('ae7e53ac', '655ce4ed', 'Cimahi', '1', '28'),
('b640eacd', 'b8ecae48', 'Jambi', '1', '21'),
('bda79db3', '45df820e', 'Banjarbaru', '1', '50'),
('bedb83be', '47ce163d', 'Batu', '1', '40'),
('c20ab30f', '53584149', 'Samarinda', '1', '54'),
('c3232e95', '2041084a', 'Dumai', '1', '74'),
('cafb7513', '655ce4ed', 'Tasikmalaya', '1', '22'),
('ce0264b7', '17c51680', 'Sibolga', '1', '100'),
('cf86b184', 'ded0f8ed', 'Pagar Alam', '1', '93'),
('d2ad689b', 'aa1d46a0', 'Tegal', '1', '32'),
('d41b4357', '47ce163d', 'Mojokerto', '1', '46'),
('d4263cb1', '5bd5a405', 'Bireuen', '1', '9'),
('d9985e7c', '198fdd85', 'Palu', '1', '78'),
('dab1b70b', '45df820e', 'Banjarmasin', '1', '51'),
('dab5e10a', 'fac1cda0', 'Tual', '1', '61'),
('e09c05e1', '5bd5a405', 'Blangkejeren', '1', '10'),
('e1718897', '5bd5a405', 'Langsa', '1', '12'),
('e81b5d7b', 'c24548e6', 'Kota Sorong', '1', '69'),
('e9d89ba1', '43642366', 'Tangerang', '1', '15'),
('ea149869', '53584149', 'Tenggarong', '1', '56'),
('eed83267', 'aa1d46a0', 'Surakarta', '1', '38'),
('f136da9e', 'b2d3c1a8', 'Payakumbuh', '1', '87'),
('f19853eb', '43642366', 'Serang', '1', '17'),
('f1aeb8ec', '17c51680', 'Binjai', '1', '96'),
('f25e19c6', '53584149', 'Tarakan', '1', '57'),
('f6335a4c', '5bd5a405', 'Redelong (Simpang Tiga Redelong)', '1', '1'),
('f6c904ce', 'b2d3c1a8', 'Sawah Lunto', '1', '90'),
('f9001ba9', '5bd5a405', 'Banda Aceh', '1', '8'),
('f9b62151', 'b2d3c1a8', 'Padang Panjang', '1', '89'),
('fe43f2c9', 'b2d3c1a8', 'Solok', '1', '84');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id_company` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `company`
--

TRUNCATE TABLE `company`;
--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `name`, `active`, `notes`) VALUES
('zenCorp', 'Zen Reflexion', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id_contact` varchar(30) NOT NULL DEFAULT '',
  `pin` varchar(6) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `user_pass` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(20) NOT NULL DEFAULT '',
  `last_name` varchar(20) DEFAULT '',
  `alias` varchar(20) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_birth` date NOT NULL DEFAULT '0000-00-00',
  `genre` enum('L','P') DEFAULT NULL,
  `blood` enum('A','B','AB','O') DEFAULT NULL,
  `fk.id_religion` varchar(30) DEFAULT NULL,
  `fk.id_relationship` varchar(30) DEFAULT NULL,
  `picture` text,
  `allow_access` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  `active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id_contact`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `fk.id_religion` (`fk.id_religion`),
  KEY `fk.id_relationship` (`fk.id_relationship`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `contact`
--

TRUNCATE TABLE `contact`;
--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id_contact`, `pin`, `user_name`, `user_pass`, `first_name`, `last_name`, `alias`, `registered`, `date_of_birth`, `genre`, `blood`, `fk.id_religion`, `fk.id_relationship`, `picture`, `allow_access`, `notes`, `active`) VALUES
('contact001', NULL, 'pegawai', '$2y$10$TG9s.Mfbhhot5W2BUdRgRuU6NbvjuERuZMtI8KWiEkgMQz0zgmrDK', 'Joko', 'Mardoyo', 'jomar', '2014-12-13 22:46:20', '0000-00-00', 'L', 'B', NULL, NULL, NULL, '1', '', '1'),
('contact002', NULL, 'member', '$2y$10$TG9s.Mfbhhot5W2BUdRgRuU6NbvjuERuZMtI8KWiEkgMQz0zgmrDK', 'Ina', 'Saraswati', 'inras', '2014-12-13 22:46:20', '0000-00-00', 'P', 'B', NULL, NULL, NULL, '1', '', '1'),
('contact003', NULL, 'supplier', '$2y$10$TG9s.Mfbhhot5W2BUdRgRuU6NbvjuERuZMtI8KWiEkgMQz0zgmrDK', 'Yatna', 'Sumartin', 'yasum', '2014-12-13 22:47:19', '0000-00-00', 'L', 'B', NULL, NULL, NULL, '1', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `contact_addr`
--

DROP TABLE IF EXISTS `contact_addr`;
CREATE TABLE `contact_addr` (
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_city` varchar(30) DEFAULT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `zip_code` varchar(6) DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_city` (`fk.id_city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `contact_addr`
--

TRUNCATE TABLE `contact_addr`;
--
-- Dumping data for table `contact_addr`
--

INSERT INTO `contact_addr` (`fk.id_contact`, `fk.id_city`, `address`, `zip_code`, `active`, `notes`) VALUES
('contact001', '43501c7e', 'Dipati ukur 103', '', '1', ''),
('contact002', '43501c7e', 'Cimahi 771', '', '1', ''),
('contact003', '43501c7e', 'Ciroyom 51', '', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact_ex`
--

DROP TABLE IF EXISTS `contact_ex`;
CREATE TABLE `contact_ex` (
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_social` varchar(30) DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_social` (`fk.id_social`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `contact_ex`
--

TRUNCATE TABLE `contact_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `contact_log`
--

DROP TABLE IF EXISTS `contact_log`;
CREATE TABLE `contact_log` (
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  KEY `fk.id_contact` (`fk.id_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `contact_log`
--

TRUNCATE TABLE `contact_log`;
-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id_country` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `alpha2` varchar(2) NOT NULL DEFAULT '',
  `alpha3` varchar(3) NOT NULL DEFAULT '',
  `numeric` varchar(3) DEFAULT '',
  `iso3166_2` varchar(13) DEFAULT '',
  `currency` varchar(10) DEFAULT '?',
  `symbolic` varchar(10) DEFAULT '?',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_country`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `country`
--

TRUNCATE TABLE `country`;
--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id_country`, `name`, `alpha2`, `alpha3`, `numeric`, `iso3166_2`, `currency`, `symbolic`, `active`, `notes`) VALUES
('00c784f1', 'Slovakia', 'SK', 'SVK', '703', 'ISO 3166-2:SK', NULL, NULL, '1', ''),
('01626ddd', 'Marshall Islands', 'MH', 'MHL', '584', 'ISO 3166-2:MH', NULL, NULL, '1', ''),
('05fe9add', 'Equatorial Guinea', 'GQ', 'GNQ', '226', 'ISO 3166-2:GQ', NULL, NULL, '1', ''),
('0602c184', 'Japan', 'JP', 'JPN', '392', 'ISO 3166-2:JP', NULL, NULL, '1', ''),
('069e51e6', 'Chile', 'CL', 'CHL', '152', 'ISO 3166-2:CL', NULL, NULL, '1', ''),
('07cd194a', 'Botswana', 'BW', 'BWA', '72', 'ISO 3166-2:BW', NULL, NULL, '1', ''),
('0af396fc', 'Heard Island and McDonald Islands', 'HM', 'HMD', '334', 'ISO 3166-2:HM', NULL, NULL, '1', ''),
('0b3669c4', 'Israel', 'IL', 'ISR', '376', 'ISO 3166-2:IL', NULL, NULL, '1', ''),
('0c096152', 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', '654', 'ISO 3166-2:SH', NULL, NULL, '1', ''),
('0c9c3394', 'British Indian Ocean Territory', 'IO', 'IOT', '86', 'ISO 3166-2:IO', NULL, NULL, '1', ''),
('0d4cebff', 'Macao', 'MO', 'MAC', '446', 'ISO 3166-2:MO', NULL, NULL, '1', ''),
('0d9bf93b', 'Jamaica', 'JM', 'JAM', '388', 'ISO 3166-2:JM', NULL, NULL, '1', ''),
('0dc2754b', 'Indonesia', 'ID', 'IDN', '360', 'ISO 3166-2:ID', NULL, NULL, '1', ''),
('0ebe5d3f', 'Algeria', 'DZ', 'DZA', '12', 'ISO 3166-2:DZ', NULL, NULL, '1', ''),
('1082aed3', 'Greece', 'GR', 'GRC', '300', 'ISO 3166-2:GR', NULL, NULL, '1', ''),
('124e9c1f', 'Colombia', 'CO', 'COL', '170', 'ISO 3166-2:CO', NULL, NULL, '1', ''),
('12e29f7d', 'Micronesia, Federated States of', 'FM', 'FSM', '583', 'ISO 3166-2:FM', NULL, NULL, '1', ''),
('1317ecdc', 'Bangladesh', 'BD', 'BGD', '50', 'ISO 3166-2:BD', NULL, NULL, '1', ''),
('15d8cc84', 'Zambia', 'ZM', 'ZMB', '894', 'ISO 3166-2:ZM', NULL, NULL, '1', ''),
('16c8845d', 'Sint Maarten (Dutch part)', 'SX', 'SXM', '534', 'ISO 3166-2:SX', NULL, NULL, '1', ''),
('171c513f', 'Saint Lucia', 'LC', 'LCA', '662', 'ISO 3166-2:LC', NULL, NULL, '1', ''),
('173f2095', 'Croatia', 'HR', 'HRV', '191', 'ISO 3166-2:HR', NULL, NULL, '1', ''),
('1a8f9239', 'Iraq', 'IQ', 'IRQ', '368', 'ISO 3166-2:IQ', NULL, NULL, '1', ''),
('1d7aa72c', 'Viet Nam', 'VN', 'VNM', '704', 'ISO 3166-2:VN', NULL, NULL, '1', ''),
('1eeb5185', 'Tunisia', 'TN', 'TUN', '788', 'ISO 3166-2:TN', NULL, NULL, '1', ''),
('21dbb6e6', 'Togo', 'TG', 'TGO', '768', 'ISO 3166-2:TG', NULL, NULL, '1', ''),
('238ec5c8', 'Poland', 'PL', 'POL', '616', 'ISO 3166-2:PL', NULL, NULL, '1', ''),
('2581b41f', 'Tonga', 'TO', 'TON', '776', 'ISO 3166-2:TO', NULL, NULL, '1', ''),
('2584f990', 'Hungary', 'HU', 'HUN', '348', 'ISO 3166-2:HU', NULL, NULL, '1', ''),
('25a1213a', 'Benin', 'BJ', 'BEN', '204', 'ISO 3166-2:BJ', NULL, NULL, '1', ''),
('2ace0ca6', 'Gambia', 'GM', 'GMB', '270', 'ISO 3166-2:GM', NULL, NULL, '1', ''),
('2b18e99f', 'Djibouti', 'DJ', 'DJI', '262', 'ISO 3166-2:DJ', NULL, NULL, '1', ''),
('2bf86559', 'Mongolia', 'MN', 'MNG', '496', 'ISO 3166-2:MN', NULL, NULL, '1', ''),
('2d054cd4', 'Venezuela, Bolivarian Republic of', 'VE', 'VEN', '862', 'ISO 3166-2:VE', NULL, NULL, '1', ''),
('2ef87577', 'United Arab Emirates', 'AE', 'ARE', '784', 'ISO 3166-2:AE', NULL, NULL, '1', ''),
('2fe054c1', 'Zimbabwe', 'ZW', 'ZWE', '716', 'ISO 3166-2:ZW', NULL, NULL, '1', ''),
('3027c4bc', 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '535', 'ISO 3166-2:BQ', NULL, NULL, '1', ''),
('3227688d', 'Austria', 'AT', 'AUT', '40', 'ISO 3166-2:AT', NULL, NULL, '1', ''),
('32f3fa05', 'Belgium', 'BE', 'BEL', '56', 'ISO 3166-2:BE', NULL, NULL, '1', ''),
('33ab7310', 'San Marino', 'SM', 'SMR', '674', 'ISO 3166-2:SM', NULL, NULL, '1', ''),
('346bcd7d', 'Lithuania', 'LT', 'LTU', '440', 'ISO 3166-2:LT', NULL, NULL, '1', ''),
('3490df03', 'Burundi', 'BI', 'BDI', '108', 'ISO 3166-2:BI', NULL, NULL, '1', ''),
('350c1cfa', 'Cura?ao', 'CW', 'CUW', '531', 'ISO 3166-2:CW', NULL, NULL, '1', ''),
('36e75e6b', 'Estonia', 'EE', 'EST', '233', 'ISO 3166-2:EE', NULL, NULL, '1', ''),
('3b228278', 'Moldova, Republic of', 'MD', 'MDA', '498', 'ISO 3166-2:MD', NULL, NULL, '1', ''),
('3c1c88ef', 'Panama', 'PA', 'PAN', '591', 'ISO 3166-2:PA', NULL, NULL, '1', ''),
('3cbe835a', 'Falkland Islands (Malvinas)', 'FK', 'FLK', '238', 'ISO 3166-2:FK', NULL, NULL, '1', ''),
('3dabeb15', 'Bulgaria', 'BG', 'BGR', '100', 'ISO 3166-2:BG', NULL, NULL, '1', ''),
('3dcaf958', 'France', 'FR', 'FRA', '250', 'ISO 3166-2:FR', NULL, NULL, '1', ''),
('3e352d52', 'Cape Verde', 'CV', 'CPV', '132', 'ISO 3166-2:CV', NULL, NULL, '1', ''),
('4048d3aa', 'Denmark', 'DK', 'DNK', '208', 'ISO 3166-2:DK', NULL, NULL, '1', ''),
('40c5373b', 'Tajikistan', 'TJ', 'TJK', '762', 'ISO 3166-2:TJ', NULL, NULL, '1', ''),
('4126df49', 'Nicaragua', 'NI', 'NIC', '558', 'ISO 3166-2:NI', NULL, NULL, '1', ''),
('4264d1fc', 'Mali', 'ML', 'MLI', '466', 'ISO 3166-2:ML', NULL, NULL, '1', ''),
('431e96b0', 'Ukraine', 'UA', 'UKR', '804', 'ISO 3166-2:UA', NULL, NULL, '1', ''),
('435dadfc', 'Saudi Arabia', 'SA', 'SAU', '682', 'ISO 3166-2:SA', NULL, NULL, '1', ''),
('43e89d05', 'Saint Pierre and Miquelon', 'PM', 'SPM', '666', 'ISO 3166-2:PM', NULL, NULL, '1', ''),
('446c5dd1', 'India', 'IN', 'IND', '356', 'ISO 3166-2:IN', NULL, NULL, '1', ''),
('451c1602', 'Bosnia and Herzegovina', 'BA', 'BIH', '70', 'ISO 3166-2:BA', NULL, NULL, '1', ''),
('47e4c5df', 'Hong Kong', 'HK', 'HKG', '344', 'ISO 3166-2:HK', NULL, NULL, '1', ''),
('481bfa34', 'Jersey', 'JE', 'JEY', '832', 'ISO 3166-2:JE', NULL, NULL, '1', ''),
('49119647', 'Virgin Islands, British', 'VG', 'VGB', '92', 'ISO 3166-2:VG', NULL, NULL, '1', ''),
('497d1865', 'Dominican Republic', 'DO', 'DOM', '214', 'ISO 3166-2:DO', NULL, NULL, '1', ''),
('4992fc8c', 'Australia', 'AU', 'AUS', '36', 'ISO 3166-2:AU', NULL, NULL, '1', ''),
('49c03c23', 'Liberia', 'LR', 'LBR', '430', 'ISO 3166-2:LR', NULL, NULL, '1', ''),
('4b0dceee', 'Christmas Island', 'CX', 'CXR', '162', 'ISO 3166-2:CX', NULL, NULL, '1', ''),
('4b52737c', 'Cocos (Keeling) Islands', 'CC', 'CCK', '166', 'ISO 3166-2:CC', NULL, NULL, '1', ''),
('4bc8540f', 'Palau', 'PW', 'PLW', '585', 'ISO 3166-2:PW', NULL, NULL, '1', ''),
('4c260451', 'Argentina', 'AR', 'ARG', '32', 'ISO 3166-2:AR', NULL, NULL, '1', ''),
('4c959a08', 'Guernsey', 'GG', 'GGY', '831', 'ISO 3166-2:GG', NULL, NULL, '1', ''),
('4d2b97a0', 'C?te d''Ivoire', 'CI', 'CIV', '384', 'ISO 3166-2:CI', NULL, NULL, '1', ''),
('4e002d08', 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', '239', 'ISO 3166-2:GS', NULL, NULL, '1', ''),
('4e46c6d7', 'Bahamas', 'BS', 'BHS', '44', 'ISO 3166-2:BS', NULL, NULL, '1', ''),
('4eb9e4cc', 'Brazil', 'BR', 'BRA', '76', 'ISO 3166-2:BR', NULL, NULL, '1', ''),
('4edb11a9', 'Sri Lanka', 'LK', 'LKA', '144', 'ISO 3166-2:LK', NULL, NULL, '1', ''),
('4f103e80', 'Swaziland', 'SZ', 'SWZ', '748', 'ISO 3166-2:SZ', NULL, NULL, '1', ''),
('4f46b979', 'Belarus', 'BY', 'BLR', '112', 'ISO 3166-2:BY', NULL, NULL, '1', ''),
('4f716ede', 'Vanuatu', 'VU', 'VUT', '548', 'ISO 3166-2:VU', NULL, NULL, '1', ''),
('5027baca', 'Nauru', 'NR', 'NRU', '520', 'ISO 3166-2:NR', NULL, NULL, '1', ''),
('52aeaf17', 'South Sudan', 'SS', 'SSD', '728', 'ISO 3166-2:SS', NULL, NULL, '1', ''),
('538ae45f', 'Anguilla', 'AI', 'AIA', '660', 'ISO 3166-2:AI', NULL, NULL, '1', ''),
('53da9787', 'Niue', 'NU', 'NIU', '570', 'ISO 3166-2:NU', NULL, NULL, '1', ''),
('5553281c', 'Antigua and Barbuda', 'AG', 'ATG', '28', 'ISO 3166-2:AG', NULL, NULL, '1', ''),
('55dc56d3', 'Philippines', 'PH', 'PHL', '608', 'ISO 3166-2:PH', NULL, NULL, '1', ''),
('5722f3e0', 'Korea, Republic of', 'KR', 'KOR', '410', 'ISO 3166-2:KR', NULL, NULL, '1', ''),
('5939ac91', 'Isle of Man', 'IM', 'IMN', '833', 'ISO 3166-2:IM', NULL, NULL, '1', ''),
('5a21b6ed', 'Singapore', 'SG', 'SGP', '702', 'ISO 3166-2:SG', NULL, NULL, '1', ''),
('5ba7b263', 'Syrian Arab Republic', 'SY', 'SYR', '760', 'ISO 3166-2:SY', NULL, NULL, '1', ''),
('5d8483d9', 'Tuvalu', 'TV', 'TUV', '798', 'ISO 3166-2:TV', NULL, NULL, '1', ''),
('5e0c9807', 'United States Minor Outlying Islands', 'UM', 'UMI', '581', 'ISO 3166-2:UM', NULL, NULL, '1', ''),
('640f30f7', 'R?union', 'RE', 'REU', '638', 'ISO 3166-2:RE', NULL, NULL, '1', ''),
('66587462', 'Congo, the Democratic Republic of the', 'CD', 'COD', '180', 'ISO 3166-2:CD', NULL, NULL, '1', ''),
('67aa821e', 'China', 'CN', 'CHN', '156', 'ISO 3166-2:CN', NULL, NULL, '1', ''),
('6867f26e', 'Bolivia, Plurinational State of', 'BO', 'BOL', '68', 'ISO 3166-2:BO', NULL, NULL, '1', ''),
('693c0104', 'Namibia', 'NA', 'NAM', '516', 'ISO 3166-2:NA', NULL, NULL, '1', ''),
('6c4d5fde', 'Afghanistan', 'AF', 'AFG', '4', 'ISO 3166-2:AF', NULL, NULL, '1', ''),
('6de86353', 'Spain', 'ES', 'ESP', '724', 'ISO 3166-2:ES', NULL, NULL, '1', ''),
('6ee323df', 'New Zealand', 'NZ', 'NZL', '554', 'ISO 3166-2:NZ', NULL, NULL, '1', ''),
('6fc165d9', 'Macedonia, the former Yugoslav Republic of', 'MK', 'MKD', '807', 'ISO 3166-2:MK', NULL, NULL, '1', ''),
('6fe4184f', 'Oman', 'OM', 'OMN', '512', 'ISO 3166-2:OM', NULL, NULL, '1', ''),
('706bdf89', 'Grenada', 'GD', 'GRD', '308', 'ISO 3166-2:GD', NULL, NULL, '1', ''),
('70ac2219', 'Senegal', 'SN', 'SEN', '686', 'ISO 3166-2:SN', NULL, NULL, '1', ''),
('70fde2da', 'Korea, Democratic People''s Republic of', 'KP', 'PRK', '408', 'ISO 3166-2:KP', NULL, NULL, '1', ''),
('71f232a8', 'Paraguay', 'PY', 'PRY', '600', 'ISO 3166-2:PY', NULL, NULL, '1', ''),
('72ae8c3d', 'Kiribati', 'KI', 'KIR', '296', 'ISO 3166-2:KI', NULL, NULL, '1', ''),
('734b23c1', 'French Southern Territories', 'TF', 'ATF', '260', 'ISO 3166-2:TF', NULL, NULL, '1', ''),
('73f8a5ab', 'Honduras', 'HN', 'HND', '340', 'ISO 3166-2:HN', NULL, NULL, '1', ''),
('7581ac4e', 'Russian Federation', 'RU', 'RUS', '643', 'ISO 3166-2:RU', NULL, NULL, '1', ''),
('76630166', 'Azerbaijan', 'AZ', 'AZE', '31', 'ISO 3166-2:AZ', NULL, NULL, '1', ''),
('775cb6c8', 'Qatar', 'QA', 'QAT', '634', 'ISO 3166-2:QA', NULL, NULL, '1', ''),
('7761056a', 'Portugal', 'PT', 'PRT', '620', 'ISO 3166-2:PT', NULL, NULL, '1', ''),
('77c2094e', 'Guinea-Bissau', 'GW', 'GNB', '624', 'ISO 3166-2:GW', NULL, NULL, '1', ''),
('7855b819', 'Cambodia', 'KH', 'KHM', '116', 'ISO 3166-2:KH', NULL, NULL, '1', ''),
('7b0d5fe8', 'Saint Martin (French part)', 'MF', 'MAF', '663', 'ISO 3166-2:MF', NULL, NULL, '1', ''),
('7c3b2588', 'Sweden', 'SE', 'SWE', '752', 'ISO 3166-2:SE', NULL, NULL, '1', ''),
('7e46afb1', 'Slovenia', 'SI', 'SVN', '705', 'ISO 3166-2:SI', NULL, NULL, '1', ''),
('7e7d7f3a', 'Iceland', 'IS', 'ISL', '352', 'ISO 3166-2:IS', NULL, NULL, '1', ''),
('800c2eab', 'Czech Republic', 'CZ', 'CZE', '203', 'ISO 3166-2:CZ', NULL, NULL, '1', ''),
('80c56973', 'Lesotho', 'LS', 'LSO', '426', 'ISO 3166-2:LS', NULL, NULL, '1', ''),
('810967e5', 'Mayotte', 'YT', 'MYT', '175', 'ISO 3166-2:YT', NULL, NULL, '1', ''),
('820eca36', 'Northern Mariana Islands', 'MP', 'MNP', '580', 'ISO 3166-2:MP', NULL, NULL, '1', ''),
('82d5f60a', 'Niger', 'NE', 'NER', '562', 'ISO 3166-2:NE', NULL, NULL, '1', ''),
('8354a10b', 'Chad', 'TD', 'TCD', '148', 'ISO 3166-2:TD', NULL, NULL, '1', ''),
('83efaa1a', 'Brunei Darussalam', 'BN', 'BRN', '96', 'ISO 3166-2:BN', NULL, NULL, '1', ''),
('84b86270', 'Cyprus', 'CY', 'CYP', '196', 'ISO 3166-2:CY', NULL, NULL, '1', ''),
('859246ae', 'Samoa', 'WS', 'WSM', '882', 'ISO 3166-2:WS', NULL, NULL, '1', ''),
('860e8e19', 'Malawi', 'MW', 'MWI', '454', 'ISO 3166-2:MW', NULL, NULL, '1', ''),
('8754d6e6', 'El Salvador', 'SV', 'SLV', '222', 'ISO 3166-2:SV', NULL, NULL, '1', ''),
('87aa7da7', 'Sao Tome and Principe', 'ST', 'STP', '678', 'ISO 3166-2:ST', NULL, NULL, '1', ''),
('88b434be', 'Faroe Islands', 'FO', 'FRO', '234', 'ISO 3166-2:FO', NULL, NULL, '1', ''),
('8a4655bf', 'Saint Barth?lemy', 'BL', 'BLM', '652', 'ISO 3166-2:BL', NULL, NULL, '1', ''),
('8ad2e4f6', 'Luxembourg', 'LU', 'LUX', '442', 'ISO 3166-2:LU', NULL, NULL, '1', ''),
('8b5e0680', 'Malta', 'MT', 'MLT', '470', 'ISO 3166-2:MT', NULL, NULL, '1', ''),
('8e2dcdbc', 'Barbados', 'BB', 'BRB', '52', 'ISO 3166-2:BB', NULL, NULL, '1', ''),
('8e8795d8', 'Cayman Islands', 'KY', 'CYM', '136', 'ISO 3166-2:KY', NULL, NULL, '1', ''),
('901395de', 'Sudan', 'SD', 'SDN', '729', 'ISO 3166-2:SD', NULL, NULL, '1', ''),
('91199ff5', 'Switzerland', 'CH', 'CHE', '756', 'ISO 3166-2:CH', NULL, NULL, '1', ''),
('9124cc5f', 'United States', 'US', 'USA', '840', 'ISO 3166-2:US', NULL, NULL, '1', ''),
('91412bb3', 'South Africa', 'ZA', 'ZAF', '710', 'ISO 3166-2:ZA', NULL, NULL, '1', ''),
('92130a78', 'Liechtenstein', 'LI', 'LIE', '438', 'ISO 3166-2:LI', NULL, NULL, '1', ''),
('930c2b1d', 'Mauritania', 'MR', 'MRT', '478', 'ISO 3166-2:MR', NULL, NULL, '1', ''),
('9515d853', 'Kazakhstan', 'KZ', 'KAZ', '398', 'ISO 3166-2:KZ', NULL, NULL, '1', ''),
('97642733', 'Solomon Islands', 'SB', 'SLB', '90', 'ISO 3166-2:SB', NULL, NULL, '1', ''),
('98c2e160', 'Montserrat', 'MS', 'MSR', '500', 'ISO 3166-2:MS', NULL, NULL, '1', ''),
('996121c0', 'Cuba', 'CU', 'CUB', '192', 'ISO 3166-2:CU', NULL, NULL, '1', ''),
('9a407571', 'Germany', 'DE', 'DEU', '276', 'ISO 3166-2:DE', NULL, NULL, '1', ''),
('9a4e3325', 'Suriname', 'SR', 'SUR', '740', 'ISO 3166-2:SR', NULL, NULL, '1', ''),
('9bd2fd0c', 'Lebanon', 'LB', 'LBN', '422', 'ISO 3166-2:LB', NULL, NULL, '1', ''),
('9c0b33fd', 'French Polynesia', 'PF', 'PYF', '258', 'ISO 3166-2:PF', NULL, NULL, '1', ''),
('9cc572eb', 'Central African Republic', 'CF', 'CAF', '140', 'ISO 3166-2:CF', NULL, NULL, '1', ''),
('9de04ffa', 'Norfolk Island', 'NF', 'NFK', '574', 'ISO 3166-2:NF', NULL, NULL, '1', ''),
('9de35fc5', 'Saint Kitts and Nevis', 'KN', 'KNA', '659', 'ISO 3166-2:KN', NULL, NULL, '1', ''),
('9f039757', 'Mauritius', 'MU', 'MUS', '480', 'ISO 3166-2:MU', NULL, NULL, '1', ''),
('a1cb18d2', 'Pitcairn', 'PN', 'PCN', '612', 'ISO 3166-2:PN', NULL, NULL, '1', ''),
('a23c9fb5', 'Ghana', 'GH', 'GHA', '288', 'ISO 3166-2:GH', NULL, NULL, '1', ''),
('a36af41a', 'United Kingdom', 'GB', 'GBR', '826', 'ISO 3166-2:GB', NULL, NULL, '1', ''),
('a47a24a6', 'Aruba', 'AW', 'ABW', '533', 'ISO 3166-2:AW', NULL, NULL, '1', ''),
('a52f7b01', 'Turks and Caicos Islands', 'TC', 'TCA', '796', 'ISO 3166-2:TC', NULL, NULL, '1', ''),
('a70d0154', 'Kyrgyzstan', 'KG', 'KGZ', '417', 'ISO 3166-2:KG', NULL, NULL, '1', ''),
('a822f462', 'Congo', 'CG', 'COG', '178', 'ISO 3166-2:CG', NULL, NULL, '1', ''),
('a8325427', 'Western Sahara', 'EH', 'ESH', '732', 'ISO 3166-2:EH', NULL, NULL, '1', ''),
('a9f8b333', 'Haiti', 'HT', 'HTI', '332', 'ISO 3166-2:HT', NULL, NULL, '1', ''),
('abb96242', 'Costa Rica', 'CR', 'CRI', '188', 'ISO 3166-2:CR', NULL, NULL, '1', ''),
('ae16dfbb', 'Timor-Leste', 'TL', 'TLS', '626', 'ISO 3166-2:TL', NULL, NULL, '1', ''),
('ae1cb573', 'Tokelau', 'TK', 'TKL', '772', 'ISO 3166-2:TK', NULL, NULL, '1', ''),
('aec31d9c', 'Guatemala', 'GT', 'GTM', '320', 'ISO 3166-2:GT', NULL, NULL, '1', ''),
('afabf5a6', 'Yemen', 'YE', 'YEM', '887', 'ISO 3166-2:YE', NULL, NULL, '1', ''),
('afbefcfe', 'Uzbekistan', 'UZ', 'UZB', '860', 'ISO 3166-2:UZ', NULL, NULL, '1', ''),
('afd58365', 'Italy', 'IT', 'ITA', '380', 'ISO 3166-2:IT', NULL, NULL, '1', ''),
('b1585e7a', 'Guam', 'GU', 'GUM', '316', 'ISO 3166-2:GU', NULL, NULL, '1', ''),
('b37ba449', 'Belize', 'BZ', 'BLZ', '84', 'ISO 3166-2:BZ', NULL, NULL, '1', ''),
('b38a22f1', 'Wallis and Futuna', 'WF', 'WLF', '876', 'ISO 3166-2:WF', NULL, NULL, '1', ''),
('b39db15f', 'Ireland', 'IE', 'IRL', '372', 'ISO 3166-2:IE', NULL, NULL, '1', ''),
('b3bd4d48', 'Dominica', 'DM', 'DMA', '212', 'ISO 3166-2:DM', NULL, NULL, '1', ''),
('b4aa7b50', 'Martinique', 'MQ', 'MTQ', '474', 'ISO 3166-2:MQ', NULL, NULL, '1', ''),
('b52ca0e7', 'Peru', 'PE', 'PER', '604', 'ISO 3166-2:PE', NULL, NULL, '1', ''),
('b5b91bf6', 'Tanzania, United Republic of', 'TZ', 'TZA', '834', 'ISO 3166-2:TZ', NULL, NULL, '1', ''),
('b5e57d7c', 'Seychelles', 'SC', 'SYC', '690', 'ISO 3166-2:SC', NULL, NULL, '1', ''),
('b771e79e', 'Papua New Guinea', 'PG', 'PNG', '598', 'ISO 3166-2:PG', NULL, NULL, '1', ''),
('b7e46aad', 'Romania', 'RO', 'ROU', '642', 'ISO 3166-2:RO', NULL, NULL, '1', ''),
('b9c79a53', 'Mexico', 'MX', 'MEX', '484', 'ISO 3166-2:MX', NULL, NULL, '1', ''),
('bb0faf77', 'Cameroon', 'CM', 'CMR', '120', 'ISO 3166-2:CM', NULL, NULL, '1', ''),
('bc275acb', 'Virgin Islands, U.S.', 'VI', 'VIR', '850', 'ISO 3166-2:VI', NULL, NULL, '1', ''),
('bd5b0f55', 'Monaco', 'MC', 'MCO', '492', 'ISO 3166-2:MC', NULL, NULL, '1', ''),
('be48dc7f', 'Turkey', 'TR', 'TUR', '792', 'ISO 3166-2:TR', NULL, NULL, '1', ''),
('c0bf0d1a', 'Sierra Leone', 'SL', 'SLE', '694', 'ISO 3166-2:SL', NULL, NULL, '1', ''),
('c277f536', 'Taiwan, Province of China', 'TW', 'TWN', '158', 'ISO 3166-2:TW', NULL, NULL, '1', ''),
('c2a04ced', 'Kenya', 'KE', 'KEN', '404', 'ISO 3166-2:KE', NULL, NULL, '1', ''),
('c312471d', 'Maldives', 'MV', 'MDV', '462', 'ISO 3166-2:MV', NULL, NULL, '1', ''),
('c56fba61', 'Holy See (Vatican City State)', 'VA', 'VAT', '336', 'ISO 3166-2:VA', NULL, NULL, '1', ''),
('c5c1dd24', 'Bahrain', 'BH', 'BHR', '48', 'ISO 3166-2:BH', NULL, NULL, '1', ''),
('c769a10f', 'Uruguay', 'UY', 'URY', '858', 'ISO 3166-2:UY', NULL, NULL, '1', ''),
('c8709103', 'Guadeloupe', 'GP', 'GLP', '312', 'ISO 3166-2:GP', NULL, NULL, '1', ''),
('c8ec9674', 'Bouvet Island', 'BV', 'BVT', '74', 'ISO 3166-2:BV', NULL, NULL, '1', ''),
('c922f2c2', '?land Islands', 'AX', 'ALA', '248', 'ISO 3166-2:AX', NULL, NULL, '1', ''),
('c9e5fcf8', 'Nigeria', 'NG', 'NGA', '566', 'ISO 3166-2:NG', NULL, NULL, '1', ''),
('ca42de74', 'Libya', 'LY', 'LBY', '434', 'ISO 3166-2:LY', NULL, NULL, '1', ''),
('cce4fa6c', 'Fiji', 'FJ', 'FJI', '242', 'ISO 3166-2:FJ', NULL, NULL, '1', ''),
('cd8486f2', 'Trinidad and Tobago', 'TT', 'TTO', '780', 'ISO 3166-2:TT', NULL, NULL, '1', ''),
('d0710892', 'Ethiopia', 'ET', 'ETH', '231', 'ISO 3166-2:ET', NULL, NULL, '1', ''),
('d2a1f646', 'New Caledonia', 'NC', 'NCL', '540', 'ISO 3166-2:NC', NULL, NULL, '1', ''),
('d2bf1b52', 'Thailand', 'TH', 'THA', '764', 'ISO 3166-2:TH', NULL, NULL, '1', ''),
('d365746b', 'Greenland', 'GL', 'GRL', '304', 'ISO 3166-2:GL', NULL, NULL, '1', ''),
('d40df118', 'Morocco', 'MA', 'MAR', '504', 'ISO 3166-2:MA', NULL, NULL, '1', ''),
('d43e265b', 'Egypt', 'EG', 'EGY', '818', 'ISO 3166-2:EG', NULL, NULL, '1', ''),
('d4692c37', 'Netherlands', 'NL', 'NLD', '528', 'ISO 3166-2:NL', NULL, NULL, '1', ''),
('d4c719d5', 'American Samoa', 'AS', 'ASM', '16', 'ISO 3166-2:AS', NULL, NULL, '1', ''),
('d511c303', 'Uganda', 'UG', 'UGA', '800', 'ISO 3166-2:UG', NULL, NULL, '1', ''),
('d5d951a6', 'Latvia', 'LV', 'LVA', '428', 'ISO 3166-2:LV', NULL, NULL, '1', ''),
('d62005a7', 'Gibraltar', 'GI', 'GIB', '292', 'ISO 3166-2:GI', NULL, NULL, '1', ''),
('d778ba75', 'Ecuador', 'EC', 'ECU', '218', 'ISO 3166-2:EC', NULL, NULL, '1', ''),
('d80d621d', 'Malaysia', 'MY', 'MYS', '458', 'ISO 3166-2:MY', NULL, NULL, '1', ''),
('d8b4b72f', 'Georgia', 'GE', 'GEO', '268', 'ISO 3166-2:GE', NULL, NULL, '1', ''),
('dcefd97c', 'Svalbard and Jan Mayen', 'SJ', 'SJM', '744', 'ISO 3166-2:SJ', NULL, NULL, '1', ''),
('e085574b', 'Puerto Rico', 'PR', 'PRI', '630', 'ISO 3166-2:PR', NULL, NULL, '1', ''),
('e108b70f', 'Guyana', 'GY', 'GUY', '328', 'ISO 3166-2:GY', NULL, NULL, '1', ''),
('e156984a', 'Iran, Islamic Republic of', 'IR', 'IRN', '364', 'ISO 3166-2:IR', NULL, NULL, '1', ''),
('e1d2a70a', 'Guinea', 'GN', 'GIN', '324', 'ISO 3166-2:GN', NULL, NULL, '1', ''),
('e47e3dc7', 'Albania', 'AL', 'ALB', '8', 'ISO 3166-2:AL', NULL, NULL, '1', ''),
('e53e603e', 'Rwanda', 'RW', 'RWA', '646', 'ISO 3166-2:RW', NULL, NULL, '1', ''),
('e769c2c7', 'Montenegro', 'ME', 'MNE', '499', 'ISO 3166-2:ME', NULL, NULL, '1', ''),
('e8a8cbf4', 'Mozambique', 'MZ', 'MOZ', '508', 'ISO 3166-2:MZ', NULL, NULL, '1', ''),
('ea1ad680', 'Serbia', 'RS', 'SRB', '688', 'ISO 3166-2:RS', NULL, NULL, '1', ''),
('ea30d569', 'Burkina Faso', 'BF', 'BFA', '854', 'ISO 3166-2:BF', NULL, NULL, '1', ''),
('ea4f358c', 'Cook Islands', 'CK', 'COK', '184', 'ISO 3166-2:CK', NULL, NULL, '1', ''),
('eb3f5938', 'Somalia', 'SO', 'SOM', '706', 'ISO 3166-2:SO', NULL, NULL, '1', ''),
('ecfddf4d', 'Canada', 'CA', 'CAN', '124', 'ISO 3166-2:CA', NULL, NULL, '1', ''),
('ed7c3b47', 'Myanmar', 'MM', 'MMR', '104', 'ISO 3166-2:MM', NULL, NULL, '1', ''),
('eea9ce14', 'Kuwait', 'KW', 'KWT', '414', 'ISO 3166-2:KW', NULL, NULL, '1', ''),
('f06bc6a4', 'French Guiana', 'GF', 'GUF', '254', 'ISO 3166-2:GF', NULL, NULL, '1', ''),
('f11b798e', 'Turkmenistan', 'TM', 'TKM', '795', 'ISO 3166-2:TM', NULL, NULL, '1', ''),
('f1e4c64a', 'Norway', 'NO', 'NOR', '578', 'ISO 3166-2:NO', NULL, NULL, '1', ''),
('f35c0874', 'Andorra', 'AD', 'AND', '20', 'ISO 3166-2:AD', NULL, NULL, '1', ''),
('f3a97967', 'Comoros', 'KM', 'COM', '174', 'ISO 3166-2:KM', NULL, NULL, '1', ''),
('f3f4eb11', 'Antarctica', 'AQ', 'ATA', '10', 'ISO 3166-2:AQ', NULL, NULL, '1', ''),
('f4baeee3', 'Finland', 'FI', 'FIN', '246', 'ISO 3166-2:FI', NULL, NULL, '1', ''),
('f4de246e', 'Armenia', 'AM', 'ARM', '51', 'ISO 3166-2:AM', NULL, NULL, '1', ''),
('f6ee8c74', 'Jordan', 'JO', 'JOR', '400', 'ISO 3166-2:JO', NULL, NULL, '1', ''),
('f7b7457f', 'Saint Vincent and the Grenadines', 'VC', 'VCT', '670', 'ISO 3166-2:VC', NULL, NULL, '1', ''),
('f869ac32', 'Bhutan', 'BT', 'BTN', '64', 'ISO 3166-2:BT', NULL, NULL, '1', ''),
('f92c4d65', 'Madagascar', 'MG', 'MDG', '450', 'ISO 3166-2:MG', NULL, NULL, '1', ''),
('fa1d6c7f', 'Angola', 'AO', 'AGO', '24', 'ISO 3166-2:AO', NULL, NULL, '1', ''),
('fbb040ca', 'Pakistan', 'PK', 'PAK', '586', 'ISO 3166-2:PK', NULL, NULL, '1', ''),
('fc217ac4', 'Lao People''s Democratic Republic', 'LA', 'LAO', '418', 'ISO 3166-2:LA', NULL, NULL, '1', ''),
('fdd19a6c', 'Palestine, State of', 'PS', 'PSE', '275', 'ISO 3166-2:PS', NULL, NULL, '1', ''),
('fdebfbe9', 'Bermuda', 'BM', 'BMU', '60', 'ISO 3166-2:BM', NULL, NULL, '1', ''),
('ff6bf22a', 'Nepal', 'NP', 'NPL', '524', 'ISO 3166-2:NP', NULL, NULL, '1', ''),
('ff7b72f5', 'Gabon', 'GA', 'GAB', '266', 'ISO 3166-2:GA', NULL, NULL, '1', ''),
('ffaf6c10', 'Eritrea', 'ER', 'ERI', '232', 'ISO 3166-2:ER', NULL, NULL, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `internal`
--

DROP TABLE IF EXISTS `internal`;
CREATE TABLE `internal` (
  `id_internal` varchar(30) NOT NULL DEFAULT '',
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_branch` varchar(30) DEFAULT NULL,
  `fk.id_internal_group` varchar(30) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restricted` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_internal`),
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_branch` (`fk.id_branch`),
  KEY `fk.id_internal_group` (`fk.id_internal_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `internal`
--

TRUNCATE TABLE `internal`;
--
-- Dumping data for table `internal`
--

INSERT INTO `internal` (`id_internal`, `fk.id_contact`, `fk.id_branch`, `fk.id_internal_group`, `registered`, `restricted`, `active`, `notes`) VALUES
('internal001', 'contact001', 'branch001', 'internalgroup001', '2014-11-12 10:21:11', NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `internal_group`
--

DROP TABLE IF EXISTS `internal_group`;
CREATE TABLE `internal_group` (
  `id_internal_group` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_internal_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `internal_group`
--

TRUNCATE TABLE `internal_group`;
--
-- Dumping data for table `internal_group`
--

INSERT INTO `internal_group` (`id_internal_group`, `name`, `active`, `notes`) VALUES
('internalgroup001', 'Menejer', '1', ''),
('internalgroup002', 'Admin', '1', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `internal_karyawan`
--
DROP VIEW IF EXISTS `internal_karyawan`;
CREATE TABLE `internal_karyawan` (
`id` varchar(30)
,`nama_depan` varchar(20)
,`nama_belakang` varchar(20)
,`cabang` varchar(30)
,`grup` varchar(30)
,`active` enum('0','1')
);
-- --------------------------------------------------------

--
-- Table structure for table `internal_module`
--

DROP TABLE IF EXISTS `internal_module`;
CREATE TABLE `internal_module` (
  `id_internal_module` varchar(30) NOT NULL DEFAULT '',
  `fk.id_internal_module` varchar(30) DEFAULT NULL,
  `fk.id_internal_group` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `handler` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_internal_module`),
  KEY `fk.id_internal_group` (`fk.id_internal_group`),
  KEY `fk.id_internal_module` (`fk.id_internal_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `internal_module`
--

TRUNCATE TABLE `internal_module`;
--
-- Dumping data for table `internal_module`
--

INSERT INTO `internal_module` (`id_internal_module`, `fk.id_internal_module`, `fk.id_internal_group`, `name`, `handler`, `icon`, `order`, `active`, `notes`) VALUES
('im0001', NULL, 'internalgroup001', 'Master', '', NULL, NULL, '1', ''),
('im0002', NULL, 'internalgroup001', 'Pembelian & Retur', '', NULL, NULL, '1', ''),
('im0003', NULL, 'internalgroup001', 'Pengiriman & Retur', '', NULL, NULL, '1', ''),
('im0004', NULL, 'internalgroup001', 'Stock Opname', '', NULL, NULL, '1', ''),
('im0005', NULL, 'internalgroup001', 'Laporan', '', NULL, NULL, '1', ''),
('im0006', 'im0001', 'internalgroup001', 'Karyawan', 'i-karyawan', NULL, NULL, '1', ''),
('im0007', 'im0001', 'internalgroup001', 'Outlet', 'i-outlet', NULL, NULL, '1', ''),
('im0008', 'im0001', 'internalgroup001', 'Supplier', 'i-supplier', NULL, NULL, '1', ''),
('im0009', 'im0001', 'internalgroup001', 'Barang & Produk', 'i-barang', NULL, NULL, '1', ''),
('im0010', 'im0002', 'internalgroup001', 'Order Pembelian', 'i-orderbeli', NULL, NULL, '1', ''),
('im0011', 'im0002', 'internalgroup001', 'Penerimaan Barang', 'i-penerimaan', NULL, NULL, '1', ''),
('im0012', 'im0002', 'internalgroup001', 'Retur Beli', 'i-returbeli', NULL, NULL, '1', ''),
('im0013', 'im0003', 'internalgroup001', 'Pengiriman & Surat Jalan', 'i-pengiriman+sj', NULL, NULL, '1', ''),
('im0014', 'im0003', 'internalgroup001', 'Konsinyasi Pengiriman', 'i-konsinyasi', NULL, NULL, '1', ''),
('im0015', 'im0003', 'internalgroup001', 'Retur Pengiriman', 'i-returkirim', NULL, NULL, '1', ''),
('im0016', 'im0004', 'internalgroup001', 'Opname', 'i-opname', NULL, NULL, '1', ''),
('im0017', 'im0004', 'internalgroup001', 'Adjustment', 'i-adjustment', NULL, NULL, '1', ''),
('im0018', 'im0005', 'internalgroup001', 'Stock Barang', 'i-stockbarang', NULL, NULL, '1', ''),
('im0019', 'im0005', 'internalgroup001', 'Kartu Stock', 'i-kartustock', NULL, NULL, '1', ''),
('im0020', 'im0005', 'internalgroup001', 'Rekap Hutang', 'i-rekaphutang', NULL, NULL, '1', ''),
('im0021', 'im0005', 'internalgroup001', 'Rekap Piutang', 'i-rekappiutang', NULL, NULL, '1', ''),
('im0022', 'im0005', 'internalgroup001', 'Analisa Pengadaan Barang', 'i-analisa', NULL, NULL, '1', ''),
('im0023', NULL, 'internalgroup002', 'Master', '', NULL, NULL, '1', ''),
('im0024', NULL, 'internalgroup002', 'Pembelian & Retur', '', NULL, NULL, '1', ''),
('im0025', NULL, 'internalgroup002', 'Pengiriman & Retur', '', NULL, NULL, '1', ''),
('im0026', NULL, 'internalgroup002', 'Stock Opname', '', NULL, NULL, '1', ''),
('im0027', NULL, 'internalgroup002', 'Laporan', '', NULL, NULL, '1', ''),
('im0028', 'im0023', 'internalgroup002', 'Barang & Produk', 'i-barang2', NULL, NULL, '1', ''),
('im0029', 'im0024', 'internalgroup002', 'Order Pembelian', 'i-orderbeli2', NULL, NULL, '1', ''),
('im0030', 'im0024', 'internalgroup002', 'Penerimaan Barang', 'i-penerimaan2', NULL, NULL, '1', ''),
('im0031', 'im0024', 'internalgroup002', 'Retur Beli', 'i-returbeli2', NULL, NULL, '1', ''),
('im0032', 'im0025', 'internalgroup002', 'Pengiriman & Surat Jalan', 'i-pengiriman+sj2', NULL, NULL, '1', ''),
('im0033', 'im0025', 'internalgroup002', 'Konsinyasi Pengiriman', 'i-konsinyasi2', NULL, NULL, '1', ''),
('im0034', 'im0025', 'internalgroup002', 'Retur Pengiriman', 'i-returkirim2', NULL, NULL, '1', ''),
('im0035', 'im0026', 'internalgroup002', 'Opname', 'i-opname2', NULL, NULL, '1', ''),
('im0036', 'im0027', 'internalgroup002', 'Stock Barang', 'i-stockbarang2', NULL, NULL, '1', ''),
('im0037', 'im0027', 'internalgroup002', 'Kartu Stock', 'i-kartustock2', NULL, NULL, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `id_level` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `level`
--

TRUNCATE TABLE `level`;
--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `name`, `active`, `notes`) VALUES
('1a01fb2a', 'Product', '1', ''),
('26c7c31a', 'Mid Raw', '1', ''),
('7b19cee0', 'Raw', '1', ''),
('b2159635', 'Spoilage', '0', ''),
('c5578126', 'Packages', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id_member` varchar(30) NOT NULL DEFAULT '',
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_branch` varchar(30) DEFAULT NULL,
  `fk.id_member_group` varchar(30) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restricted` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_member`),
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_branch` (`fk.id_branch`),
  KEY `fk.id_member_group` (`fk.id_member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `member`
--

TRUNCATE TABLE `member`;
--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `fk.id_contact`, `fk.id_branch`, `fk.id_member_group`, `registered`, `restricted`, `active`, `notes`) VALUES
('member001', 'contact002', 'branch001', 'membergroup001', '2014-11-15 15:06:08', NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member_group`
--

DROP TABLE IF EXISTS `member_group`;
CREATE TABLE `member_group` (
  `id_member_group` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `member_group`
--

TRUNCATE TABLE `member_group`;
--
-- Dumping data for table `member_group`
--

INSERT INTO `member_group` (`id_member_group`, `name`, `active`, `notes`) VALUES
('membergroup001', 'Member', '1', ''),
('membergroup002', 'Konsinyasi', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `member_module`
--

DROP TABLE IF EXISTS `member_module`;
CREATE TABLE `member_module` (
  `id_member_module` varchar(30) NOT NULL DEFAULT '',
  `fk.id_member_module` varchar(30) DEFAULT NULL,
  `fk.id_member_group` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `handler` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_member_module`),
  KEY `fk.id_member_group` (`fk.id_member_group`),
  KEY `fk.id_member_module` (`fk.id_member_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `member_module`
--

TRUNCATE TABLE `member_module`;
--
-- Dumping data for table `member_module`
--

INSERT INTO `member_module` (`id_member_module`, `fk.id_member_module`, `fk.id_member_group`, `name`, `handler`, `icon`, `order`, `active`, `notes`) VALUES
('mm0000', NULL, 'membergroup001', 'Master', '', NULL, NULL, '1', ''),
('mm0001', 'mm0000', 'membergroup001', 'Diskon & Event', 'member-diskondanevent', NULL, NULL, '1', ''),
('mm0002', 'mm0000', 'membergroup002', 'Pemesanan Barang', 'member-pemesasan', NULL, NULL, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `on_order`
--

DROP TABLE IF EXISTS `on_order`;
CREATE TABLE `on_order` (
  `id_on_order` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_on_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `on_order`
--

TRUNCATE TABLE `on_order`;
--
-- Dumping data for table `on_order`
--

INSERT INTO `on_order` (`id_on_order`, `name`, `active`, `notes`) VALUES
('774d7c78', 'Delivered', '1', ''),
('7c90ab4f', 'Billing', '1', ''),
('98224788', 'Checked', '1', ''),
('be321259', 'Reserving', '1', ''),
('d13dc784', 'Eating', '1', ''),
('d39772ef', 'Payment', '1', ''),
('d42d8111', 'Greeted', '1', ''),
('d58821d6', 'Ordering', '1', ''),
('e66309d9', 'Table Switch', '1', ''),
('f2d5dcf9', 'Table Join', '1', ''),
('f3b4e885', 'Waiting', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type` (
  `id_payment_type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `color` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `payment_type`
--

TRUNCATE TABLE `payment_type`;
--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`id_payment_type`, `name`, `active`, `color`, `icon`, `notes`) VALUES
('16aafz04', 'Pay Later', '1', NULL, NULL, NULL),
('2a0d7547', 'Cash', '1', NULL, NULL, NULL),
('3928179b', 'Credit Card', '1', NULL, NULL, NULL),
('438d1858', 'Down Payment', '1', NULL, NULL, NULL),
('49a07646', 'Other', '1', NULL, NULL, NULL),
('a5cbf18f', 'Complimentary', '1', NULL, NULL, NULL),
('c2556c99', 'Debit Card', '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

DROP TABLE IF EXISTS `pos`;
CREATE TABLE `pos` (
  `id_pos` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_purchasing` varchar(30) DEFAULT NULL,
  `fk.id_table` varchar(30) DEFAULT NULL,
  `fk.id_table_before` varchar(30) DEFAULT NULL,
  `fk.id_on_order` varchar(30) DEFAULT NULL,
  `pic` varchar(50) DEFAULT '',
  `visitor_num` int(11) unsigned DEFAULT '1',
  `reason` varchar(20) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_purchasing` (`fk.id_purchasing`),
  KEY `fk.id_table` (`fk.id_table`),
  KEY `fk.id_table_before` (`fk.id_table_before`),
  KEY `fk.id_on_order` (`fk.id_on_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `pos`
--

TRUNCATE TABLE `pos`;
-- --------------------------------------------------------

--
-- Table structure for table `pos_bill`
--

DROP TABLE IF EXISTS `pos_bill`;
CREATE TABLE `pos_bill` (
  `id_pos_bill` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_member` varchar(30) DEFAULT NULL,
  `alternative` varchar(100) DEFAULT NULL,
  `tax_percent` double unsigned DEFAULT '10',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '5',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double DEFAULT '0',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pos_bill`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_member` (`fk.id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `pos_bill`
--

TRUNCATE TABLE `pos_bill`;
-- --------------------------------------------------------

--
-- Table structure for table `pos_bill_ex`
--

DROP TABLE IF EXISTS `pos_bill_ex`;
CREATE TABLE `pos_bill_ex` (
  `id_pos_bill_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_pos_bill` varchar(50) DEFAULT NULL,
  `fk.id_pos_ex` bigint(20) unsigned DEFAULT NULL,
  `fk.id_product_sale_price` int(11) unsigned DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned DEFAULT '0',
  `tax_percent` double unsigned DEFAULT '0',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '0',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double unsigned DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_bill_ex`),
  KEY `fk.id_pos_bill` (`fk.id_pos_bill`),
  KEY `fk.id_product_sale_price` (`fk.id_product_sale_price`),
  KEY `fk.id_pos_ex` (`fk.id_pos_ex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `pos_bill_ex`
--

TRUNCATE TABLE `pos_bill_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `pos_bill_pay`
--

DROP TABLE IF EXISTS `pos_bill_pay`;
CREATE TABLE `pos_bill_pay` (
  `id_pos_bill_pay` varchar(50) NOT NULL DEFAULT '' COMMENT 'MD5(LEFT(UUID(), 8))',
  `fk.id_pos_bill` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `change` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_bill_pay`),
  KEY `fk.id_pos_bill` (`fk.id_pos_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `pos_bill_pay`
--

TRUNCATE TABLE `pos_bill_pay`;
-- --------------------------------------------------------

--
-- Table structure for table `pos_bill_pay_ex`
--

DROP TABLE IF EXISTS `pos_bill_pay_ex`;
CREATE TABLE `pos_bill_pay_ex` (
  `id_pos_bill_pay_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_pos_bill_pay` varchar(50) DEFAULT NULL,
  `fk.id_payment_type` varchar(30) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `fk.id_bank` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_bill_pay_ex`),
  KEY `fk.id_pos_bill_pay` (`fk.id_pos_bill_pay`),
  KEY `fk.id_payment_type` (`fk.id_payment_type`),
  KEY `fk.id_bank` (`fk.id_bank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `pos_bill_pay_ex`
--

TRUNCATE TABLE `pos_bill_pay_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `pos_ex`
--

DROP TABLE IF EXISTS `pos_ex`;
CREATE TABLE `pos_ex` (
  `id_pos_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_pos` varchar(50) DEFAULT NULL,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `fk.id_product_sale_price` int(10) unsigned DEFAULT NULL,
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_ex`),
  KEY `id_parent` (`fk.id_pos`),
  KEY `fk.id_product` (`fk.id_product`),
  KEY `fk.id_product_sale_price` (`fk.id_product_sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `pos_ex`
--

TRUNCATE TABLE `pos_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `pos_return`
--

DROP TABLE IF EXISTS `pos_return`;
CREATE TABLE `pos_return` (
  `id_pos_return` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_return`),
  KEY `fk.id_internal` (`fk.id_internal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `pos_return`
--

TRUNCATE TABLE `pos_return`;
-- --------------------------------------------------------

--
-- Table structure for table `pos_return_ex`
--

DROP TABLE IF EXISTS `pos_return_ex`;
CREATE TABLE `pos_return_ex` (
  `id_pos_return_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_pos_return` varchar(50) DEFAULT NULL,
  `fk.id_pos_bill_ex` bigint(20) unsigned DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `tax_percent` double unsigned DEFAULT '0',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '0',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double unsigned DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_return_ex`),
  KEY `fk.id_pos_return` (`fk.id_pos_return`),
  KEY `fk.id_pos_bill_ex` (`fk.id_pos_bill_ex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `pos_return_ex`
--

TRUNCATE TABLE `pos_return_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id_product` varchar(30) NOT NULL,
  `fk.id_level` varchar(30) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(100) NOT NULL DEFAULT '',
  `recommend` enum('0','1') DEFAULT '0',
  `color` text,
  `picture` text,
  `min_stock` double DEFAULT NULL,
  `max_stock` double DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  `update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_product`),
  KEY `fk.id_level` (`fk.id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product`
--

TRUNCATE TABLE `product`;
--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `fk.id_level`, `datetime`, `name`, `recommend`, `color`, `picture`, `min_stock`, `max_stock`, `active`, `notes`, `update`) VALUES
('Produk001', '1a01fb2a', '2014-11-14 06:57:54', 'Minyak Jahe', '0', NULL, NULL, NULL, NULL, '1', '', '2014-12-13 23:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_ex`
--

DROP TABLE IF EXISTS `product_ex`;
CREATE TABLE `product_ex` (
  `id_product_ex` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `fk.id_product_changeof` varchar(30) DEFAULT NULL,
  `fk.id_product_component` varchar(30) DEFAULT NULL,
  `size` double DEFAULT '0',
  `qty` double unsigned NOT NULL DEFAULT '0',
  `fk.id_unit` varchar(30) DEFAULT NULL,
  `cost` double unsigned DEFAULT '0',
  `decrease_size` double DEFAULT '0',
  `decrease_price` double DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_ex`),
  KEY `fk.id_product` (`fk.id_product`),
  KEY `fk.id_product_changeof` (`fk.id_product_changeof`),
  KEY `fk.id_product_component` (`fk.id_product_component`),
  KEY `fk.id_unit` (`fk.id_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `product_ex`
--

TRUNCATE TABLE `product_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `product_process_cost`
--

DROP TABLE IF EXISTS `product_process_cost`;
CREATE TABLE `product_process_cost` (
  `id_product_process_cost` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` double NOT NULL DEFAULT '0',
  `value` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_process_cost`),
  KEY `fk.id_product` (`fk.id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `product_process_cost`
--

TRUNCATE TABLE `product_process_cost`;
-- --------------------------------------------------------

--
-- Table structure for table `product_purchase_price`
--

DROP TABLE IF EXISTS `product_purchase_price`;
CREATE TABLE `product_purchase_price` (
  `id_product_purchase_price` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` double NOT NULL DEFAULT '0',
  `value` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_purchase_price`),
  KEY `fk.id_product` (`fk.id_product`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `product_purchase_price`
--

TRUNCATE TABLE `product_purchase_price`;
--
-- Dumping data for table `product_purchase_price`
--

INSERT INTO `product_purchase_price` (`id_product_purchase_price`, `fk.id_product`, `datetime`, `qty`, `value`, `active`, `notes`) VALUES
(1, 'Produk001', '2014-12-13 23:57:53', 0, 80000, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_sale_price`
--

DROP TABLE IF EXISTS `product_sale_price`;
CREATE TABLE `product_sale_price` (
  `id_product_sale_price` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` double NOT NULL DEFAULT '1',
  `value` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_sale_price`),
  KEY `fk.id_product` (`fk.id_product`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `product_sale_price`
--

TRUNCATE TABLE `product_sale_price`;
--
-- Dumping data for table `product_sale_price`
--

INSERT INTO `product_sale_price` (`id_product_sale_price`, `fk.id_product`, `datetime`, `qty`, `value`, `active`, `notes`) VALUES
(1, 'Produk001', '2014-12-13 23:57:53', 1, 99000, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `id_purchase` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_purchasing` varchar(30) DEFAULT NULL,
  `fk.id_table` varchar(30) DEFAULT NULL,
  `fk.id_table_before` varchar(30) DEFAULT NULL,
  `fk.id_on_order` varchar(30) DEFAULT NULL,
  `pic` varchar(50) DEFAULT '',
  `visitor_num` int(11) unsigned DEFAULT '1',
  `reason` varchar(20) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_purchasing` (`fk.id_purchasing`),
  KEY `fk.id_table` (`fk.id_table`),
  KEY `fk.id_table_before` (`fk.id_table_before`),
  KEY `fk.id_on_order` (`fk.id_on_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `purchase`
--

TRUNCATE TABLE `purchase`;
-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill`
--

DROP TABLE IF EXISTS `purchase_bill`;
CREATE TABLE `purchase_bill` (
  `id_purchase_bill` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_supplier` varchar(30) DEFAULT NULL,
  `alternative` varchar(100) DEFAULT NULL,
  `tax_percent` double unsigned DEFAULT '10',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '0',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double DEFAULT '0',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_purchase_bill`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_member` (`fk.id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `purchase_bill`
--

TRUNCATE TABLE `purchase_bill`;
-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill_ex`
--

DROP TABLE IF EXISTS `purchase_bill_ex`;
CREATE TABLE `purchase_bill_ex` (
  `id_purchase_bill_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_purchase_bill` varchar(50) DEFAULT NULL,
  `fk.id_purchase_ex` bigint(20) unsigned DEFAULT NULL,
  `fk.id_product_purchase_price` int(11) unsigned DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned DEFAULT '0',
  `tax_percent` double unsigned DEFAULT '0',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '0',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double unsigned DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_bill_ex`),
  KEY `fk.id_purchase_bill` (`fk.id_purchase_bill`),
  KEY `fk.id_product_sale_price` (`fk.id_product_purchase_price`),
  KEY `fk.id_purchase_ex` (`fk.id_purchase_ex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `purchase_bill_ex`
--

TRUNCATE TABLE `purchase_bill_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill_pay`
--

DROP TABLE IF EXISTS `purchase_bill_pay`;
CREATE TABLE `purchase_bill_pay` (
  `id_purchase_bill_pay` varchar(50) NOT NULL DEFAULT '' COMMENT 'MD5(LEFT(UUID(), 8))',
  `fk.id_purchase_bill` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `change` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_bill_pay`),
  KEY `fk.id_purchase_bill` (`fk.id_purchase_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `purchase_bill_pay`
--

TRUNCATE TABLE `purchase_bill_pay`;
-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill_pay_ex`
--

DROP TABLE IF EXISTS `purchase_bill_pay_ex`;
CREATE TABLE `purchase_bill_pay_ex` (
  `id_purchase_bill_pay_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_purchase_bill_pay` varchar(50) DEFAULT NULL,
  `fk.id_payment_type` varchar(30) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `fk.id_bank` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_bill_pay_ex`),
  KEY `fk.id_purchase_bill_pay` (`fk.id_purchase_bill_pay`),
  KEY `fk.id_payment_type` (`fk.id_payment_type`),
  KEY `fk.id_bank` (`fk.id_bank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `purchase_bill_pay_ex`
--

TRUNCATE TABLE `purchase_bill_pay_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `purchase_ex`
--

DROP TABLE IF EXISTS `purchase_ex`;
CREATE TABLE `purchase_ex` (
  `id_purchase_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_purchase` varchar(50) DEFAULT NULL,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `fk.id_product_purchase_price` int(11) unsigned DEFAULT NULL,
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_ex`),
  KEY `id_parent` (`fk.id_purchase`),
  KEY `fk.id_product` (`fk.id_product`),
  KEY `fk.id_product_purchase_price` (`fk.id_product_purchase_price`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `purchase_ex`
--

TRUNCATE TABLE `purchase_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

DROP TABLE IF EXISTS `purchase_return`;
CREATE TABLE `purchase_return` (
  `id_purchase_return` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_return`),
  KEY `fk.id_internal` (`fk.id_internal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `purchase_return`
--

TRUNCATE TABLE `purchase_return`;
-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_ex`
--

DROP TABLE IF EXISTS `purchase_return_ex`;
CREATE TABLE `purchase_return_ex` (
  `id_purchase_return_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_purchase_return` varchar(50) DEFAULT NULL,
  `fk.id_purchase_bill_ex` bigint(20) unsigned DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `modifier` varchar(255) DEFAULT NULL,
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `tax_percent` double unsigned DEFAULT '0',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '0',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double unsigned DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_return_ex`),
  KEY `fk.id_purchase_return` (`fk.id_purchase_return`),
  KEY `fk.id_purchase_bill_ex` (`fk.id_purchase_bill_ex`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `purchase_return_ex`
--

TRUNCATE TABLE `purchase_return_ex`;
-- --------------------------------------------------------

--
-- Table structure for table `purchasing`
--

DROP TABLE IF EXISTS `purchasing`;
CREATE TABLE `purchasing` (
  `id_purchasing` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_purchasing`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Truncate table before insert `purchasing`
--

TRUNCATE TABLE `purchasing`;
--
-- Dumping data for table `purchasing`
--

INSERT INTO `purchasing` (`id_purchasing`, `name`, `active`, `notes`) VALUES
('6fff0547', 'Delivery', '1', ''),
('d0d29eb4', 'Take Away', '1', ''),
('df71d549', 'Rent', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship` (
  `id_relationship` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_relationship`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `relationship`
--

TRUNCATE TABLE `relationship`;
-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
CREATE TABLE `religion` (
  `id_religion` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_religion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `religion`
--

TRUNCATE TABLE `religion`;
-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id_room` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_room`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `room`
--

TRUNCATE TABLE `room`;
-- --------------------------------------------------------

--
-- Table structure for table `social`
--

DROP TABLE IF EXISTS `social`;
CREATE TABLE `social` (
  `id_social` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_social`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `social`
--

TRUNCATE TABLE `social`;
--
-- Dumping data for table `social`
--

INSERT INTO `social` (`id_social`, `name`, `active`, `notes`) VALUES
('05916d8b', 'Facebook', '1', 'FB'),
('4e16aa60', 'Yahoo Messager', '1', 'YM'),
('5a31b346', 'Email', '1', 'EM'),
('5f6a78ae', 'Car Driven License', '1', 'CDL'),
('7566de75', 'Fax', '1', 'FAX'),
('82837cce', 'Black Berry Messager', '1', 'BBM'),
('c7e8cec8', 'Phone', '1', 'PH'),
('d530213f', 'Google+', '1', 'GPL'),
('e235e339', 'Passport', '1', 'PS'),
('e8e69da6', 'National Identity', '1', 'NI'),
('f8c1024e', 'Linked in', '1', 'LIN');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id_state` varchar(30) NOT NULL DEFAULT '',
  `fk.id_country` varchar(30) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('autonomous province','province','special district','special region') DEFAULT 'province',
  `geo_code` varchar(30) DEFAULT NULL,
  `geo_unit` varchar(2) DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_state`),
  KEY `fk.id_country` (`fk.id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `state`
--

TRUNCATE TABLE `state`;
--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id_state`, `fk.id_country`, `name`, `type`, `geo_code`, `geo_unit`, `active`, `notes`) VALUES
('003c1ec9', '0dc2754b', 'Gorontalo', 'province', 'ID-GO', 'SL', '1', ''),
('0267667a', '0dc2754b', 'Bengkulu', 'province', 'ID-BE', 'SM', '1', ''),
('04e00bf8', '0dc2754b', 'Jakarta Raya', 'special district', 'ID-JK', 'JW', '1', ''),
('06900688', '0dc2754b', 'Sulawesi Tenggara', 'province', 'ID-SG', 'SL', '1', ''),
('0ee2d159', '0dc2754b', 'Sulawesi Utara', 'province', 'ID-SA', 'SL', '1', ''),
('133dc4b4', '0dc2754b', 'Papua', 'province', 'ID-PA', 'IJ', '1', ''),
('17c51680', '0dc2754b', 'Sumatera Utara', 'province', 'ID-SU', 'SM', '1', ''),
('198fdd85', '0dc2754b', 'Sulawesi Tengah', 'province', 'ID-ST', 'SL', '1', ''),
('1b73af98', '0dc2754b', 'Sulawesi Barat', 'province', 'ID-SR', 'SL', '1', ''),
('2041084a', '0dc2754b', 'Riau', 'province', 'ID-RI', 'SM', '1', ''),
('253841c9', '0dc2754b', 'Yogyakarta', 'special region', 'ID-YO', 'JW', '1', ''),
('37b6c53a', '0dc2754b', 'Kepulauan Riau', 'province', 'ID-KR', 'SM', '1', ''),
('42f23102', '0dc2754b', 'Kalimantan Barat', 'province', 'ID-KB', 'KA', '1', ''),
('43642366', '0dc2754b', 'Banten', 'province', 'ID-BT', 'JW', '1', ''),
('45df820e', '0dc2754b', 'Kalimantan Selatan', 'province', 'ID-KS', 'KA', '1', ''),
('47ce163d', '0dc2754b', 'Jawa Timur', 'province', 'ID-JI', 'JW', '1', ''),
('53584149', '0dc2754b', 'Kalimantan Timur', 'province', 'ID-KI', 'KA', '1', ''),
('5bd5a405', '0dc2754b', 'Aceh', 'autonomous province', 'ID-AC', 'SM', '1', ''),
('655ce4ed', '0dc2754b', 'Jawa Barat', 'province', 'ID-JB', 'JW', '1', ''),
('6a132fde', '0dc2754b', 'Sulawesi Selatan', 'province', 'ID-SN', 'SL', '1', ''),
('6c009956', '0dc2754b', 'Nusa Tenggara Barat', 'province', 'ID-NB', 'NU', '1', ''),
('9308f6d2', '0dc2754b', 'Bangka Belitung', 'province', 'ID-BB', 'SM', '1', ''),
('aa1d46a0', '0dc2754b', 'Jawa Tengah', 'province', 'ID-JT', 'JW', '1', ''),
('ae63ba92', '0dc2754b', 'Kalimantan Tengah', 'province', 'ID-KT', 'KA', '1', ''),
('b2d3c1a8', '0dc2754b', 'Sumatera Barat', 'province', 'ID-SB', 'SM', '1', ''),
('b73f309e', '0dc2754b', 'Maluku Utara', 'province', 'ID-MU', 'ML', '1', ''),
('b8ecae48', '0dc2754b', 'Jambi', 'province', 'ID-JA', 'SM', '1', ''),
('c24548e6', '0dc2754b', 'Papua Barat', 'province', 'ID-PB', 'IJ', '1', ''),
('d87534a2', '0dc2754b', 'Nusa Tenggara Timur', 'province', 'ID-NT', 'NU', '1', ''),
('ded0f8ed', '0dc2754b', 'Sumatera Selatan', 'province', 'ID-SS', 'SM', '1', ''),
('fac1cda0', '0dc2754b', 'Maluku', 'province', 'ID-MA', 'ML', '1', ''),
('fb31b68e', '0dc2754b', 'Lampung', 'province', 'ID-LA', 'SM', '1', ''),
('fd49b6c7', '0dc2754b', 'Bali', 'province', 'ID-BA', 'NU', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id_supplier` varchar(30) NOT NULL DEFAULT '',
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_branch` varchar(30) DEFAULT NULL,
  `fk.id_supplier_group` varchar(30) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restricted` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`),
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_branch` (`fk.id_branch`),
  KEY `fk.id_supplier_group` (`fk.id_supplier_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `supplier`
--

TRUNCATE TABLE `supplier`;
--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `fk.id_contact`, `fk.id_branch`, `fk.id_supplier_group`, `registered`, `restricted`, `active`, `notes`) VALUES
('supplier001', 'contact002', 'branch001', 'suppliergroup001', '2014-11-15 15:04:38', NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_group`
--

DROP TABLE IF EXISTS `supplier_group`;
CREATE TABLE `supplier_group` (
  `id_supplier_group` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_supplier_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `supplier_group`
--

TRUNCATE TABLE `supplier_group`;
--
-- Dumping data for table `supplier_group`
--

INSERT INTO `supplier_group` (`id_supplier_group`, `name`, `active`, `notes`) VALUES
('suppliergroup001', 'Supplier', '1', ''),
('suppliergroup002', 'Grosir', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_module`
--

DROP TABLE IF EXISTS `supplier_module`;
CREATE TABLE `supplier_module` (
  `id_supplier_module` varchar(30) NOT NULL DEFAULT '',
  `fk.id_supplier_module` varchar(30) DEFAULT NULL,
  `fk.id_supplier_group` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `handler` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_supplier_module`),
  KEY `fk.id_supplier_group` (`fk.id_supplier_group`),
  KEY `fk.id_supplier_module` (`fk.id_supplier_module`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `supplier_module`
--

TRUNCATE TABLE `supplier_module`;
--
-- Dumping data for table `supplier_module`
--

INSERT INTO `supplier_module` (`id_supplier_module`, `fk.id_supplier_module`, `fk.id_supplier_group`, `name`, `handler`, `icon`, `order`, `active`, `notes`) VALUES
('sm0000', NULL, 'suppliergroup001', 'Master', '', NULL, NULL, '1', ''),
('sm0001', 'sm0000', 'suppliergroup001', 'Penawaran Barang', 'supplier-penawaranbarang', NULL, NULL, '1', ''),
('sm0002', 'sm0000', 'suppliergroup002', 'Penagihan Piutang', 'supplier-penagihanpiutang', NULL, NULL, '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `id_table` varchar(30) NOT NULL DEFAULT '',
  `fk.id_room` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `capacity` int(11) unsigned DEFAULT '1',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_table`),
  KEY `fk.id_room` (`fk.id_room`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `table`
--

TRUNCATE TABLE `table`;
-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `id_unit` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `unit`
--

TRUNCATE TABLE `unit`;
--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id_unit`, `name`, `active`, `notes`) VALUES
('bag', 'Bag', '1', ''),
('ball', 'Ball', '1', ''),
('bks', 'Bungkus', '1', ''),
('box', 'Box', '1', ''),
('btk', 'Botol', '1', ''),
('btl(295ml)', 'Botol(295ml)', '1', ''),
('btl(330ml)', 'Botol(330ml)', '1', ''),
('buah', 'Buah', '1', ''),
('can', 'Can', '1', ''),
('ekr', 'Ekor', '1', ''),
('gln', 'Galon', '1', ''),
('gr', 'Gram', '1', ''),
('ikat', 'Ikat', '1', ''),
('kg', 'Killogram', '1', ''),
('lmr', 'Lembar', '1', ''),
('ltr', 'Liter', '1', ''),
('ml', 'Mililiter', '1', ''),
('pack', 'Pack', '1', ''),
('pcs', 'Pcs', '1', ''),
('pet', 'Pet', '1', ''),
('porsi', 'Porsi', '1', ''),
('potong', 'Potong', '1', ''),
('ppn', 'Papan', '1', ''),
('scp', 'Scoope', '1', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_outlet`
--
DROP VIEW IF EXISTS `view_outlet`;
CREATE TABLE `view_outlet` (
`id` varchar(30)
,`nama_outlet` varchar(20)
,`notes` varchar(100)
,`active` enum('0','1')
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_supplier`
--
DROP VIEW IF EXISTS `view_supplier`;
CREATE TABLE `view_supplier` (
`id_supplier` varchar(30)
,`first_name` varchar(20)
,`fk.id_branch` varchar(30)
,`name` varchar(30)
,`notes` varchar(100)
,`active` enum('0','1')
);
-- --------------------------------------------------------

--
-- Table structure for table `_`
--

DROP TABLE IF EXISTS `_`;
CREATE TABLE `_` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `query` text,
  `active` enum('0','1') DEFAULT '0' COMMENT 'Leave it ''0'' for safety',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `_`
--

TRUNCATE TABLE `_`;
--
-- Dumping data for table `_`
--

INSERT INTO `_` (`id`, `query`, `active`, `notes`) VALUES
('get_price_id', 'select * from product_sale_price where `fk.id_product` = $id_product AND value = $value', '0', 'buat cek id harga'),
('harga', 'SELECT\n    a.id_product, a.name, b.name AS ''type'',\n    c.value AS "product_purchase_price", c.`id_product_purchase_price` AS ''id_product_purchase_price'',\n    d.value AS "product_sale_price", d.`id_product_sale_price` AS ''id_product_sale_price''\nFROM product AS a\rJOIN `level` AS b ON a.`fk.id_level` = b.`id_level`\rLEFT JOIN (\r    SELECT * FROM (\r        SELECT * FROM product_purchase_price WHERE active = ''1'' ORDER BY `datetime` DESC, `value` DESC\r    ) AS x GROUP BY `fk.id_product`\r) AS c ON a.`id_product` = c.`fk.id_product`\nLEFT JOIN (\r    SELECT * FROM (\r        SELECT * FROM product_sale_price WHERE active = ''1'' ORDER BY `datetime` DESC, `value` DESC\r    ) AS y GROUP BY `fk.id_product`\r) AS d ON a.`id_product` = d.`fk.id_product`\nWHERE a.`active` = ''1''\nORDER BY `type`, b.`name`;', '0', 'harga jual & harga beli'),
('purchase', 'SELECT DISTINCT(X.`fk.id_purchase`) AS ''id_purchase'' FROM (\n    SELECT\n        purchase_ex.`id_purchase_ex`, purchase_ex.`datetime`, purchase_ex.`fk.id_purchase`, purchase_ex.`fk.id_product`,\n        purchase_ex.`modifier`,\n        IF(ISNULL(purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`), purchase_ex.`qty`, (purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`))  AS ''qty'',\n        IF(ISNULL(purchase_bill_ex_.`sum_qty`), 0, purchase_bill_ex_.`sum_qty`)  AS ''sum_qty'',\n        purchase_ex.`fk.id_product_purchase_price`, purchase_ex.`discount`, purchase_ex.`void`, purchase_ex.`complimentary`, purchase_ex.`active`, purchase_ex.`notes`,\n        product.name AS ''name_product'', product_purchase_price.`value`AS ''harga_beli''\n    FROM purchase_ex\n    LEFT JOIN product ON purchase_ex.`fk.id_product` = product.`id_product`\n    LEFT JOIN product_purchase_price ON purchase_ex.`fk.id_product_purchase_price` = product_purchase_price.`id_product_purchase_price`\n    LEFT JOIN (SELECT *, sum(`qty`) AS ''sum_qty'' FROM purchase_bill_ex WHERE `active` = ''1'' GROUP BY `fk.id_purchase_ex`, `fk.id_product_purchase_price`) AS purchase_bill_ex_\n        ON purchase_ex.`id_purchase_ex` = purchase_bill_ex_.`fk.id_purchase_ex`\n    WHERE purchase_ex.`active` = ''1''\n) AS X JOIN purchase ON purchase.`id_purchase` = X.`fk.id_purchase` WHERE purchase.`pic` = $id_supplier AND X.`qty` > 0 ORDER BY X.`fk.id_purchase`;', '0', 'clean join with product & product_purchase_price'),
('purchase_bill', 'SELECT DISTINCT(X.`fk.id_purchase_bill`) FROM (\n    SELECT\n        SUM(`qty`) AS qty, IF(isNULL(pR.`sum_qty`), 0, pR.`sum_qty`) AS qty_,\n        IF(isNULL(SUM(`qty`) - IF(isNULL(pR.`sum_qty`), 0, pR.`sum_qty`)), 0, (SUM(`qty`) - IF(isNULL(pR.`sum_qty`), 0, pR.`sum_qty`))) AS available,\n        pBX.`id_purchase_bill_ex`, pBX.`fk.id_purchase_bill`, pBX.`fk.id_purchase_ex`, pBX.`fk.id_product_purchase_price`, pBX.`complimentary`, pBX.`tax_percent`, pBX.`tax_amount`, pBX.`service_percent`, pBX.`service_amount`,\n        pBX.`discount_percent`, pBX.`discount_amount`, pBX.`active`, pBX.`notes`, pBX.`update`\n    FROM\n        purchase_bill_ex AS pBX\n    LEFT JOIN (\n        SELECT\n            pRX.`fk.id_purchase_bill_ex`, SUM(pRX.qty) AS sum_qty\n        FROM\n            purchase_return_ex AS pRX\n        JOIN\n            purchase_return AS pR ON pR.`id_purchase_return` = pRX.`fk.id_purchase_return`\n        WHERE\n            pR.`active`=''1'' AND pRX.`active` = ''1''\n        GROUP BY\n            pRX.`fk.id_purchase_bill_ex`\n        ORDER BY\n            pRX.`fk.id_purchase_return`, pRX.`fk.id_purchase_bill_ex`\n    ) AS pR ON pR.`fk.id_purchase_bill_ex` = pBX.`id_purchase_bill_ex`\n    WHERE\n        pBX.`active` = ''1''\n    GROUP BY\n        pBX.`fk.id_purchase_bill`, pBX.`fk.id_product_purchase_price`\n    ORDER BY\n        pBX.`fk.id_purchase_bill`, pBX.`id_purchase_bill_ex`\n) AS X WHERE X.available > 0;', '0', NULL),
('purchase_bill_ex', 'SELECT Z.`name` AS name_product, Z.`id_product`, Y.`value` AS harga_beli, X.*\nFROM (\n    SELECT\n        SUM(`qty`) AS qty, IF(isNULL(pR.`sum_qty`), 0, pR.`sum_qty`) AS qty_,\n        IF(isNULL(SUM(`qty`) - IF(isNULL(pR.`sum_qty`), 0, pR.`sum_qty`)), 0, (SUM(`qty`) - IF(isNULL(pR.`sum_qty`), 0, pR.`sum_qty`))) AS available,\n        pBX.`id_purchase_bill_ex`, pBX.`fk.id_purchase_bill`, pBX.`fk.id_purchase_ex`, pBX.`fk.id_product_purchase_price`, pBX.`complimentary`, pBX.`tax_percent`, pBX.`tax_amount`, pBX.`service_percent`, pBX.`service_amount`,\n        pBX.`discount_percent`, pBX.`discount_amount`, pBX.`active`, pBX.`notes`, pBX.`update`\n    FROM\n        purchase_bill_ex AS pBX\n    LEFT JOIN (\n        SELECT\n            pRX.`fk.id_purchase_bill_ex`, SUM(pRX.qty) AS sum_qty\n        FROM\n            purchase_return_ex AS pRX\n        JOIN\n            purchase_return AS pR ON pR.`id_purchase_return` = pRX.`fk.id_purchase_return`\n        WHERE\n            pR.`active`=''1'' AND pRX.`active` = ''1''\n        GROUP BY\n            pRX.`fk.id_purchase_bill_ex`\n        ORDER BY\n            pRX.`fk.id_purchase_return`, pRX.`fk.id_purchase_bill_ex`\n    ) AS pR ON pR.`fk.id_purchase_bill_ex` = pBX.`id_purchase_bill_ex`\n    WHERE\n        pBX.`active` = ''1''\n    GROUP BY\n        pBX.`fk.id_purchase_bill`, pBX.`fk.id_product_purchase_price`\n    ORDER BY\n        pBX.`fk.id_purchase_bill`, pBX.`id_purchase_bill_ex`\n) AS X\nJOIN `product_purchase_price` AS Y ON Y.`id_product_purchase_price` = X.`fk.id_product_purchase_price`\nJOIN `product` AS Z ON Z.`id_product` = Y.`fk.id_product`\nWHERE X.available > 0 AND X.`fk.id_purchase_bill` = $id_purchase_bill;', '0', NULL),
('purchase_ex', 'SELECT X.* FROM (\n    SELECT\n        purchase_ex.`id_purchase_ex`, purchase_ex.`datetime`, purchase_ex.`fk.id_purchase`, purchase_ex.`fk.id_product`,\n        purchase_ex.`modifier`,\n        IF(ISNULL(purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`), purchase_ex.`qty`, (purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`))  AS ''qty'',\n        IF(ISNULL(purchase_bill_ex_.`sum_qty`), 0, purchase_bill_ex_.`sum_qty`)  AS ''sum_qty'',\n        purchase_ex.`fk.id_product_purchase_price`, purchase_ex.`discount`, purchase_ex.`void`, purchase_ex.`complimentary`, purchase_ex.`active`, purchase_ex.`notes`,\n        product.name AS ''name_product'', product_purchase_price.`value`AS ''harga_beli''\n    FROM purchase_ex\n    LEFT JOIN product ON purchase_ex.`fk.id_product` = product.`id_product`\n    LEFT JOIN product_purchase_price ON purchase_ex.`fk.id_product_purchase_price` = product_purchase_price.`id_product_purchase_price`\n    LEFT JOIN (SELECT *, sum(`qty`) AS ''sum_qty'' FROM purchase_bill_ex WHERE `active` = ''1'' GROUP BY `fk.id_purchase_ex`, `fk.id_product_purchase_price`) AS purchase_bill_ex_\n        ON purchase_ex.`id_purchase_ex` = purchase_bill_ex_.`fk.id_purchase_ex`\n    WHERE purchase_ex.`fk.id_purchase` = $id_purchase AND purchase_ex.`active` = ''1'' AND !isNULL(purchase_ex.`fk.id_purchase`)\n) AS X WHERE X.`qty` > 0 ORDER BY X.`fk.id_purchase`;', '0', 'join with product & product_purchase_price'),
('stock', 'SELECT \n    ppp.`fk.id_product` AS `code`, p.name, pb.ippp, ppp.value,\n    SUM(pb.qty) AS qty_p, SUM(IF(ISNULL(pr.qty), 0, pr.qty)) AS qty_r,\n    SUM(pb.qty - IF(ISNULL(pr.qty), 0, pr.qty)) AS qty,\n    pb.ipx, pb.ipb, DATE(pb.datetime) AS ipb_date, pb.ipbx, pr.ipr, DATE(pr.datetime) AS ipr_date\nFROM (\n    SELECT\n        pb.`datetime`, pbx.`fk.id_purchase_ex` AS ipx, pb.`id_purchase_bill` AS ipb,\n        pbx.`id_purchase_bill_ex` AS ipbx, pbx.`fk.id_product_purchase_price` AS ippp, pbx.`qty`\n    FROM purchase_bill AS pb\n    JOIN purchase_bill_ex pbx ON pb.`id_purchase_bill` = pbx.`fk.id_purchase_bill`\n    WHERE pb.`active`=''1'' AND pbx.`active` = ''1''\n) AS pb\nLEFT JOIN (\n    SELECT\n        pr.`DATETIME`, prx.`fk.id_purchase_bill_ex` AS ipbx, pr.`id_purchase_return` AS ipr,\n        prx.`id_purchase_return_ex` AS iprx, SUM(prx.`qty`) AS `qty`\n    FROM purchase_return AS pr\n    JOIN purchase_return_ex AS prx ON pr.`id_purchase_return` = prx.`fk.id_purchase_return`\n    WHERE pr.`active`=''1'' AND prx.`active` = ''1''\n    GROUP BY ipbx\n) AS pr ON pr.ipbx = pb.ipbx\nJOIN product_purchase_price AS ppp ON ppp.`id_product_purchase_price` = pb.ippp\nJOIN product AS p ON p.`id_product` = ppp.`fk.id_product`\nWHERE pb.datetime >= $start\nGROUP BY pb.ippp;', '0', NULL),
('supplier', 'SELECT\n    supplier.`id_supplier`, supplier_group.`id_supplier_group`, supplier_group.`name` AS ''name_supplier_group'',\n    branch.`id_branch`, branch.`name` AS ''name_branch'',\n    contact.`id_contact`, contact.`user_name`, contact.`first_name`, contact.`last_name`, contact.`alias` AS ''alias'', contact_addr.`address`, city.`name` AS ''city''\nFROM supplier\nLEFT JOIN contact ON supplier.`fk.id_contact` = contact.`id_contact`\nLEFT JOIN contact_addr ON contact.`id_contact` = contact_addr.`fk.id_contact`\nLEFT JOIN city ON contact_addr.`fk.id_city` = city.`id_city`\nLEFT JOIN supplier_group ON supplier_group.`id_supplier_group` = supplier.`fk.id_supplier_group`\nLEFT JOIN branch ON branch.`id_branch` = supplier.`fk.id_branch`\nWHERE supplier.`active` = ''1'' AND supplier_group.`active` = ''1'' AND branch.`active` = ''1'' AND contact_addr.`active` = ''1'';', '0', NULL),
('_', 'SELECT * FROM product WHERE id_product LIKE concat(''%'', $id_product, ''%'');', '0', NULL);

-- --------------------------------------------------------

--
-- Structure for view `internal_karyawan`
--
DROP TABLE IF EXISTS `internal_karyawan`;

CREATE VIEW `internal_karyawan` AS select `a`.`id_internal` AS `id`,`b`.`first_name` AS `nama_depan`,`b`.`last_name` AS `nama_belakang`,`c`.`name` AS `cabang`,`d`.`name` AS `grup`,`a`.`active` AS `active` from (((`contact` `b` left join `internal` `a` on((`a`.`fk.id_contact` = `b`.`id_contact`))) left join `branch` `c` on((`a`.`fk.id_branch` = `c`.`id_branch`))) left join `internal_group` `d` on((`a`.`fk.id_internal_group` = `d`.`id_internal_group`)));

-- --------------------------------------------------------

--
-- Structure for view `view_outlet`
--
DROP TABLE IF EXISTS `view_outlet`;

CREATE VIEW `view_outlet` AS select `a`.`id_member` AS `id`,`b`.`first_name` AS `nama_outlet`,`a`.`notes` AS `notes`,`a`.`active` AS `active` from (`member` `a` join `contact` `b` on((`a`.`fk.id_contact` = `b`.`id_contact`))) where (`a`.`fk.id_member_group` = 'outlet');

-- --------------------------------------------------------

--
-- Structure for view `view_supplier`
--
DROP TABLE IF EXISTS `view_supplier`;

CREATE VIEW `view_supplier` AS select `a`.`id_supplier` AS `id_supplier`,`b`.`first_name` AS `first_name`,`a`.`fk.id_branch` AS `fk.id_branch`,`c`.`name` AS `name`,`a`.`notes` AS `notes`,`a`.`active` AS `active` from ((`supplier` `a` join `contact` `b` on((`a`.`fk.id_contact` = `b`.`id_contact`))) join `supplier_group` `c` on((`a`.`fk.id_supplier_group` = `c`.`id_supplier_group`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`fk.id_city_official`) REFERENCES `city` (`id_city`) ON UPDATE CASCADE;

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`fk.id_company`) REFERENCES `company` (`id_company`) ON UPDATE CASCADE;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`fk.id_state`) REFERENCES `state` (`id_state`) ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`fk.id_religion`) REFERENCES `religion` (`id_religion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`fk.id_relationship`) REFERENCES `relationship` (`id_relationship`) ON UPDATE CASCADE;

--
-- Constraints for table `contact_addr`
--
ALTER TABLE `contact_addr`
  ADD CONSTRAINT `contact_addr_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_addr_ibfk_2` FOREIGN KEY (`fk.id_city`) REFERENCES `city` (`id_city`) ON UPDATE CASCADE;

--
-- Constraints for table `contact_ex`
--
ALTER TABLE `contact_ex`
  ADD CONSTRAINT `contact_ex_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_ex_ibfk_2` FOREIGN KEY (`fk.id_social`) REFERENCES `social` (`id_social`) ON UPDATE CASCADE;

--
-- Constraints for table `contact_log`
--
ALTER TABLE `contact_log`
  ADD CONSTRAINT `contact_log_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE;

--
-- Constraints for table `internal`
--
ALTER TABLE `internal`
  ADD CONSTRAINT `internal_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  ADD CONSTRAINT `internal_ibfk_2` FOREIGN KEY (`fk.id_branch`) REFERENCES `branch` (`id_branch`) ON UPDATE CASCADE,
  ADD CONSTRAINT `internal_ibfk_3` FOREIGN KEY (`fk.id_internal_group`) REFERENCES `internal_group` (`id_internal_group`) ON UPDATE CASCADE;

--
-- Constraints for table `internal_module`
--
ALTER TABLE `internal_module`
  ADD CONSTRAINT `internal_module_ibfk_2` FOREIGN KEY (`fk.id_internal_group`) REFERENCES `internal_group` (`id_internal_group`) ON UPDATE CASCADE,
  ADD CONSTRAINT `internal_module_ibfk_3` FOREIGN KEY (`fk.id_internal_module`) REFERENCES `internal_module` (`id_internal_module`) ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`fk.id_branch`) REFERENCES `branch` (`id_branch`) ON UPDATE CASCADE,
  ADD CONSTRAINT `member_ibfk_3` FOREIGN KEY (`fk.id_member_group`) REFERENCES `member_group` (`id_member_group`) ON UPDATE CASCADE;

--
-- Constraints for table `member_module`
--
ALTER TABLE `member_module`
  ADD CONSTRAINT `member_module_ibfk_2` FOREIGN KEY (`fk.id_member_group`) REFERENCES `member_group` (`id_member_group`) ON UPDATE CASCADE,
  ADD CONSTRAINT `member_module_ibfk_3` FOREIGN KEY (`fk.id_member_module`) REFERENCES `member_module` (`id_member_module`) ON UPDATE CASCADE;

--
-- Constraints for table `pos`
--
ALTER TABLE `pos`
  ADD CONSTRAINT `pos_ibfk_2` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_ibfk_3` FOREIGN KEY (`fk.id_purchasing`) REFERENCES `purchasing` (`id_purchasing`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_ibfk_4` FOREIGN KEY (`fk.id_table`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_ibfk_5` FOREIGN KEY (`fk.id_table_before`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_ibfk_6` FOREIGN KEY (`fk.id_on_order`) REFERENCES `on_order` (`id_on_order`) ON UPDATE CASCADE;

--
-- Constraints for table `pos_bill`
--
ALTER TABLE `pos_bill`
  ADD CONSTRAINT `pos_bill_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_bill_ibfk_2` FOREIGN KEY (`fk.id_member`) REFERENCES `member` (`id_member`) ON UPDATE CASCADE;

--
-- Constraints for table `pos_bill_ex`
--
ALTER TABLE `pos_bill_ex`
  ADD CONSTRAINT `pos_bill_ex_ibfk_1` FOREIGN KEY (`fk.id_pos_bill`) REFERENCES `pos_bill` (`id_pos_bill`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_bill_ex_ibfk_3` FOREIGN KEY (`fk.id_product_sale_price`) REFERENCES `product_sale_price` (`id_product_sale_price`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_bill_ex_ibfk_4` FOREIGN KEY (`fk.id_pos_ex`) REFERENCES `pos_ex` (`id_pos_ex`) ON UPDATE CASCADE;

--
-- Constraints for table `pos_bill_pay`
--
ALTER TABLE `pos_bill_pay`
  ADD CONSTRAINT `pos_bill_pay_ibfk_1` FOREIGN KEY (`fk.id_pos_bill`) REFERENCES `pos_bill` (`id_pos_bill`) ON UPDATE CASCADE;

--
-- Constraints for table `pos_bill_pay_ex`
--
ALTER TABLE `pos_bill_pay_ex`
  ADD CONSTRAINT `pos_bill_pay_ex_ibfk_1` FOREIGN KEY (`fk.id_pos_bill_pay`) REFERENCES `pos_bill_pay` (`id_pos_bill_pay`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_bill_pay_ex_ibfk_2` FOREIGN KEY (`fk.id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_bill_pay_ex_ibfk_3` FOREIGN KEY (`fk.id_bank`) REFERENCES `bank` (`id_bank`) ON UPDATE CASCADE;

--
-- Constraints for table `pos_ex`
--
ALTER TABLE `pos_ex`
  ADD CONSTRAINT `pos_ex_ibfk_1` FOREIGN KEY (`fk.id_pos`) REFERENCES `pos` (`id_pos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_ex_ibfk_2` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_ex_ibfk_3` FOREIGN KEY (`fk.id_product_sale_price`) REFERENCES `product_sale_price` (`id_product_sale_price`) ON UPDATE CASCADE;

--
-- Constraints for table `pos_return`
--
ALTER TABLE `pos_return`
  ADD CONSTRAINT `pos_return_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE;

--
-- Constraints for table `pos_return_ex`
--
ALTER TABLE `pos_return_ex`
  ADD CONSTRAINT `pos_return_ex_ibfk_1` FOREIGN KEY (`fk.id_pos_return`) REFERENCES `pos_return` (`id_pos_return`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pos_return_ex_ibfk_2` FOREIGN KEY (`fk.id_pos_bill_ex`) REFERENCES `pos_bill_ex` (`id_pos_bill_ex`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk.id_level`) REFERENCES `level` (`id_level`) ON UPDATE CASCADE;

--
-- Constraints for table `product_ex`
--
ALTER TABLE `product_ex`
  ADD CONSTRAINT `product_ex_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ex_ibfk_2` FOREIGN KEY (`fk.id_product_changeof`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ex_ibfk_3` FOREIGN KEY (`fk.id_product_component`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ex_ibfk_4` FOREIGN KEY (`fk.id_unit`) REFERENCES `unit` (`id_unit`) ON UPDATE CASCADE;

--
-- Constraints for table `product_process_cost`
--
ALTER TABLE `product_process_cost`
  ADD CONSTRAINT `product_process_cost_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE;

--
-- Constraints for table `product_purchase_price`
--
ALTER TABLE `product_purchase_price`
  ADD CONSTRAINT `product_purchase_price_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE;

--
-- Constraints for table `product_sale_price`
--
ALTER TABLE `product_sale_price`
  ADD CONSTRAINT `product_sale_price_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`fk.id_purchasing`) REFERENCES `purchasing` (`id_purchasing`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_4` FOREIGN KEY (`fk.id_table`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_5` FOREIGN KEY (`fk.id_table_before`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_6` FOREIGN KEY (`fk.id_on_order`) REFERENCES `on_order` (`id_on_order`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD CONSTRAINT `purchase_bill_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_bill_ibfk_2` FOREIGN KEY (`fk.id_supplier`) REFERENCES `supplier` (`id_supplier`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_bill_ex`
--
ALTER TABLE `purchase_bill_ex`
  ADD CONSTRAINT `purchase_bill_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase_bill`) REFERENCES `purchase_bill` (`id_purchase_bill`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_bill_ex_ibfk_4` FOREIGN KEY (`fk.id_purchase_ex`) REFERENCES `purchase_ex` (`id_purchase_ex`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_bill_ex_ibfk_5` FOREIGN KEY (`fk.id_product_purchase_price`) REFERENCES `product_purchase_price` (`id_product_purchase_price`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_bill_pay`
--
ALTER TABLE `purchase_bill_pay`
  ADD CONSTRAINT `purchase_bill_pay_ibfk_1` FOREIGN KEY (`fk.id_purchase_bill`) REFERENCES `purchase_bill` (`id_purchase_bill`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_bill_pay_ex`
--
ALTER TABLE `purchase_bill_pay_ex`
  ADD CONSTRAINT `purchase_bill_pay_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase_bill_pay`) REFERENCES `purchase_bill_pay` (`id_purchase_bill_pay`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_bill_pay_ex_ibfk_2` FOREIGN KEY (`fk.id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_bill_pay_ex_ibfk_3` FOREIGN KEY (`fk.id_bank`) REFERENCES `bank` (`id_bank`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_ex`
--
ALTER TABLE `purchase_ex`
  ADD CONSTRAINT `purchase_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase`) REFERENCES `purchase` (`id_purchase`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ex_ibfk_2` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ex_ibfk_3` FOREIGN KEY (`fk.id_product_purchase_price`) REFERENCES `product_purchase_price` (`id_product_purchase_price`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD CONSTRAINT `purchase_return_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_return_ex`
--
ALTER TABLE `purchase_return_ex`
  ADD CONSTRAINT `purchase_return_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase_return`) REFERENCES `purchase_return` (`id_purchase_return`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_ex_ibfk_2` FOREIGN KEY (`fk.id_purchase_bill_ex`) REFERENCES `purchase_bill_ex` (`id_purchase_bill_ex`) ON UPDATE CASCADE;

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`fk.id_country`) REFERENCES `country` (`id_country`) ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`fk.id_branch`) REFERENCES `branch` (`id_branch`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_ibfk_3` FOREIGN KEY (`fk.id_supplier_group`) REFERENCES `supplier_group` (`id_supplier_group`) ON UPDATE CASCADE;

--
-- Constraints for table `supplier_module`
--
ALTER TABLE `supplier_module`
  ADD CONSTRAINT `supplier_module_ibfk_2` FOREIGN KEY (`fk.id_supplier_group`) REFERENCES `supplier_group` (`id_supplier_group`) ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_module_ibfk_3` FOREIGN KEY (`fk.id_supplier_module`) REFERENCES `supplier_module` (`id_supplier_module`) ON UPDATE CASCADE;

--
-- Constraints for table `table`
--
ALTER TABLE `table`
  ADD CONSTRAINT `table_ibfk_1` FOREIGN KEY (`fk.id_room`) REFERENCES `room` (`id_room`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;