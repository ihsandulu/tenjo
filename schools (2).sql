-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2022 at 05:07 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schools`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `absensi_id` int(11) NOT NULL,
  `absensi_date` date NOT NULL,
  `grup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `absensi_remarks` text NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `absensi_status` int(11) NOT NULL COMMENT '1=hadir,2=sakit,3=izin,4=alpha'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`absensi_id`, `absensi_date`, `grup_id`, `user_id`, `absensi_remarks`, `sekolah_id`, `absensi_status`) VALUES
(2, '2017-11-05', 1, 37, 'tonight', 1, 1),
(3, '2017-11-05', 1, 40, 'We Are young', 1, 2),
(4, '2017-11-09', 1, 37, '', 1, 1),
(5, '2017-11-15', 1, 37, 'Sakit Flu', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `grup`
--

CREATE TABLE `grup` (
  `grup_id` int(11) NOT NULL,
  `grup_name` varchar(255) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `matpel_id` int(11) NOT NULL,
  `grup_no` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grup`
--

INSERT INTO `grup` (`grup_id`, `grup_name`, `sekolah_id`, `kelas_id`, `matpel_id`, `grup_no`) VALUES
(1, '7 IPA 1', 0, 7, 7, '1-1'),
(2, '10 ipa ppn', 1, 10, 6, '1-2'),
(3, '7 IPA 1 PPKN', 1, 7, 6, '1-3'),
(4, 'PPKN 7 Server', 0, 7, 6, '1-4');

-- --------------------------------------------------------

--
-- Table structure for table `grup_guru`
--

CREATE TABLE `grup_guru` (
  `grup_guru_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `grup_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grup_guru`
--

INSERT INTO `grup_guru` (`grup_guru_id`, `user_id`, `grup_id`, `sekolah_id`, `kelas_id`) VALUES
(17, 8, 1, 1, 7),
(18, 8, 3, 1, 7),
(20, 42, 4, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `grup_siswa`
--

CREATE TABLE `grup_siswa` (
  `grup_siswa_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `grup_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grup_siswa`
--

INSERT INTO `grup_siswa` (`grup_siswa_id`, `user_id`, `grup_id`, `sekolah_id`, `kelas_id`) VALUES
(14, 40, 1, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `identity`
--

CREATE TABLE `identity` (
  `identity_name` varchar(250) NOT NULL,
  `identity_coorporate` varchar(250) NOT NULL,
  `identity_picture` text NOT NULL,
  `identity_address` text NOT NULL,
  `identity_server` text NOT NULL,
  `identity_client` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `identity`
--

INSERT INTO `identity` (`identity_name`, `identity_coorporate`, `identity_picture`, `identity_address`, `identity_server`, `identity_client`) VALUES
('Smart School\'s System', '', 'logo.png', '', 'https://www.qithy.com/schools', 'https://www.qithy.com/schools/1');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `jawaban_id` int(11) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban_content` int(11) NOT NULL,
  `jawaban_true` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kelas_id` int(11) NOT NULL,
  `kelas_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kelas_id`, `kelas_name`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_guru`
--

CREATE TABLE `kelas_guru` (
  `kelas_guru_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_guru`
--

INSERT INTO `kelas_guru` (`kelas_guru_id`, `sekolah_id`, `user_id`, `kelas_id`) VALUES
(10, 1, 8, 7),
(11, 1, 8, 8),
(12, 1, 42, 7),
(13, 1, 42, 8),
(14, 1, 42, 9),
(15, 1, 42, 10);

-- --------------------------------------------------------

--
-- Table structure for table `kelas_sekolah`
--

CREATE TABLE `kelas_sekolah` (
  `kelas_sekolah_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_sekolah`
--

INSERT INTO `kelas_sekolah` (`kelas_sekolah_id`, `sekolah_id`, `kelas_id`) VALUES
(31, 1, 7),
(32, 1, 8),
(33, 1, 9),
(35, 1, 10),
(36, 1, 11),
(37, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_date` date NOT NULL,
  `login_siswa` int(11) NOT NULL,
  `login_guru` int(11) NOT NULL,
  `login_admin` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_date`, `login_siswa`, `login_guru`, `login_admin`, `sekolah_id`) VALUES
(2, '2017-11-05', 2, 1, 3, 1),
(3, '2017-11-06', 0, 0, 1, 1),
(4, '2017-11-07', 2, 0, 4, 1),
(5, '2017-11-08', 2, 0, 4, 1),
(6, '2017-11-09', 0, 0, 2, 1),
(7, '2017-11-10', 0, 0, 1, 1),
(8, '2017-11-14', 0, 0, 2, 1),
(9, '2017-11-15', 1, 2, 5, 1),
(10, '2017-11-17', 2, 9, 6, 1),
(11, '2017-11-18', 0, 4, 0, 1),
(12, '2017-11-19', 2, 6, 0, 1),
(13, '2017-11-20', 1, 1, 1, 1),
(14, '2017-11-21', 0, 3, 2, 1),
(15, '2017-12-10', 0, 0, 1, 1),
(16, '2017-12-14', 0, 1, 1, 1),
(17, '2017-12-20', 0, 1, 1, 1),
(18, '2018-02-15', 0, 2, 1, 1),
(19, '2018-02-15', 0, 0, 1, 0),
(20, '2018-02-23', 0, 0, 1, 1),
(21, '2018-03-17', 0, 1, 3, 1),
(22, '2018-03-17', 0, 0, 1, 0),
(23, '2018-03-18', 0, 0, 0, 0),
(24, '2018-03-18', 0, 0, 2, 1),
(25, '2018-03-19', 0, 0, 2, 1),
(26, '2018-03-20', 0, 0, 2, 1),
(27, '2018-04-08', 0, 1, 0, 1),
(28, '2018-04-08', 0, 0, 0, 0),
(29, '2018-04-13', 0, 0, 2, 1),
(30, '2018-07-17', 0, 1, 2, 1),
(31, '2018-07-16', 0, 0, 1, 1),
(32, '2018-07-19', 0, 0, 3, 1),
(33, '2018-07-20', 0, 0, 2, 1),
(34, '2018-07-21', 0, 0, 1, 1),
(35, '2018-07-27', 0, 0, 1, 1),
(36, '2018-07-28', 0, 0, 2, 1),
(37, '2018-07-29', 0, 0, 2, 1),
(38, '2018-07-30', 0, 0, 1, 1),
(39, '2018-08-02', 0, 0, 2, 1),
(40, '2018-08-04', 0, 0, 1, 1),
(41, '2018-08-06', 0, 0, 1, 1),
(42, '2018-08-07', 0, 0, 2, 1),
(43, '2018-08-08', 1, 0, 2, 1),
(44, '2018-08-09', 0, 0, 4, 1),
(45, '2018-08-10', 0, 0, 2, 1),
(46, '2018-08-11', 0, 0, 1, 1),
(47, '2018-08-13', 0, 0, 2, 1),
(48, '2018-08-14', 0, 0, 3, 1),
(49, '2018-08-20', 0, 0, 2, 1),
(50, '2018-08-21', 0, 0, 2, 1),
(51, '2018-08-23', 0, 0, 1, 1),
(52, '2018-08-24', 0, 0, 2, 1),
(53, '2018-08-25', 0, 0, 1, 1),
(54, '2018-08-27', 0, 0, 3, 1),
(55, '2018-08-28', 0, 0, 1, 1),
(56, '2018-08-29', 0, 0, 1, 1),
(57, '2018-08-30', 0, 0, 1, 1),
(58, '2018-08-31', 0, 0, 1, 1),
(59, '2018-09-01', 0, 0, 2, 1),
(60, '2018-09-03', 0, 0, 1, 1),
(61, '2018-09-04', 0, 0, 1, 1),
(62, '2018-09-05', 0, 0, 1, 1),
(63, '2018-09-06', 0, 0, 1, 1),
(64, '2018-09-07', 0, 0, 1, 1),
(65, '2018-09-08', 0, 0, 3, 1),
(66, '2018-09-10', 0, 0, 1, 1),
(67, '2018-09-12', 0, 0, 1, 1),
(68, '2018-09-13', 0, 0, 2, 1),
(69, '2018-09-14', 0, 0, 2, 1),
(70, '2018-09-15', 0, 0, 2, 1),
(71, '2018-09-16', 0, 0, 1, 1),
(72, '2018-09-17', 0, 0, 2, 1),
(73, '2018-09-18', 0, 0, 2, 1),
(74, '2018-09-19', 0, 0, 2, 1),
(75, '2018-09-20', 0, 0, 2, 1),
(76, '2018-09-21', 0, 0, 1, 1),
(77, '2018-09-22', 0, 0, 2, 1),
(78, '2018-09-24', 0, 0, 1, 1),
(79, '2018-09-25', 0, 0, 1, 1),
(80, '2018-09-26', 0, 0, 2, 1),
(81, '2018-09-27', 0, 0, 1, 1),
(82, '2018-09-28', 0, 0, 1, 1),
(83, '2018-09-29', 0, 0, 3, 1),
(84, '2018-10-01', 0, 0, 2, 1),
(85, '2018-10-02', 0, 0, 1, 1),
(86, '2018-10-03', 0, 0, 1, 1),
(87, '2018-10-04', 0, 0, 1, 1),
(88, '2018-10-05', 0, 0, 1, 1),
(89, '2018-10-06', 0, 0, 2, 1),
(90, '2018-10-08', 0, 0, 1, 1),
(91, '2018-10-09', 0, 0, 1, 1),
(92, '2018-10-10', 0, 0, 2, 1),
(93, '2018-10-11', 0, 0, 1, 1),
(94, '2018-10-12', 0, 0, 3, 1),
(95, '2018-10-13', 0, 0, 1, 1),
(96, '2018-10-15', 0, 0, 2, 1),
(97, '2018-10-16', 0, 0, 2, 1),
(98, '2018-10-17', 0, 0, 1, 1),
(99, '2018-10-18', 0, 0, 1, 1),
(100, '2018-10-19', 0, 0, 2, 1),
(101, '2018-10-20', 0, 0, 1, 1),
(102, '2018-10-22', 0, 0, 2, 1),
(103, '2018-10-23', 0, 0, 2, 1),
(104, '2018-10-24', 0, 0, 1, 1),
(105, '2018-10-25', 0, 0, 2, 1),
(106, '2018-10-26', 0, 0, 1, 1),
(107, '2018-10-27', 0, 0, 1, 1),
(108, '2018-10-29', 0, 0, 2, 1),
(109, '2018-10-30', 0, 0, 2, 1),
(110, '2018-10-31', 0, 0, 2, 1),
(111, '2018-11-01', 0, 0, 2, 1),
(112, '2018-11-02', 0, 0, 1, 1),
(113, '2018-11-03', 0, 0, 2, 1),
(114, '2018-11-05', 0, 0, 1, 1),
(115, '2018-11-06', 0, 0, 1, 1),
(116, '2018-11-07', 0, 0, 1, 1),
(117, '2018-11-08', 0, 0, 2, 1),
(118, '2018-11-09', 0, 0, 1, 1),
(119, '2018-11-12', 0, 0, 2, 1),
(120, '2018-11-13', 0, 0, 2, 1),
(121, '2018-11-14', 0, 0, 2, 1),
(122, '2018-11-15', 0, 0, 1, 1),
(123, '2018-11-16', 0, 0, 2, 1),
(124, '2018-11-23', 0, 0, 3, 1),
(125, '2018-11-24', 0, 0, 3, 1),
(126, '2018-11-26', 0, 0, 2, 1),
(127, '2018-11-27', 0, 0, 1, 1),
(128, '2018-11-28', 0, 0, 1, 1),
(129, '2018-11-29', 0, 0, 1, 1),
(130, '2018-11-30', 0, 0, 1, 1),
(131, '2018-12-01', 0, 0, 1, 1),
(132, '2018-12-03', 0, 0, 3, 1),
(133, '2018-12-04', 0, 0, 1, 1),
(134, '2018-12-05', 0, 0, 1, 1),
(135, '2018-12-06', 0, 0, 2, 1),
(136, '2018-12-07', 0, 0, 1, 1),
(137, '2018-12-08', 0, 0, 1, 1),
(138, '2018-12-10', 0, 0, 1, 1),
(139, '2018-12-11', 0, 0, 1, 1),
(140, '2018-12-12', 0, 0, 1, 1),
(141, '2018-12-13', 0, 0, 2, 1),
(142, '2018-12-14', 0, 0, 2, 1),
(143, '2018-12-18', 0, 0, 1, 1),
(144, '2019-01-02', 0, 0, 1, 1),
(145, '2019-01-03', 0, 0, 1, 1),
(146, '2019-01-04', 0, 0, 2, 1),
(147, '2019-01-05', 0, 0, 2, 1),
(148, '2019-01-07', 0, 0, 1, 1),
(149, '2019-01-08', 0, 0, 1, 1),
(150, '2019-01-09', 0, 0, 1, 1),
(151, '2019-01-10', 0, 0, 1, 1),
(152, '2019-01-14', 0, 0, 1, 1),
(153, '2019-01-15', 0, 0, 1, 1),
(154, '2019-01-16', 0, 0, 1, 1),
(155, '2019-01-17', 0, 0, 1, 1),
(156, '2019-01-18', 0, 0, 1, 1),
(157, '2019-01-19', 0, 0, 1, 1),
(158, '2019-01-21', 0, 0, 1, 1),
(159, '2019-01-22', 0, 0, 1, 1),
(160, '2019-01-23', 0, 0, 2, 1),
(161, '2019-01-24', 0, 0, 2, 1),
(162, '2019-01-25', 0, 0, 1, 1),
(163, '2019-01-26', 0, 0, 1, 1),
(164, '2019-01-28', 0, 0, 1, 1),
(165, '2019-01-29', 0, 0, 1, 1),
(166, '2019-01-30', 0, 0, 1, 1),
(167, '2019-01-31', 0, 0, 1, 1),
(168, '2019-02-01', 0, 0, 1, 1),
(169, '2019-02-02', 0, 0, 2, 1),
(170, '2019-02-04', 0, 0, 1, 1),
(171, '2019-02-06', 0, 0, 1, 1),
(172, '2019-02-07', 0, 0, 2, 1),
(173, '2019-02-08', 0, 0, 1, 1),
(174, '2019-02-09', 0, 0, 1, 1),
(175, '2019-02-11', 0, 0, 2, 1),
(176, '2019-02-12', 0, 0, 2, 1),
(177, '2019-02-13', 0, 0, 2, 1),
(178, '2019-02-14', 0, 0, 2, 1),
(179, '2019-02-15', 0, 0, 1, 1),
(180, '2019-02-16', 0, 0, 1, 1),
(181, '2019-02-18', 0, 0, 1, 1),
(182, '2019-02-19', 0, 0, 2, 1),
(183, '2019-02-20', 0, 0, 2, 1),
(184, '2019-02-21', 0, 0, 2, 1),
(185, '2019-02-23', 0, 0, 1, 1),
(186, '2019-02-25', 0, 0, 1, 1),
(187, '2019-02-26', 0, 0, 3, 1),
(188, '2019-02-27', 0, 0, 2, 1),
(189, '2019-02-28', 0, 0, 0, 1),
(190, '2019-03-01', 0, 0, 2, 1),
(191, '2019-03-02', 0, 0, 2, 1),
(192, '2019-03-04', 0, 0, 0, 1),
(193, '2019-03-05', 0, 0, 1, 1),
(194, '2019-03-06', 0, 0, 2, 1),
(195, '2019-03-09', 0, 0, 2, 1),
(196, '2019-03-11', 0, 0, 1, 1),
(197, '2019-03-15', 0, 0, 1, 1),
(198, '2019-03-18', 0, 0, 1, 1),
(199, '2019-03-19', 0, 0, 1, 1),
(200, '2019-03-22', 0, 0, 2, 1),
(201, '2019-03-23', 0, 0, 3, 1),
(202, '2019-03-24', 0, 0, 1, 1),
(203, '2019-03-25', 0, 0, 1, 1),
(204, '2019-03-26', 0, 0, 1, 1),
(205, '2019-03-27', 0, 0, 1, 1),
(206, '2019-03-28', 0, 0, 2, 1),
(207, '2019-03-29', 0, 0, 2, 1),
(208, '2019-04-01', 0, 0, 1, 1),
(209, '2019-04-02', 0, 0, 2, 1),
(210, '2019-04-04', 0, 0, 2, 1),
(211, '2019-04-05', 0, 0, 2, 1),
(212, '2019-04-06', 0, 0, 3, 1),
(213, '2019-04-08', 0, 0, 1, 1),
(214, '2019-04-09', 0, 0, 3, 1),
(215, '2019-04-10', 0, 0, 2, 1),
(216, '2019-04-11', 0, 0, 1, 1),
(217, '2019-04-12', 0, 0, 1, 1),
(218, '2019-04-15', 0, 0, 2, 1),
(219, '2019-04-16', 0, 0, 1, 1),
(220, '2019-04-18', 0, 0, 1, 1),
(221, '2019-04-20', 0, 0, 2, 1),
(222, '2019-04-22', 0, 0, 2, 1),
(223, '2019-04-23', 0, 0, 1, 1),
(224, '2019-04-24', 0, 0, 1, 1),
(225, '2019-04-27', 0, 0, 2, 1),
(226, '2019-04-29', 0, 0, 4, 1),
(227, '2019-04-30', 0, 0, 2, 1),
(228, '2019-05-04', 0, 0, 1, 1),
(229, '2019-05-09', 0, 0, 1, 1),
(230, '2019-05-10', 0, 0, 1, 1),
(231, '2019-05-11', 0, 0, 1, 1),
(232, '2019-05-13', 0, 0, 1, 1),
(233, '2019-05-14', 0, 0, 1, 1),
(234, '2019-05-15', 0, 0, 1, 1),
(235, '2019-05-16', 0, 0, 1, 1),
(236, '2019-05-17', 0, 0, 1, 1),
(237, '2019-05-20', 0, 0, 2, 1),
(238, '2019-05-21', 0, 0, 1, 1),
(239, '2019-05-22', 0, 0, 1, 1),
(240, '2019-06-12', 0, 0, 1, 1),
(241, '2019-06-13', 0, 0, 2, 1),
(242, '2019-06-14', 0, 0, 1, 1),
(243, '2019-06-15', 0, 0, 1, 1),
(244, '2019-06-17', 0, 0, 1, 1),
(245, '2019-06-19', 0, 0, 1, 1),
(246, '2019-06-21', 0, 0, 1, 1),
(247, '2019-06-22', 0, 0, 0, 1),
(248, '2019-07-03', 0, 0, 5, 1),
(249, '2019-07-10', 0, 0, 1, 1),
(250, '2019-07-17', 0, 0, 1, 1),
(251, '2019-07-25', 0, 0, 1, 1),
(252, '2019-08-09', 0, 0, 1, 1),
(253, '2019-12-02', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `materi_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `grup_id` int(11) NOT NULL,
  `materi_title` text NOT NULL,
  `materi_content` text NOT NULL,
  `materi_publish` int(11) NOT NULL,
  `soal_publish` int(11) NOT NULL,
  `soal_status` int(11) NOT NULL COMMENT '0=belum mulai, 1=mulai, 2=selesai',
  `materi_server` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`materi_id`, `sekolah_id`, `grup_id`, `materi_title`, `materi_content`, `materi_publish`, `soal_publish`, `soal_status`, `materi_server`) VALUES
(4, 1, 2, 'kebangsaan', '<p>pendalaman pancasila</p>\r\n', 0, 0, 0, 0),
(5, 1, 2, 'Pancasila', '<p><strong>Kebangsaan Pancasila</strong></p>\r\n\r\n<ol>\r\n	<li><strong>aaa</strong></li>\r\n	<li><strong>bbb</strong></li>\r\n</ol>\r\n', 0, 0, 0, 0),
(6, 1, 1, 'Besaran dan Pengukuran', '<ol>\r\n	<li>Besaran adalah sesuatu yang dapat diukur dan dinyatakan dengan angka, sedangkan satuan adalah besaran pembanding yang digunakan dalam pengukuran.</li>\r\n	<li>Besaran pokok terdiri dari panjang, massa, waktu, suhu, kuat arus, jumlah zat, dan intensitas cahaya. Dari besaran pokok tersebut dapat diturunkan besaran turunan seperti luas, volume, kecepatan, gaya, dan sebagainya.</li>\r\n	<li>Alat-alat yang digunakan untuk pengukuran besaran panjang antara lain mistar, rol meter, jangka sorong, dan mikrometer sekrup.</li>\r\n	<li>Alat untuk mengukur besaran massa disebut timbangan atau neraca. Terdapat bermacam-macam jenis timbangan atau neraca sesuai kegunaannya.</li>\r\n	<li>Alat pengukuran waktu adalah jam dan stopwatch. Stopwatch digunakan dalam pengukuran waktu yang membutuhkan ketelitian seperti mencatat waktu dalam perlombaan olahraga lari, renang, balap mobil, dan sebagainya.</li>\r\n	<li>Suhu adalah besaran untuk menyatakan tingkat panas dinginnya suatu keadaan. Alat pengukuran suhu adalah termometer.</li>\r\n	<li>Ada empat skala satuan suhu, yaitu Celcius, Fahrenheit, Reamur, dan Kelvin dengan konversi sebagai berikut:</li>\r\n</ol>\r\n\r\n<div style=\"text-align:justify\">\r\n<blockquote>&nbsp;&nbsp;&nbsp; t &deg;C = 5 / 9 (t &deg;F &ndash; 32) atau t &deg;F = 9 / 5 t &deg;C + 32<br />\r\n&nbsp;&nbsp;&nbsp; t &deg;C = 5 / 4 t &deg;R atau t &deg;R = 4 / 5 t &deg;C<br />\r\n&nbsp;&nbsp;&nbsp; t &deg;C = t K &ndash; 273 atau t K = t &deg;C + 273</blockquote>\r\n</div>\r\n', 0, 0, 0, 0),
(7, 0, 4, 'Jadi', '<p>adalah</p>\r\n', 0, 0, 0, 0),
(8, 1, 3, 'Pancasila', '<p><strong>Kebangsaan Pancasila</strong></p>\n\n<ol>\n	<li><strong>aaa</strong></li>\n	<li><strong>bbb</strong></li>\n</ol>\n', 0, 0, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `matpel`
--

CREATE TABLE `matpel` (
  `matpel_id` int(11) NOT NULL,
  `matpel_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matpel`
--

INSERT INTO `matpel` (`matpel_id`, `matpel_name`) VALUES
(1, 'IPA'),
(2, 'IPS'),
(3, 'Matematika'),
(4, 'B.Indonesia'),
(5, 'Sejarah'),
(6, 'PPKN'),
(7, 'Biologi'),
(8, 'Kimia'),
(9, 'Fisika'),
(10, 'KKPI'),
(11, 'B.Daerah'),
(12, 'B.Inggris'),
(13, 'Penjaskes'),
(14, 'Akuntansi');

-- --------------------------------------------------------

--
-- Table structure for table `matpel_sekolah`
--

CREATE TABLE `matpel_sekolah` (
  `matpel_sekolah_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `matpel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matpel_sekolah`
--

INSERT INTO `matpel_sekolah` (`matpel_sekolah_id`, `sekolah_id`, `matpel_id`) VALUES
(3, 1, 7),
(4, 1, 3),
(5, 1, 4),
(6, 1, 5),
(7, 1, 6),
(9, 1, 9),
(10, 1, 12),
(11, 1, 13),
(12, 1, 8),
(13, 1, 1),
(14, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`) VALUES
(1, 'Administrator'),
(2, 'Admin'),
(3, 'Guru'),
(4, 'Siswa');

-- --------------------------------------------------------

--
-- Table structure for table `refresh`
--

CREATE TABLE `refresh` (
  `refresh_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `refresh_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `refresh`
--

INSERT INTO `refresh` (`refresh_id`, `position_id`, `refresh_status`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `sekolah_id` int(11) NOT NULL,
  `sekolah_name` varchar(150) NOT NULL,
  `sekolah_address` text NOT NULL,
  `sekolah_picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`sekolah_id`, `sekolah_name`, `sekolah_address`, `sekolah_picture`) VALUES
(1, 'SMK Avicenna Tenjo', 'Jl. Abdul Fatah, Tenjo, Bogor, Jawa Barat 16370', '14_38_13_Logo_SMK_Avicenna.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `soal_id` int(11) NOT NULL,
  `soal_question` text NOT NULL,
  `soal_solution` text NOT NULL,
  `soal_answer1` text NOT NULL,
  `soal_answer2` text NOT NULL,
  `soal_answer3` text NOT NULL,
  `soal_answer4` text NOT NULL,
  `soal_picture` text NOT NULL,
  `sekolah_id` int(11) NOT NULL COMMENT '0=soal umum',
  `materi_id` int(11) NOT NULL,
  `soal_key` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `soal_umum`
--

CREATE TABLE `soal_umum` (
  `soal_umum_id` int(11) NOT NULL,
  `soal_umum_content` text NOT NULL,
  `soal_umum_title` varchar(100) NOT NULL,
  `soal_umum_picture` text NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `matpel_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `materi_umum_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tabungan`
--

CREATE TABLE `tabungan` (
  `tabungan_id` int(11) NOT NULL,
  `user_nisn` varchar(20) NOT NULL,
  `tabungan_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tabungan_amount` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tabungan_type` varchar(20) NOT NULL,
  `tabungan_remarks` text NOT NULL,
  `sekolah_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tabungan`
--

INSERT INTO `tabungan` (`tabungan_id`, `user_nisn`, `tabungan_datetime`, `tabungan_amount`, `user_id`, `tabungan_type`, `tabungan_remarks`, `sekolah_id`) VALUES
(1, '1819001', '2018-07-29 20:36:00', 1, 7, 'Debet', '', 1),
(3, '1819001', '2018-07-29 21:10:52', 20000, 7, 'Debet', '', 1),
(4, '1819001', '2018-08-06 14:43:41', 10000, 7, 'Debet', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`test_id`, `sekolah_id`, `materi_id`, `user_id`, `test_nilai`) VALUES
(1, 1, 1, 7, 0),
(2, 1, 1, 8, 0),
(3, 1, 9, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_detail`
--

CREATE TABLE `test_detail` (
  `test_detail_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_detail_answer` varchar(1) NOT NULL,
  `soal_key` varchar(1) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_detail`
--

INSERT INTO `test_detail` (`test_detail_id`, `test_id`, `test_detail_answer`, `soal_key`, `soal_id`, `materi_id`, `sekolah_id`, `user_id`) VALUES
(30, 0, 'C', 'D', 2, 9, 1, 40),
(31, 0, 'B', 'D', 9, 9, 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `transaction_name` varchar(255) NOT NULL,
  `transaction_amount` bigint(20) NOT NULL,
  `transaction_type` varchar(10) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `user_nisn` varchar(20) NOT NULL,
  `user_nik` varchar(20) NOT NULL,
  `transaction_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_name`, `transaction_amount`, `transaction_type`, `sekolah_id`, `user_nisn`, `user_nik`, `transaction_datetime`, `kelas_id`) VALUES
(29, 'iuran sekolah', 7560000, 'Kredit', 1, '', '123456', '2018-07-16 12:51:21', 10),
(52, '', 210000, 'Debet', 1, '1819270', '', '2018-08-04 12:38:11', 0),
(53, '', 28000, 'Debet', 1, '1819270', '', '2018-08-04 12:39:32', 0),
(54, '', 50000, 'Debet', 1, '1819040', '', '2018-08-04 12:42:53', 0),
(55, '', 210000, 'Debet', 1, '1819287', '', '2018-08-06 08:06:53', 0),
(56, '', 100000, 'Debet', 1, '1819157', '', '2018-08-06 08:09:07', 0),
(57, '', 210000, 'Debet', 1, '1819252', '', '2018-08-06 08:10:23', 0),
(58, '', 200000, 'Debet', 1, '1819198', '', '2018-08-06 08:12:15', 0),
(59, '', 210000, 'Debet', 1, '1819150', '', '2018-08-06 08:13:21', 0),
(60, '', 210000, 'Debet', 1, '1819049', '', '2018-08-06 08:15:08', 0),
(61, '', 50000, 'Debet', 1, '1819206', '', '2018-08-06 08:16:46', 0),
(62, '', 1, 'Debet', 1, '1819345', '', '2018-08-06 08:35:31', 0),
(63, '', 210000, 'Debet', 1, '1819296', '', '2018-08-06 09:24:37', 0),
(64, '', 149000, 'Debet', 1, '1819200', '', '2018-08-06 09:25:46', 0),
(65, '', 210000, 'Debet', 1, '1819079', '', '2018-08-06 09:30:31', 0),
(66, '', 420000, 'Debet', 1, '1819163', '', '2018-08-06 09:32:13', 0),
(67, '', 50000, 'Debet', 1, '1819071', '', '2018-08-06 09:33:24', 0),
(68, '', 210000, 'Debet', 1, '1819039', '', '2018-08-06 09:37:35', 0),
(69, '', 210000, 'Debet', 1, '1819114', '', '2018-08-06 09:57:16', 0),
(70, '', 100000, 'Debet', 1, '1819094', '', '2018-08-06 10:01:59', 0),
(71, '', 50000, 'Debet', 1, '1819111', '', '2018-08-06 10:02:56', 0),
(72, '', 110000, 'Debet', 1, '1819122', '', '2018-08-06 10:06:02', 0),
(73, '', 7000, 'Debet', 1, '1819186', '', '2018-08-06 10:27:34', 0),
(74, '', 210000, 'Debet', 1, '1819056', '', '2018-08-06 10:31:12', 0),
(75, '', 210000, 'Debet', 1, '1819033', '', '2018-08-06 10:32:49', 0),
(76, '', 50000, 'Debet', 1, '1819051', '', '2018-08-06 10:33:43', 0),
(77, '', 50000, 'Debet', 1, '1819104', '', '2018-08-06 11:26:44', 0),
(78, '', 21000, 'Debet', 1, '1819237', '', '2018-08-06 12:34:27', 0),
(79, '', 252000, 'Debet', 1, '1819338', '', '2018-08-06 12:37:19', 0),
(80, '', 210000, 'Debet', 1, '1819271', '', '2018-08-07 06:58:04', 0),
(81, '', 210000, 'Debet', 1, '1819173', '', '2018-08-07 06:58:55', 0),
(82, '', 210000, 'Debet', 1, '1819120', '', '2018-08-07 07:00:00', 0),
(83, '', 210000, 'Debet', 1, '1819237', '', '2018-08-07 07:02:14', 0),
(84, '', 100000, 'Debet', 1, '1819128', '', '2018-08-07 07:49:45', 0),
(85, '', 7000, 'Debet', 1, '1819186', '', '2018-08-07 08:09:30', 0),
(86, '', 7000, 'Debet', 1, '1819267', '', '2018-08-07 08:12:33', 0),
(87, '', 7000, 'Debet', 1, '1819176', '', '2018-08-07 09:26:39', 0),
(88, 'iuran sekolah', 210000, 'Debet', 1, '1819015', '', '2018-08-07 09:31:42', 0),
(89, 'iuran sekolah', 210000, 'Debet', 1, '1819292', '', '2018-08-07 09:33:43', 0),
(90, 'iuran sekolah', 210000, 'Debet', 1, '1819229', '', '2018-08-07 09:34:52', 0),
(91, '', 100000, 'Debet', 1, '1819273', '', '2018-08-07 09:52:52', 0),
(92, 'iuran sekolah', 40000, 'Debet', 1, '1819220', '', '2018-08-07 10:06:44', 0),
(93, 'iuran sekolah', 14000, 'Debet', 1, '1819237', '', '2018-08-07 12:05:27', 0),
(94, 'iuran sekolah', 7000, 'Debet', 1, '1819237', '', '2018-08-07 12:06:06', 0),
(95, 'iuran sekolah', 7000, 'Debet', 1, '1819338', '', '2018-08-07 12:07:56', 0),
(96, '', 210000, 'Debet', 1, '1819118', '', '2018-08-08 06:57:34', 0),
(97, 'iuran sekolah', 420000, 'Debet', 1, '1819032', '', '2018-08-08 08:28:15', 0),
(98, 'iuran sekolah', 210000, 'Debet', 1, '1819249', '', '2018-08-08 08:36:56', 0),
(99, 'iuran sekolah', 210000, 'Debet', 1, '1819269', '', '2018-08-08 09:32:53', 0),
(100, 'iuran sekolah', 7000, 'Debet', 1, '1819186', '', '2018-08-08 09:34:13', 0),
(101, '', 7000, 'Debet', 1, '1819176', '', '2018-08-08 10:01:09', 0),
(102, 'iuran sekolah', 210000, 'Debet', 1, '1819219', '', '2018-08-08 11:38:17', 0),
(103, 'iuran sekolah', 7000, 'Debet', 1, '1819338', '', '2018-08-08 11:58:13', 0),
(104, 'iuran sekolah', 7000, 'Debet', 1, '1819237', '', '2018-08-08 11:59:01', 0),
(105, 'iuran sekolah', 100000, 'Debet', 1, '1819315', '', '2018-08-08 12:01:23', 0),
(106, 'iuran sekolah', 50000, 'Debet', 1, '1819040', '', '2018-08-08 12:02:30', 0),
(107, 'iuran sekolah', 50000, 'Debet', 1, '1819040', '', '2018-08-08 12:03:21', 0),
(108, 'iuran sekolah', 28000, 'Debet', 1, '1819270', '', '2018-08-08 12:04:15', 0),
(109, 'iuran sekolah', 210000, 'Debet', 1, '1819081', '', '2018-08-09 07:18:25', 0),
(110, 'iuran sekolah', 210000, 'Debet', 1, '1819199', '', '2018-08-09 08:29:03', 0),
(111, 'iuran sekolah', 210000, 'Debet', 1, '1819298', '', '2018-08-09 09:12:19', 0),
(112, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-09 09:16:37', 0),
(113, 'iuran sekolah', 7000, 'Debet', 1, '1819270', '', '2018-08-09 12:03:45', 0),
(114, 'iuran sekolah', 7000, 'Debet', 1, '1819237', '', '2018-08-09 12:05:48', 0),
(115, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-08-09 12:06:39', 0),
(116, 'iuran sekolah', 15000, 'Debet', 1, '1819282', '', '2018-08-09 13:04:42', 0),
(117, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-10 09:23:41', 0),
(118, '', 14000, 'Debet', 1, '1819186', '', '2018-08-10 09:31:19', 0),
(119, '', 7000, 'Debet', 1, '1819237', '', '2018-08-10 11:24:00', 0),
(120, '', 10000, 'Debet', 1, '1819338', '', '2018-08-10 11:25:18', 0),
(121, '', 7000, 'Debet', 1, '1819270', '', '2018-08-10 11:26:35', 0),
(122, '', 210000, 'Debet', 1, '1819029', '', '2018-08-10 11:28:03', 0),
(123, '', 420000, 'Debet', 1, '1819151', '', '2018-08-11 06:36:02', 0),
(124, '', 210000, 'Debet', 1, '1819169', '', '2018-08-11 06:48:58', 0),
(125, '', 40000, 'Debet', 1, '1819094', '', '2018-08-11 06:58:01', 0),
(126, '', 40000, 'Debet', 1, '1819182', '', '2018-08-11 07:06:43', 0),
(127, '', 60000, 'Debet', 1, '1819233', '', '2018-08-11 07:17:41', 0),
(128, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2018-08-11 08:24:35', 0),
(129, 'iuran sekolah', 100000, 'Debet', 1, '1819122', '', '2018-08-11 09:41:27', 0),
(130, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-11 09:55:07', 0),
(131, 'iuran sekolah', 210000, 'Debet', 1, '1819168', '', '2018-08-11 10:36:38', 0),
(132, '', 7000, 'Debet', 1, '1819186', '', '2018-08-11 11:53:48', 0),
(133, 'iuran sekolah', 1260000, 'Debet', 1, '1819101', '', '2018-08-11 12:05:53', 0),
(134, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-08-11 12:06:49', 0),
(135, 'iuran sekolah', 7000, 'Debet', 1, '1819237', '', '2018-08-11 12:43:03', 0),
(136, '', 200000, 'Debet', 1, '1819042', '', '2018-08-13 06:57:27', 0),
(137, 'iuran sekolah', 210000, 'Debet', 1, '1819195', '', '2018-08-13 08:11:41', 0),
(138, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-08-13 08:12:54', 0),
(139, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2018-08-13 08:14:27', 0),
(140, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2018-08-13 08:15:13', 0),
(141, 'iuran sekolah', 210000, 'Debet', 1, '1819207', '', '2018-08-13 08:16:09', 0),
(142, 'iuran sekolah', 250000, 'Debet', 1, '1819218', '', '2018-08-13 08:16:57', 0),
(143, 'iuran sekolah', 100000, 'Debet', 1, '1819246', '', '2018-08-13 08:17:43', 0),
(144, 'iuran sekolah', 210000, 'Debet', 1, '1819034', '', '2018-08-13 08:18:55', 0),
(145, 'iuran sekolah', 100000, 'Debet', 1, '1819115', '', '2018-08-13 08:21:51', 0),
(146, 'iuran sekolah', 210000, 'Debet', 1, '1819142', '', '2018-08-13 08:22:40', 0),
(147, 'iuran sekolah', 100000, 'Debet', 1, '1819211', '', '2018-08-13 08:27:00', 0),
(148, 'iuran sekolah', 200000, 'Debet', 1, '1819336', '', '2018-08-13 08:28:50', 0),
(149, 'iuran sekolah', 200000, 'Debet', 1, '1819336', '', '2018-08-13 08:29:30', 0),
(150, 'iuran sekolah', 210000, 'Debet', 1, '1819109', '', '2018-08-13 08:30:17', 0),
(151, '', 210000, 'Debet', 1, '1819018', '', '2018-08-13 08:41:43', 0),
(152, '', 210000, 'Debet', 1, '1819027', '', '2018-08-13 08:48:13', 0),
(153, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2018-08-13 08:57:35', 0),
(154, 'iuran sekolah', 7000, 'Debet', 1, '1819082', '', '2018-08-13 09:01:52', 0),
(155, 'iuran sekolah', 210000, 'Debet', 1, '1819047', '', '2018-08-13 09:23:56', 0),
(156, '', 7000, 'Debet', 1, '1819176', '', '2018-08-13 09:31:34', 0),
(157, '', 40000, 'Debet', 1, '1819220', '', '2018-08-13 09:35:15', 0),
(158, '', 7000, 'Debet', 1, '1819186', '', '2018-08-13 10:27:19', 0),
(159, '', 210000, 'Debet', 1, '1819285', '', '2018-08-13 10:36:10', 0),
(160, '', 50000, 'Debet', 1, '1819313', '', '2018-08-13 11:02:53', 0),
(161, 'iuran sekolah', 50000, 'Debet', 1, '1819104', '', '2018-08-13 11:47:30', 0),
(162, 'iuran sekolah', 7000, 'Debet', 1, '1819237', '', '2018-08-13 12:39:18', 0),
(163, 'iuran sekolah', 7000, 'Debet', 1, '1819237', '', '2018-08-13 12:40:01', 0),
(164, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-08-13 12:40:55', 0),
(165, 'iuran sekolah', 210000, 'Debet', 1, '1819008', '', '2018-08-13 12:42:33', 0),
(166, '', 160000, 'Debet', 1, '1819004', '', '2018-08-13 16:17:47', 0),
(167, '', 210000, 'Debet', 1, '1819006', '', '2018-08-14 07:04:29', 0),
(168, '', 100000, 'Debet', 1, '1819264', '', '2018-08-14 07:16:52', 0),
(169, 'iuran sekolah', 210000, 'Debet', 1, '1819303', '', '2018-08-14 07:49:15', 0),
(170, 'iuran sekolah', 210000, 'Debet', 1, '1819297', '', '2018-08-14 09:21:30', 0),
(171, '', 7000, 'Debet', 1, '1819237', '', '2018-08-14 11:27:30', 0),
(172, '', 10000, 'Debet', 1, '1819338', '', '2018-08-14 11:28:38', 0),
(173, 'iuran sekolah', 210000, 'Debet', 1, '1819174', '', '2018-08-14 11:42:30', 0),
(174, '', 50000, 'Debet', 1, '1819094', '', '2018-08-20 06:52:28', 0),
(175, 'iuran sekolah', 210000, 'Debet', 1, '1819327', '', '2018-08-20 06:53:36', 0),
(176, '', 210000, 'Debet', 1, '1819181', '', '2018-08-20 07:56:04', 0),
(177, 'iuran sekolah', 210000, 'Debet', 1, '1819069', '', '2018-08-20 08:02:11', 0),
(178, '', 210000, 'Debet', 1, '1819266', '', '2018-08-20 08:02:55', 0),
(179, 'iuran sekolah', 420000, 'Debet', 1, '1819166', '', '2018-08-20 08:04:16', 0),
(180, 'iuran sekolah', 110000, 'Debet', 1, '1819206', '', '2018-08-20 08:11:59', 0),
(181, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2018-08-20 08:16:50', 0),
(182, '', 210000, 'Debet', 1, '1819139', '', '2018-08-20 09:25:50', 0),
(183, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-20 10:33:02', 0),
(184, '', 210000, 'Debet', 1, '1819131', '', '2018-08-21 07:06:06', 0),
(185, '', 60000, 'Debet', 1, '1819313', '', '2018-08-21 07:08:33', 0),
(186, 'iuran sekolah', 210000, 'Debet', 1, '1819092', '', '2018-08-21 07:39:06', 0),
(187, '', 100000, 'Debet', 1, '1819064', '', '2018-08-21 10:10:23', 0),
(188, '', 50000, 'Debet', 1, '1819051', '', '2018-08-21 10:11:44', 0),
(189, '', 7000, 'Debet', 1, '1819176', '', '2018-08-21 10:43:34', 0),
(190, '', 50000, 'Debet', 1, '1819104', '', '2018-08-21 11:33:46', 0),
(191, 'iuran sekolah', 200000, 'Debet', 1, '1819158', '', '2018-08-23 09:13:35', 0),
(192, 'iuran sekolah', 210000, 'Debet', 1, '1819308', '', '2018-08-24 08:09:28', 0),
(193, 'iuran sekolah', 210000, 'Debet', 1, '1819330', '', '2018-08-24 08:26:34', 0),
(194, 'iuran sekolah', 210000, 'Debet', 1, '1819122', '', '2018-08-24 09:04:01', 0),
(195, 'iuran sekolah', 70000, 'Debet', 1, '1819257', '', '2018-08-24 09:05:52', 0),
(196, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-24 09:21:30', 0),
(197, '', 50000, 'Debet', 1, '1819186', '', '2018-08-24 11:25:26', 0),
(198, '', 40000, 'Debet', 1, '1819237', '', '2018-08-24 11:26:29', 0),
(199, '', 10000, 'Debet', 1, '1819338', '', '2018-08-24 11:27:12', 0),
(200, '', 50000, 'Debet', 1, '1819094', '', '2018-08-25 07:19:24', 0),
(201, '', 45000, 'Debet', 1, '1819182', '', '2018-08-25 07:20:25', 0),
(202, 'iuran sekolah', 210000, 'Debet', 1, '1819120', '', '2018-08-25 09:09:43', 0),
(203, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-25 10:14:36', 0),
(204, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-08-25 12:05:10', 0),
(205, 'Iuran Sekolah', 300000, 'Debet', 1, '1819334', '', '2018-08-27 08:41:31', 0),
(206, 'Iuran Sekolah', 50000, 'Debet', 1, '1819313', '', '2018-08-27 08:44:26', 0),
(207, 'Iuran Sekolah', 50000, 'Debet', 1, '1819051', '', '2018-08-27 08:45:08', 0),
(208, 'Iuran Sekolah', 50000, 'Debet', 1, '1819111', '', '2018-08-27 08:46:48', 0),
(209, 'Iuran Sekolah', 50000, 'Debet', 1, '1819200', '', '2018-08-27 08:49:25', 0),
(210, 'Iuran Sekolah', 210000, 'Debet', 1, '1819227', '', '2018-08-27 08:50:02', 0),
(211, 'Iuran Sekolah', 7000, 'Debet', 1, '1819082', '', '2018-08-27 08:50:50', 0),
(212, 'Iuran Sekolah', 210000, 'Debet', 1, '1819022', '', '2018-08-27 08:56:32', 0),
(213, 'Iuran Sekolah', 50000, 'Debet', 1, '1819157', '', '2018-08-27 09:19:32', 0),
(214, 'Iuran Sekolah', 300000, 'Debet', 1, '1819124', '', '2018-08-27 09:29:30', 0),
(215, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-27 09:37:03', 0),
(216, 'Iuran Sekolah', 50000, 'Debet', 1, '1819104', '', '2018-08-27 10:14:58', 0),
(217, 'Iuran Sekolah', 100000, 'Debet', 1, '1819198', '', '2018-08-27 10:15:43', 0),
(218, 'Iuran Sekolah', 10000, 'Debet', 1, '1819338', '', '2018-08-27 12:32:52', 0),
(219, 'Iuran Sekolah', 14000, 'Debet', 1, '1819237', '', '2018-08-27 12:33:37', 0),
(220, 'Iuran sekolah', 170000, 'Debet', 1, '1819070', '', '2018-08-28 07:55:24', 0),
(221, 'Iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2018-08-28 07:56:06', 0),
(222, 'Iuran sekolah', 200000, 'Debet', 1, '1819023', '', '2018-08-28 08:43:53', 0),
(223, 'Iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-28 08:50:40', 0),
(224, 'Iuran sekolah', 210000, 'Debet', 1, '1819076', '', '2018-08-28 10:10:08', 0),
(225, 'Iuran sekolah', 210000, 'Debet', 1, '1819066', '', '2018-08-28 12:06:04', 0),
(226, '', 210000, 'Debet', 1, '1819053', '', '2018-08-29 07:57:30', 0),
(227, '', 210000, 'Debet', 1, '1819053', '', '2018-08-29 07:58:14', 0),
(228, '', 250000, 'Debet', 1, '1819068', '', '2018-08-29 08:07:33', 0),
(229, '', 200000, 'Debet', 1, '1819319', '', '2018-08-29 08:32:20', 0),
(230, '', 200000, 'Debet', 1, '1819274', '', '2018-08-29 09:35:18', 0),
(231, '', 200000, 'Debet', 1, '1819336', '', '2018-08-29 09:39:09', 0),
(232, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2018-08-30 08:20:36', 0),
(233, 'Iuran Sekolah', 150000, 'Debet', 1, '1819206', '', '2018-08-30 09:19:28', 0),
(234, 'Iuran Sekolah', 210000, 'Debet', 1, '1819008', '', '2018-08-30 09:34:08', 0),
(235, 'Iuran Sekolah', 100000, 'Debet', 1, '1819159', '', '2018-08-30 09:37:28', 0),
(236, 'Iuran Sekolah', 100000, 'Debet', 1, '1819026', '', '2018-08-30 10:46:27', 0),
(237, '', 30000, 'Debet', 1, '1819237', '', '2018-08-30 12:01:21', 0),
(238, '', 10000, 'Debet', 1, '1819338', '', '2018-08-30 12:03:23', 0),
(239, 'Iuran Sekolah', 140000, 'Debet', 1, '1819318', '', '2018-08-31 08:14:55', 0),
(240, 'Iuran Sekolah', 21000, 'Debet', 1, '1819318', '', '2018-08-31 08:16:03', 0),
(241, 'Iuran Sekolah', 210000, 'Debet', 1, '1819216', '', '2018-08-31 08:17:16', 0),
(242, 'Iuran Sekolah', 10000, 'Debet', 1, '1819066', '', '2018-08-31 08:18:10', 0),
(243, 'Iuran Sekolah', 420000, 'Debet', 1, '1819320', '', '2018-08-31 08:29:34', 0),
(244, 'Iuran Sekolah', 100000, 'Debet', 1, '1819233', '', '2018-08-31 08:41:22', 0),
(245, 'Iuran Sekolah', 210000, 'Debet', 1, '1819325', '', '2018-08-31 09:41:03', 0),
(246, 'Iuran Sekolah', 100000, 'Debet', 1, '1819246', '', '2018-08-31 11:07:46', 0),
(247, 'Iuran Sekolah', 7000, 'Debet', 1, '1819082', '', '2018-08-31 11:18:11', 0),
(248, 'Iuran Sekolah', 10000, 'Debet', 1, '1819338', '', '2018-08-31 11:26:11', 0),
(249, '', 210000, 'Debet', 1, '1819292', '', '2018-09-01 10:10:24', 0),
(250, '', 210000, 'Debet', 1, '1819229', '', '2018-09-01 10:11:34', 0),
(251, 'Iuran Sekolah', 210000, 'Debet', 1, '1819207', '', '2018-09-01 10:57:54', 0),
(252, 'Iuran Sekolah', 150000, 'Debet', 1, '1819245', '', '2018-09-01 11:05:12', 0),
(253, '', 200000, 'Debet', 1, '1819245', '', '2018-09-01 11:06:15', 0),
(254, 'Iuran Sekolah', 50000, 'Debet', 1, '1819186', '', '2018-09-01 12:18:50', 0),
(255, 'Iuran Sekolah', 50000, 'Debet', 1, '1819267', '', '2018-09-01 12:20:17', 0),
(256, 'Iuran Sekolah', 20000, 'Debet', 1, '1819237', '', '2018-09-01 12:22:17', 0),
(257, 'Iuran Sekolah', 210000, 'Debet', 1, '1819046', '', '2018-09-01 12:23:10', 0),
(258, 'Iuran Sekolah', 210000, 'Debet', 1, '1819058', '', '2018-09-03 08:04:04', 0),
(259, 'Iuran Sekolah', 210000, 'Debet', 1, '1819030', '', '2018-09-03 08:05:29', 0),
(260, 'Iuran Sekolah', 210000, 'Debet', 1, '1819039', '', '2018-09-03 08:06:48', 0),
(261, 'Iuran Sekolah', 210000, 'Debet', 1, '1819090', '', '2018-09-03 08:07:30', 0),
(262, 'Iuran Sekolah', 210000, 'Debet', 1, '1819196', '', '2018-09-03 08:08:27', 0),
(263, 'Iuran Sekolah', 50000, 'Debet', 1, '1819313', '', '2018-09-03 08:10:42', 0),
(264, 'Iuran Sekolah', 210000, 'Debet', 1, '1819296', '', '2018-09-03 08:12:55', 0),
(265, 'Iuran Sekolah', 210000, 'Debet', 1, '1819260', '', '2018-09-03 08:15:03', 0),
(266, 'Iuran Sekolah', 210000, 'Debet', 1, '1819086', '', '2018-09-03 08:16:55', 0),
(267, 'Iuran Sekolah', 200000, 'Debet', 1, '1819072', '', '2018-09-03 08:22:44', 0),
(268, 'Iuran Sekolah', 50000, 'Debet', 1, '1819051', '', '2018-09-03 08:24:53', 0),
(269, 'Iuran Sekolah', 210000, 'Debet', 1, '1819037', '', '2018-09-03 08:27:48', 0),
(270, 'Iuran Sekolah', 230000, 'Debet', 1, '1819062', '', '2018-09-03 08:31:20', 0),
(271, 'Iuran Sekolah', 200000, 'Debet', 1, '1819154', '', '2018-09-03 08:36:20', 0),
(272, 'Iuran Sekolah', 50000, 'Debet', 1, '1819128', '', '2018-09-03 08:57:03', 0),
(273, 'Iuran Sekolah', 50000, 'Debet', 1, '1819104', '', '2018-09-03 09:34:11', 0),
(274, 'Iuran Sekolah', 210000, 'Debet', 1, '1819025', '', '2018-09-03 09:34:59', 0),
(276, 'Iuran Sekolah', 7000, 'Debet', 1, '1819082', '', '2018-09-03 09:37:01', 0),
(277, '', 210000, 'Debet', 1, '1819195', '', '2018-09-03 10:18:26', 0),
(278, '', 210000, 'Debet', 1, '1819287', '', '2018-09-03 10:19:54', 0),
(279, '', 210000, 'Debet', 1, '1819180', '', '2018-09-03 10:33:01', 0),
(280, '', 200000, 'Debet', 1, '1819190', '', '2018-09-03 10:34:17', 0),
(281, 'Iuran Sekolah', 210000, 'Debet', 1, '1819098', '', '2018-09-03 11:11:20', 0),
(282, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2018-09-03 11:12:07', 0),
(283, 'Iuran Sekolah', 210000, 'Debet', 1, '1819253', '', '2018-09-03 11:38:38', 0),
(284, 'Iuran Sekolah', 14000, 'Debet', 1, '1819253', '', '2018-09-03 11:40:32', 0),
(285, '', 210000, 'Debet', 1, '1819183', '', '2018-09-03 12:19:08', 0),
(286, '', 210000, 'Debet', 1, '1819033', '', '2018-09-04 06:59:51', 0),
(287, '', 40000, 'Debet', 1, '1819182', '', '2018-09-04 07:01:38', 0),
(288, '', 200000, 'Debet', 1, '1819258', '', '2018-09-04 07:02:54', 0),
(289, 'iuran sekolah', 210000, 'Debet', 1, '1819328', '', '2018-09-04 07:37:12', 0),
(290, 'iuran sekolah', 20000, 'Debet', 1, '1819066', '', '2018-09-04 08:19:07', 0),
(291, 'iuran sekolah', 50000, 'Debet', 1, '1819211', '', '2018-09-04 08:26:26', 0),
(292, 'iuran sekolah', 210000, 'Debet', 1, '1819321', '', '2018-09-04 10:04:58', 0),
(293, 'iuran sekolah', 210000, 'Debet', 1, '1819321', '', '2018-09-04 10:06:44', 0),
(294, '', 210000, 'Debet', 1, '1819192', '', '2018-09-04 10:09:49', 0),
(295, 'iuran sekolah', 210000, 'Debet', 1, '1819192', '', '2018-09-04 10:10:55', 0),
(296, 'iuran sekolah', 200000, 'Debet', 1, '1819085', '', '2018-09-04 11:17:05', 0),
(297, 'iuran sekolah', 210000, 'Debet', 1, '1819183', '', '2018-09-04 11:29:34', 0),
(298, 'iuran sekolah', 140000, 'Debet', 1, '1819270', '', '2018-09-04 11:59:38', 0),
(299, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-09-04 12:01:35', 0),
(300, 'iuran sekolah', 210000, 'Debet', 1, '1819316', '', '2018-09-04 12:02:47', 0),
(301, 'iuran sekolah', 380000, 'Debet', 1, '1819309', '', '2018-09-04 12:05:19', 0),
(302, '', 210000, 'Debet', 1, '1819151', '', '2018-09-05 06:48:37', 0),
(303, '', 210000, 'Debet', 1, '1819229', '', '2018-09-05 06:49:46', 0),
(304, '', 210000, 'Debet', 1, '1819277', '', '2018-09-05 06:50:53', 0),
(305, 'iuran sekolah', 100000, 'Debet', 1, '1819064', '', '2018-09-05 07:47:38', 0),
(306, 'iuran sekolah', 60000, 'Debet', 1, '1819128', '', '2018-09-05 07:48:36', 0),
(307, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-09-05 08:41:08', 0),
(308, 'iuran sekolah', 50000, 'Debet', 1, '1819087', '', '2018-09-05 08:42:02', 0),
(309, 'iuran sekolah', 7000, 'Debet', 1, '1819082', '', '2018-09-05 09:43:20', 0),
(310, 'iuran sekolah', 210000, 'Debet', 1, '1819230', '', '2018-09-05 09:46:27', 0),
(311, 'iuran sekolah', 420000, 'Debet', 1, '1819006', '', '2018-09-05 09:49:01', 0),
(312, 'iuran sekolah', 50000, 'Debet', 1, '1819157', '', '2018-09-05 10:05:25', 0),
(313, 'iuran sekolah', 50000, 'Debet', 1, '1819198', '', '2018-09-05 10:06:31', 0),
(314, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2018-09-05 10:07:31', 0),
(315, 'iuran sekolah', 210000, 'Debet', 1, '1819219', '', '2018-09-05 10:08:35', 0),
(316, 'iuran sekolah', 10000, 'Debet', 1, '1819066', '', '2018-09-05 10:09:55', 0),
(317, 'iuran sekolah', 210000, 'Debet', 1, '1819281', '', '2018-09-05 10:52:10', 0),
(318, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-09-05 12:01:01', 0),
(319, 'iuran sekolah', 210000, 'Debet', 1, '1819050', '', '2018-09-05 12:03:33', 0),
(320, '', 210000, 'Debet', 1, '1819279', '', '2018-09-05 13:52:59', 0),
(321, '', 2000000, 'Debet', 1, '1819209', '', '2018-09-06 06:53:31', 0),
(322, '', 420000, 'Debet', 1, '1819283', '', '2018-09-06 06:54:59', 0),
(323, '', 250000, 'Debet', 1, '1819271', '', '2018-09-06 06:58:51', 0),
(324, '', 210000, 'Debet', 1, '1819173', '', '2018-09-06 07:00:23', 0),
(325, '', 210000, 'Debet', 1, '1819056', '', '2018-09-06 07:04:08', 0),
(326, '', 110000, 'Debet', 1, '1819206', '', '2018-09-06 07:05:20', 0),
(327, '', 210000, 'Debet', 1, '1819195', '', '2018-09-06 07:06:56', 0),
(328, '', 210000, 'Debet', 1, '1819261', '', '2018-09-06 07:16:49', 0),
(329, '', 200000, 'Debet', 1, '1819095', '', '2018-09-06 07:18:43', 0),
(330, '', 200000, 'Debet', 1, '1819011', '', '2018-09-06 07:26:27', 0),
(331, 'Iuran Sekolah', 200000, 'Debet', 1, '1819299', '', '2018-09-06 08:07:26', 0),
(332, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2018-09-06 08:12:54', 0),
(333, 'Iuran Sekolah', 210000, 'Debet', 1, '1819314', '', '2018-09-06 08:22:53', 0),
(334, 'Iuran Sekolah', 200000, 'Debet', 1, '1819336', '', '2018-09-06 08:25:42', 0),
(335, '', 250000, 'Debet', 1, '1819024', '', '2018-09-06 10:10:48', 0),
(336, '', 420000, 'Debet', 1, '1819113', '', '2018-09-06 10:26:04', 0),
(337, 'Iuran Sekolah', 200000, 'Debet', 1, '1819102', '', '2018-09-06 10:43:11', 0),
(338, 'Iuran Sekolah', 210000, 'Debet', 1, '1819205', '', '2018-09-06 10:49:43', 0),
(339, 'Iuran Sekolah', 210000, 'Debet', 1, '1819037', '', '2018-09-06 10:50:34', 0),
(340, 'Iuran Sekolah', 77000, 'Debet', 1, '1819149', '', '2018-09-06 11:15:22', 0),
(341, 'Iuran Sekolah', 84000, 'Debet', 1, '1819149', '', '2018-09-06 11:16:07', 0),
(342, 'Iuran Sekolah', 84000, 'Debet', 1, '1819149', '', '2018-09-06 11:16:48', 0),
(343, 'Iuran Sekolah', 203000, 'Debet', 1, '1819149', '', '2018-09-06 11:17:41', 0),
(344, 'Iuran Sekolah', 10000, 'Debet', 1, '1819338', '', '2018-09-06 11:58:49', 0),
(345, 'Iuran Sekolah', 30000, 'Debet', 1, '1819237', '', '2018-09-06 12:00:06', 0),
(346, 'Iuran Sekolah', 50000, 'Debet', 1, '1819040', '', '2018-09-06 12:01:33', 0),
(347, 'Iuran Sekolah', 250000, 'Debet', 1, '1819309', '', '2018-09-06 12:12:21', 0),
(348, 'Iuran Sekolah', 400000, 'Debet', 1, '1819159', '', '2018-09-07 07:43:11', 0),
(349, '', 50000, 'Debet', 1, '1819094', '', '2018-09-07 08:03:39', 0),
(350, '', 210000, 'Debet', 1, '1819150', '', '2018-09-07 08:39:21', 0),
(351, 'Iuran Sekolah', 210000, 'Debet', 1, '1819291', '', '2018-09-07 09:29:45', 0),
(352, 'Iuran Sekolah', 210000, 'Debet', 1, '1819208', '', '2018-09-07 09:35:01', 0),
(353, 'Iuran Sekolah', 210000, 'Debet', 1, '1819083', '', '2018-09-07 09:46:16', 0),
(354, 'Iuran Sekolah', 700000, 'Debet', 1, '1819288', '', '2018-09-07 10:11:43', 0),
(355, 'Iuran Sekolah', 210000, 'Debet', 1, '1819118', '', '2018-09-07 10:20:32', 0),
(356, 'Iuran Sekolah', 50000, 'Debet', 1, '1819257', '', '2018-09-07 12:12:26', 0),
(357, 'Iuran Sekolah', 210000, 'Debet', 1, '1819325', '', '2018-09-08 07:15:32', 0),
(358, 'Iuran Sekolah', 210000, 'Debet', 1, '1819196', '', '2018-09-08 08:36:11', 0),
(359, '', 210000, 'Debet', 1, '1819168', '', '2018-09-08 10:25:36', 0),
(360, '', 210000, 'Debet', 1, '1819184', '', '2018-09-10 07:11:33', 0),
(361, '', 210000, 'Debet', 1, '1819154', '', '2018-09-10 07:13:46', 0),
(362, '', 630000, 'Debet', 1, '1819057', '', '2018-09-10 07:16:53', 0),
(363, '', 210000, 'Debet', 1, '1819103', '', '2018-09-10 07:18:33', 0),
(364, '', 300000, 'Debet', 1, '1819324', '', '2018-09-10 08:36:17', 0),
(365, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2018-09-10 10:00:21', 0),
(366, 'iuran sekolah', 150000, 'Debet', 1, '1819179', '', '2018-09-10 10:01:41', 0),
(367, 'iuran sekolah', 20000, 'Debet', 1, '1819119', '', '2018-09-10 10:05:24', 0),
(368, 'iuran sekolah', 210000, 'Debet', 1, '1819119', '', '2018-09-10 10:06:14', 0),
(369, 'iuran sekolah', 210000, 'Debet', 1, '1819214', '', '2018-09-10 10:06:58', 0),
(370, '', 510000, 'Debet', 1, '1819257', '', '2018-09-10 11:00:46', 0),
(371, '', 50000, 'Debet', 1, '1819051', '', '2018-09-10 11:13:01', 0),
(372, 'iuran sekolah', 210000, 'Debet', 1, '1819029', '', '2018-09-10 11:57:08', 0),
(373, 'iuran sekolah', 210000, 'Debet', 1, '1819029', '', '2018-09-10 11:58:09', 0),
(374, 'iuran sekolah', 28000, 'Debet', 1, '1819237', '', '2018-09-10 12:09:08', 0),
(375, '', 7000, 'Debet', 1, '1819082', '', '2018-09-10 12:23:17', 0),
(376, 'iuran sekolah', 210000, 'Debet', 1, '1819076', '', '2018-09-10 12:38:27', 0),
(377, 'iuran sekolah', 70000, 'Debet', 1, '1819233', '', '2018-09-10 12:43:49', 0),
(378, 'iuran sekolah', 210000, 'Debet', 1, '1819190', '', '2018-09-10 12:45:34', 0),
(379, 'iuran sekolah', 100000, 'Debet', 1, '1819026', '', '2018-09-10 12:46:53', 0),
(380, '', 630000, 'Debet', 1, '1819175', '', '2018-09-12 07:01:01', 0),
(381, '', 150000, 'Debet', 1, '1819329', '', '2018-09-12 07:02:21', 0),
(382, '', 210000, 'Debet', 1, '1819298', '', '2018-09-12 07:03:51', 0),
(383, '', 210000, 'Debet', 1, '1819343', '', '2018-09-12 07:11:47', 0),
(384, '', 200000, 'Debet', 1, '1819069', '', '2018-09-12 07:14:29', 0),
(385, '', 210000, 'Debet', 1, '1819027', '', '2018-09-12 07:16:40', 0),
(386, '', 210000, 'Debet', 1, '1819181', '', '2018-09-12 07:17:22', 0),
(387, '', 210000, 'Debet', 1, '1819269', '', '2018-09-12 07:18:04', 0),
(388, '', 210000, 'Debet', 1, '1819236', '', '2018-09-12 07:19:59', 0),
(389, '', 210000, 'Debet', 1, '1819215', '', '2018-09-12 07:20:38', 0),
(390, '', 210000, 'Debet', 1, '1819034', '', '2018-09-12 07:21:17', 0),
(391, '', 110000, 'Debet', 1, '1819115', '', '2018-09-12 07:21:58', 0),
(392, '', 50000, 'Debet', 1, '1819186', '', '2018-09-12 07:22:38', 0),
(393, '', 420000, 'Debet', 1, '1819272', '', '2018-09-12 07:24:11', 0),
(394, '', 210000, 'Debet', 1, '1819140', '', '2018-09-12 07:24:49', 0),
(395, '', 50000, 'Debet', 1, '1819200', '', '2018-09-12 07:28:53', 0),
(396, '', 210000, 'Debet', 1, '1819189', '', '2018-09-12 07:32:18', 0),
(397, 'Iuran Harian', 200000, 'Debet', 1, '1819234', '', '2018-09-12 07:38:03', 0),
(398, '', 200000, 'Debet', 1, '1819013', '', '2018-09-12 07:53:12', 0),
(399, '', 210000, 'Debet', 1, '1819306', '', '2018-09-12 07:56:23', 0),
(400, 'Iuran Harian', 200000, 'Debet', 1, '1819190', '', '2018-09-12 08:19:30', 0),
(401, 'Iuran Harian', 420000, 'Debet', 1, '1819163', '', '2018-09-12 08:20:46', 0),
(402, 'Iuran Harian', 7000, 'Debet', 1, '1819176', '', '2018-09-12 08:26:19', 0),
(403, 'Iuran Harian', 210000, 'Debet', 1, '1819325', '', '2018-09-12 08:39:25', 0),
(404, 'Iuran Harian', 200000, 'Debet', 1, '1819154', '', '2018-09-12 08:40:59', 0),
(405, 'Iuran Harian', 200000, 'Debet', 1, '1819218', '', '2018-09-12 08:50:05', 0),
(406, 'Iuran Harian', 630000, 'Debet', 1, '1819333', '', '2018-09-12 09:05:59', 0),
(407, 'Iuran Harian', 500000, 'Debet', 1, '1819345', '', '2018-09-12 09:33:29', 0),
(408, 'Iuran Harian', 685000, 'Debet', 1, '1819202', '', '2018-09-12 09:45:09', 0),
(409, 'Iuran Harian', 475000, 'Debet', 1, '1819022', '', '2018-09-12 09:49:09', 0),
(410, 'Iuran Harian', 250000, 'Debet', 1, '1819070', '', '2018-09-12 10:22:13', 0),
(411, 'Iuran Harian', 210000, 'Debet', 1, '1819292', '', '2018-09-12 10:52:09', 0),
(412, 'Iuran Harian', 210000, 'Debet', 1, '1819046', '', '2018-09-12 11:44:55', 0),
(413, 'Iuran Harian', 14000, 'Debet', 1, '1819237', '', '2018-09-12 12:06:20', 0),
(414, 'Iuran Harian', 100000, 'Debet', 1, '1819339', '', '2018-09-12 12:07:23', 0),
(415, 'Iuran Harian', 50000, 'Debet', 1, '1819313', '', '2018-09-12 12:57:07', 0),
(416, '', 420000, 'Debet', 1, '1819262', '', '2018-09-13 07:05:10', 0),
(417, '', 400000, 'Debet', 1, '1819031', '', '2018-09-13 07:10:31', 0),
(418, '', 110000, 'Debet', 1, '1819068', '', '2018-09-13 07:14:13', 0),
(419, '', 250000, 'Debet', 1, '1819293', '', '2018-09-13 07:16:36', 0),
(420, '', 420000, 'Debet', 1, '1819072', '', '2018-09-13 07:19:03', 0),
(421, '', 100000, 'Debet', 1, '1819142', '', '2018-09-13 07:21:53', 0),
(422, 'Iuran Sekolah', 400000, 'Debet', 1, '1819322', '', '2018-09-13 07:44:52', 0),
(423, 'Iuran Sekolah', 400000, 'Debet', 1, '1819231', '', '2018-09-13 07:47:14', 0),
(424, '', 50000, 'Debet', 1, '1819273', '', '2018-09-13 08:16:20', 0),
(425, 'Iuran Sekolah', 110000, 'Debet', 1, '1819066', '', '2018-09-13 08:43:23', 0),
(426, 'Iuran Sekolah', 100000, 'Debet', 1, '1819066', '', '2018-09-13 08:44:07', 0),
(427, 'Iuran Sekolah', 50000, 'Debet', 1, '1819157', '', '2018-09-13 08:44:48', 0),
(428, 'Iuran Sekolah', 190000, 'Debet', 1, '1819119', '', '2018-09-13 09:03:49', 0),
(429, 'Iuran Sekolah', 210000, 'Debet', 1, '1819192', '', '2018-09-13 09:04:32', 0),
(430, 'Iuran Sekolah', 210000, 'Debet', 1, '1819086', '', '2018-09-13 09:23:00', 0),
(431, 'Iuran Sekolah', 630000, 'Debet', 1, '1819302', '', '2018-09-13 09:53:08', 0),
(432, 'Iuran Sekolah', 210000, 'Debet', 1, '1819052', '', '2018-09-13 10:13:00', 0),
(433, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2018-09-13 10:17:20', 0),
(434, '', 420000, 'Debet', 1, '1819136', '', '2018-09-13 10:45:26', 0),
(435, 'Iuran Sekolah', 14000, 'Debet', 1, '1819237', '', '2018-09-13 12:07:49', 0),
(436, 'Iuran Sekolah', 150000, 'Debet', 1, '1819337', '', '2018-09-13 12:14:05', 0),
(437, 'Iuran Sekolah', 210000, 'Debet', 1, '1819088', '', '2018-09-13 12:15:25', 0),
(438, 'Iuran Sekolah', 50000, 'Debet', 1, '1819318', '', '2018-09-13 12:24:13', 0),
(439, '', 130000, 'Debet', 1, '1819159', '', '2018-09-14 06:50:56', 0),
(440, '', 120000, 'Debet', 1, '1819206', '', '2018-09-14 07:04:24', 0),
(441, '', 200000, 'Debet', 1, '1819274', '', '2018-09-14 07:10:31', 0),
(442, '', 210000, 'Debet', 1, '1819131', '', '2018-09-14 08:20:52', 0),
(443, 'Iuran Sekolah', 420000, 'Debet', 1, '1819326', '', '2018-09-14 08:26:22', 0),
(444, 'Iuran Sekolah', 210000, 'Debet', 1, '1819291', '', '2018-09-14 08:27:36', 0),
(445, 'Iuran Sekolah', 210000, 'Debet', 1, '1819169', '', '2018-09-14 08:28:13', 0),
(446, 'Iuran Sekolah', 310000, 'Debet', 1, '1819300', '', '2018-09-14 08:29:08', 0),
(447, 'Iuran Sekolah', 210000, 'Debet', 1, '1819008', '', '2018-09-14 08:36:42', 0),
(448, 'Iuran Sekolah', 200000, 'Debet', 1, '1819092', '', '2018-09-14 08:58:44', 0),
(449, 'Iuran Sekolah', 420000, 'Debet', 1, '1819226', '', '2018-09-14 09:01:39', 0),
(450, 'Iuran Sekolah', 100000, 'Debet', 1, '1819286', '', '2018-09-14 09:03:45', 0),
(451, '', 55000, 'Debet', 1, '1819294', '', '2018-09-14 10:12:30', 0),
(452, 'Iuran Sekolah', 100000, 'Debet', 1, '1819338', '', '2018-09-14 11:23:32', 0),
(453, 'Iuran Sekolah', 420, 'Debet', 1, '1819009', '', '2018-09-14 15:18:40', 0),
(454, '', 250000, 'Debet', 1, '1819004', '', '2018-09-14 16:35:51', 0),
(455, '', 210000, 'Debet', 1, '1819198', '', '2018-09-15 07:07:08', 0),
(456, '', 420000, 'Debet', 1, '1819243', '', '2018-09-15 07:09:13', 0),
(457, '', 300000, 'Debet', 1, '1819240', '', '2018-09-15 07:11:55', 0),
(458, '', 320000, 'Debet', 1, '1819264', '', '2018-09-15 07:16:15', 0),
(459, '', 210000, 'Debet', 1, '1819042', '', '2018-09-15 07:17:50', 0),
(460, '', 50000, 'Debet', 1, '1819182', '', '2018-09-15 07:18:31', 0),
(461, '', 560000, 'Debet', 1, '1819317', '', '2018-09-15 07:19:24', 0),
(462, '', 42000, 'Debet', 1, '1819091', '', '2018-09-15 07:20:31', 0),
(463, '', 210000, 'Debet', 1, '1819060', '', '2018-09-15 07:21:30', 0),
(464, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2018-09-15 07:40:27', 0),
(465, 'Iuran Sekolah', 210000, 'Debet', 1, '1819303', '', '2018-09-15 07:58:51', 0),
(466, 'Iuran Sekolah', 210000, 'Debet', 1, '1819036', '', '2018-09-15 08:01:17', 0),
(467, 'Iuran Sekolah', 210000, 'Debet', 1, '1819096', '', '2018-09-15 08:23:21', 0),
(468, 'Iuran Sekolah', 100000, 'Debet', 1, '1819064', '', '2018-09-15 08:39:28', 0),
(469, 'Iuran Sekolah', 200000, 'Debet', 1, '1819258', '', '2018-09-15 09:36:26', 0),
(470, 'Iuran Sekolah', 210000, 'Debet', 1, '1819158', '', '2018-09-15 09:37:50', 0),
(471, 'Iuran Sekolah', 210000, 'Debet', 1, '1819132', '', '2018-09-15 09:46:01', 0),
(472, 'Iuran Sekolah', 100000, 'Debet', 1, '1819152', '', '2018-09-15 09:53:37', 0),
(473, 'Iuran Sekolah', 50000, 'Debet', 1, '1819040', '', '2018-09-15 09:59:15', 0),
(474, 'Iuran Sekolah', 7000, 'Debet', 1, '1819082', '', '2018-09-15 10:02:52', 0),
(475, 'Iuran Sekolah', 200000, 'Debet', 1, '1819248', '', '2018-09-15 10:09:35', 0),
(476, 'Iuran Sekolah', 100000, 'Debet', 1, '1819125', '', '2018-09-15 10:16:55', 0),
(477, 'Iuran Sekolah', 14000, 'Debet', 1, '1819237', '', '2018-09-15 12:09:34', 0),
(478, 'Iuran Sekolah', 210000, 'Debet', 1, '1819297', '', '2018-09-15 12:10:53', 0),
(479, 'Iuran Sekolah', 100000, 'Debet', 1, '1819338', '', '2018-09-15 12:13:10', 0),
(480, 'Iuran Sekolah', 210000, 'Debet', 1, '1819285', '', '2018-09-15 12:29:30', 0),
(481, 'Iuran Sekolah', 50000, 'Debet', 1, '1819275', '', '2018-09-15 12:32:46', 0),
(482, 'Iuran Sekolah', 210000, 'Debet', 1, '1819126', '', '2018-09-15 12:35:34', 0),
(483, 'Iuran Sekolah', 150000, 'Debet', 1, '1819319', '', '2018-09-15 12:51:27', 0),
(484, '', 100000, 'Debet', 1, '1819201', '', '2018-09-15 12:53:52', 0),
(485, 'Iuran Sekolah', 30000, 'Debet', 1, '1819201', '', '2018-09-15 12:55:09', 0),
(486, 'Iuran Sekolah', 210000, 'Debet', 1, '1819112', '', '2018-09-15 12:59:17', 0),
(487, 'Iuran Sekolah', 210000, 'Debet', 1, '1819208', '', '2018-09-15 13:09:56', 0),
(488, 'Iuran Sekolah', 420000, 'Debet', 1, '1819002', '', '2018-09-15 14:26:18', 0),
(489, 'Iuran Sekolah', 419580, 'Debet', 1, '1819009', '', '2018-09-15 14:37:22', 0),
(490, '', 210000, 'Debet', 1, '1819053', '', '2018-09-16 10:25:40', 0),
(491, '', 210000, 'Debet', 1, '1819227', '', '2018-09-16 10:26:28', 0),
(492, '', 210000, 'Debet', 1, '1819307', '', '2018-09-17 06:25:55', 0),
(493, '', 420000, 'Debet', 1, '1819307', '', '2018-09-17 06:26:43', 0),
(494, '', 210000, 'Debet', 1, '1819067', '', '2018-09-17 06:30:07', 0),
(495, '', 240000, 'Debet', 1, '1819147', '', '2018-09-17 06:31:17', 0),
(497, '', 170000, 'Debet', 1, '1819148', '', '2018-09-17 06:34:08', 0),
(498, '', 210000, 'Debet', 1, '1819025', '', '2018-09-17 06:35:06', 0),
(499, '', 210000, 'Debet', 1, '1819215', '', '2018-09-17 06:35:59', 0),
(500, '', 210000, 'Debet', 1, '1819123', '', '2018-09-17 06:36:41', 0),
(501, '', 210000, 'Debet', 1, '1819155', '', '2018-09-17 06:37:22', 0),
(502, 'iuran sekolah', 50000, 'Debet', 1, '1819313', '', '2018-09-17 06:42:29', 0),
(503, 'iuran sekolah', 100000, 'Debet', 1, '1819284', '', '2018-09-17 06:43:37', 0),
(504, 'iuran sekolah', 210000, 'Debet', 1, '1819266', '', '2018-09-17 06:44:41', 0),
(505, 'iuran sekolah', 630000, 'Debet', 1, '1819228', '', '2018-09-17 06:45:52', 0),
(506, 'iuran sekolah', 210000, 'Debet', 1, '1819058', '', '2018-09-17 06:46:45', 0),
(507, 'iuran sekolah', 400000, 'Debet', 1, '1819197', '', '2018-09-17 06:47:37', 0),
(508, 'iuran sekolah', 200000, 'Debet', 1, '1819179', '', '2018-09-17 06:53:04', 0),
(509, 'iuran sekolah', 320000, 'Debet', 1, '1819223', '', '2018-09-17 06:54:05', 0),
(510, 'iuran sekolah', 210000, 'Debet', 1, '1819114', '', '2018-09-17 06:55:18', 0),
(511, 'iuran sekolah', 210000, 'Debet', 1, '1819015', '', '2018-09-17 06:57:29', 0),
(512, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-09-17 06:59:08', 0),
(513, '', 100000, 'Debet', 1, '1819104', '', '2018-09-17 07:00:13', 0),
(514, 'iuran sekolah', 100000, 'Debet', 1, '1819018', '', '2018-09-17 07:01:53', 0),
(515, 'iuran sekolah', 420000, 'Debet', 1, '1819108', '', '2018-09-17 07:02:35', 0),
(516, 'iuran sekolah', 210000, 'Debet', 1, '1819330', '', '2018-09-17 07:03:51', 0),
(517, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2018-09-17 07:04:51', 0),
(518, 'iuran sekolah', 200000, 'Debet', 1, '1819278', '', '2018-09-17 07:05:37', 0),
(519, 'iuran sekolah', 50000, 'Debet', 1, '1819249', '', '2018-09-17 07:07:00', 0),
(520, 'iuran sekolah', 400000, 'Debet', 1, '1819165', '', '2018-09-17 07:08:01', 0),
(521, 'iuran sekolah', 420000, 'Debet', 1, '1819049', '', '2018-09-17 07:09:49', 0),
(522, 'iuran sekolah', 200000, 'Debet', 1, '1819267', '', '2018-09-17 07:12:16', 0),
(523, 'iuran sekolah', 55000, 'Debet', 1, '1819222', '', '2018-09-17 07:13:39', 0),
(524, 'iuran sekolah', 200000, 'Debet', 1, '1819242', '', '2018-09-17 07:18:35', 0),
(525, 'iuran sekolah', 200000, 'Debet', 1, '1819059', '', '2018-09-17 07:20:30', 0),
(526, 'iuran sekolah', 420000, 'Debet', 1, '1819265', '', '2018-09-17 07:21:38', 0),
(527, 'iuran sekolah', 250000, 'Debet', 1, '1819239', '', '2018-09-17 07:22:54', 0),
(528, 'iuran sekolah', 200000, 'Debet', 1, '1819256', '', '2018-09-17 07:24:49', 0),
(529, 'iuran sekolah', 50000, 'Debet', 1, '1819211', '', '2018-09-17 07:28:14', 0),
(530, 'iuran sekolah', 500000, 'Debet', 1, '1819016', '', '2018-09-17 08:34:38', 0),
(531, 'iuran sekolah', 100000, 'Debet', 1, '1819138', '', '2018-09-17 09:28:38', 0),
(532, 'iuran sekolah', 50000, 'Debet', 1, '1819322', '', '2018-09-17 09:29:27', 0),
(533, 'iuran sekolah', 100000, 'Debet', 1, '1819011', '', '2018-09-17 09:32:15', 0),
(534, 'iuran sekolah', 500000, 'Debet', 1, '1819201', '', '2018-09-17 09:33:19', 0),
(535, 'iuran sekolah', 210000, 'Debet', 1, '1819130', '', '2018-09-17 09:34:23', 0),
(536, 'iuran sekolah', 100000, 'Debet', 1, '1819253', '', '2018-09-17 09:35:05', 0),
(537, 'iuran sekolah', 210000, 'Debet', 1, '1819122', '', '2018-09-17 09:41:46', 0),
(538, 'iuran sekolah', 100000, 'Debet', 1, '1819273', '', '2018-09-17 09:44:12', 0),
(539, 'iuran sekolah', 420000, 'Debet', 1, '1819109', '', '2018-09-17 09:47:34', 0),
(540, 'iuran sekolah', 300000, 'Debet', 1, '1819094', '', '2018-09-17 09:48:40', 0),
(541, '', 210000, 'Debet', 1, '1819252', '', '2018-09-17 09:52:49', 0),
(542, 'iuran sekolah', 150000, 'Debet', 1, '1819121', '', '2018-09-17 09:55:08', 0),
(543, 'iuran sekolah', 150000, 'Debet', 1, '1819003', '', '2018-09-17 09:56:04', 0),
(544, 'iuran sekolah', 420000, 'Debet', 1, '1819221', '', '2018-09-17 09:57:54', 0),
(545, 'iuran sekolah', 100000, 'Debet', 1, '1819050', '', '2018-09-17 09:58:48', 0),
(546, 'iuran sekolah', 210000, 'Debet', 1, '1819119', '', '2018-09-17 09:59:59', 0),
(547, 'iuran sekolah', 150000, 'Debet', 1, '1819071', '', '2018-09-17 10:01:58', 0),
(548, 'iuran sekolah', 100000, 'Debet', 1, '1819220', '', '2018-09-17 10:03:09', 0),
(549, 'iuran sekolah', 420000, 'Debet', 1, '1819043', '', '2018-09-17 11:06:11', 0),
(550, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-09-17 11:07:35', 0),
(551, 'iuran sekolah', 420000, 'Debet', 1, '1819213', '', '2018-09-17 11:11:34', 0),
(553, '', 200000, 'Debet', 1, '1819255', '', '2018-09-17 12:29:20', 0),
(554, '', 100000, 'Debet', 1, '1819170', '', '2018-09-17 13:27:16', 0),
(555, 'Iuran Sekolah', 420000, 'Debet', 1, '1819171', '', '2018-09-17 15:08:20', 0),
(556, '', 210000, 'Debet', 1, '1819199', '', '2018-09-18 07:14:14', 0),
(557, '', 420000, 'Debet', 1, '1819346', '', '2018-09-18 08:01:21', 0),
(558, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819174', '', '2018-09-18 08:41:30', 0),
(559, '', 7000, 'Debet', 1, '1819111', '', '2018-09-18 09:36:36', 0),
(560, '', 50000, 'Debet', 1, '1819206', '', '2018-09-18 10:05:02', 0),
(561, 'IURAN SEKOLAH', 12000, 'Debet', 1, '1819237', '', '2018-09-18 10:54:12', 0),
(562, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819026', '', '2018-09-18 10:55:29', 0),
(563, '', 210000, 'Debet', 1, '1819081', '', '2018-09-19 09:54:06', 0),
(564, 'IURAN SEKOLAH', 7000, 'Debet', 1, '1819176', '', '2018-09-20 08:11:05', 0),
(565, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819087', '', '2018-09-20 08:11:53', 0),
(566, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819037', '', '2018-09-20 10:22:46', 0),
(567, 'IURAN SEKOLAH', 21000, 'Debet', 1, '1819091', '', '2018-09-20 10:23:36', 0),
(568, 'IURAN SEKOLAH', 14000, 'Debet', 1, '1819237', '', '2018-09-20 10:24:34', 0),
(569, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819254', '', '2018-09-20 10:25:45', 0),
(570, 'IURAN SEKOLAH', 330000, 'Debet', 1, '1819124', '', '2018-09-21 07:45:35', 0),
(571, '', 50000, 'Debet', 1, '1819186', '', '2018-09-21 09:06:26', 0),
(572, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819133', '', '2018-09-22 07:45:27', 0),
(573, '', 210000, 'Debet', 1, '1819054', '', '2018-09-22 07:48:19', 0),
(574, 'IURAN SEKOLAH', 630000, 'Debet', 1, '1819012', '', '2018-09-22 09:58:18', 0),
(575, '', 420000, 'Debet', 1, '1819161', '', '2018-09-22 11:22:23', 0),
(576, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819211', '', '2018-09-24 08:46:48', 0),
(577, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819206', '', '2018-09-24 08:49:30', 0),
(578, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819313', '', '2018-09-24 08:50:25', 0),
(579, 'IURAN SEKOLAH', 40000, 'Debet', 1, '1819182', '', '2018-09-24 08:51:38', 0),
(580, 'IURAN SEKOLAH', 7000, 'Debet', 1, '1819176', '', '2018-09-24 08:52:26', 0),
(581, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819079', '', '2018-09-24 08:53:12', 0),
(582, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819234', '', '2018-09-24 08:54:20', 0),
(583, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819200', '', '2018-09-24 08:55:34', 0),
(584, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819051', '', '2018-09-24 08:56:48', 0),
(585, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819275', '', '2018-09-24 08:57:35', 0),
(586, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819138', '', '2018-09-24 09:19:08', 0),
(587, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819322', '', '2018-09-24 09:20:35', 0),
(588, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819157', '', '2018-09-24 10:26:50', 0),
(589, 'IURAN SEKOLAH', 20000, 'Debet', 1, '1819237', '', '2018-09-24 12:13:56', 0),
(590, 'IURAN SEKOLAH', 130000, 'Debet', 1, '1819233', '', '2018-09-25 07:22:47', 0),
(591, 'IURAN SEKOLAH', 300000, 'Debet', 1, '1819336', '', '2018-09-25 08:17:50', 0),
(592, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819315', '', '2018-09-25 09:03:20', 0),
(593, 'IURAN SEKOLAH', 7000, 'Debet', 1, '1819176', '', '2018-09-25 10:31:10', 0),
(594, '', 50000, 'Debet', 1, '1819244', '', '2018-09-26 07:12:13', 0),
(595, 'IURAN SEKOLAH', 250000, 'Debet', 1, '1819071', '', '2018-09-26 10:36:09', 0),
(596, 'IURAN SEKOLAH', 20000, 'Debet', 1, '1819237', '', '2018-09-26 11:56:53', 0),
(597, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819120', '', '2018-09-27 07:33:35', 0),
(598, '', 630000, 'Debet', 1, '1819305', '', '2018-09-27 07:53:52', 0),
(599, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819180', '', '2018-09-27 09:48:18', 0),
(600, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819023', '', '2018-09-27 10:11:15', 0),
(601, 'Iuran Sekolah', 50000, 'Debet', 1, '1819091', '', '2018-09-28 09:24:37', 0),
(602, 'iuran sekolah', 600000, 'Debet', 1, '1819167', '', '2018-09-29 08:00:07', 0),
(603, 'iuran sekolah', 420000, 'Debet', 1, '1819110', '', '2018-09-29 10:15:56', 0),
(604, 'iuran sekolah', 210000, 'Debet', 1, '1819093', '', '2018-09-29 13:20:35', 0),
(605, 'iuran sekolah', 210000, 'Debet', 1, '1819287', '', '2018-09-29 14:59:51', 0),
(606, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2018-10-01 08:42:41', 0),
(607, 'iuran sekolah', 50000, 'Debet', 1, '1819313', '', '2018-10-01 08:44:35', 0),
(608, 'iuran sekolah', 210000, 'Debet', 1, '1819055', '', '2018-10-01 08:46:42', 0),
(610, 'iuran sekolah', 100000, 'Debet', 1, '1819299', '', '2018-10-01 08:51:38', 0),
(611, 'iuran sekolah', 50000, 'Debet', 1, '1819211', '', '2018-10-01 08:53:14', 0),
(612, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-01 08:54:41', 0),
(613, 'iuran sekolah', 50000, 'Debet', 1, '1819273', '', '2018-10-01 08:57:50', 0),
(614, '', 210000, 'Debet', 1, '1819033', '', '2018-10-02 07:08:31', 0),
(615, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819051', '', '2018-10-02 07:44:16', 0),
(616, '', 100000, 'Debet', 1, '1819119', '', '2018-10-02 07:58:09', 0),
(617, 'IURAN SEKOLAH', 420000, 'Debet', 1, '1819145', '', '2018-10-02 08:04:34', 0),
(618, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819231', '', '2018-10-02 08:54:13', 0),
(619, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819322', '', '2018-10-02 08:55:51', 0),
(620, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819229', '', '2018-10-02 09:21:48', 0),
(621, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819039', '', '2018-10-02 09:22:34', 0),
(622, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819104', '', '2018-10-02 09:25:45', 0),
(623, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819091', '', '2018-10-02 09:59:47', 0),
(624, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819034', '', '2018-10-02 10:28:59', 0),
(625, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819181', '', '2018-10-02 10:30:12', 0),
(626, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819321', '', '2018-10-02 10:32:38', 0),
(627, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2018-10-03 08:17:48', 0),
(628, 'iuran sekolah', 210000, 'Debet', 1, '1819281', '', '2018-10-03 09:59:31', 0),
(629, 'iuran sekolah', 210000, 'Debet', 1, '1819219', '', '2018-10-03 10:06:03', 0),
(630, 'iuran sekolah', 100000, 'Debet', 1, '1819186', '', '2018-10-03 11:57:52', 0),
(631, '', 210000, 'Debet', 1, '1819261', '', '2018-10-04 07:14:50', 0),
(632, '', 200000, 'Debet', 1, '1819286', '', '2018-10-04 07:27:25', 0),
(633, 'iuran sekolah', 195000, 'Debet', 1, '1819267', '', '2018-10-04 08:34:55', 0),
(634, '', 150000, 'Debet', 1, '1819183', '', '2018-10-04 09:11:56', 0),
(635, 'iuran sekolah', 200000, 'Debet', 1, '1819283', '', '2018-10-04 09:34:22', 0),
(636, 'iuran sekolah', 100000, 'Debet', 1, '1819090', '', '2018-10-04 09:43:39', 0),
(637, 'iuran sekolah', 210000, 'Debet', 1, '1819296', '', '2018-10-04 09:53:20', 0),
(638, 'iuran sekolah', 150000, 'Debet', 1, '1819121', '', '2018-10-04 10:24:47', 0),
(639, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-04 12:02:48', 0),
(640, '', 100000, 'Debet', 1, '1819154', '', '2018-10-05 07:21:25', 0),
(641, '', 170000, 'Debet', 1, '1819066', '', '2018-10-05 07:25:03', 0),
(642, 'iuran sekolah', 210000, 'Debet', 1, '1819130', '', '2018-10-05 07:52:52', 0),
(643, 'iuran sekolah', 105000, 'Debet', 1, '1819145', '', '2018-10-05 08:55:01', 0),
(644, 'iuran sekolah', 210000, 'Debet', 1, '1819316', '', '2018-10-05 09:32:26', 0),
(645, 'iuran sekolah', 250000, 'Debet', 1, '1819271', '', '2018-10-05 09:34:03', 0),
(646, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-05 11:14:44', 0),
(647, '', 168000, 'Debet', 1, '1819149', '', '2018-10-06 07:47:56', 0),
(648, 'iuran sekolah', 210000, 'Debet', 1, '1819224', '', '2018-10-06 08:20:48', 0),
(649, 'iuran sekolah', 100000, 'Debet', 1, '1819198', '', '2018-10-06 08:49:38', 0),
(650, 'iuran sekolah', 100000, 'Debet', 1, '1819309', '', '2018-10-08 07:53:45', 0),
(651, 'iuran sekolah', 210000, 'Debet', 1, '1819291', '', '2018-10-08 07:56:03', 0),
(652, 'iuran sekolah', 210000, 'Debet', 1, '1819150', '', '2018-10-08 07:56:54', 0),
(653, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-10-08 07:57:42', 0),
(654, 'iuran sekolah', 200000, 'Debet', 1, '1819107', '', '2018-10-08 07:58:24', 0),
(655, 'iuran sekolah', 400000, 'Debet', 1, '1819019', '', '2018-10-08 08:01:55', 0),
(656, 'iuran sekolah', 210000, 'Debet', 1, '1819207', '', '2018-10-08 08:08:49', 0),
(657, 'iuran sekolah', 100000, 'Debet', 1, '1819157', '', '2018-10-08 08:10:26', 0),
(658, 'iuran sekolah', 210000, 'Debet', 1, '1819057', '', '2018-10-08 09:18:21', 0),
(659, 'iuran sekolah', 210000, 'Debet', 1, '1819230', '', '2018-10-08 10:31:50', 0),
(660, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-10-08 12:28:01', 0),
(661, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-08 12:28:46', 0),
(662, '', 50000, 'Debet', 1, '1819200', '', '2018-10-09 07:20:33', 0),
(663, '', 210000, 'Debet', 1, '1819032', '', '2018-10-09 07:26:02', 0),
(664, 'iuran sekolah', 150000, 'Debet', 1, '1819128', '', '2018-10-09 08:12:13', 0),
(665, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-10-09 08:32:14', 0),
(666, '', 40000, 'Debet', 1, '1819182', '', '2018-10-09 08:44:47', 0),
(667, 'iuran sekolah', 110000, 'Debet', 1, '1819119', '', '2018-10-09 09:58:04', 0),
(668, 'iuran sekolah', 210000, 'Debet', 1, '1819325', '', '2018-10-09 10:28:30', 0),
(669, 'iuran sekolah', 100000, 'Debet', 1, '1819115', '', '2018-10-09 10:32:47', 0),
(670, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-10-09 11:58:35', 0),
(671, 'iuran sekolah', 15000, 'Debet', 1, '1819237', '', '2018-10-09 11:59:26', 0),
(672, 'iuran sekolah', 200000, 'Debet', 1, '1819102', '', '2018-10-10 07:42:36', 0),
(673, 'iuran sekolah', 100000, 'Debet', 1, '1819068', '', '2018-10-10 08:10:28', 0),
(674, '', 100000, 'Debet', 1, '1819064', '', '2018-10-10 08:29:02', 0),
(675, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2018-10-10 10:01:22', 0),
(676, '', 210000, 'Debet', 1, '1819269', '', '2018-10-11 07:04:25', 0),
(677, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-10-11 08:28:13', 0),
(678, 'iuran sekolah', 200000, 'Debet', 1, '1819048', '', '2018-10-11 08:29:05', 0),
(679, 'iuran sekolah', 210000, 'Debet', 1, '1819260', '', '2018-10-11 09:46:22', 0),
(680, 'iuran sekolah', 200000, 'Debet', 1, '1819336', '', '2018-10-11 09:47:17', 0),
(681, 'iuran sekolah', 200000, 'Debet', 1, '1819336', '', '2018-10-12 07:05:51', 0),
(682, 'iuran sekolah', 210000, 'Debet', 1, '1819173', '', '2018-10-12 07:07:11', 0),
(683, 'iuran sekolah', 50000, 'Debet', 1, '1819273', '', '2018-10-12 07:44:41', 0),
(684, 'iuran sekolah', 50000, 'Debet', 1, '1819104', '', '2018-10-12 10:54:59', 0),
(685, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-12 11:20:09', 0),
(686, 'iuran sekolah', 100000, 'Debet', 1, '1819233', '', '2018-10-12 11:22:42', 0),
(687, 'iuran sekolah', 210000, 'Debet', 1, '1819027', '', '2018-10-12 11:23:51', 0),
(688, 'iuran sekolah', 210000, 'Debet', 1, '1819175', '', '2018-10-13 08:44:53', 0),
(689, 'iuran sekolah', 210000, 'Debet', 1, '1819012', '', '2018-10-13 08:48:12', 0),
(690, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-10-13 10:19:22', 0);
INSERT INTO `transaction` (`transaction_id`, `transaction_name`, `transaction_amount`, `transaction_type`, `sekolah_id`, `user_nisn`, `user_nik`, `transaction_datetime`, `kelas_id`) VALUES
(691, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-10-15 07:41:44', 0),
(692, 'iuran sekolah', 200000, 'Debet', 1, '1819315', '', '2018-10-15 07:42:31', 0),
(693, 'iuran sekolah', 50000, 'Debet', 1, '1819313', '', '2018-10-15 07:43:53', 0),
(694, 'iuran sekolah', 210000, 'Debet', 1, '1819118', '', '2018-10-15 07:45:07', 0),
(695, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2018-10-15 07:46:12', 0),
(696, 'iuran sekolah', 210000, 'Debet', 1, '1819252', '', '2018-10-15 07:48:52', 0),
(697, 'iuran sekolah', 210000, 'Debet', 1, '1819067', '', '2018-10-15 07:50:13', 0),
(698, 'iuran sekolah', 100000, 'Debet', 1, '1819125', '', '2018-10-15 07:51:31', 0),
(699, '', 210000, 'Debet', 1, '1819169', '', '2018-10-15 07:55:30', 0),
(700, 'iuran sekolah', 500000, 'Debet', 1, '1819274', '', '2018-10-15 08:01:37', 0),
(701, 'iuran sekolah', 100000, 'Debet', 1, '1819211', '', '2018-10-15 08:03:47', 0),
(702, 'iuran sekolah', 210000, 'Debet', 1, '1819086', '', '2018-10-15 08:07:58', 0),
(703, 'iuran sekolah', 210000, 'Debet', 1, '1819081', '', '2018-10-15 13:08:59', 0),
(704, '', 40000, 'Debet', 1, '1819182', '', '2018-10-16 07:05:32', 0),
(705, '', 40000, 'Debet', 1, '1819182', '', '2018-10-16 07:11:33', 0),
(706, 'iuran sekolah', 210000, 'Debet', 1, '1819199', '', '2018-10-16 07:12:46', 0),
(707, 'iuran sekolah', 210000, 'Debet', 1, '1819298', '', '2018-10-16 07:34:29', 0),
(708, 'iuran sekolah', 210000, 'Debet', 1, '1819046', '', '2018-10-16 09:31:01', 0),
(709, 'iuran sekolah', 210000, 'Debet', 1, '1819214', '', '2018-10-16 10:48:28', 0),
(710, 'iuran sekolah', 300000, 'Debet', 1, '1819318', '', '2018-10-16 11:36:31', 0),
(711, 'iuran sekolah', 110000, 'Debet', 1, '1819115', '', '2018-10-16 11:52:15', 0),
(712, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-10-16 11:56:26', 0),
(713, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-16 11:57:15', 0),
(714, 'iuran sekolah', 210000, 'Debet', 1, '1819297', '', '2018-10-16 11:58:32', 0),
(715, 'iuran sekolah', 210000, 'Debet', 1, '1819007', '', '2018-10-16 11:59:31', 0),
(716, 'iuran sekolah', 210000, 'Debet', 1, '1819007', '', '2018-10-16 12:00:25', 0),
(717, 'iuran harian', 50000, 'Debet', 1, '1819206', '', '2018-10-17 08:20:02', 0),
(718, 'iuran harian', 100000, 'Debet', 1, '1819087', '', '2018-10-17 08:32:46', 0),
(719, 'iuran harian', 210000, 'Debet', 1, '1819088', '', '2018-10-17 09:44:01', 0),
(720, 'iuran harian', 210000, 'Debet', 1, '1819192', '', '2018-10-17 11:01:05', 0),
(721, 'iuran harian', 210000, 'Debet', 1, '1819292', '', '2018-10-18 09:42:55', 0),
(722, 'iuran harian', 420000, 'Debet', 1, '1819174', '', '2018-10-18 10:00:23', 0),
(723, 'iuran sekolah', 100000, 'Debet', 1, '1819068', '', '2018-10-19 08:27:44', 0),
(724, 'iuran sekolah', 210000, 'Debet', 1, '1819277', '', '2018-10-19 08:30:05', 0),
(725, '', 20000, 'Debet', 1, '1819237', '', '2018-10-19 11:19:40', 0),
(726, '', 10000, 'Debet', 1, '1819338', '', '2018-10-19 11:20:17', 0),
(727, 'iuran sekolah', 210000, 'Debet', 1, '1819213', '', '2018-10-20 08:54:59', 0),
(728, 'iuran sekolah', 50000, 'Debet', 1, '1819094', '', '2018-10-20 09:48:18', 0),
(729, 'iuran sekolah', 100000, 'Debet', 1, '1819114', '', '2018-10-20 10:23:46', 0),
(730, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-20 11:45:22', 0),
(731, '', 20000, 'Debet', 1, '1819094', '', '2018-10-22 08:32:40', 0),
(732, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2018-10-22 08:37:47', 0),
(733, 'iuran sekolah', 50000, 'Debet', 1, '1819313', '', '2018-10-22 08:39:22', 0),
(734, '', 50000, 'Debet', 1, '1819051', '', '2018-10-22 09:35:11', 0),
(735, '', 105000, 'Debet', 1, '1819145', '', '2018-10-22 09:36:03', 0),
(736, '', 100000, 'Debet', 1, '1819285', '', '2018-10-22 09:39:08', 0),
(737, '', 200000, 'Debet', 1, '1819042', '', '2018-10-22 12:24:43', 0),
(738, 'iuran sekolah', 210000, 'Debet', 1, '1819243', '', '2018-10-22 12:31:46', 0),
(739, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2018-10-23 07:43:07', 0),
(740, 'iuran sekolah', 210000, 'Debet', 1, '1819034', '', '2018-10-23 07:49:12', 0),
(741, 'iuran sekolah', 400000, 'Debet', 1, '1819019', '', '2018-10-23 07:50:49', 0),
(742, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-10-23 08:08:56', 0),
(743, 'iuran sekolah', 210000, 'Debet', 1, '1819330', '', '2018-10-23 08:26:36', 0),
(744, 'iuran sekolah', 210000, 'Debet', 1, '1819108', '', '2018-10-23 08:44:49', 0),
(745, 'iuran sekolah', 50000, 'Debet', 1, '1819040', '', '2018-10-23 08:45:29', 0),
(746, 'iuran sekolah', 100000, 'Debet', 1, '1819242', '', '2018-10-23 08:46:12', 0),
(747, 'iuran sekolah', 50000, 'Debet', 1, '1819157', '', '2018-10-23 08:51:39', 0),
(748, 'iuran sekolah', 60000, 'Debet', 1, '1819104', '', '2018-10-23 09:07:23', 0),
(749, 'iuran sekolah', 210000, 'Debet', 1, '1819058', '', '2018-10-24 07:42:02', 0),
(750, 'iuran sekolah', 450000, 'Debet', 1, '1819339', '', '2018-10-24 07:44:18', 0),
(751, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-10-24 08:32:28', 0),
(752, 'iuran sekolah', 100000, 'Debet', 1, '1819265', '', '2018-10-24 08:37:57', 0),
(753, 'iuran sekolah', 210000, 'Debet', 1, '1819205', '', '2018-10-24 09:24:52', 0),
(754, 'iuran sekolah', 100000, 'Debet', 1, '1819115', '', '2018-10-24 09:44:18', 0),
(755, 'iuran sekolah', 765000, 'Debet', 1, '1819148', '', '2018-10-24 10:09:14', 0),
(756, 'iuran sekolah', 210000, 'Debet', 1, '1819139', '', '2018-10-24 11:50:29', 0),
(757, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-24 11:53:45', 0),
(758, 'iuran sekolah', 10000, 'Debet', 1, '1819338', '', '2018-10-24 11:54:25', 0),
(759, 'iuran sekolah', 50000, 'Debet', 1, '1819090', '', '2018-10-25 12:01:32', 0),
(760, 'iuran sekolah', 100000, 'Debet', 1, '1819043', '', '2018-10-25 12:03:43', 0),
(761, 'iuran sekolah', 200000, 'Debet', 1, '1819015', '', '2018-10-26 08:21:05', 0),
(762, 'iuran sekolah', 210000, 'Debet', 1, '1819076', '', '2018-10-26 08:29:54', 0),
(763, '', 210000, 'Debet', 1, '1819166', '', '2018-10-27 08:19:40', 0),
(764, '', 210000, 'Debet', 1, '1819290', '', '2018-10-27 08:30:16', 0),
(765, '', 200000, 'Debet', 1, '1819069', '', '2018-10-27 10:10:50', 0),
(766, 'iuran sekolah', 210000, 'Debet', 1, '1819120', '', '2018-10-27 10:58:51', 0),
(767, 'iuran sekolah', 210000, 'Debet', 1, '1819208', '', '2018-10-29 06:23:12', 0),
(768, 'iuran sekolah', 210000, 'Debet', 1, '1819266', '', '2018-10-29 08:52:41', 0),
(769, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-10-29 08:54:12', 0),
(770, 'IURAN SEKOLAH', 500000, 'Debet', 1, '1819336', '', '2018-10-29 08:56:11', 0),
(771, '', 210000, 'Debet', 1, '1819295', '', '2018-10-30 06:56:04', 0),
(772, '', 150000, 'Debet', 1, '1819025', '', '2018-10-30 07:13:23', 0),
(773, '', 210000, 'Debet', 1, '1819227', '', '2018-10-30 07:16:42', 0),
(774, '', 50000, 'Debet', 1, '1819200', '', '2018-10-30 07:31:31', 0),
(775, 'Iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-10-30 07:47:04', 0),
(776, 'Iuran sekolah', 200000, 'Debet', 1, '1819004', '', '2018-10-30 07:49:34', 0),
(777, 'Iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2018-10-30 07:59:01', 0),
(778, 'Iuran sekolah', 210000, 'Debet', 1, '1819131', '', '2018-10-30 09:33:53', 0),
(779, 'Iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2018-10-30 09:40:36', 0),
(780, 'Iuran sekolah', 110000, 'Debet', 1, '1819115', '', '2018-10-30 12:05:36', 0),
(781, 'Iuran sekolah', 100000, 'Debet', 1, '1819137', '', '2018-10-30 12:06:28', 0),
(782, 'Iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-10-30 12:07:42', 0),
(783, 'Iuran sekolah', 420000, 'Debet', 1, '1819307', '', '2018-10-30 12:08:34', 0),
(784, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2018-10-31 07:50:38', 0),
(785, 'iuran sekolah', 100000, 'Debet', 1, '1819206', '', '2018-10-31 08:06:48', 0),
(786, 'iuran sekolah', 320000, 'Debet', 1, '1819114', '', '2018-10-31 08:12:01', 0),
(787, '', 210000, 'Debet', 1, '1819183', '', '2018-10-31 10:27:12', 0),
(788, 'iuran sekolah', 210000, 'Debet', 1, '1819037', '', '2018-10-31 10:31:00', 0),
(789, 'iuran sekolah', 210000, 'Debet', 1, '1819321', '', '2018-10-31 11:29:47', 0),
(790, 'iuran sekolah', 50000, 'Debet', 1, '1819104', '', '2018-10-31 11:48:33', 0),
(791, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819053', '', '2018-11-01 07:12:16', 0),
(792, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819316', '', '2018-11-01 07:13:40', 0),
(793, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819218', '', '2018-11-01 08:07:38', 0),
(794, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819195', '', '2018-11-01 08:16:00', 0),
(795, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819085', '', '2018-11-01 08:19:14', 0),
(796, 'IURAN SEKOLAH', 420000, 'Debet', 1, '1819106', '', '2018-11-01 10:59:43', 0),
(797, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819043', '', '2018-11-01 11:37:05', 0),
(798, 'IURAN SEKOLAH', 20000, 'Debet', 1, '1819237', '', '2018-11-01 11:57:04', 0),
(799, '', 210000, 'Debet', 1, '1819279', '', '2018-11-02 07:57:10', 0),
(800, 'iuran sekolah', 210000, 'Debet', 1, '1819039', '', '2018-11-02 08:33:01', 0),
(801, 'iuran sekolah', 200000, 'Debet', 1, '1819286', '', '2018-11-02 08:52:23', 0),
(802, 'iuran sekolah', 210000, 'Debet', 1, '1819219', '', '2018-11-02 09:13:57', 0),
(803, 'iuran sekolah', 210000, 'Debet', 1, '1819291', '', '2018-11-02 09:24:04', 0),
(804, 'Iuran Sekolah', 210000, 'Debet', 1, '1819149', '', '2018-11-02 10:21:37', 0),
(805, '', 100000, 'Debet', 1, '1819233', '', '2018-11-03 07:28:18', 0),
(806, 'iuran sekolah', 210000, 'Debet', 1, '1819110', '', '2018-11-03 07:41:51', 0),
(807, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2018-11-03 07:44:52', 0),
(808, 'iuran sekolah', 100000, 'Debet', 1, '1819110', '', '2018-11-03 07:47:23', 0),
(809, 'iuran sekolah', 210000, 'Debet', 1, '1819281', '', '2018-11-03 08:09:17', 0),
(810, 'iuran sekolah', 420000, 'Debet', 1, '1819226', '', '2018-11-03 08:21:58', 0),
(811, 'iuran sekolah', 100000, 'Debet', 1, '1819299', '', '2018-11-03 08:29:23', 0),
(812, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2018-11-03 08:32:14', 0),
(813, 'iuran sekolah', 600000, 'Debet', 1, '1819288', '', '2018-11-03 09:25:18', 0),
(814, 'iuran sekolah', 420000, 'Debet', 1, '1819006', '', '2018-11-03 09:39:55', 0),
(815, 'iuran sekolah', 210000, 'Debet', 1, '1819056', '', '2018-11-03 10:11:13', 0),
(816, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2018-11-03 10:15:25', 0),
(817, 'iuran sekolah', 100000, 'Debet', 1, '1819128', '', '2018-11-03 11:26:30', 0),
(818, 'iuran sekolah', 400000, 'Debet', 1, '1819168', '', '2018-11-03 11:34:50', 0),
(819, 'iuran sekolah', 20000, 'Debet', 1, '1819338', '', '2018-11-03 12:02:06', 0),
(820, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-11-03 12:02:52', 0),
(821, '', 210000, 'Debet', 1, '1819067', '', '2018-11-05 06:58:03', 0),
(822, 'iuran sekolah', 200000, 'Debet', 1, '1819154', '', '2018-11-05 07:58:55', 0),
(823, 'iuran sekolah', 210000, 'Debet', 1, '1819057', '', '2018-11-05 07:59:42', 0),
(824, 'iuran sekolah', 210000, 'Debet', 1, '1819140', '', '2018-11-05 08:00:51', 0),
(825, 'iuran sekolah', 60000, 'Debet', 1, '1819025', '', '2018-11-05 08:02:37', 0),
(826, 'iuran sekolah', 500000, 'Debet', 1, '1819345', '', '2018-11-05 08:04:24', 0),
(827, 'iuran sekolah', 210000, 'Debet', 1, '1819287', '', '2018-11-05 08:05:28', 0),
(828, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2018-11-05 08:07:36', 0),
(829, 'iuran sekolah', 200000, 'Debet', 1, '1819019', '', '2018-11-05 08:08:44', 0),
(830, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-11-05 08:11:49', 0),
(831, 'iuran sekolah', 200000, 'Debet', 1, '1819198', '', '2018-11-05 08:13:07', 0),
(832, 'iuran sekolah', 210000, 'Debet', 1, '1819243', '', '2018-11-05 08:46:02', 0),
(833, '', 210000, 'Debet', 1, '1819098', '', '2018-11-05 09:42:42', 0),
(834, 'iuran sekolah', 150000, 'Debet', 1, '1819159', '', '2018-11-05 09:59:35', 0),
(835, 'iuran sekolah', 210000, 'Debet', 1, '1819230', '', '2018-11-05 10:16:03', 0),
(836, 'iuran sekolah', 210000, 'Debet', 1, '1819081', '', '2018-11-05 10:16:53', 0),
(837, 'iuran sekolah', 210000, 'Debet', 1, '1819079', '', '2018-11-05 10:38:19', 0),
(838, 'iuran sekolah', 400000, 'Debet', 1, '1819047', '', '2018-11-05 10:49:40', 0),
(839, 'iuran sekolah', 210000, 'Debet', 1, '1819125', '', '2018-11-05 11:05:54', 0),
(840, '', 20000, 'Debet', 1, '1819237', '', '2018-11-05 12:25:47', 0),
(841, 'iuran sekolah', 420000, 'Debet', 1, '1819008', '', '2018-11-05 12:30:27', 0),
(842, '', 210000, 'Debet', 1, '1819173', '', '2018-11-06 07:01:52', 0),
(843, '', 210000, 'Debet', 1, '1819296', '', '2018-11-06 07:05:26', 0),
(844, '', 500000, 'Debet', 1, '1819141', '', '2018-11-06 07:06:53', 0),
(845, '', 50000, 'Debet', 1, '1819200', '', '2018-11-06 07:07:46', 0),
(846, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819207', '', '2018-11-06 07:27:53', 0),
(847, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819181', '', '2018-11-06 07:50:25', 0),
(848, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819115', '', '2018-11-06 07:51:21', 0),
(849, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819196', '', '2018-11-06 08:20:54', 0),
(850, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819252', '', '2018-11-06 08:50:54', 0),
(851, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819261', '', '2018-11-06 09:42:47', 0),
(853, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819293', '', '2018-11-06 10:06:57', 0),
(855, 'IURAN SEKOLAH', 300000, 'Debet', 1, '1819310', '', '2018-11-06 10:10:06', 0),
(856, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819190', '', '2018-11-06 10:11:30', 0),
(857, 'IURAN SEKOLAH', 150000, 'Debet', 1, '1819299', '', '2018-11-06 10:13:51', 0),
(858, 'IURAN SEKOLAH', 7000, 'Debet', 1, '1819176', '', '2018-11-06 10:14:40', 0),
(859, '', 50000, 'Debet', 1, '1819338', '', '2018-11-06 11:58:39', 0),
(860, '', 7000, 'Debet', 1, '1819021', '', '2018-11-06 11:59:26', 0),
(861, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819337', '', '2018-11-06 12:10:10', 0),
(862, 'iuran sekolah', 200000, 'Debet', 1, '1819271', '', '2018-11-07 07:30:34', 0),
(863, 'iuran sekolah', 50000, 'Debet', 1, '1819313', '', '2018-11-07 08:05:06', 0),
(864, 'iuran sekolah', 70000, 'Debet', 1, '1819176', '', '2018-11-07 08:20:10', 0),
(865, 'iuran sekolah', 80000, 'Debet', 1, '1819066', '', '2018-11-07 09:34:26', 0),
(866, 'iuran sekolah', 60000, 'Debet', 1, '1819159', '', '2018-11-07 09:38:37', 0),
(867, 'iuran sekolah', 210000, 'Debet', 1, '1819088', '', '2018-11-07 10:00:16', 0),
(868, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-11-07 11:57:45', 0),
(869, 'iuran sekolah', 430000, 'Debet', 1, '1819245', '', '2018-11-08 08:30:48', 0),
(870, 'iuran sekolah', 200000, 'Debet', 1, '1819328', '', '2018-11-08 09:07:08', 0),
(871, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-11-08 11:59:35', 0),
(872, '', 100000, 'Debet', 1, '1819011', '', '2018-11-09 07:22:26', 0),
(873, 'Iuran Sekolah', 50000, 'Debet', 1, '1819040', '', '2018-11-09 07:24:08', 0),
(874, '', 210000, 'Debet', 1, '1819150', '', '2018-11-09 07:45:46', 0),
(875, 'Iuran Sekolah', 200000, 'Debet', 1, '1819221', '', '2018-11-09 08:23:57', 0),
(876, 'Iuran Sekolah', 210000, 'Debet', 1, '1819269', '', '2018-11-09 09:49:19', 0),
(877, 'Iuran Sekolah', 450000, 'Debet', 1, '1819246', '', '2018-11-09 10:40:37', 0),
(878, 'Iuran Sekolah', 210000, 'Debet', 1, '1819325', '', '2018-11-09 10:53:17', 0),
(879, 'Iuran Sekolah', 100000, 'Debet', 1, '1819026', '', '2018-11-09 11:27:14', 0),
(880, 'iuran sekolah', 420000, 'Debet', 1, '1819163', '', '2018-11-12 08:02:08', 0),
(881, 'iuran sekolah', 150000, 'Debet', 1, '1819159', '', '2018-11-12 08:05:26', 0),
(882, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-11-12 08:06:11', 0),
(883, 'iuran sekolah', 210000, 'Debet', 1, '1819260', '', '2018-11-12 08:07:28', 0),
(884, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2018-11-12 08:09:01', 0),
(885, 'iuran sekolah', 210000, 'Debet', 1, '1819308', '', '2018-11-12 08:10:10', 0),
(886, 'iuran sekolah', 210000, 'Debet', 1, '1819151', '', '2018-11-12 08:10:59', 0),
(887, 'iuran sekolah', 100000, 'Debet', 1, '1819142', '', '2018-11-12 08:11:41', 0),
(888, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2018-11-12 08:12:40', 0),
(889, 'iuran sekolah', 7000, 'Debet', 1, '1819021', '', '2018-11-12 08:15:11', 0),
(890, 'iuran sekolah', 210000, 'Debet', 1, '1819112', '', '2018-11-12 08:18:56', 0),
(891, 'iuran sekolah', 210000, 'Debet', 1, '1819314', '', '2018-11-12 08:19:53', 0),
(892, 'iuran sekolah', 420000, 'Debet', 1, '1819007', '', '2018-11-12 08:20:56', 0),
(893, 'iuran sekolah', 210000, 'Debet', 1, '1819279', '', '2018-11-12 08:43:49', 0),
(894, 'iuran sekolah', 210000, 'Debet', 1, '1819034', '', '2018-11-12 08:54:29', 0),
(895, 'iuran sekolah', 210000, 'Debet', 1, '1819139', '', '2018-11-12 08:55:38', 0),
(896, 'iuran sekolah', 100000, 'Debet', 1, '1819121', '', '2018-11-12 08:56:30', 0),
(897, 'iuran sekolah', 210, 'Debet', 1, '1819166', '', '2018-11-12 09:35:37', 0),
(898, 'iuran sekolah', 210000, 'Debet', 1, '1819166', '', '2018-11-12 09:38:30', 0),
(899, 'iuran sekolah', 210000, 'Debet', 1, '1819108', '', '2018-11-12 09:56:21', 0),
(900, 'iuran sekolah', 210000, 'Debet', 1, '1819330', '', '2018-11-12 09:57:32', 0),
(901, 'iuran sekolah', 210000, 'Debet', 1, '1819265', '', '2018-11-12 09:59:29', 0),
(902, 'iuran sekolah', 210000, 'Debet', 1, '1819027', '', '2018-11-12 12:21:18', 0),
(903, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2018-11-12 12:24:05', 0),
(904, 'iuran sekolah', 420000, 'Debet', 1, '1819302', '', '2018-11-12 13:10:10', 0),
(905, 'Iuran Sekolah', 210000, 'Debet', 1, '1819122', '', '2018-11-13 07:08:21', 0),
(906, 'Iuran Sekolah', 210000, 'Debet', 1, '1819151', '', '2018-11-13 07:09:39', 0),
(907, 'Iuran Sekolah', 210000, 'Debet', 1, '1819099', '', '2018-11-13 07:12:29', 0),
(908, 'Iuran Sekolah', 420000, 'Debet', 1, '1819249', '', '2018-11-13 07:23:14', 0),
(909, 'Iuran Sekolah', 150000, 'Debet', 1, '1819211', '', '2018-11-13 07:27:00', 0),
(910, 'Iuran Sekolah', 210000, 'Debet', 1, '1819298', '', '2018-11-13 07:27:42', 0),
(911, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2018-11-13 07:50:45', 0),
(912, 'Iuran Sekolah', 210000, 'Debet', 1, '1819090', '', '2018-11-13 08:22:51', 0),
(913, 'Iuran Sekolah', 200000, 'Debet', 1, '1819201', '', '2018-11-13 08:26:06', 0),
(914, 'Iuran Sekolah', 100000, 'Debet', 1, '1819094', '', '2018-11-13 09:30:14', 0),
(915, 'Iuran Sekolah', 210000, 'Debet', 1, '1819119', '', '2018-11-13 09:46:02', 0),
(916, 'Iuran Sekolah', 140000, 'Debet', 1, '1819161', '', '2018-11-13 10:04:58', 0),
(917, 'Iuran Sekolah', 110000, 'Debet', 1, '1819275', '', '2018-11-13 12:34:30', 0),
(918, 'Iuran Sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-14 07:17:24', 0),
(919, 'Iuran Sekolah', 210000, 'Debet', 1, '1819199', '', '2018-11-14 07:18:50', 0),
(920, 'Iuran Sekolah', 100000, 'Debet', 1, '1819233', '', '2018-11-14 08:26:29', 0),
(921, 'Iuran Sekolah', 210000, 'Debet', 1, '1819218', '', '2018-11-14 08:27:10', 0),
(922, 'Iuran Sekolah', 60000, 'Debet', 1, '1819159', '', '2018-11-14 08:27:59', 0),
(923, 'Iuran Sekolah', 210000, 'Debet', 1, '1819131', '', '2018-11-14 08:28:59', 0),
(924, 'Iuran Sekolah', 50000, 'Debet', 1, '1819104', '', '2018-11-14 08:57:02', 0),
(925, 'Iuran Sekolah', 210000, 'Debet', 1, '1819229', '', '2018-11-14 09:30:59', 0),
(926, 'Iuran Sekolah', 50000, 'Debet', 1, '1819157', '', '2018-11-14 09:56:48', 0),
(927, 'Iuran Sekolah', 100000, 'Debet', 1, '1819257', '', '2018-11-14 09:57:43', 0),
(928, 'Iuran Sekolah', 210000, 'Debet', 1, '1819192', '', '2018-11-14 10:01:59', 0),
(929, 'Iuran Sekolah', 210000, 'Debet', 1, '1819236', '', '2018-11-14 10:56:05', 0),
(930, 'Iuran Sekolah', 110000, 'Debet', 1, '1819115', '', '2018-11-14 10:57:27', 0),
(931, 'Iuran Sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-15 07:10:54', 0),
(932, 'Iuran Sekolah', 170000, 'Debet', 1, '1819267', '', '2018-11-15 07:20:37', 0),
(933, 'Iuran Sekolah', 300000, 'Debet', 1, '1819222', '', '2018-11-15 08:15:07', 0),
(936, 'Iuran Sekolah', 210000, 'Debet', 1, '1819227', '', '2018-11-15 08:39:30', 0),
(937, 'Iuran Sekolah', 100000, 'Debet', 1, '1819102', '', '2018-11-15 10:08:28', 0),
(938, 'Iuran Sekolah', 210000, 'Debet', 1, '1819118', '', '2018-11-15 11:11:24', 0),
(939, 'Iuran Sekolah', 420000, 'Debet', 1, '1819022', '', '2018-11-15 11:25:15', 0),
(940, 'Iuran Sekolah', 210000, 'Debet', 1, '1819292', '', '2018-11-15 11:59:47', 0),
(941, 'Iuran Sekolah', 50000, 'Debet', 1, '1819237', '', '2018-11-15 12:01:26', 0),
(942, 'iiuran sekolah', 210000, 'Debet', 1, '1819030', '', '2018-11-16 07:17:08', 0),
(943, 'iiuran sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-16 07:18:19', 0),
(944, 'iuran sekolah', 100000, 'Debet', 1, '1819240', '', '2018-11-23 08:27:20', 0),
(945, 'iuran sekolah', 320000, 'Debet', 1, '1819300', '', '2018-11-23 08:30:10', 0),
(946, 'iuran sekolah', 210000, 'Debet', 1, '1819243', '', '2018-11-23 08:31:37', 0),
(947, 'iuran sekolah', 110000, 'Debet', 1, '1819273', '', '2018-11-23 08:34:23', 0),
(948, 'iuran sekolah', 100000, 'Debet', 1, '1819309', '', '2018-11-23 08:36:04', 0),
(949, 'iuran sekolah', 50000, 'Debet', 1, '1819094', '', '2018-11-23 08:37:10', 0),
(950, 'iuran sekolah', 630000, 'Debet', 1, '1819049', '', '2018-11-23 08:38:46', 0),
(951, 'iuran sekolah', 100000, 'Debet', 1, '1819082', '', '2018-11-23 08:40:08', 0),
(952, 'iuran sekolah', 40000, 'Debet', 1, '1819099', '', '2018-11-23 08:41:44', 0),
(953, 'iuran sekolah', 200000, 'Debet', 1, '1819248', '', '2018-11-23 08:45:04', 0),
(954, 'iuran sekolah', 100000, 'Debet', 1, '1819257', '', '2018-11-23 08:46:39', 0),
(955, 'iuran sekolah', 210000, 'Debet', 1, '1819123', '', '2018-11-23 08:47:43', 0),
(956, 'iuran sekolah', 210000, 'Debet', 1, '1819031', '', '2018-11-23 08:51:54', 0),
(957, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2018-11-23 08:53:00', 0),
(958, 'iuran sekolah', 210000, 'Debet', 1, '1819260', '', '2018-11-23 08:54:52', 0),
(959, 'iuran sekolah', 100000, 'Debet', 1, '1819296', '', '2018-11-23 08:57:29', 0),
(960, 'iuran sekolah', 210000, 'Debet', 1, '1819189', '', '2018-11-23 09:00:10', 0),
(961, 'iuran sekolah', 630000, 'Debet', 1, '1819264', '', '2018-11-23 09:01:50', 0),
(962, 'iuran sekolah', 210000, 'Debet', 1, '1819046', '', '2018-11-23 09:02:58', 0),
(963, 'iuran sekolah', 210000, 'Debet', 1, '1819055', '', '2018-11-23 09:05:04', 0),
(964, 'iuran sekolah', 210000, 'Debet', 1, '1819180', '', '2018-11-23 09:05:58', 0),
(965, 'iuran sekolah', 210000, 'Debet', 1, '1819152', '', '2018-11-23 09:07:05', 0),
(966, 'iuran sekolah', 210000, 'Debet', 1, '1819178', '', '2018-11-23 09:07:54', 0),
(967, 'iuran sekolah', 200000, 'Debet', 1, '1819158', '', '2018-11-23 09:08:50', 0),
(968, 'iuran sekolah', 210000, 'Debet', 1, '1819012', '', '2018-11-23 10:58:09', 0),
(969, 'iuran sekolah', 22000, 'Debet', 1, '1819338', '', '2018-11-23 11:09:47', 0),
(970, 'iuran sekolah', 7000, 'Debet', 1, '1819021', '', '2018-11-23 11:11:48', 0),
(971, 'iuran sekolah', 210000, 'Debet', 1, '1819260', '', '2018-11-23 12:13:36', 0),
(972, 'iuran sekolah', 100000, 'Debet', 1, '1819335', '', '2018-11-24 06:54:14', 0),
(973, 'iuran sekolah', 300000, 'Debet', 1, '1819050', '', '2018-11-24 06:57:26', 0),
(974, 'iuran sekolah', 250000, 'Debet', 1, '1819239', '', '2018-11-24 07:01:27', 0),
(975, '', 210000, 'Debet', 1, '1819060', '', '2018-11-24 07:03:35', 0),
(976, 'iuran sekolah', 300000, 'Debet', 1, '1819315', '', '2018-11-24 07:04:31', 0),
(977, 'iuran sekolah', 80000, 'Debet', 1, '1819182', '', '2018-11-24 07:06:19', 0),
(978, 'iuran sekolah', 250000, 'Debet', 1, '1819068', '', '2018-11-24 07:07:53', 0),
(979, 'iuran sekolah', 50000, 'Debet', 1, '1819282', '', '2018-11-24 07:08:57', 0),
(980, 'iuran sekolah', 200000, 'Debet', 1, '1819202', '', '2018-11-24 07:10:03', 0),
(981, 'iuran sekolah', 420000, 'Debet', 1, '1819226', '', '2018-11-24 07:11:16', 0),
(982, 'iuran sekolah', 140000, 'Debet', 1, '1819113', '', '2018-11-24 07:12:08', 0),
(983, 'iuran sekolah', 100000, 'Debet', 1, '1819085', '', '2018-11-24 07:13:15', 0),
(984, 'iuran sekolah', 210000, 'Debet', 1, '1819213', '', '2018-11-24 07:14:15', 0),
(985, 'iuran sekolah', 110000, 'Debet', 1, '1819026', '', '2018-11-24 07:15:27', 0),
(986, 'iuran sekolah', 100000, 'Debet', 1, '1819284', '', '2018-11-24 07:18:42', 0),
(987, 'iuran sekolah', 50000, 'Debet', 1, '1819285', '', '2018-11-24 07:20:16', 0),
(988, 'iuran sekolah', 420000, 'Debet', 1, '1819188', '', '2018-11-24 07:30:20', 0),
(989, 'iuran sekolah', 100000, 'Debet', 1, '1819220', '', '2018-11-24 07:31:58', 0),
(990, 'iuran sekolah', 200000, 'Debet', 1, '1819251', '', '2018-11-24 07:32:43', 0),
(991, 'iuran sekolah', 200000, 'Debet', 1, '1819074', '', '2018-11-24 07:34:31', 0),
(992, 'iuran sekolah', 420000, 'Debet', 1, '1819305', '', '2018-11-24 08:07:54', 0),
(993, 'iuran sekolah', 100000, 'Debet', 1, '1819087', '', '2018-11-24 08:09:19', 0),
(994, 'iuran sekolah', 50000, 'Debet', 1, '1819171', '', '2018-11-24 08:10:28', 0),
(995, 'iuran sekolah', 100000, 'Debet', 1, '1819242', '', '2018-11-24 08:11:44', 0),
(996, 'iuran sekolah', 210000, 'Debet', 1, '1819165', '', '2018-11-24 08:12:48', 0),
(997, 'iuran sekolah', 210000, 'Debet', 1, '1819108', '', '2018-11-24 08:13:43', 0),
(998, 'iuran sekolah', 100000, 'Debet', 1, '1819161', '', '2018-11-24 08:14:36', 0),
(999, 'iuran sekolah', 50000, 'Debet', 1, '1819040', '', '2018-11-24 08:15:56', 0),
(1000, 'iuran sekolah', 210000, 'Debet', 1, '1819132', '', '2018-11-24 08:21:16', 0),
(1001, 'iuran sekolah', 50000, 'Debet', 1, '1819067', '', '2018-11-24 08:22:36', 0),
(1002, 'iuran sekolah', 100000, 'Debet', 1, '1819064', '', '2018-11-24 08:25:45', 0),
(1003, 'iuran sekolah', 210000, 'Debet', 1, '1819126', '', '2018-11-24 08:38:35', 0),
(1004, 'iuran sekolah', 100000, 'Debet', 1, '1819016', '', '2018-11-24 09:05:04', 0),
(1005, 'iuran sekolah', 200000, 'Debet', 1, '1819059', '', '2018-11-24 09:49:18', 0),
(1006, 'iuran sekolah', 950000, 'Debet', 1, '1819244', '', '2018-11-24 09:51:17', 0),
(1007, 'iuran sekolah', 210000, 'Debet', 1, '1819214', '', '2018-11-24 11:45:59', 0),
(1008, 'iuran sekolah', 150000, 'Debet', 1, '1819319', '', '2018-11-24 11:49:00', 0),
(1009, 'iuran sekolah', 420000, 'Debet', 1, '1819079', '', '2018-11-26 06:49:27', 0),
(1010, 'iuran sekolah', 100000, 'Debet', 1, '1819048', '', '2018-11-26 07:30:50', 0),
(1011, 'iuran sekolah', 210000, 'Debet', 1, '1819029', '', '2018-11-26 07:33:10', 0),
(1012, 'iuran sekolah', 105000, 'Debet', 1, '1819145', '', '2018-11-26 07:34:25', 0),
(1013, 'iuran sekolah', 210000, 'Debet', 1, '1819145', '', '2018-11-26 07:37:48', 0),
(1014, 'iuran sekolah', 210000, 'Debet', 1, '1819270', '', '2018-11-26 07:38:54', 0),
(1015, 'iuran sekolah', 200000, 'Debet', 1, '1819186', '', '2018-11-26 07:40:14', 0),
(1016, 'iuran sekolah', 210000, 'Debet', 1, '1819297', '', '2018-11-26 07:41:13', 0),
(1017, 'iuran sekolah', 50000, 'Debet', 1, '1819121', '', '2018-11-26 07:42:00', 0),
(1018, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-26 07:42:52', 0),
(1019, 'iuran sekolah', 100000, 'Debet', 1, '1819134', '', '2018-11-26 07:43:59', 0),
(1020, 'iuran sekolah', 100000, 'Debet', 1, '1819277', '', '2018-11-26 07:45:24', 0),
(1021, 'iuran sekolah', 100000, 'Debet', 1, '1819204', '', '2018-11-26 07:47:09', 0),
(1022, 'iuran sekolah', 300000, 'Debet', 1, '1819103', '', '2018-11-26 07:49:14', 0),
(1023, 'iuran sekolah', 100000, 'Debet', 1, '1819093', '', '2018-11-26 07:51:17', 0),
(1024, 'iuran sekolah', 100000, 'Debet', 1, '1819066', '', '2018-11-26 07:52:07', 0),
(1025, 'iuran sekolah', 500000, 'Debet', 1, '1819172', '', '2018-11-26 07:53:44', 0),
(1026, 'iuran sekolah', 55000, 'Debet', 1, '1819294', '', '2018-11-26 07:54:43', 0),
(1027, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2018-11-26 07:55:33', 0),
(1028, 'iuran sekolah', 200000, 'Debet', 1, '1819075', '', '2018-11-26 07:56:19', 0),
(1029, 'iuran sekolah', 200000, 'Debet', 1, '1819255', '', '2018-11-26 07:57:18', 0),
(1030, 'iuran sekolah', 200000, 'Debet', 1, '1819223', '', '2018-11-26 07:58:04', 0),
(1031, 'iuran sekolah', 210000, 'Debet', 1, '1819266', '', '2018-11-26 07:58:58', 0),
(1032, 'iuran sekolah', 100000, 'Debet', 1, '1819104', '', '2018-11-26 08:00:31', 0),
(1033, 'iuran sekolah', 220000, 'Debet', 1, '1819042', '', '2018-11-26 08:01:40', 0),
(1034, 'iuran sekolah', 10000, 'Debet', 1, '1819021', '', '2018-11-26 08:02:51', 0),
(1035, 'iuran sekolah', 200000, 'Debet', 1, '1819206', '', '2018-11-26 08:03:55', 0),
(1036, 'iuran sekolah', 50000, 'Debet', 1, '1819267', '', '2018-11-26 08:04:51', 0),
(1037, 'iuran sekolah', 300000, 'Debet', 1, '1819107', '', '2018-11-26 08:05:41', 0),
(1038, 'iuran sekolah', 210000, 'Debet', 1, '1819278', '', '2018-11-26 08:06:27', 0),
(1039, 'iuran sekolah', 210000, 'Debet', 1, '1819155', '', '2018-11-26 08:07:25', 0),
(1040, 'iuran sekolah', 150000, 'Debet', 1, '1819025', '', '2018-11-26 08:08:26', 0),
(1041, 'iuran sekolah', 50000, 'Debet', 1, '1819197', '', '2018-11-26 08:09:13', 0),
(1042, 'iuran sekolah', 100000, 'Debet', 1, '1819111', '', '2018-11-26 08:23:46', 0),
(1043, 'iuran sekolah', 110000, 'Debet', 1, '1819127', '', '2018-11-26 08:25:20', 0),
(1044, 'iuran sekolah', 210000, 'Debet', 1, '1819252', '', '2018-11-26 09:27:02', 0),
(1045, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-11-26 09:28:17', 0),
(1046, 'iuran sekolah', 100000, 'Debet', 1, '1819125', '', '2018-11-26 09:29:04', 0),
(1047, 'iuran sekolah', 400000, 'Debet', 1, '1819004', '', '2018-11-26 09:32:45', 0),
(1048, 'iuran sekolah', 100000, 'Debet', 1, '1819187', '', '2018-11-26 10:43:48', 0),
(1049, 'iuran sekolah', 50000, 'Debet', 1, '1819306', '', '2018-11-26 13:04:04', 0),
(1050, 'iuran sekolah', 150000, 'Debet', 1, '1819175', '', '2018-11-26 15:22:09', 0),
(1051, '', 50000, 'Debet', 1, '1819313', '', '2018-11-27 08:16:32', 0),
(1052, 'iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2018-11-27 08:22:20', 0),
(1053, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-27 08:23:19', 0),
(1054, 'iuran sekolah', 50000, 'Debet', 1, '1819313', '', '2018-11-27 08:24:42', 0),
(1055, 'iuran sekolah', 100000, 'Debet', 1, '1819066', '', '2018-11-27 10:01:52', 0),
(1056, 'iuran sekolah', 200000, 'Debet', 1, '1819256', '', '2018-11-27 11:06:11', 0),
(1057, 'iuran sekolah', 410000, 'Debet', 1, '1819109', '', '2018-11-27 11:29:40', 0),
(1058, 'iuran sekolah', 100000, 'Debet', 1, '1819323', '', '2018-11-27 11:45:52', 0),
(1059, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-28 09:24:43', 0),
(1060, 'iuran sekolah', 160000, 'Debet', 1, '1819290', '', '2018-11-29 09:30:20', 0),
(1061, 'iuran sekolah', 160000, 'Debet', 1, '1819285', '', '2018-11-29 09:36:01', 0),
(1062, 'iuran sekolah', 60000, 'Debet', 1, '1819025', '', '2018-11-29 10:05:53', 0),
(1063, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-29 10:49:42', 0),
(1064, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2018-11-30 10:17:44', 0),
(1065, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2018-12-01 09:21:49', 0),
(1066, 'iuran sekolah', 210000, 'Debet', 1, '1819195', '', '2018-12-03 07:00:42', 0),
(1067, 'iuran sekolah', 210000, 'Debet', 1, '1819033', '', '2018-12-03 09:11:25', 0),
(1068, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2018-12-03 09:14:54', 0),
(1069, 'iuran sekolah', 150000, 'Debet', 1, '1819237', '', '2018-12-03 10:20:49', 0),
(1070, 'iuran sekolah', 210000, 'Debet', 1, '1819307', '', '2018-12-03 12:21:25', 0),
(1071, 'iuran sekolah', 210000, 'Debet', 1, '1819287', '', '2018-12-04 08:16:58', 0),
(1072, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2018-12-04 08:18:42', 0),
(1073, 'iuran sekolah', 210000, 'Debet', 1, '1819039', '', '2018-12-04 08:19:49', 0),
(1074, 'iuran sekolah', 50000, 'Debet', 1, '1819313', '', '2018-12-04 08:20:43', 0),
(1075, 'iuran sekolah', 20000, 'Debet', 1, '1819099', '', '2018-12-04 08:30:59', 0),
(1076, 'iuran sekolah', 150000, 'Debet', 1, '1819069', '', '2018-12-04 09:59:11', 0),
(1077, 'iuran sekolah', 150000, 'Debet', 1, '1819299', '', '2018-12-05 07:44:45', 0),
(1078, 'iuran sekolah', 200000, 'Debet', 1, '1819274', '', '2018-12-06 07:59:10', 0),
(1079, 'iuran sekolah', 50000, 'Debet', 1, '1819056', '', '2018-12-06 08:03:25', 0),
(1080, 'iuran sekolah', 210000, 'Debet', 1, '1819325', '', '2018-12-06 08:55:20', 0),
(1081, 'iuran sekolah', 210000, 'Debet', 1, '1819279', '', '2018-12-06 12:45:29', 0),
(1082, 'iuran sekolah', 400000, 'Debet', 1, '1819103', '', '2018-12-07 07:39:22', 0),
(1083, 'iuran sekolah', 210000, 'Debet', 1, '1819229', '', '2018-12-08 08:03:37', 0),
(1084, 'iuran sekolah', 210000, 'Debet', 1, '1819269', '', '2018-12-08 08:24:38', 0),
(1085, 'iuran sekolah', 210000, 'Debet', 1, '1819150', '', '2018-12-08 08:29:34', 0),
(1086, 'iuran sekolah', 420000, 'Debet', 1, '1819208', '', '2018-12-10 06:46:54', 0),
(1087, 'iuran sekolah', 210000, 'Debet', 1, '1819295', '', '2018-12-10 06:48:00', 0),
(1088, 'iuran sekolah', 50000, 'Debet', 1, '1819237', '', '2018-12-10 08:47:43', 0),
(1089, '', 50000, 'Debet', 1, '1819051', '', '2018-12-10 08:57:53', 0),
(1090, 'iuran sekolah', 210000, 'Debet', 1, '1819333', '', '2018-12-10 10:29:06', 0),
(1091, 'iuran sekolah', 200000, 'Debet', 1, '1819198', '', '2018-12-11 07:57:27', 0),
(1092, 'iuran sekolah', 200000, 'Debet', 1, '1819313', '', '2018-12-12 06:48:33', 0),
(1093, 'iuran sekolah', 400000, 'Debet', 1, '1819303', '', '2018-12-12 08:09:36', 0),
(1094, 'iuran sekolah', 200000, 'Debet', 1, '1819201', '', '2018-12-13 08:22:42', 0),
(1095, 'iuran sekolah', 210000, 'Debet', 1, '1819230', '', '2018-12-13 08:33:16', 0),
(1096, 'iuran sekolah', 210000, 'Debet', 1, '1819029', '', '2018-12-13 12:59:42', 0),
(1097, 'Iursn Sekolah', 100000, 'Debet', 1, '1819102', '', '2018-12-14 07:39:02', 0),
(1098, 'Iuran Sekolah', 200000, 'Debet', 1, '1819042', '', '2018-12-14 07:41:21', 0),
(1099, 'Iursn Sekolah', 210000, 'Debet', 1, '1819321', '', '2018-12-14 07:56:04', 0),
(1100, 'Iursn Sekolah', 300000, 'Debet', 1, '1819170', '', '2018-12-14 08:32:53', 0),
(1101, 'Iuran Sekolah', 420000, 'Debet', 1, '1819120', '', '2018-12-14 08:40:30', 0),
(1102, 'Iursn Sekolah', 200000, 'Debet', 1, '1819190', '', '2018-12-14 09:08:19', 0),
(1103, 'Iuran Sekolah', 100000, 'Debet', 1, '1819154', '', '2018-12-14 09:09:09', 0),
(1104, 'Iursn Sekolah', 150000, 'Debet', 1, '1819149', '', '2018-12-14 09:11:50', 0),
(1105, 'Iursn Sekolah', 400000, 'Debet', 1, '1819167', '', '2018-12-14 09:25:13', 0),
(1106, 'Iursn Sekolah', 300000, 'Debet', 1, '1819271', '', '2018-12-14 09:28:58', 0),
(1107, 'iuran sekolah', 150000, 'Debet', 1, '1819309', '', '2018-12-14 13:01:50', 0),
(1108, '', 150000, 'Debet', 1, '1819026', '', '2019-01-02 07:48:45', 0),
(1109, '', 420000, 'Debet', 1, '1819057', '', '2019-01-02 07:50:38', 0),
(1110, 'iuran sekolah', 150000, 'Debet', 1, '1819051', '', '2019-01-02 08:29:38', 0),
(1111, 'iuran sekolah', 100000, 'Debet', 1, '1819064', '', '2019-01-02 08:52:47', 0),
(1112, 'iuran sekolah', 270000, 'Debet', 1, '1819206', '', '2019-01-02 09:10:44', 0),
(1113, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2019-01-02 10:19:44', 0),
(1114, 'iuran sekolah', 210000, 'Debet', 1, '1819183', '', '2019-01-02 10:33:48', 0),
(1115, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2019-01-03 08:23:47', 0),
(1116, 'iuran sekolah', 210000, 'Debet', 1, '1819330', '', '2019-01-03 08:24:49', 0),
(1117, 'iuran sekolah', 210000, 'Debet', 1, '1819195', '', '2019-01-03 08:26:07', 0),
(1118, 'iuran sekolah', 200000, 'Debet', 1, '1819218', '', '2019-01-03 08:27:32', 0),
(1119, 'iuran sekolah', 250000, 'Debet', 1, '1819313', '', '2019-01-03 09:22:24', 0),
(1120, 'iuran sekolah', 210000, 'Debet', 1, '1819196', '', '2019-01-03 09:39:55', 0),
(1121, 'iuran sekolah', 210000, 'Debet', 1, '1819033', '', '2019-01-03 10:24:38', 0),
(1122, 'iuran sekolah', 100000, 'Debet', 1, '1819284', '', '2019-01-04 08:03:08', 0),
(1123, 'iuran sekolah', 150000, 'Debet', 1, '1819094', '', '2019-01-04 08:24:35', 0),
(1124, 'iuran sekolah', 210000, 'Debet', 1, '1819291', '', '2019-01-04 08:31:06', 0),
(1125, 'iuran sekolah', 210000, 'Debet', 1, '1819219', '', '2019-01-04 08:32:04', 0),
(1126, 'iuran sekolah', 200000, 'Debet', 1, '1819271', '', '2019-01-04 09:01:12', 0),
(1127, 'iuran sekolah', 210000, 'Debet', 1, '1819119', '', '2019-01-04 09:02:11', 0),
(1128, 'iuran sekolah', 210000, 'Debet', 1, '1819122', '', '2019-01-04 09:03:18', 0),
(1129, 'iuran sekolah', 210000, 'Debet', 1, '1819122', '', '2019-01-04 09:54:05', 0),
(1130, 'iuran sekolah', 210000, 'Debet', 1, '1819037', '', '2019-01-04 11:01:42', 0),
(1131, 'iuran sekolah', 50000, 'Debet', 1, '1819237', '', '2019-01-04 11:11:19', 0),
(1132, 'Iuran Sekolah', 320000, 'Debet', 1, '1819296', '', '2019-01-05 07:22:30', 0),
(1133, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-01-05 07:30:18', 0),
(1134, 'iuran sekolah', 210000, 'Debet', 1, '1819118', '', '2019-01-05 07:32:26', 0),
(1135, 'iuran sekolah', 210000, 'Debet', 1, '1819292', '', '2019-01-05 08:02:25', 0),
(1136, 'iuran sekolah', 100000, 'Debet', 1, '1819230', '', '2019-01-05 08:24:37', 0),
(1137, 'iuran sekolah', 210000, 'Debet', 1, '1819269', '', '2019-01-05 08:32:25', 0),
(1138, 'iuran sekolah', 210000, 'Debet', 1, '1819150', '', '2019-01-05 09:15:57', 0),
(1139, 'iuran sekolah', 200000, 'Debet', 1, '1819258', '', '2019-01-05 10:06:11', 0),
(1140, 'iuran sekolah', 200000, 'Debet', 1, '1819258', '', '2019-01-05 10:08:26', 0),
(1141, 'iuran sekolah', 210000, 'Debet', 1, '1819119', '', '2019-01-05 10:10:15', 0),
(1142, 'iuran sekolah', 210000, 'Debet', 1, '1819192', '', '2019-01-05 10:12:22', 0),
(1143, 'iuran sekolah', 150000, 'Debet', 1, '1819149', '', '2019-01-05 11:52:04', 0),
(1144, 'iuran sekolah', 420000, 'Debet', 1, '1819088', '', '2019-01-05 11:56:58', 0),
(1145, 'iuran sekolah', 210000, 'Debet', 1, '1819207', '', '2019-01-07 07:58:12', 0),
(1146, 'iuran sekolah', 250000, 'Debet', 1, '1819286', '', '2019-01-07 08:01:14', 0),
(1147, 'iuran sekolah', 210000, 'Debet', 1, '1819181', '', '2019-01-07 08:02:03', 0),
(1148, 'iuran sekolah', 210000, 'Debet', 1, '1819114', '', '2019-01-07 08:02:54', 0),
(1149, 'iuran sekolah', 210000, 'Debet', 1, '1819169', '', '2019-01-07 08:03:57', 0),
(1150, 'iuran sekolah', 210000, 'Debet', 1, '1819169', '', '2019-01-07 08:06:24', 0),
(1151, 'iuran sekolah', 310000, 'Debet', 1, '1819081', '', '2019-01-07 09:20:09', 0),
(1152, 'iuran sekolah', 210000, 'Debet', 1, '1819053', '', '2019-01-07 09:28:47', 0),
(1153, 'iuran sekolah', 210000, 'Debet', 1, '1819053', '', '2019-01-07 09:29:37', 0),
(1154, 'iuran sekolah', 420000, 'Debet', 1, '1819163', '', '2019-01-07 09:46:54', 0),
(1155, 'iuran sekolah', 210000, 'Debet', 1, '1819233', '', '2019-01-07 10:32:24', 0),
(1156, 'iuran sekolah', 10000, 'Debet', 1, '1819233', '', '2019-01-07 10:38:03', 0),
(1157, 'iuran sekolah', 100000, 'Debet', 1, '1819154', '', '2019-01-07 10:39:28', 0),
(1158, 'iuran sekolah', 100000, 'Debet', 1, '1819190', '', '2019-01-07 10:41:20', 0),
(1159, 'iuran sekolah', 230000, 'Debet', 1, '1819265', '', '2019-01-07 11:11:36', 0),
(1160, 'iuran sekolah', 50000, 'Debet', 1, '1819237', '', '2019-01-07 12:23:21', 0),
(1161, 'Iuran Sekolah', 30000, 'Debet', 1, '1819182', '', '2019-01-08 07:16:58', 0),
(1162, 'Iuran Sekolah', 210000, 'Debet', 1, '1819224', '', '2019-01-08 07:49:33', 0),
(1163, 'Iuran Sekolah', 210000, 'Debet', 1, '1819213', '', '2019-01-08 07:50:43', 0),
(1164, 'Iuran Sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-08 07:58:22', 0),
(1165, 'Iuran Sekolah', 50000, 'Debet', 1, '1819051', '', '2019-01-08 09:28:57', 0),
(1166, 'Iuran Sekolah', 50000, 'Debet', 1, '1819051', '', '2019-01-08 09:31:03', 0),
(1167, 'Iuran Sekolah', 210000, 'Debet', 1, '1819114', '', '2019-01-08 10:28:42', 0),
(1168, 'Iuran Sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-09 10:00:32', 0),
(1169, 'Iuran Sekolah', 210000, 'Debet', 1, '1819037', '', '2019-01-09 11:00:36', 0),
(1170, 'Iuran Sekolah', 450000, 'Debet', 1, '1819173', '', '2019-01-10 07:19:14', 0),
(1171, 'Iuran Sekolah', 420000, 'Debet', 1, '1819316', '', '2019-01-10 07:30:08', 0),
(1173, 'Iuran Sekolah', 300000, 'Debet', 1, '1819253', '', '2019-01-14 16:36:46', 0),
(1174, 'Iuran Sekolah', 210000, 'Debet', 1, '1819229', '', '2019-01-14 16:38:38', 0),
(1175, 'Iuran Sekolah', 400000, 'Debet', 1, '1819283', '', '2019-01-14 16:41:07', 0),
(1176, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2019-01-15 08:16:09', 0),
(1177, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2019-01-15 08:17:11', 0),
(1178, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-01-15 08:34:30', 0),
(1179, 'iuran sekolah', 210000, 'Debet', 1, '1819120', '', '2019-01-15 08:42:51', 0),
(1180, 'iuran sekolah', 210000, 'Debet', 1, '1819151', '', '2019-01-15 09:24:30', 0),
(1181, 'iuran sekolah', 210000, 'Debet', 1, '1819151', '', '2019-01-15 09:25:27', 0),
(1182, 'iuran sekolah', 20000, 'Debet', 1, '1819099', '', '2019-01-15 10:07:41', 0),
(1183, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2019-01-15 10:10:00', 0),
(1184, 'iuran sekolah', 210000, 'Debet', 1, '1819321', '', '2019-01-15 10:20:52', 0),
(1185, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-15 10:27:31', 0),
(1186, 'iuran sekolah', 150000, 'Debet', 1, '1819004', '', '2019-01-16 08:33:01', 0),
(1187, 'iuran sekolah', 100000, 'Debet', 1, '1819186', '', '2019-01-16 09:09:11', 0),
(1188, 'iuran sekolah', 210000, 'Debet', 1, '1819053', '', '2019-01-16 09:22:38', 0),
(1190, 'iuran sekolah', 110000, 'Debet', 1, '1819081', '', '2019-01-16 09:38:49', 0),
(1191, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-16 11:09:34', 0),
(1192, 'iuran sekolah', 700000, 'Debet', 1, '1819162', '', '2019-01-17 07:29:24', 0),
(1193, 'iuran sekolah', 100000, 'Debet', 1, '1819245', '', '2019-01-17 09:12:50', 0),
(1194, 'iuran sekolah', 210000, 'Debet', 1, '1819058', '', '2019-01-17 09:27:27', 0),
(1195, 'iuran sekolah', 210000, 'Debet', 1, '1819058', '', '2019-01-17 09:29:06', 0),
(1196, 'iuran sekolah', 10000, 'Debet', 1, '1819176', '', '2019-01-17 11:26:09', 0),
(1197, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-17 11:27:52', 0),
(1198, 'iuran sekolah', 420000, 'Debet', 1, '1819327', '', '2019-01-18 08:40:17', 0),
(1199, 'KIP', 400000, 'Debet', 1, '1819227', '', '2019-01-18 08:43:18', 0),
(1200, 'KIP', 400000, 'Debet', 1, '1819147', '', '2019-01-18 08:44:26', 0),
(1201, 'KIP', 400000, 'Debet', 1, '1819196', '', '2019-01-18 08:45:26', 0),
(1202, 'KIP', 400000, 'Debet', 1, '1819157', '', '2019-01-18 08:46:38', 0),
(1203, 'KIP', 400000, 'Debet', 1, '1819280', '', '2019-01-18 08:55:58', 0),
(1204, 'KIP', 400000, 'Debet', 1, '1819151', '', '2019-01-18 08:56:51', 0),
(1205, 'KIP', 400000, 'Debet', 1, '1819292', '', '2019-01-18 08:57:49', 0),
(1206, 'KIP', 400000, 'Debet', 1, '1819245', '', '2019-01-18 08:59:39', 0),
(1207, 'KIP', 400000, 'Debet', 1, '1819279', '', '2019-01-18 09:00:35', 0),
(1208, 'KIP', 400000, 'Debet', 1, '1819150', '', '2019-01-18 09:01:34', 0),
(1209, 'KIP', 400000, 'Debet', 1, '1819303', '', '2019-01-18 09:02:41', 0),
(1210, 'KIP', 400000, 'Debet', 1, '1819298', '', '2019-01-18 09:04:07', 0),
(1211, 'KIP', 400000, 'Debet', 1, '1819164', '', '2019-01-18 09:06:26', 0),
(1212, 'KIP', 400000, 'Debet', 1, '1819295', '', '2019-01-18 09:07:15', 0),
(1213, 'KIP', 400000, 'Debet', 1, '1819240', '', '2019-01-18 09:08:05', 0),
(1214, 'KIP', 400000, 'Debet', 1, '1819095', '', '2019-01-18 09:14:59', 0),
(1215, 'KIP', 400000, 'Debet', 1, '1819026', '', '2019-01-18 09:16:32', 0),
(1216, 'KIP', 400000, 'Debet', 1, '1819085', '', '2019-01-18 09:21:23', 0),
(1217, 'KIP', 400000, 'Debet', 1, '1819118', '', '2019-01-18 09:22:09', 0),
(1218, 'KIP', 400000, 'Debet', 1, '1819131', '', '2019-01-18 09:25:15', 0),
(1219, 'KIP', 400000, 'Debet', 1, '1819109', '', '2019-01-18 09:26:10', 0),
(1220, 'KIP', 400000, 'Debet', 1, '1819308', '', '2019-01-18 09:26:54', 0),
(1221, 'KIP', 400000, 'Debet', 1, '1819258', '', '2019-01-18 09:27:45', 0),
(1222, 'KIP', 400000, 'Debet', 1, '1819176', '', '2019-01-18 09:32:03', 0),
(1223, 'KIP', 400000, 'Debet', 1, '1819181', '', '2019-01-18 09:33:08', 0),
(1224, 'KIP', 400000, 'Debet', 1, '1819115', '', '2019-01-18 09:34:11', 0),
(1225, 'KIP', 400000, 'Debet', 1, '1819236', '', '2019-01-18 09:34:59', 0),
(1226, 'KIP', 400000, 'Debet', 1, '1819288', '', '2019-01-18 09:36:28', 0),
(1227, 'KIP', 400000, 'Debet', 1, '1819251', '', '2019-01-18 09:37:39', 0),
(1228, 'iuran sekolah', 210000, 'Debet', 1, '1819297', '', '2019-01-18 09:38:44', 0),
(1229, 'KIP', 400000, 'Debet', 1, '1819080', '', '2019-01-18 09:39:34', 0),
(1230, 'KIP', 400000, 'Debet', 1, '1819243', '', '2019-01-18 09:40:42', 0),
(1231, 'KIP', 400000, 'Debet', 1, '1819299', '', '2019-01-18 09:42:08', 0),
(1232, 'KIP', 400000, 'Debet', 1, '1819248', '', '2019-01-18 09:43:04', 0),
(1233, 'KIP', 400000, 'Debet', 1, '1819326', '', '2019-01-18 09:44:15', 0),
(1234, 'KIP', 400000, 'Debet', 1, '1819306', '', '2019-01-18 09:45:04', 0),
(1235, 'KIP', 400000, 'Debet', 1, '1819048', '', '2019-01-18 09:46:03', 0),
(1236, 'KIP', 400000, 'Debet', 1, '1819106', '', '2019-01-18 09:47:24', 0),
(1237, 'KIP', 400000, 'Debet', 1, '1819051', '', '2019-01-18 10:32:06', 0),
(1238, 'KIP', 400000, 'Debet', 1, '1819037', '', '2019-01-18 10:33:18', 0),
(1239, 'KIP', 400000, 'Debet', 1, '1819166', '', '2019-01-18 10:34:14', 0),
(1240, 'KIP', 400000, 'Debet', 1, '1819237', '', '2019-01-18 10:35:39', 0),
(1241, 'KIP', 400000, 'Debet', 1, '1819335', '', '2019-01-19 08:22:30', 0),
(1242, 'KIP', 400000, 'Debet', 1, '1819128', '', '2019-01-19 08:23:31', 0),
(1243, 'KIP', 40000, 'Debet', 1, '1819182', '', '2019-01-19 08:29:13', 0),
(1244, 'KIP', 400000, 'Debet', 1, '1819331', '', '2019-01-19 09:33:27', 0),
(1245, 'IURAN SEKOLAH', 630000, 'Debet', 1, '1819259', '', '2019-01-19 10:52:13', 0),
(1246, 'IURAN SEKOLAH', 420000, 'Debet', 1, '1819259', '', '2019-01-19 10:52:58', 0),
(1247, 'IURAN SEKOLAH', 40000, 'Debet', 1, '1819182', '', '2019-01-19 10:55:29', 0),
(1248, 'iuran sekolah', 210000, 'Debet', 1, '1819039', '', '2019-01-21 07:58:58', 0),
(1249, 'iuran sekolah', 510000, 'Debet', 1, '1819291', '', '2019-01-21 08:02:04', 0),
(1250, 'iuran sekolah', 300000, 'Debet', 1, '1819315', '', '2019-01-21 08:03:29', 0),
(1251, 'iuran sekolah', 200000, 'Debet', 1, '1819308', '', '2019-01-21 09:25:04', 0),
(1252, 'KIP', 400000, 'Debet', 1, '1819123', '', '2019-01-21 10:14:31', 0),
(1253, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-21 10:40:25', 0),
(1254, 'iuran sekolah', 320000, 'Debet', 1, '1819074', '', '2019-01-21 11:12:39', 0),
(1255, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-01-21 11:13:42', 0),
(1256, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2019-01-21 11:55:50', 0),
(1257, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2019-01-21 11:57:03', 0),
(1258, 'iuran sekolah', 420000, 'Debet', 1, '1819036', '', '2019-01-21 12:15:27', 0),
(1259, 'iuran sekolah', 100000, 'Debet', 1, '1819145', '', '2019-01-21 12:27:28', 0),
(1260, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2019-01-22 07:39:36', 0),
(1261, 'iuran sekolah', 100000, 'Debet', 1, '1819076', '', '2019-01-22 08:34:33', 0),
(1262, 'iuran sekolah', 210000, 'Debet', 1, '1819040', '', '2019-01-22 09:00:01', 0),
(1263, 'iuran sekolah', 200000, 'Debet', 1, '1819293', '', '2019-01-22 09:11:22', 0),
(1264, 'iuran sekolah', 200000, 'Debet', 1, '1819293', '', '2019-01-22 09:11:22', 0),
(1265, 'iuran sekolah', 50000, 'Debet', 1, '1819338', '', '2019-01-22 09:14:45', 0),
(1266, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2019-01-22 09:43:23', 0),
(1267, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-22 10:26:49', 0),
(1268, 'iuran sekolah', 300000, 'Debet', 1, '1819249', '', '2019-01-23 08:18:20', 0),
(1269, 'iuran sekolah', 100000, 'Debet', 1, '1819087', '', '2019-01-23 08:24:44', 0),
(1270, 'iuran sekolah', 300000, 'Debet', 1, '1819162', '', '2019-01-23 08:27:39', 0),
(1271, 'iuran sekolah', 450000, 'Debet', 1, '1819043', '', '2019-01-23 08:28:45', 0),
(1272, 'iuran sekolah', 210000, 'Debet', 1, '1819122', '', '2019-01-23 08:38:17', 0),
(1273, 'iuran sekolah', 210000, 'Debet', 1, '1819088', '', '2019-01-23 08:40:38', 0),
(1274, 'iuran sekolah', 500000, 'Debet', 1, '1819179', '', '2019-01-23 08:47:05', 0),
(1275, 'iuran sekolah', 210000, 'Debet', 1, '1819179', '', '2019-01-23 08:49:18', 0),
(1276, 'iuran sekolah', 200000, 'Debet', 1, '1819198', '', '2019-01-23 08:58:50', 0),
(1277, 'iuran sekolah', 210000, 'Debet', 1, '1819112', '', '2019-01-23 09:39:45', 0),
(1278, 'iuran sekolah', 420000, 'Debet', 1, '1819205', '', '2019-01-23 11:55:45', 0),
(1279, 'iuran sekolah', 20000, 'Debet', 1, '1819338', '', '2019-01-23 11:56:43', 0),
(1280, 'Iuran Sekolah', 210000, 'Debet', 1, '1819169', '', '2019-01-24 07:18:20', 0),
(1281, 'Iuran Sekolah', 400000, 'Debet', 1, '1819333', '', '2019-01-24 07:19:54', 0),
(1282, 'Iuran Sekolah', 300000, 'Debet', 1, '1819298', '', '2019-01-24 07:55:27', 0),
(1283, 'Iuran Sekolah', 220000, 'Debet', 1, '1819216', '', '2019-01-24 09:47:15', 0),
(1284, 'Iuran Sekolah', 200000, 'Debet', 1, '1819216', '', '2019-01-24 09:48:50', 0),
(1285, 'Iuran Sekolah', 210000, 'Debet', 1, '1819090', '', '2019-01-24 11:55:50', 0),
(1286, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-25 07:58:44', 0),
(1287, 'iuran sekolah', 420000, 'Debet', 1, '1819228', '', '2019-01-25 08:22:36', 0),
(1288, 'iuran sekolah', 210000, 'Debet', 1, '1819228', '', '2019-01-25 08:23:56', 0),
(1289, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-01-26 08:25:16', 0),
(1290, 'iuran sekolah', 210000, 'Debet', 1, '1819260', '', '2019-01-26 08:55:51', 0),
(1291, 'iuran sekolah', 49000, 'Debet', 1, '1819078', '', '2019-01-26 10:36:45', 0),
(1292, 'iuran sekolah', 500000, 'Debet', 1, '1819078', '', '2019-01-26 10:38:00', 0),
(1293, 'iuran sekolah', 210000, 'Debet', 1, '1819215', '', '2019-01-28 08:11:47', 0),
(1294, 'iuran sekolah', 210000, 'Debet', 1, '1819208', '', '2019-01-28 08:13:39', 0),
(1295, 'iuran sekolah', 160000, 'Debet', 1, '1819242', '', '2019-01-28 08:43:13', 0),
(1296, 'iuran sekolah', 250000, 'Debet', 1, '1819255', '', '2019-01-28 09:22:40', 0),
(1297, 'iuran sekolah', 220000, 'Debet', 1, '1819290', '', '2019-01-28 09:27:03', 0),
(1298, 'iuran sekolah', 420000, 'Debet', 1, '1819116', '', '2019-01-28 10:35:45', 0),
(1299, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-01-28 10:40:30', 0),
(1300, 'iuran sekolah', 210000, 'Debet', 1, '1819046', '', '2019-01-28 10:41:55', 0),
(1301, 'iuran sekolah', 115000, 'Debet', 1, '1819145', '', '2019-01-28 11:23:44', 0),
(1302, 'iuran sekolah', 210000, 'Debet', 1, '1819252', '', '2019-01-28 11:54:30', 0),
(1303, 'iuran sekolah', 420000, 'Debet', 1, '1819302', '', '2019-01-28 13:17:42', 0),
(1304, 'iuran sekolah', 210000, 'Debet', 1, '1819053', '', '2019-01-29 07:17:12', 0),
(1305, 'iuran sekolah', 300000, 'Debet', 1, '1819310', '', '2019-01-29 07:34:15', 0);
INSERT INTO `transaction` (`transaction_id`, `transaction_name`, `transaction_amount`, `transaction_type`, `sekolah_id`, `user_nisn`, `user_nik`, `transaction_datetime`, `kelas_id`) VALUES
(1306, 'iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2019-01-29 08:13:44', 0),
(1307, 'iuran sekolah', 150000, 'Debet', 1, '1819069', '', '2019-01-29 10:02:39', 0),
(1308, 'iuran sekolah', 50000, 'Debet', 1, '1819094', '', '2019-01-29 10:06:00', 0),
(1309, 'iuran sekolah', 210000, 'Debet', 1, '1819144', '', '2019-01-29 10:10:49', 0),
(1310, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-01-29 10:26:16', 0),
(1311, 'iuran sekolah', 500000, 'Debet', 1, '1819128', '', '2019-01-29 10:54:07', 0),
(1312, 'iuran sekolah', 200000, 'Debet', 1, '1819336', '', '2019-01-30 07:42:02', 0),
(1313, 'KIP', 400000, 'Debet', 1, '1819119', '', '2019-01-31 09:49:59', 0),
(1314, 'KIP', 400000, 'Debet', 1, '1819088', '', '2019-01-31 09:51:27', 0),
(1315, 'KIP', 400000, 'Debet', 1, '1819291', '', '2019-01-31 09:52:27', 0),
(1316, 'KIP', 400000, 'Debet', 1, '1819069', '', '2019-01-31 09:53:45', 0),
(1317, 'KIP', 400000, 'Debet', 1, '1819189', '', '2019-01-31 09:54:51', 0),
(1318, 'KIP', 400000, 'Debet', 1, '1819083', '', '2019-01-31 09:56:03', 0),
(1319, 'KIP', 400000, 'Debet', 1, '1819178', '', '2019-01-31 09:57:41', 0),
(1320, 'KIP', 400000, 'Debet', 1, '1819249', '', '2019-01-31 10:01:35', 0),
(1321, 'KIP', 400000, 'Debet', 1, '1819142', '', '2019-01-31 10:02:50', 0),
(1322, 'KIP', 150000, 'Debet', 1, '1819142', '', '2019-01-31 10:05:10', 0),
(1323, 'KIP', 400000, 'Debet', 1, '1819099', '', '2019-01-31 10:46:51', 0),
(1324, 'KIP', 400000, 'Debet', 1, '1819289', '', '2019-01-31 11:24:50', 0),
(1325, 'KIP', 400000, 'Debet', 1, '1819254', '', '2019-01-31 11:26:15', 0),
(1326, 'KIP', 400000, 'Debet', 1, '1819184', '', '2019-01-31 11:27:31', 0),
(1327, 'KIP', 210000, 'Debet', 1, '1819184', '', '2019-01-31 11:29:31', 0),
(1328, 'KIP', 400000, 'Debet', 1, '1819180', '', '2019-01-31 11:35:49', 0),
(1329, 'KIP', 400000, 'Debet', 1, '1819073', '', '2019-01-31 11:38:36', 0),
(1330, 'KIP', 400000, 'Debet', 1, '1819137', '', '2019-01-31 11:39:51', 0),
(1331, 'KIP', 400000, 'Debet', 1, '1819064', '', '2019-01-31 11:41:19', 0),
(1332, 'KIP', 400000, 'Debet', 1, '1819126', '', '2019-01-31 11:42:26', 0),
(1333, 'KIP', 400000, 'Debet', 1, '1819215', '', '2019-01-31 11:43:26', 0),
(1334, 'KIP', 400000, 'Debet', 1, '1819045', '', '2019-01-31 11:44:26', 0),
(1335, 'KIP', 400000, 'Debet', 1, '1819334', '', '2019-01-31 11:45:38', 0),
(1336, 'KIP', 400000, 'Debet', 1, '1819055', '', '2019-01-31 11:46:37', 0),
(1337, 'KIP', 400000, 'Debet', 1, '1819270', '', '2019-01-31 11:47:55', 0),
(1338, 'KIP', 400000, 'Debet', 1, '1819097', '', '2019-01-31 11:49:26', 0),
(1339, 'IURAN SEKOLAH', 1500000, 'Debet', 1, '1819097', '', '2019-01-31 11:50:36', 0),
(1340, 'KIP', 400000, 'Debet', 1, '1819046', '', '2019-01-31 11:52:06', 0),
(1341, 'KIP', 400000, 'Debet', 1, '1819223', '', '2019-01-31 12:02:31', 0),
(1342, 'KIP', 400000, 'Debet', 1, '1819315', '', '2019-01-31 12:03:47', 0),
(1343, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819102', '', '2019-01-31 12:13:49', 0),
(1344, 'KIP', 400000, 'Debet', 1, '1819060', '', '2019-02-01 08:30:59', 0),
(1345, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819233', '', '2019-02-01 08:46:10', 0),
(1346, 'KIP', 420000, 'Debet', 1, '1819049', '', '2019-02-01 09:07:27', 0),
(1347, 'KIP', 420000, 'Debet', 1, '1819108', '', '2019-02-01 09:08:53', 0),
(1348, 'KIP', 420000, 'Debet', 1, '1819108', '', '2019-02-01 09:08:53', 0),
(1349, 'KIP', 400000, 'Debet', 1, '1819255', '', '2019-02-01 09:58:38', 0),
(1350, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819023', '', '2019-02-01 10:14:31', 0),
(1351, 'IURAN SEKOLAH', 10000, 'Debet', 1, '1819099', '', '2019-02-01 10:35:30', 0),
(1352, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819007', '', '2019-02-01 10:45:09', 0),
(1353, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819257', '', '2019-02-01 11:14:10', 0),
(1354, 'iuran sekolah', 210000, 'Debet', 1, '1819236', '', '2019-02-02 08:10:29', 0),
(1355, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-02-02 09:31:31', 0),
(1356, 'iuran sekolah', 400000, 'Debet', 1, '1819246', '', '2019-02-02 12:03:48', 0),
(1357, 'Iuran Sekolah', 210000, 'Debet', 1, '1819075', '', '2019-02-04 08:08:10', 0),
(1358, 'Iuran Sekolah', 50000, 'Debet', 1, '1819056', '', '2019-02-04 08:23:59', 0),
(1359, 'Iuran Sekolah', 210000, 'Debet', 1, '1819296', '', '2019-02-04 09:24:26', 0),
(1360, 'Iuran Sekolah', 100000, 'Debet', 1, '1819200', '', '2019-02-04 09:25:51', 0),
(1361, 'Iuran Sekolah', 200000, 'Debet', 1, '1819154', '', '2019-02-04 10:00:46', 0),
(1362, 'Iuran Sekolah', 210000, 'Debet', 1, '1819281', '', '2019-02-04 10:09:16', 0),
(1363, 'Iuran Sekolah', 210000, 'Debet', 1, '1819287', '', '2019-02-04 10:10:44', 0),
(1364, 'Iuran Sekolah', 210000, 'Debet', 1, '1819195', '', '2019-02-04 10:13:37', 0),
(1365, 'Iuran Sekolah', 210000, 'Debet', 1, '1819219', '', '2019-02-04 10:20:35', 0),
(1366, 'Iuran Sekolah', 630000, 'Debet', 1, '1819166', '', '2019-02-04 10:47:47', 0),
(1367, 'Iuran Sekolah', 50000, 'Debet', 1, '1819051', '', '2019-02-04 10:49:14', 0),
(1368, 'Iuran Sekolah', 200000, 'Debet', 1, '1819190', '', '2019-02-04 11:22:43', 0),
(1369, 'iuran sekolah', 200000, 'Debet', 1, '1819271', '', '2019-02-06 07:40:04', 0),
(1370, 'iuran sekolah', 210000, 'Debet', 1, '1819057', '', '2019-02-06 08:01:13', 0),
(1371, 'iuran sekolah', 200000, 'Debet', 1, '1819266', '', '2019-02-06 08:02:12', 0),
(1372, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2019-02-06 08:25:12', 0),
(1373, 'iuran sekolah', 200000, 'Debet', 1, '1819218', '', '2019-02-06 08:31:15', 0),
(1374, 'iuran sekolah', 210000, 'Debet', 1, '1819229', '', '2019-02-06 09:03:37', 0),
(1375, 'iuran sekolah', 420000, 'Debet', 1, '1819006', '', '2019-02-06 09:26:16', 0),
(1376, 'iuran sekolah', 300000, 'Debet', 1, '1819161', '', '2019-02-06 09:33:23', 0),
(1377, 'iuran sekolah', 210000, 'Debet', 1, '1819012', '', '2019-02-06 09:36:35', 0),
(1378, 'iuran sekolah', 420000, 'Debet', 1, '1819131', '', '2019-02-06 09:41:27', 0),
(1379, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-02-06 09:56:51', 0),
(1380, 'iuran sekolah', 200000, 'Debet', 1, '1819313', '', '2019-02-06 10:09:51', 0),
(1381, 'iuran sekolah', 210000, 'Debet', 1, '1819325', '', '2019-02-06 10:47:10', 0),
(1382, 'iuran sekolah', 210000, 'Debet', 1, '1819230', '', '2019-02-06 12:04:25', 0),
(1383, 'kip', 400000, 'Debet', 1, '1819165', '', '2019-02-06 12:05:58', 0),
(1384, 'iuran sekolah', 210000, 'Debet', 1, '1819081', '', '2019-02-06 12:07:44', 0),
(1385, 'IURAN SEKOLAH', 40000, 'Debet', 1, '1819089', '', '2019-02-07 07:46:26', 0),
(1386, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819089', '', '2019-02-07 07:47:33', 0),
(1387, 'IURAN SEKOLAH', 20000, 'Debet', 1, '1819338', '', '2019-02-07 12:00:05', 0),
(1389, 'IURAN SEKOLAH', 220000, 'Debet', 1, '1819173', '', '2019-02-07 12:04:08', 0),
(1390, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2019-02-08 09:03:02', 0),
(1391, 'iuran sekolah', 420000, 'Debet', 1, '1819183', '', '2019-02-08 10:45:16', 0),
(1392, 'iuran sekolah', 200000, 'Debet', 1, '1819104', '', '2019-02-08 11:09:41', 0),
(1393, 'iuran sekolah', 20000, 'Debet', 1, '1819338', '', '2019-02-08 11:16:08', 0),
(1394, 'iuran sekolah', 150000, 'Debet', 1, '1819149', '', '2019-02-08 11:17:23', 0),
(1395, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-02-09 08:28:09', 0),
(1396, 'iuran sekolah', 210000, 'Debet', 1, '1819079', '', '2019-02-09 08:38:32', 0),
(1397, 'iuran sekolah', 200000, 'Debet', 1, '1819055', '', '2019-02-09 08:57:21', 0),
(1398, 'iuran sekolah', 300000, 'Debet', 1, '1819107', '', '2019-02-09 09:48:55', 0),
(1399, 'iuran sekolah', 20000, 'Debet', 1, '1819338', '', '2019-02-09 11:41:17', 0),
(1400, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-02-11 08:04:04', 0),
(1401, 'iuran sekolah', 210000, 'Debet', 1, '1819207', '', '2019-02-11 08:13:22', 0),
(1402, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-02-11 08:35:56', 0),
(1403, 'iuran sekolah', 190000, 'Debet', 1, '1819245', '', '2019-02-11 08:51:49', 0),
(1404, 'iuran sekolah', 210000, 'Debet', 1, '1819269', '', '2019-02-11 11:20:32', 0),
(1405, 'iuran sekolah', 210000, 'Debet', 1, '1819186', '', '2019-02-11 12:39:30', 0),
(1406, 'iuran sekolah', 400000, 'Debet', 1, '1819309', '', '2019-02-11 12:58:15', 0),
(1407, 'iuran sekolah', 210000, 'Debet', 1, '1819027', '', '2019-02-12 07:40:00', 0),
(1408, 'iuran sekolah', 210000, 'Debet', 1, '1819027', '', '2019-02-12 07:41:04', 0),
(1409, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-02-12 07:56:38', 0),
(1410, 'iuran sekolah', 210000, 'Debet', 1, '1819139', '', '2019-02-12 09:59:11', 0),
(1411, 'iuran sekolah', 210000, 'Debet', 1, '1819268', '', '2019-02-12 10:00:04', 0),
(1412, 'iuran sekolah', 50000, 'Debet', 1, '1819237', '', '2019-02-12 11:54:14', 0),
(1413, 'KIP', 400000, 'Debet', 1, '1819159', '', '2019-02-13 07:56:32', 0),
(1414, 'KIP', 400000, 'Debet', 1, '1819093', '', '2019-02-13 07:58:08', 0),
(1415, 'KIP', 400000, 'Debet', 1, '1819218', '', '2019-02-13 08:00:48', 0),
(1416, 'KIP', 400000, 'Debet', 1, '1819036', '', '2019-02-13 08:23:36', 0),
(1417, 'KIP', 400000, 'Debet', 1, '1819155', '', '2019-02-13 08:25:06', 0),
(1418, 'KIP', 400000, 'Debet', 1, '1819138', '', '2019-02-13 08:35:02', 0),
(1419, 'KIP', 400000, 'Debet', 1, '1819242', '', '2019-02-13 08:35:58', 0),
(1420, 'iuran sekolah', 210000, 'Debet', 1, '1819192', '', '2019-02-13 10:46:18', 0),
(1421, 'iuran sekolah', 210000, 'Debet', 1, '1819321', '', '2019-02-13 11:47:49', 0),
(1422, 'iuran sekolah', 100000, 'Debet', 1, '1819277', '', '2019-02-14 08:23:07', 0),
(1423, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-02-14 11:34:25', 0),
(1424, 'iuran sekolah', 210000, 'Debet', 1, '1819101', '', '2019-02-15 08:59:26', 0),
(1425, 'iuran sekolah', 210000, 'Debet', 1, '1819169', '', '2019-02-15 09:25:56', 0),
(1426, 'iuran sekolah', 750000, 'Debet', 1, '1819019', '', '2019-02-15 09:33:23', 0),
(1427, 'KIP', 400000, 'Debet', 1, '1819330', '', '2019-02-15 11:13:55', 0),
(1428, 'iuran sekolah', 70000, 'Debet', 1, '1819182', '', '2019-02-16 08:58:33', 0),
(1429, 'iuran sekolah', 250000, 'Debet', 1, '1819286', '', '2019-02-18 07:00:24', 0),
(1430, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2019-02-18 08:06:10', 0),
(1431, 'iuran sekolah', 630000, 'Debet', 1, '1819140', '', '2019-02-18 09:15:52', 0),
(1432, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-02-18 09:18:16', 0),
(1433, 'iuran sekolah', 210000, 'Debet', 1, '1819252', '', '2019-02-18 10:44:36', 0),
(1434, 'iuran sekolah', 210000, 'Debet', 1, '1819227', '', '2019-02-18 11:41:10', 0),
(1435, 'iuran sekolah', 210000, 'Debet', 1, '1819095', '', '2019-02-18 12:23:24', 0),
(1436, 'iuran sekolah', 210000, 'Debet', 1, '1819114', '', '2019-02-19 08:22:43', 0),
(1437, 'iuran sekolah', 100000, 'Debet', 1, '1819253', '', '2019-02-19 11:56:25', 0),
(1438, 'iuran sekolah', 50000, 'Debet', 1, '1819200', '', '2019-02-20 10:05:26', 0),
(1439, 'iuran sekolah', 210000, 'Debet', 1, '1819174', '', '2019-02-20 10:37:53', 0),
(1440, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-02-20 11:16:08', 0),
(1441, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2019-02-20 11:54:18', 0),
(1442, 'iuran sekolah', 210000, 'Debet', 1, '1819120', '', '2019-02-21 07:24:47', 0),
(1443, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-02-21 11:19:07', 0),
(1444, 'iuran sekolah', 210000, 'Debet', 1, '1819297', '', '2019-02-21 11:55:06', 0),
(1445, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-02-23 09:55:34', 0),
(1446, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-02-25 07:55:39', 0),
(1447, 'iuran sekolah', 200000, 'Debet', 1, '1819025', '', '2019-02-25 07:59:56', 0),
(1448, 'iuran sekolah', 210000, 'Debet', 1, '1819090', '', '2019-02-25 08:46:30', 0),
(1449, 'iuran sekolah', 210000, 'Debet', 1, '1819034', '', '2019-02-25 09:07:07', 0),
(1450, 'iuran sekolah', 210000, 'Debet', 1, '1819034', '', '2019-02-25 09:09:49', 0),
(1451, 'iuran sekolah', 210000, 'Debet', 1, '1819008', '', '2019-02-25 10:38:03', 0),
(1452, 'iuran sekolah', 100000, 'Debet', 1, '1819026', '', '2019-02-25 10:39:43', 0),
(1453, 'iuran sekolah', 200000, 'Debet', 1, '1819199', '', '2019-02-26 08:56:27', 0),
(1454, 'iuran sekolah', 110000, 'Debet', 1, '1819046', '', '2019-02-27 07:50:54', 0),
(1455, 'iuran sekolah', 210000, 'Debet', 1, '1819066', '', '2019-02-27 07:56:07', 0),
(1456, 'iuran sekolah', 500000, 'Debet', 1, '1819009', '', '2019-02-27 08:14:19', 0),
(1457, 'iuran sekolah', 400000, 'Debet', 1, '1819009', '', '2019-02-27 08:17:48', 0),
(1458, 'iuran sekolah', 20000, 'Debet', 1, '1819099', '', '2019-02-27 08:21:24', 0),
(1459, 'iuran sekolah', 300000, 'Debet', 1, '1819324', '', '2019-02-27 08:22:23', 0),
(1460, 'iuran sekolah', 420000, 'Debet', 1, '1819205', '', '2019-02-27 09:06:28', 0),
(1461, 'iuran sekolah', 210000, 'Debet', 1, '1819053', '', '2019-02-27 09:36:28', 0),
(1462, 'iuran sekolah', 50000, 'Debet', 1, '1819237', '', '2019-02-27 11:57:52', 0),
(1463, 'Iuran Sekolah', 630000, 'Debet', 1, '1819110', '', '2019-02-28 07:28:45', 0),
(1464, 'Iuran Sekolah', 500000, 'Debet', 1, '1819172', '', '2019-02-28 07:55:17', 0),
(1465, 'Iuran Sekolah', 200000, 'Debet', 1, '1819336', '', '2019-02-28 08:27:18', 0),
(1466, 'Iuran Sekolah', 200000, 'Debet', 1, '1819175', '', '2019-02-28 10:02:48', 0),
(1467, 'Iuran Sekolah', 200000, 'Debet', 1, '1819175', '', '2019-02-28 10:04:00', 0),
(1468, 'Iuran Sekolah', 7000, 'Debet', 1, '1819176', '', '2019-02-28 10:05:05', 0),
(1469, 'Iuran Sekolah', 140000, 'Debet', 1, '1819168', '', '2019-02-28 10:11:43', 0),
(1470, 'Iuran Sekolah', 300000, 'Debet', 1, '1819168', '', '2019-02-28 10:13:19', 0),
(1471, 'Iuran Sekolah', 840000, 'Debet', 1, '1819101', '', '2019-02-28 10:35:48', 0),
(1472, 'Iuran Sekolah', 400000, 'Debet', 1, '1819113', '', '2019-02-28 11:09:29', 0),
(1473, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2019-03-01 10:39:23', 0),
(1474, 'iuran sekolah', 200000, 'Debet', 1, '1819237', '', '2019-03-01 11:11:37', 0),
(1475, 'iuran sekolah', 210000, 'Debet', 1, '1819229', '', '2019-03-01 11:14:41', 0),
(1476, 'iuran sekolah', 400000, 'Debet', 1, '1819239', '', '2019-03-02 08:02:01', 0),
(1477, 'iuran sekolah', 150000, 'Debet', 1, '1819144', '', '2019-03-02 08:03:13', 0),
(1478, 'iuran sekolah', 200000, 'Debet', 1, '1819075', '', '2019-03-02 10:13:29', 0),
(1479, 'iuran sekolah', 210000, 'Debet', 1, '1819292', '', '2019-03-02 10:30:03', 0),
(1480, 'iuran sekolah', 210000, 'Debet', 1, '1819287', '', '2019-03-02 10:31:27', 0),
(1481, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2019-03-02 10:37:44', 0),
(1482, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-03-02 10:39:33', 0),
(1483, 'iuran sekolah', 210000, 'Debet', 1, '1819095', '', '2019-03-02 10:48:36', 0),
(1484, 'iuran sekolah', 100000, 'Debet', 1, '1819338', '', '2019-03-02 11:47:03', 0),
(1485, 'iuran sekolah', 420000, 'Debet', 1, '1819226', '', '2019-03-04 09:03:46', 0),
(1486, 'iuran sekolah', 210000, 'Debet', 1, '1819025', '', '2019-03-04 09:05:09', 0),
(1487, 'iuran sekolah', 210000, 'Debet', 1, '1819207', '', '2019-03-04 09:06:07', 0),
(1488, 'iuran sekolah', 200000, 'Debet', 1, '1819262', '', '2019-03-04 09:07:20', 0),
(1489, 'iuran sekolah', 300000, 'Debet', 1, '1819087', '', '2019-03-04 09:08:47', 0),
(1490, 'iuran sekolah', 420000, 'Debet', 1, '1819259', '', '2019-03-04 09:15:49', 0),
(1491, 'iuran sekolah', 1050000, 'Debet', 1, '1819072', '', '2019-03-04 09:22:42', 0),
(1492, 'iuran sekolah', 210000, 'Debet', 1, '1819281', '', '2019-03-04 09:25:09', 0),
(1493, 'iuran sekolah', 210000, 'Debet', 1, '1819039', '', '2019-03-04 09:26:27', 0),
(1494, 'iuran sekolah', 420000, 'Debet', 1, '1819163', '', '2019-03-04 09:28:48', 0),
(1495, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-03-04 09:59:12', 0),
(1496, 'iuran sekolah', 200000, 'Debet', 1, '1819190', '', '2019-03-04 10:10:56', 0),
(1497, 'iuran sekolah', 420000, 'Debet', 1, '1819316', '', '2019-03-04 10:13:26', 0),
(1498, 'iuran sekolah', 210000, 'Debet', 1, '1819325', '', '2019-03-04 10:15:04', 0),
(1499, 'iuran sekolah', 200000, 'Debet', 1, '1819154', '', '2019-03-04 10:39:07', 0),
(1500, 'iuran sekolah', 220000, 'Debet', 1, '1819233', '', '2019-03-04 10:41:00', 0),
(1501, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2019-03-04 10:42:58', 0),
(1502, 'iuran sekolah', 210000, 'Debet', 1, '1819181', '', '2019-03-04 12:16:31', 0),
(1503, 'iuran sekolah', 420000, 'Debet', 1, '1819008', '', '2019-03-04 12:18:24', 0),
(1504, 'iuran sekolah', 210000, 'Debet', 1, '1819230', '', '2019-03-04 12:25:44', 0),
(1505, 'iuran sekolah', 150000, 'Debet', 1, '1819149', '', '2019-03-04 12:27:56', 0),
(1506, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2019-03-05 08:23:50', 0),
(1507, 'iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2019-03-05 08:25:33', 0),
(1508, 'iuran sekolah', 630000, 'Debet', 1, '1819305', '', '2019-03-05 08:29:25', 0),
(1509, 'iuran sekolah', 210000, 'Debet', 1, '1819314', '', '2019-03-05 08:34:44', 0),
(1510, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2019-03-05 10:29:14', 0),
(1511, 'iuran sekolah', 210000, 'Debet', 1, '1819081', '', '2019-03-05 12:29:07', 0),
(1512, 'iuran sekolah', 150000, 'Debet', 1, '1819069', '', '2019-03-06 08:14:06', 0),
(1513, 'iuran sekolah', 200000, 'Debet', 1, '1819109', '', '2019-03-06 09:48:15', 0),
(1514, 'iuran sekolah', 7000, 'Debet', 1, '1819176', '', '2019-03-06 10:08:42', 0),
(1515, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-03-06 10:09:46', 0),
(1516, 'iuran sekolah', 210000, 'Debet', 1, '1819214', '', '2019-03-06 11:14:38', 0),
(1517, 'iuran sekolah', 200000, 'Debet', 1, '1819023', '', '2019-03-06 12:06:12', 0),
(1518, 'iuran sekolah', 210000, 'Debet', 1, '1819007', '', '2019-03-06 12:07:23', 0),
(1519, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2019-03-06 16:20:56', 0),
(1520, 'iuran sekolah', 1060000, 'Debet', 1, '1819061', '', '2019-03-09 06:43:19', 0),
(1521, 'iuran sekolah', 220000, 'Debet', 1, '1819173', '', '2019-03-09 13:54:01', 0),
(1522, 'iuran sekolah', 1000000, 'Debet', 1, '1819274', '', '2019-03-15 08:33:41', 0),
(1523, 'iuran sekolah', 420000, 'Debet', 1, '1819012', '', '2019-03-18 08:32:03', 0),
(1524, 'iuran sekolah', 200000, 'Debet', 1, '1819109', '', '2019-03-19 07:35:20', 0),
(1525, 'iuran sekolah', 150000, 'Debet', 1, '1819043', '', '2019-03-19 07:36:43', 0),
(1526, 'iuran sekolah', 1060000, 'Debet', 1, '1819315', '', '2019-03-19 07:38:11', 0),
(1527, 'iuran sekolah', 500000, 'Debet', 1, '1819345', '', '2019-03-19 07:40:18', 0),
(1528, 'iuran sekolah', 420000, 'Debet', 1, '1819284', '', '2019-03-19 07:41:58', 0),
(1529, 'iuran sekolah', 630000, 'Debet', 1, '1819022', '', '2019-03-19 07:45:13', 0),
(1531, 'iuran sekolah', 200000, 'Debet', 1, '1819271', '', '2019-03-19 07:48:03', 0),
(1532, 'iuran sekolah', 150000, 'Debet', 1, '1819168', '', '2019-03-19 08:20:26', 0),
(1534, 'iuran sekolah', 265000, 'Debet', 1, '1819183', '', '2019-03-19 08:22:50', 0),
(1535, 'iuran sekolah', 210000, 'Debet', 1, '1819067', '', '2019-03-19 08:47:53', 0),
(1536, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819120', '', '2019-03-22 07:03:19', 0),
(1537, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819296', '', '2019-03-22 07:11:55', 0),
(1538, 'IURAN SEKOLAH', 150000, 'Debet', 1, '1819085', '', '2019-03-22 07:13:22', 0),
(1539, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819027', '', '2019-03-22 07:16:38', 0),
(1540, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819236', '', '2019-03-22 07:18:44', 0),
(1541, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819286', '', '2019-03-22 07:20:09', 0),
(1542, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819313', '', '2019-03-22 07:22:01', 0),
(1543, 'IURAN SEKOLAH', 420000, 'Debet', 1, '1819260', '', '2019-03-22 07:24:26', 0),
(1544, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819140', '', '2019-03-22 07:25:50', 0),
(1545, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819142', '', '2019-03-22 07:27:06', 0),
(1546, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819257', '', '2019-03-22 07:28:24', 0),
(1547, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819152', '', '2019-03-22 07:29:49', 0),
(1548, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819180', '', '2019-03-22 07:31:18', 0),
(1549, 'IURAN SEKOLAH', 500000, 'Debet', 1, '1819059', '', '2019-03-22 07:33:19', 0),
(1550, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819058', '', '2019-03-22 07:35:02', 0),
(1551, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819093', '', '2019-03-22 07:36:32', 0),
(1552, 'IURAN SEKOLAH', 400000, 'Debet', 1, '1819289', '', '2019-03-22 07:37:58', 0),
(1553, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819303', '', '2019-03-22 07:39:55', 0),
(1554, 'IURAN SEKOLAH', 420000, 'Debet', 1, '1819340', '', '2019-03-22 07:42:08', 0),
(1555, 'IURAN SEKOLAH', 500000, 'Debet', 1, '1819071', '', '2019-03-22 07:43:50', 0),
(1556, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819221', '', '2019-03-22 07:45:21', 0),
(1557, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819186', '', '2019-03-22 07:46:38', 0),
(1558, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819158', '', '2019-03-22 07:48:01', 0),
(1559, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819051', '', '2019-03-22 07:49:23', 0),
(1560, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819252', '', '2019-03-22 07:51:03', 0),
(1561, 'IURAN SEKOLAH', 600000, 'Debet', 1, '1819016', '', '2019-03-22 07:52:25', 0),
(1562, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819206', '', '2019-03-22 07:53:38', 0),
(1563, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819111', '', '2019-03-22 07:54:59', 0),
(1564, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819213', '', '2019-03-22 07:57:27', 0),
(1565, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819175', '', '2019-03-22 07:58:34', 0),
(1566, 'IURAN SEKOLAH', 130000, 'Debet', 1, '1819233', '', '2019-03-22 08:10:36', 0),
(1567, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819157', '', '2019-03-22 08:12:09', 0),
(1568, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819082', '', '2019-03-22 08:13:43', 0),
(1569, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819078', '', '2019-03-22 08:15:10', 0),
(1570, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819338', '', '2019-03-22 08:16:34', 0),
(1571, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819239', '', '2019-03-22 08:17:54', 0),
(1572, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819268', '', '2019-03-22 08:19:43', 0),
(1573, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819172', '', '2019-03-22 08:23:03', 0),
(1574, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819248', '', '2019-03-22 08:24:16', 0),
(1575, 'IURAN SEKOLAH', 90000, 'Debet', 1, '1819170', '', '2019-03-22 08:25:47', 0),
(1576, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819195', '', '2019-03-22 08:26:58', 0),
(1577, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819114', '', '2019-03-22 08:28:42', 0),
(1578, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819220', '', '2019-03-22 08:31:28', 0),
(1579, 'IURAN SEKOLAH', 150000, 'Debet', 1, '1819060', '', '2019-03-22 08:32:29', 0),
(1580, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819066', '', '2019-03-22 08:33:39', 0),
(1581, 'IURAN SEKOLAH', 10000, 'Debet', 1, '1819099', '', '2019-03-22 08:36:34', 0),
(1582, 'IURAN SEKOLAH', 400000, 'Debet', 1, '1819317', '', '2019-03-22 08:38:05', 0),
(1583, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819297', '', '2019-03-22 08:39:47', 0),
(1584, 'IURAN SEKOLAH', 250000, 'Debet', 1, '1819062', '', '2019-03-22 08:41:23', 0),
(1585, 'IURAN SEKOLAH', 250000, 'Debet', 1, '1819062', '', '2019-03-22 08:42:36', 0),
(1586, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819046', '', '2019-03-22 08:44:12', 0),
(1587, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819086', '', '2019-03-22 08:45:23', 0),
(1588, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819086', '', '2019-03-22 08:46:31', 0),
(1589, 'IURAN SEKOLAH', 250000, 'Debet', 1, '1819265', '', '2019-03-22 08:48:17', 0),
(1590, 'IURAN SEKOLAH', 110000, 'Debet', 1, '1819040', '', '2019-03-22 08:50:03', 0),
(1591, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819090', '', '2019-03-22 08:52:21', 0),
(1592, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819196', '', '2019-03-22 08:56:51', 0),
(1593, 'IURAN SEKOLAH', 140000, 'Debet', 1, '1819147', '', '2019-03-22 08:58:15', 0),
(1594, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819263', '', '2019-03-22 08:59:41', 0),
(1595, 'IURAN SEKOLAH', 150000, 'Debet', 1, '1819185', '', '2019-03-22 09:00:47', 0),
(1596, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819122', '', '2019-03-22 09:01:57', 0),
(1597, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819228', '', '2019-03-22 09:03:03', 0),
(1598, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819307', '', '2019-03-22 09:04:30', 0),
(1599, 'IURAN SEKOLAH', 20000, 'Debet', 1, '1819028', '', '2019-03-22 09:37:43', 0),
(1600, 'IURAN SEKOLAH', 200000, 'Debet', 1, '1819009', '', '2019-03-22 10:34:23', 0),
(1601, 'IURAN SEKOLAH', 250000, 'Debet', 1, '1819255', '', '2019-03-22 10:38:47', 0),
(1602, 'iuran sekolah', 210000, 'Debet', 1, '1819227', '', '2019-03-23 07:13:47', 0),
(1603, 'iuran sekolah', 50000, 'Debet', 1, '1819234', '', '2019-03-23 07:15:09', 0),
(1604, 'iuran sekolah', 400000, 'Debet', 1, '1819141', '', '2019-03-23 07:17:13', 0),
(1605, 'iuran sekolah', 210000, 'Debet', 1, '1819080', '', '2019-03-23 07:18:32', 0),
(1606, 'iuran sekolah', 50000, 'Debet', 1, '1819074', '', '2019-03-23 07:19:46', 0),
(1607, 'iuran sekolah', 210000, 'Debet', 1, '1819216', '', '2019-03-23 07:21:16', 0),
(1608, 'iuran sekolah', 100000, 'Debet', 1, '1819102', '', '2019-03-23 07:22:39', 0),
(1609, 'iuran sekolah', 100000, 'Debet', 1, '1819159', '', '2019-03-23 07:23:52', 0),
(1610, 'iuran sekolah', 310000, 'Debet', 1, '1819330', '', '2019-03-23 07:25:14', 0),
(1611, 'iuran sekolah', 300000, 'Debet', 1, '1819161', '', '2019-03-23 07:26:35', 0),
(1612, 'iuran sekolah', 210000, 'Debet', 1, '1819108', '', '2019-03-23 07:27:57', 0),
(1613, 'iuran sekolah', 50000, 'Debet', 1, '1819155', '', '2019-03-23 07:29:12', 0),
(1614, 'iuran sekolah', 210000, 'Debet', 1, '1819079', '', '2019-03-23 07:30:52', 0),
(1615, 'iuran sekolah', 200000, 'Debet', 1, '1819125', '', '2019-03-23 07:34:24', 0),
(1616, 'iuran sekolah', 100000, 'Debet', 1, '1819128', '', '2019-03-23 07:35:33', 0),
(1617, 'iuran sekolah', 210000, 'Debet', 1, '1819184', '', '2019-03-23 07:37:01', 0),
(1618, 'iuran sekolah', 100000, 'Debet', 1, '1819273', '', '2019-03-23 07:41:15', 0),
(1619, 'iuran sekolah', 100000, 'Debet', 1, '1819118', '', '2019-03-23 07:42:51', 0),
(1620, 'iuran sekolah', 210000, 'Debet', 1, '1819189', '', '2019-03-23 07:44:44', 0),
(1621, 'iuran sekolah', 50000, 'Debet', 1, '1819073', '', '2019-03-23 07:51:41', 0),
(1622, 'iuran sekolah', 100000, 'Debet', 1, '1819249', '', '2019-03-23 07:52:44', 0),
(1623, 'iuran sekolah', 100000, 'Debet', 1, '1819232', '', '2019-03-23 07:53:53', 0),
(1624, 'iuran sekolah', 420000, 'Debet', 1, '1819133', '', '2019-03-23 07:55:31', 0),
(1625, 'iuran sekolah', 100000, 'Debet', 1, '1819048', '', '2019-03-23 07:57:12', 0),
(1626, 'iuran sekolah', 100000, 'Debet', 1, '1819026', '', '2019-03-23 07:58:33', 0),
(1627, 'iuran sekolah', 500000, 'Debet', 1, '1819177', '', '2019-03-23 08:00:37', 0),
(1628, 'iuran sekolah', 50000, 'Debet', 1, '1819010', '', '2019-03-23 08:02:35', 0),
(1629, 'iuran sekolah', 150000, 'Debet', 1, '1819298', '', '2019-03-23 08:03:46', 0),
(1630, 'iuran sekolah', 200000, 'Debet', 1, '1819326', '', '2019-03-23 08:04:55', 0),
(1631, 'iuran sekolah', 500000, 'Debet', 1, '1819272', '', '2019-03-23 08:06:19', 0),
(1632, 'iuran sekolah', 50000, 'Debet', 1, '1819237', '', '2019-03-23 08:07:45', 0),
(1633, 'iuran sekolah', 210000, 'Debet', 1, '1819325', '', '2019-03-23 08:08:53', 0),
(1634, 'iuran sekolah', 210000, 'Debet', 1, '1819049', '', '2019-03-23 08:12:22', 0),
(1635, 'iuran sekolah', 50000, 'Debet', 1, '1819138', '', '2019-03-23 08:18:40', 0),
(1636, 'iuran sekolah', 100000, 'Debet', 1, '1819226', '', '2019-03-23 08:19:58', 0),
(1637, 'iuran sekolah', 200000, 'Debet', 1, '1819258', '', '2019-03-23 08:22:17', 0),
(1638, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2019-03-23 08:23:46', 0),
(1639, 'iuran sekolah', 200000, 'Debet', 1, '1819267', '', '2019-03-23 08:25:19', 0),
(1640, 'iuran sekolah', 50000, 'Debet', 1, '1819306', '', '2019-03-23 08:26:16', 0),
(1641, 'iuran sekolah', 100000, 'Debet', 1, '1819334', '', '2019-03-23 08:29:18', 0),
(1642, 'iuran sekolah', 150000, 'Debet', 1, '1819064', '', '2019-03-23 08:31:35', 0),
(1643, 'iuran sekolah', 420000, 'Debet', 1, '1819052', '', '2019-03-23 08:33:25', 0),
(1644, 'iuran sekolah', 210000, 'Debet', 1, '1819002', '', '2019-03-23 08:34:35', 0),
(1645, 'iuran sekolah', 7000, 'Debet', 1, '1819021', '', '2019-03-23 09:08:00', 0),
(1646, 'iuran sekolah', 300000, 'Debet', 1, '1819153', '', '2019-03-23 09:28:01', 0),
(1647, 'iuran sekolah', 220000, 'Debet', 1, '1819199', '', '2019-03-23 09:34:53', 0),
(1648, 'iuran sekolah', 100000, 'Debet', 1, '1819178', '', '2019-03-23 09:46:22', 0),
(1649, 'iuran sekolah', 50000, 'Debet', 1, '1819056', '', '2019-03-23 09:51:12', 0),
(1650, 'iuran sekolah', 140000, 'Debet', 1, '1819055', '', '2019-03-23 10:09:18', 0),
(1651, 'iuran harian', 250000, 'Debet', 1, '1819293', '', '2019-03-23 13:16:48', 0),
(1652, 'IURAN SEKOLAH', 400000, 'Debet', 1, '1819223', '', '2019-03-24 09:35:31', 0),
(1653, 'iuran sekolah', 30000, 'Debet', 1, '1819003', '', '2019-03-25 06:45:20', 0),
(1654, 'iuran sekolah', 210000, 'Debet', 1, '1819083', '', '2019-03-25 06:47:13', 0),
(1655, 'iuran sekolah', 55000, 'Debet', 1, '1819294', '', '2019-03-25 06:48:43', 0),
(1656, 'iuran sekolah', 500000, 'Debet', 1, '1819202', '', '2019-03-25 07:12:55', 0),
(1657, 'iuran sekolah', 17000, 'Debet', 1, '1819202', '', '2019-03-25 07:14:24', 0),
(1658, 'iuran sekolah', 50000, 'Debet', 1, '1819246', '', '2019-03-25 07:29:18', 0),
(1659, 'iuran sekolah', 200000, 'Debet', 1, '1819025', '', '2019-03-25 07:30:33', 0),
(1660, 'iuran sekolah', 100000, 'Debet', 1, '1819165', '', '2019-03-25 07:33:31', 0),
(1661, 'iuran sekolah', 200000, 'Debet', 1, '1819251', '', '2019-03-25 07:37:04', 0),
(1662, 'iuran sekolah', 200000, 'Debet', 1, '1819197', '', '2019-03-25 07:38:14', 0),
(1663, 'iuran sekolah', 500000, 'Debet', 1, '1819171', '', '2019-03-25 07:40:44', 0),
(1664, 'iuran sekolah', 100000, 'Debet', 1, '1819110', '', '2019-03-25 07:41:59', 0),
(1665, 'iuran sekolah', 50000, 'Debet', 1, '1819160', '', '2019-03-25 07:43:37', 0),
(1666, 'iuran sekolah', 300000, 'Debet', 1, '1819308', '', '2019-03-25 07:45:10', 0),
(1667, 'iuran sekolah', 200000, 'Debet', 1, '1819106', '', '2019-03-25 07:48:08', 0),
(1668, 'iuran sekolah', 100000, 'Debet', 1, '1819091', '', '2019-03-25 07:49:26', 0),
(1669, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-03-25 09:51:59', 0),
(1670, 'iuran sekolah', 150000, 'Debet', 1, '1819004', '', '2019-03-25 09:54:22', 0),
(1671, 'iuran sekolah', 100000, 'Debet', 1, '1819242', '', '2019-03-25 09:56:46', 0),
(1672, 'iuran sekolah', 840000, 'Debet', 1, '1819201', '', '2019-03-25 11:26:00', 0),
(1673, 'iuran sekolah', 100000, 'Debet', 1, '1819250', '', '2019-03-25 11:47:48', 0),
(1674, 'iuran sekolah', 50000, 'Debet', 1, '1819253', '', '2019-03-25 11:49:20', 0),
(1675, 'iuran sekolah', 210000, 'Debet', 1, '1819130', '', '2019-03-26 08:32:27', 0),
(1676, 'iuran sekolah', 420000, 'Debet', 1, '1819047', '', '2019-03-26 09:51:32', 0),
(1677, 'iuran sekolah', 100000, 'Debet', 1, '1819124', '', '2019-03-26 09:57:17', 0),
(1678, 'iuran sekolah', 210000, 'Debet', 1, '1819057', '', '2019-03-26 10:07:49', 0),
(1679, 'iuran sekolah', 60000, 'Debet', 1, '1819277', '', '2019-03-26 10:10:35', 0),
(1680, 'iuran sekolah', 200000, 'Debet', 1, '1819256', '', '2019-03-27 09:11:02', 0),
(1681, 'iuran sekolah', 450000, 'Debet', 1, '1819031', '', '2019-03-27 09:36:58', 0),
(1682, 'IURAN SEKOLAH', 150000, 'Debet', 1, '1819066', '', '2019-03-28 08:11:05', 0),
(1683, 'IURAN SEKOLAH', 500000, 'Debet', 1, '1819288', '', '2019-03-28 08:45:05', 0),
(1684, 'IURAN SEKOLAH', 40000, 'Debet', 1, '1819237', '', '2019-03-28 13:18:03', 0),
(1685, 'iuran sekolah', 80000, 'Debet', 1, '1819244', '', '2019-03-29 08:15:53', 0),
(1686, 'iuran sekolah', 450000, 'Debet', 1, '1819321', '', '2019-03-29 09:16:48', 0),
(1687, 'iuran sekolah', 1000000, 'Debet', 1, '1819309', '', '2019-03-29 13:05:25', 0),
(1688, 'iuran sekolah', 500000, 'Debet', 1, '1819203', '', '2019-04-01 08:18:31', 0),
(1689, 'iuran sekolah', 200000, 'Debet', 1, '1819203', '', '2019-04-01 08:19:39', 0),
(1690, 'iuran sekolah', 210000, 'Debet', 1, '1819074', '', '2019-04-01 08:21:21', 0),
(1691, 'iuran sekolah', 210000, 'Debet', 1, '1819316', '', '2019-04-01 08:22:31', 0),
(1692, 'iuran sekolah', 50000, 'Debet', 1, '1819051', '', '2019-04-01 09:24:38', 0),
(1693, 'iuran sekolah', 210000, 'Debet', 1, '1819037', '', '2019-04-01 09:25:46', 0),
(1694, 'iuran sekolah', 200000, 'Debet', 1, '1819020', '', '2019-04-01 10:22:44', 0),
(1695, 'iuran sekolah', 40000, 'Debet', 1, '1819176', '', '2019-04-01 10:35:53', 0),
(1696, 'iuran sekolah', 85000, 'Debet', 1, '1819182', '', '2019-04-02 07:26:34', 0),
(1697, 'iuran sekolah', 1050000, 'Debet', 1, '1819174', '', '2019-04-02 08:01:12', 0),
(1698, 'iuran sekolah', 200000, 'Debet', 1, '1819102', '', '2019-04-02 08:31:00', 0),
(1699, 'iuran sekolah', 130000, 'Debet', 1, '1819084', '', '2019-04-04 07:43:47', 0),
(1700, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2019-04-04 08:10:27', 0),
(1701, 'iuran sekolah', 150000, 'Debet', 1, '1819230', '', '2019-04-04 13:20:14', 0),
(1702, 'iuran sekolah', 10000, 'Debet', 1, '1819099', '', '2019-04-05 07:56:59', 0),
(1703, 'iuran sekolah', 210000, 'Debet', 1, '1819229', '', '2019-04-05 08:56:25', 0),
(1704, 'iuran sekolah', 100000, 'Debet', 1, '1819138', '', '2019-04-05 11:19:07', 0),
(1705, 'iuran sekolah', 300000, 'Debet', 1, '1819122', '', '2019-04-06 07:25:40', 0),
(1706, 'iuran sekolah', 300000, 'Debet', 1, '1819118', '', '2019-04-06 07:26:33', 0),
(1707, 'iuran sekolah', 100000, 'Debet', 1, '1819075', '', '2019-04-06 08:33:49', 0),
(1708, 'iuran sekolah', 210000, 'Debet', 1, '1819281', '', '2019-04-06 11:47:22', 0),
(1709, 'iuran sekolah', 320000, 'Debet', 1, '1819279', '', '2019-04-06 12:55:36', 0),
(1710, 'iuran sekolah', 300000, 'Debet', 1, '1819291', '', '2019-04-06 13:02:01', 0),
(1711, 'IURAN SEKOLAH', 300000, 'Debet', 1, '1819298', '', '2019-04-08 08:02:02', 0),
(1712, 'IURAN SEKOLAH', 50000, 'Debet', 1, '1819051', '', '2019-04-08 08:11:28', 0),
(1713, 'IURAN SEKOLAH', 150000, 'Debet', 1, '1819241', '', '2019-04-08 09:15:52', 0),
(1714, 'IURAN SEKOLAH', 420000, 'Debet', 1, '1819116', '', '2019-04-08 09:27:28', 0),
(1715, 'IURAN SEKOLAH', 100000, 'Debet', 1, '1819026', '', '2019-04-08 10:27:58', 0),
(1716, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819081', '', '2019-04-08 10:30:59', 0),
(1717, 'IURAN SEKOLAH', 210000, 'Debet', 1, '1819169', '', '2019-04-08 11:14:30', 0),
(1718, 'IURAN SEKOLAH', 300000, 'Debet', 1, '1819336', '', '2019-04-08 12:14:15', 0),
(1719, 'iuran sekolah', 20000, 'Debet', 1, '1819176', '', '2019-04-09 10:10:29', 0),
(1720, 'iuran sekolah', 100000, 'Debet', 1, '1819253', '', '2019-04-09 11:26:20', 0),
(1721, 'iuran sekolah', 20000, 'Debet', 1, '1819237', '', '2019-04-09 11:56:56', 0),
(1722, 'iuran sekolah', 160000, 'Debet', 1, '1819183', '', '2019-04-10 10:02:42', 0),
(1723, 'iuran sekolah', 210000, 'Debet', 1, '1819053', '', '2019-04-10 10:28:04', 0),
(1724, 'iuran sekolah', 210000, 'Debet', 1, '1819139', '', '2019-04-10 11:04:46', 0),
(1725, 'iuran sekolah', 210000, 'Debet', 1, '1819039', '', '2019-04-11 08:25:54', 0),
(1726, 'iuran sekolah', 420000, 'Debet', 1, '1819012', '', '2019-04-11 08:40:30', 0),
(1727, 'iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2019-04-11 08:43:35', 0),
(1728, 'iuran sekolah', 210000, 'Debet', 1, '1819079', '', '2019-04-11 08:55:52', 0),
(1729, 'iuran sekolah', 210000, 'Debet', 1, '1819115', '', '2019-04-11 08:57:12', 0),
(1730, 'iuran sekolah', 210000, 'Debet', 1, '1819115', '', '2019-04-11 09:04:17', 0),
(1731, 'iuran sekolah', 150000, 'Debet', 1, '1819149', '', '2019-04-11 09:18:56', 0),
(1732, 'iuran sekolah', 250000, 'Debet', 1, '1819310', '', '2019-04-11 09:28:29', 0),
(1733, 'iuran sekolah', 400000, 'Debet', 1, '1819045', '', '2019-04-11 10:53:37', 0),
(1734, 'iuran sekolah', 200000, 'Debet', 1, '1819069', '', '2019-04-12 07:42:38', 0),
(1735, 'iuran sekolah', 110000, 'Debet', 1, '1819170', '', '2019-04-12 09:03:07', 0),
(1736, 'iuran sekolah', 100000, 'Debet', 1, '1819170', '', '2019-04-12 09:05:19', 0),
(1737, 'iuran sekolah', 100000, 'Debet', 1, '1819334', '', '2019-04-15 08:24:04', 0),
(1738, 'iuran sekolah', 65000, 'Debet', 1, '1819182', '', '2019-04-15 08:26:38', 0),
(1739, 'iuran sekolah', 300000, 'Debet', 1, '1819161', '', '2019-04-15 08:54:09', 0),
(1740, 'iuran sekolah', 210000, 'Debet', 1, '1819027', '', '2019-04-15 09:11:42', 0),
(1741, 'iuran sekolah', 210000, 'Debet', 1, '1819207', '', '2019-04-15 10:00:35', 0),
(1742, 'iuran sekolah', 500000, 'Debet', 1, '1819333', '', '2019-04-15 13:04:52', 0),
(1743, 'iuran sekolah', 210000, 'Debet', 1, '1819252', '', '2019-04-16 09:16:23', 0),
(1744, 'iuran sekolah', 210000, 'Debet', 1, '1819233', '', '2019-04-18 09:17:07', 0),
(1745, 'iuran sekolah', 630000, 'Debet', 1, '1819029', '', '2019-04-20 09:13:25', 0),
(1746, 'iuran sekolah', 210000, 'Debet', 1, '1819199', '', '2019-04-22 08:05:14', 0),
(1747, 'iuran sekolah', 200000, 'Debet', 1, '1819271', '', '2019-04-22 10:12:05', 0),
(1748, 'iuran sekolah', 50000, 'Debet', 1, '1819182', '', '2019-04-23 09:32:03', 0),
(1749, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2019-04-23 09:33:15', 0),
(1750, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-04-27 08:39:24', 0),
(1751, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2019-04-29 07:38:26', 0),
(1752, 'iuran sekolah', 200000, 'Debet', 1, '1819025', '', '2019-04-29 07:52:15', 0),
(1753, 'iuran sekolah', 210000, 'Debet', 1, '1819090', '', '2019-04-29 08:19:45', 0),
(1754, 'iuran sekolah', 210000, 'Debet', 1, '1819213', '', '2019-04-29 12:11:46', 0),
(1755, 'iuran sekolah', 210000, 'Debet', 1, '1819120', '', '2019-04-30 10:04:12', 0),
(1756, 'iuran sekolah', 200000, 'Debet', 1, '1819226', '', '2019-05-04 08:28:26', 0),
(1757, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-05-04 08:29:32', 0),
(1758, 'iuran sekkolah', 210000, 'Debet', 1, '1819181', '', '2019-05-09 09:51:21', 0),
(1759, 'iuran sekolah', 210000, 'Debet', 1, '1819207', '', '2019-05-11 09:33:13', 0),
(1760, 'iuran sekolah', 210000, 'Debet', 1, '1819236', '', '2019-05-13 08:12:54', 0),
(1761, 'iuran sekolah', 100000, 'Debet', 1, '1819253', '', '2019-05-13 08:22:31', 0),
(1762, 'iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2019-05-13 08:59:47', 0),
(1763, 'iuran sekolah', 210000, 'Debet', 1, '1819079', '', '2019-05-13 09:30:02', 0),
(1764, 'iuran sekolah', 85000, 'Debet', 1, '1819073', '', '2019-05-13 09:44:01', 0),
(1765, 'iuran sekolah', 250000, 'Debet', 1, '1819173', '', '2019-05-14 09:41:19', 0),
(1766, 'iuran sekolah', 40000, 'Debet', 1, '1819182', '', '2019-05-14 09:51:35', 0),
(1767, 'iuran sekolah', 200000, 'Debet', 1, '1819271', '', '2019-05-15 07:56:14', 0),
(1768, 'iuran sekolah', 60000, 'Debet', 1, '1819144', '', '2019-05-15 08:58:37', 0),
(1769, 'Iuran Sekolah', 210000, 'Debet', 1, '1819034', '', '2019-05-16 07:22:50', 0),
(1770, 'iuran sekolah', 210000, 'Debet', 1, '1819258', '', '2019-05-17 09:20:23', 0),
(1771, 'iuran sekolah', 200000, 'Debet', 1, '1819293', '', '2019-05-20 07:35:08', 0),
(1772, 'iuran sekolah', 210000, 'Debet', 1, '1819186', '', '2019-05-20 07:37:08', 0),
(1773, 'iuran sekolah', 200000, 'Debet', 1, '1819125', '', '2019-05-20 07:39:14', 0),
(1774, 'iuran sekolah', 50000, 'Debet', 1, '1819250', '', '2019-05-20 07:40:29', 0),
(1775, 'iuran sekolah', 520000, 'Debet', 1, '1819110', '', '2019-05-20 07:41:36', 0),
(1776, 'iuran sekolah', 210000, 'Debet', 1, '1819096', '', '2019-05-20 07:42:39', 0),
(1777, 'iuran sekolah', 420000, 'Debet', 1, '1819012', '', '2019-05-20 10:06:30', 0),
(1778, 'iuran sekolah', 210000, 'Debet', 1, '1819027', '', '2019-05-20 11:08:44', 0),
(1779, 'iuran sekolah', 210000, 'Debet', 1, '1819070', '', '2019-05-21 06:58:07', 0),
(1780, 'iuran sekolah', 150000, 'Debet', 1, '1819202', '', '2019-05-21 08:33:45', 0),
(1781, 'iuran sekolah', 600000, 'Debet', 1, '1819254', '', '2019-05-22 09:19:27', 0),
(1782, 'iuran sekolah', 420000, 'Debet', 1, '1819090', '', '2019-06-12 07:25:00', 0),
(1783, 'iuran sekolah', 210000, 'Debet', 1, '1819196', '', '2019-06-12 07:26:28', 0),
(1784, 'iuran sekolah', 100000, 'Debet', 1, '1819040', '', '2019-06-12 07:27:37', 0),
(1785, 'iuran sekolah', 200000, 'Debet', 1, '1819279', '', '2019-06-12 07:31:32', 0),
(1786, 'iuran sekolah', 210000, 'Debet', 1, '1819140', '', '2019-06-12 07:33:34', 0),
(1787, 'iuran sekolah', 300000, 'Debet', 1, '1819197', '', '2019-06-12 07:35:16', 0),
(1788, 'iuran sekolah', 420000, 'Debet', 1, '1819268', '', '2019-06-12 07:36:25', 0),
(1789, 'iuran sekolah', 250000, 'Debet', 1, '1819230', '', '2019-06-12 07:40:12', 0),
(1790, 'iuran sekolah', 150000, 'Debet', 1, '1819243', '', '2019-06-12 07:41:56', 0),
(1791, 'iuran sekolah', 210000, 'Debet', 1, '1819252', '', '2019-06-12 07:43:15', 0),
(1792, 'iuran sekolah', 290000, 'Debet', 1, '1819247', '', '2019-06-12 07:44:45', 0),
(1793, 'iuran sekolah', 200000, 'Debet', 1, '1819085', '', '2019-06-12 07:46:28', 0),
(1794, 'iuran sekolah', 100000, 'Debet', 1, '1819112', '', '2019-06-12 07:53:53', 0),
(1795, 'iuran sekolah', 420000, 'Debet', 1, '1819216', '', '2019-06-12 07:55:27', 0),
(1796, 'iuran sekolah', 350000, 'Debet', 1, '1819265', '', '2019-06-12 07:57:56', 0),
(1797, 'iuran sekolah', 210000, 'Debet', 1, '1819123', '', '2019-06-12 08:01:28', 0),
(1798, 'iuran sekolah', 500000, 'Debet', 1, '1819300', '', '2019-06-12 08:04:18', 0),
(1799, 'iuran sekolah', 500000, 'Debet', 1, '1819345', '', '2019-06-12 08:07:10', 0),
(1800, 'iuran sekolah', 210000, 'Debet', 1, '1819032', '', '2019-06-12 08:08:53', 0),
(1801, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2019-06-12 08:10:03', 0),
(1802, 'iuran sekolah', 210000, 'Debet', 1, '1819049', '', '2019-06-12 08:11:34', 0),
(1803, 'iuran sekolah', 50000, 'Debet', 1, '1819176', '', '2019-06-12 08:13:38', 0),
(1804, 'iuran sekolah', 100000, 'Debet', 1, '1819306', '', '2019-06-12 08:15:09', 0),
(1805, 'iuran sekolah', 200000, 'Debet', 1, '1819237', '', '2019-06-12 08:17:14', 0),
(1806, 'iuran sekolah', 210000, 'Debet', 1, '1819266', '', '2019-06-12 08:18:38', 0),
(1807, 'iuran sekolah', 50000, 'Debet', 1, '1819056', '', '2019-06-12 08:20:11', 0),
(1808, 'iuran sekolah', 210000, 'Debet', 1, '1819195', '', '2019-06-12 08:24:51', 0),
(1809, 'iuran sekolah', 100000, 'Debet', 1, '1819242', '', '2019-06-12 08:28:39', 0),
(1810, 'iuran sekolah', 400000, 'Debet', 1, '1819206', '', '2019-06-12 08:33:09', 0),
(1811, 'iuran sekolah', 250000, 'Debet', 1, '1819150', '', '2019-06-12 08:33:59', 0),
(1812, 'iuran sekolah', 200000, 'Debet', 1, '1819076', '', '2019-06-12 08:35:01', 0),
(1813, 'iuran sekolah', 300000, 'Debet', 1, '1819248', '', '2019-06-12 08:37:53', 0),
(1814, 'iuran sekolah', 500000, 'Debet', 1, '1819106', '', '2019-06-12 08:39:01', 0),
(1815, 'iuran sekolah', 210000, 'Debet', 1, '1819199', '', '2019-06-12 08:40:31', 0),
(1816, 'iuran sekolah', 210000, 'Debet', 1, '1819270', '', '2019-06-12 08:41:37', 0),
(1817, 'iuran sekolah', 300000, 'Debet', 1, '1819078', '', '2019-06-12 08:43:40', 0),
(1818, 'iuran sekolah', 420000, 'Debet', 1, '1819208', '', '2019-06-12 08:44:54', 0),
(1819, 'iuran sekolah', 120000, 'Debet', 1, '1819074', '', '2019-06-12 08:46:18', 0),
(1820, 'iuran sekolah', 100000, 'Debet', 1, '1819155', '', '2019-06-12 08:47:29', 0),
(1821, 'iuran sekolah', 210000, 'Debet', 1, '1819333', '', '2019-06-12 08:49:07', 0),
(1822, 'iuran sekolah', 100000, 'Debet', 1, '1819305', '', '2019-06-12 08:50:09', 0),
(1823, 'iuran sekolah', 200000, 'Debet', 1, '1819050', '', '2019-06-12 08:51:24', 0),
(1824, 'iuran sekolah', 630000, 'Debet', 1, '1819219', '', '2019-06-12 08:52:48', 0),
(1825, 'iuran sekolah', 210000, 'Debet', 1, '1819015', '', '2019-06-12 08:53:51', 0),
(1826, 'iuran sekolah', 300000, 'Debet', 1, '1819109', '', '2019-06-12 08:54:52', 0),
(1827, 'iuran sekolah', 210000, 'Debet', 1, '1819131', '', '2019-06-12 08:56:29', 0),
(1828, 'iuran sekolah', 210000, 'Debet', 1, '1819132', '', '2019-06-12 08:57:33', 0),
(1829, 'iuran sekolah', 420000, 'Debet', 1, '1819053', '', '2019-06-12 08:58:40', 0),
(1830, 'iuran sekolah', 211000, 'Debet', 1, '1819082', '', '2019-06-12 08:59:42', 0),
(1831, 'iuran sekolah', 400000, 'Debet', 1, '1819122', '', '2019-06-12 09:00:51', 0),
(1832, 'iuran sekolah', 420000, 'Debet', 1, '1819098', '', '2019-06-12 09:02:22', 0),
(1833, 'iuran sekolah', 420000, 'Debet', 1, '1819297', '', '2019-06-12 09:03:58', 0),
(1834, 'iuran sekolah', 210000, 'Debet', 1, '1819325', '', '2019-06-12 09:06:21', 0),
(1835, 'iuran sekolah', 210000, 'Debet', 1, '1819189', '', '2019-06-12 09:08:27', 0),
(1836, 'iuran sekolah', 210000, 'Debet', 1, '1819118', '', '2019-06-12 09:12:11', 0),
(1837, 'iuran sekolah', 420000, 'Debet', 1, '1819227', '', '2019-06-12 09:15:08', 0),
(1838, 'iuran sekolah', 210000, 'Debet', 1, '1819200', '', '2019-06-12 09:16:22', 0),
(1839, 'iuran sekolah', 210000, 'Debet', 1, '1819067', '', '2019-06-12 09:21:52', 0),
(1840, 'iuran sekolah', 500000, 'Debet', 1, '1819234', '', '2019-06-12 09:24:09', 0),
(1841, 'iuran sekolah', 220000, 'Debet', 1, '1819260', '', '2019-06-12 09:25:27', 0),
(1842, 'iuran sekolah', 630000, 'Debet', 1, '1819296', '', '2019-06-12 09:27:11', 0),
(1843, 'iuran sekolah', 50000, 'Debet', 1, '1819097', '', '2019-06-12 09:29:05', 0),
(1844, 'iuran sekolah', 400000, 'Debet', 1, '1819284', '', '2019-06-12 09:30:14', 0),
(1845, 'iuran sekolah', 100000, 'Debet', 1, '1819039', '', '2019-06-12 09:31:29', 0),
(1846, 'iuran sekolah', 200000, 'Debet', 1, '1819154', '', '2019-06-12 09:32:28', 0),
(1847, 'iuran sekolah', 200000, 'Debet', 1, '1819190', '', '2019-06-12 09:33:48', 0),
(1848, 'iuran sekolah', 210000, 'Debet', 1, '1819278', '', '2019-06-12 09:34:44', 0),
(1849, 'iuran sekolah', 100000, 'Debet', 1, '1819299', '', '2019-06-12 09:36:41', 0),
(1850, 'iuran sekolah', 210000, 'Debet', 1, '1819081', '', '2019-06-12 09:39:00', 0),
(1851, 'iuran sekolah', 300000, 'Debet', 1, '1819309', '', '2019-06-12 09:40:17', 0),
(1852, 'iuran sekolah', 210000, 'Debet', 1, '1819263', '', '2019-06-12 09:41:16', 0),
(1853, 'iuran sekolah', 420000, 'Debet', 1, '1819151', '', '2019-06-12 09:42:53', 0),
(1854, 'iuran sekolah', 420000, 'Debet', 1, '1819307', '', '2019-06-12 09:44:12', 0),
(1855, 'iuran sekolah', 200000, 'Debet', 1, '1819288', '', '2019-06-13 07:13:45', 0),
(1856, 'iuran sekolah', 50000, 'Debet', 1, '1819330', '', '2019-06-13 07:18:19', 0),
(1857, 'iuran sekolah', 100000, 'Debet', 1, '1819165', '', '2019-06-13 07:20:00', 0),
(1858, 'iuran sekolah', 100000, 'Debet', 1, '1819273', '', '2019-06-13 07:21:08', 0),
(1859, 'iuran sekolah', 300000, 'Debet', 1, '1819175', '', '2019-06-13 07:22:51', 0),
(1860, 'iuran sekolah', 100000, 'Debet', 1, '1819159', '', '2019-06-13 07:26:20', 0),
(1861, 'iuran sekolah', 50000, 'Debet', 1, '1819211', '', '2019-06-13 07:27:49', 0),
(1862, 'iuran sekolah', 210000, 'Debet', 1, '1819257', '', '2019-06-13 07:28:54', 0),
(1863, 'iuran sekolah', 500000, 'Debet', 1, '1819163', '', '2019-06-13 10:07:59', 0),
(1864, 'iuran sekolah', 150000, 'Debet', 1, '1819094', '', '2019-06-13 10:09:41', 0),
(1865, 'iuran sekolah', 200000, 'Debet', 1, '1819283', '', '2019-06-13 10:13:08', 0),
(1866, 'iuran sekolah', 1200000, 'Debet', 1, '1819283', '', '2019-06-13 10:14:23', 0),
(1867, 'iuran sekolah', 210000, 'Debet', 1, '1819292', '', '2019-06-13 11:02:47', 0),
(1868, 'iuran sekolah', 420000, 'Debet', 1, '1819192', '', '2019-06-13 11:07:40', 0),
(1869, 'iuran sekolah', 210000, 'Debet', 1, '1819169', '', '2019-06-13 11:10:52', 0),
(1870, 'iuran sekolah', 80000, 'Debet', 1, '1819243', '', '2019-06-13 11:17:35', 0),
(1871, 'iuran sekolah', 200000, 'Debet', 1, '1819179', '', '2019-06-14 07:09:33', 0),
(1872, 'iuran sekolah', 300000, 'Debet', 1, '1819114', '', '2019-06-14 07:10:59', 0),
(1873, 'iuran sekolah', 400000, 'Debet', 1, '1819149', '', '2019-06-14 07:13:17', 0),
(1874, 'iuran sekolah', 210000, 'Debet', 1, '1819072', '', '2019-06-14 07:14:32', 0),
(1875, 'iuran sekolah', 290000, 'Debet', 1, '1819287', '', '2019-06-15 07:39:02', 0),
(1876, 'iuran sekolah', 420000, 'Debet', 1, '1819029', '', '2019-06-15 09:00:51', 0),
(1877, 'iuran sekolah', 1000000, 'Debet', 1, '1819198', '', '2019-06-15 09:54:55', 0),
(1878, 'iuran sekolah', 500000, 'Debet', 1, '1819336', '', '2019-06-17 08:42:24', 0),
(1879, 'iuran sekolah', 210000, 'Debet', 1, '1819252', '', '2019-06-17 09:33:49', 0),
(1880, 'iuran sekolah', 210000, 'Debet', 1, '1819081', '', '2019-06-17 09:47:11', 0),
(1881, 'iuran sekolah', 100000, 'Debet', 1, '1819157', '', '2019-06-17 09:48:27', 0),
(1882, 'iuran sekolah', 200000, 'Debet', 1, '1819329', '', '2019-06-17 09:50:02', 0),
(1883, 'iuran sekolah', 420000, 'Debet', 1, '1819316', '', '2019-06-17 09:51:10', 0),
(1884, 'iuran sekolah', 210000, 'Debet', 1, '1819229', '', '2019-06-17 10:57:54', 0),
(1885, 'iuran sekolah', 500000, 'Debet', 1, '1819161', '', '2019-06-17 11:10:15', 0),
(1886, 'iuran sekolah', 300000, 'Debet', 1, '1819329', '', '2019-06-19 08:24:16', 0),
(1887, 'iuran sekolah', 330000, 'Debet', 1, '1819119', '', '2019-06-21 09:15:08', 0),
(1888, 'iuran sekolah', 500000, 'Debet', 1, '1819224', '', '2019-06-22 08:07:43', 0),
(1889, 'iuran sekolah', 320000, 'Debet', 1, '1819008', '', '2019-06-22 08:23:37', 0),
(1890, 'iuran sekolah', 210000, 'Debet', 1, '1819183', '', '2019-06-22 08:25:34', 0),
(1891, 'iuran sekolah', 630000, 'Debet', 1, '1819022', '', '2019-06-22 08:39:07', 0),
(1892, 'iuran sekolah', 2355000, 'Debet', 1, '1819294', '', '2019-06-22 08:48:45', 0),
(1893, 'iuran sekolah', 200000, 'Debet', 1, '1819260', '', '2019-06-22 08:51:58', 0),
(1894, 'iuran sekolah', 420000, 'Debet', 1, '1819120', '', '2019-06-22 08:53:21', 0),
(1895, 'iuran sekolah', 210000, 'Debet', 1, '1819152', '', '2019-06-22 09:16:08', 0),
(1896, 'iuran sekolah', 210000, 'Debet', 1, '1819261', '', '2019-06-22 09:27:10', 0),
(1897, 'iuran sekolah', 350000, 'Debet', 1, '1819175', '', '2019-06-22 11:51:15', 0),
(1898, 'iuran sekolah', 200000, 'Debet', 1, '1819313', '', '2019-07-10 08:03:31', 0),
(1899, 'iuran sekolah', 600000, 'Debet', 1, '1819051', '', '2019-07-17 16:55:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_picture` text NOT NULL,
  `position_id` int(11) NOT NULL,
  `user_nisn` varchar(50) NOT NULL,
  `sekolah_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `user_nik` varchar(50) NOT NULL,
  `user_borndate` date NOT NULL,
  `user_golongan` varchar(255) NOT NULL,
  `user_sertifikasi` text NOT NULL,
  `user_pendidikan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_picture`, `position_id`, `user_nisn`, `sekolah_id`, `kelas_id`, `user_nik`, `user_borndate`, `user_golongan`, `user_sertifikasi`, `user_pendidikan`) VALUES
(1, 'Administrator', '5kali6', 'ihsandulu.jpg', 1, '', 0, 0, '', '0000-00-00', '', '', ''),
(6, 'admin', 'password', '', 0, '', 1, 0, '', '0000-00-00', '', '', ''),
(7, 'Amir', 'password', '20_29_51_ade.jpg', 2, '', 1, 0, '123456', '0000-00-00', '', '', ''),
(8, 'Aan', 'password', '20_51_23_images.jpg', 3, '', 1, 0, '123457', '2018-02-23', 'A', 'B', 'SMA'),
(42, 'lulu', '112233', '', 3, '', 1, 0, '575778886', '0000-00-00', '', '', ''),
(351, 'AANG AJIJI', 'password', '', 4, '1819001', 1, 10, '', '0000-00-00', '', '', ''),
(357, 'ABDUL RAHMAT', 'password', '', 4, '1819003', 1, 10, '', '0000-00-00', '', '', ''),
(359, 'ABDULATIF', 'password', '', 4, '1819004', 1, 10, '', '0000-00-00', '', '', ''),
(362, 'ABI MANYU', 'password', '', 4, '1819005', 1, 10, '', '0000-00-00', '', '', ''),
(366, 'ADAM FADILAH', 'password', '', 4, '1819006', 1, 10, '', '0000-00-00', '', '', ''),
(368, 'ANGGI SUPRIYATNA', 'password', '', 4, '1819007', 1, 10, '', '0000-00-00', '', '', ''),
(371, 'ADHA ARIYADI', 'password', '', 4, '1819008', 1, 10, '', '0000-00-00', '', '', ''),
(375, 'ADITIYA RAMADHAN', 'password', '', 4, '1819009', 1, 10, '', '0000-00-00', '', '', ''),
(378, 'ADU ABDULAH', 'password', '', 4, '1819010', 1, 10, '', '0000-00-00', '', '', ''),
(380, 'AHMAD DAELIMI', 'password', '', 4, '1819011', 1, 10, '', '0000-00-00', '', '', ''),
(383, 'AHMAD DIO SAPUTRA', 'password', '', 4, '1819012', 1, 10, '', '0000-00-00', '', '', ''),
(386, 'AHMAD JENI', 'password', '', 4, '1819013', 1, 10, '', '0000-00-00', '', '', ''),
(389, 'AHMAD MUHADI', 'password', '', 4, '1819014', 1, 10, '', '0000-00-00', '', '', ''),
(393, 'AHMAD SARKAYA', 'password', '', 4, '1819015', 1, 10, '', '0000-00-00', '', '', ''),
(396, 'AHYAN BARIKLI', 'password', '', 4, '1819016', 1, 10, '', '0000-00-00', '', '', ''),
(399, 'AJAM MULYANA', 'password', '', 4, '1819017', 1, 10, '', '0000-00-00', '', '', ''),
(401, 'AJI', 'password', '', 4, '1819018', 1, 10, '', '0000-00-00', '', '', ''),
(405, 'AJI JUDIN', 'password', '', 4, '1819019', 1, 10, '', '0000-00-00', '', '', ''),
(408, 'AJI MULYADI', 'password', '', 4, '1819020', 1, 10, '', '0000-00-00', '', '', ''),
(410, 'AJIS MAULANA', 'password', '', 4, '1819021', 1, 10, '', '0000-00-00', '', '', ''),
(414, 'AKBAR SUSENO', 'password', '', 4, '1819022', 1, 10, '', '0000-00-00', '', '', ''),
(417, 'AKMAL ARYA A', 'password', '', 4, '1819023', 1, 10, '', '0000-00-00', '', '', ''),
(420, 'ALADI NURAHMAD', 'password', '', 4, '1819024', 1, 10, '', '0000-00-00', '', '', ''),
(423, 'ALDA SOLIHATI', 'password', '', 4, '1819025', 1, 10, '', '0000-00-00', '', '', ''),
(426, 'ALIS KRISNAWATI', 'password', '', 4, '1819026', 1, 10, '', '0000-00-00', '', '', ''),
(428, 'ALPIN HIDAYATULLAH', 'password', '', 4, '1819027', 1, 10, '', '0000-00-00', '', '', ''),
(431, 'AMARUDIN', 'password', '', 4, '1819028', 1, 10, '', '0000-00-00', '', '', ''),
(435, 'AMELIA', 'password', '', 4, '1819029', 1, 10, '', '0000-00-00', '', '', ''),
(437, 'AMJAHUDI', 'password', '', 4, '1819030', 1, 10, '', '0000-00-00', '', '', ''),
(440, 'ANANDA LESTARI', 'password', '', 4, '1819031', 1, 10, '', '0000-00-00', '', '', ''),
(443, 'ANANDA PERMATA KUSUMA', 'password', '', 4, '1819032', 1, 10, '', '0000-00-00', '', '', ''),
(447, 'ANANDITA', 'password', '', 4, '1819033', 1, 10, '', '0000-00-00', '', '', ''),
(449, 'ANDRES', 'password', '', 4, '1819034', 1, 10, '', '0000-00-00', '', '', ''),
(453, 'ANDRIAN', 'password', '', 4, '1819035', 1, 10, '', '0000-00-00', '', '', ''),
(455, 'ANDRIANSYAH', 'password', '', 4, '1819036', 1, 10, '', '0000-00-00', '', '', ''),
(459, 'ANGGI PERDIANSYAH', 'password', '', 4, '1819037', 1, 10, '', '0000-00-00', '', '', ''),
(462, 'A', 'password', '', 4, '1819038', 1, 10, '', '0000-00-00', '', '', ''),
(465, 'ANI ASANI', 'password', '', 4, '1819039', 1, 10, '', '0000-00-00', '', '', ''),
(468, 'ANI FEBRIANI', 'password', '', 4, '1819040', 1, 10, '', '0000-00-00', '', '', ''),
(470, 'ANISA', 'password', '', 4, '1819041', 1, 10, '', '0000-00-00', '', '', ''),
(473, 'ANISA ZAKIA', 'password', '', 4, '1819042', 1, 10, '', '0000-00-00', '', '', ''),
(476, 'ANWAR', 'password', '', 4, '1819043', 1, 10, '', '0000-00-00', '', '', ''),
(479, 'APRIYANTI', 'password', '', 4, '1819044', 1, 10, '', '0000-00-00', '', '', ''),
(483, 'ARI JULIANA', 'password', '', 4, '1819045', 1, 10, '', '0000-00-00', '', '', ''),
(485, 'ARI JUNIARTA', 'password', '', 4, '1819046', 1, 10, '', '0000-00-00', '', '', ''),
(488, 'ARIP MULYANA', 'password', '', 4, '1819047', 1, 10, '', '0000-00-00', '', '', ''),
(491, 'ARIYANTO', 'password', '', 4, '1819048', 1, 10, '', '0000-00-00', '', '', ''),
(495, 'ARYADI RAMADHAN', 'password', '', 4, '1819049', 1, 10, '', '0000-00-00', '', '', ''),
(497, 'ASEP', 'password', '', 4, '1819050', 1, 10, '', '0000-00-00', '', '', ''),
(501, 'ASEP AHYANI', 'password', '', 4, '1819051', 1, 10, '', '0000-00-00', '', '', ''),
(503, 'ASEP RAPIUDIN', 'password', '', 4, '1819052', 1, 10, '', '0000-00-00', '', '', ''),
(507, 'ATI NURLITA', 'password', '', 4, '1819053', 1, 10, '', '0000-00-00', '', '', ''),
(509, 'ATU APRIANI', 'password', '', 4, '1819054', 1, 10, '', '0000-00-00', '', '', ''),
(513, 'AYU ANGGRAENI', 'password', '', 4, '1819055', 1, 10, '', '0000-00-00', '', '', ''),
(516, 'AYU RAHMAWATI', 'password', '', 4, '1819056', 1, 10, '', '0000-00-00', '', '', ''),
(519, 'AYU SUMINAR', 'password', '', 4, '1819057', 1, 10, '', '0000-00-00', '', '', ''),
(522, 'BADRI', 'password', '', 4, '1819058', 1, 10, '', '0000-00-00', '', '', ''),
(524, 'BAYU BAGUS PRASETYA', 'password', '', 4, '1819059', 1, 10, '', '0000-00-00', '', '', ''),
(528, 'BELLA FULIHAH', 'password', '', 4, '1819060', 1, 10, '', '0000-00-00', '', '', ''),
(531, 'EGI', 'password', '', 4, '1819061', 1, 10, '', '0000-00-00', '', '', ''),
(533, 'DANDI MAULANA', 'password', '', 4, '1819062', 1, 10, '', '0000-00-00', '', '', ''),
(537, 'DEDE AMRI', 'password', '', 4, '1819063', 1, 10, '', '0000-00-00', '', '', ''),
(540, 'DEDE MAULANA', 'password', '', 4, '1819064', 1, 10, '', '0000-00-00', '', '', ''),
(542, 'DEDE SINTA WIJAYA', 'password', '', 4, '1819065', 1, 10, '', '0000-00-00', '', '', ''),
(545, 'DEDE SUPIANDI', 'password', '', 4, '1819066', 1, 10, '', '0000-00-00', '', '', ''),
(548, 'DELA RAMADHANI', 'password', '', 4, '1819067', 1, 10, '', '0000-00-00', '', '', ''),
(552, 'DELITA', 'password', '', 4, '1819068', 1, 10, '', '0000-00-00', '', '', ''),
(555, 'DENDI SUNANDAR', 'password', '', 4, '1819069', 1, 10, '', '0000-00-00', '', '', ''),
(558, 'DIKA JUALIANTO', 'password', '', 4, '1819070', 1, 10, '', '0000-00-00', '', '', ''),
(560, 'DIKI FADILAH', 'password', '', 4, '1819071', 1, 10, '', '0000-00-00', '', '', ''),
(564, 'DIMAS PERMANA', 'password', '', 4, '1819072', 1, 10, '', '0000-00-00', '', '', ''),
(567, 'DIMAS PUJI RIYANTO', 'password', '', 4, '1819073', 1, 10, '', '0000-00-00', '', '', ''),
(570, 'KIKI HERIYANTO', 'password', '', 4, '1819074', 1, 10, '', '0000-00-00', '', '', ''),
(572, 'DINAR', 'password', '', 4, '1819075', 1, 10, '', '0000-00-00', '', '', ''),
(576, 'DINI', 'password', '', 4, '1819076', 1, 10, '', '0000-00-00', '', '', ''),
(578, 'DITA TRIANA', 'password', '', 4, '1819077', 1, 10, '', '0000-00-00', '', '', ''),
(582, 'DWI ARIYANTI', 'password', '', 4, '1819078', 1, 10, '', '0000-00-00', '', '', ''),
(583, 'EKA PARERA', 'password', '', 4, '1819079', 1, 10, '', '0000-00-00', '', '', ''),
(586, 'ELENSYAH', 'password', '', 4, '1819080', 1, 10, '', '0000-00-00', '', '', ''),
(588, 'ELIA', 'password', '', 4, '1819081', 1, 10, '', '0000-00-00', '', '', ''),
(590, 'ELSA ELYASARI', 'password', '', 4, '1819082', 1, 10, '', '0000-00-00', '', '', ''),
(592, 'ENDAH HANDAYANI', 'password', '', 4, '1819083', 1, 10, '', '0000-00-00', '', '', ''),
(594, 'ENDI', 'password', '', 4, '1819084', 1, 10, '', '0000-00-00', '', '', ''),
(596, 'EPI YULIANA', 'password', '', 4, '1819085', 1, 10, '', '0000-00-00', '', '', ''),
(598, 'EQI', 'password', '', 4, '1819086', 1, 10, '', '0000-00-00', '', '', ''),
(600, 'ERIK FADILAH', 'password', '', 4, '1819087', 1, 10, '', '0000-00-00', '', '', ''),
(602, 'ERIKA FITRIA', 'password', '', 4, '1819088', 1, 10, '', '0000-00-00', '', '', ''),
(604, 'ANDRE FADLIANSYAH', 'password', '', 4, '1819089', 1, 10, '', '0000-00-00', '', '', ''),
(606, 'EVA NURHAYATI SULISTINA', 'password', '', 4, '1819090', 1, 10, '', '0000-00-00', '', '', ''),
(608, 'EVI SILVIANI', 'password', '', 4, '1819091', 1, 10, '', '0000-00-00', '', '', ''),
(610, 'EVI YANTI', 'password', '', 4, '1819092', 1, 10, '', '0000-00-00', '', '', ''),
(611, 'FAHMI PRAYOGA', 'password', '', 4, '1819093', 1, 10, '', '0000-00-00', '', '', ''),
(614, 'FARHAN HIBATULLAH', 'password', '', 4, '1819094', 1, 10, '', '0000-00-00', '', '', ''),
(615, 'FEBRIYANTI', 'password', '', 4, '1819095', 1, 10, '', '0000-00-00', '', '', ''),
(618, 'FERI HERYANTO', 'password', '', 4, '1819096', 1, 10, '', '0000-00-00', '', '', ''),
(620, 'FIRDA AINUN FITRI', 'password', '', 4, '1819097', 1, 10, '', '0000-00-00', '', '', ''),
(622, 'FITRI AWALIAH', 'password', '', 4, '1819098', 1, 10, '', '0000-00-00', '', '', ''),
(624, 'GALANG RODIATNA', 'password', '', 4, '1819099', 1, 10, '', '0000-00-00', '', '', ''),
(626, 'GILANG ARDAM PURNAMA', 'password', '', 4, '1819100', 1, 10, '', '0000-00-00', '', '', ''),
(629, 'HALIMAH SADIAH', 'password', '', 4, '1819101', 1, 10, '', '0000-00-00', '', '', ''),
(631, 'HAMKA KHAMARAULLAH', 'password', '', 4, '1819102', 1, 10, '', '0000-00-00', '', '', ''),
(633, 'HARYATI', 'password', '', 4, '1819103', 1, 10, '', '0000-00-00', '', '', ''),
(635, 'HAVIFA', 'password', '', 4, '1819104', 1, 10, '', '0000-00-00', '', '', ''),
(637, 'HERI HERIYANTO', 'password', '', 4, '1819105', 1, 10, '', '0000-00-00', '', '', ''),
(639, 'HERLAN', 'password', '', 4, '1819106', 1, 10, '', '0000-00-00', '', '', ''),
(641, 'ENI NURAENI', 'password', '', 4, '1819107', 1, 10, '', '0000-00-00', '', '', ''),
(643, 'HERMAWAN', 'password', '', 4, '1819108', 1, 10, '', '0000-00-00', '', '', ''),
(645, 'IDA SARI', 'password', '', 4, '1819109', 1, 10, '', '0000-00-00', '', '', ''),
(647, 'IDHAM MUDIN', 'password', '', 4, '1819110', 1, 10, '', '0000-00-00', '', '', ''),
(649, 'IHWAN BAIHAQI', 'password', '', 4, '1819111', 1, 10, '', '0000-00-00', '', '', ''),
(651, 'IIN', 'password', '', 4, '1819112', 1, 10, '', '0000-00-00', '', '', ''),
(653, 'IIP SAPRUDIN', 'password', '', 4, '1819113', 1, 10, '', '0000-00-00', '', '', ''),
(655, 'ILHAM BAHRI RUDIN', 'password', '', 4, '1819114', 1, 10, '', '0000-00-00', '', '', ''),
(657, 'ILHAM RAMADHAN', 'password', '', 4, '1819115', 1, 10, '', '0000-00-00', '', '', ''),
(659, 'INDRA', 'password', '', 4, '1819116', 1, 10, '', '0000-00-00', '', '', ''),
(661, 'INSYAN ALDIANINGSIH', 'password', '', 4, '1819117', 1, 10, '', '0000-00-00', '', '', ''),
(663, 'INTAN', 'password', '', 4, '1819118', 1, 10, '', '0000-00-00', '', '', ''),
(665, 'INTAN SARI', 'password', '', 4, '1819119', 1, 10, '', '0000-00-00', '', '', ''),
(667, 'IQBAL PERMANA', 'password', '', 4, '1819120', 1, 10, '', '0000-00-00', '', '', ''),
(669, 'IRFAN MAULANA', 'password', '', 4, '1819121', 1, 10, '', '0000-00-00', '', '', ''),
(671, 'IRMA SARI', 'password', '', 4, '1819122', 1, 10, '', '0000-00-00', '', '', ''),
(673, 'IRPAN', 'password', '', 4, '1819123', 1, 10, '', '0000-00-00', '', '', ''),
(675, 'IRPAN MAULANA', 'password', '', 4, '1819124', 1, 10, '', '0000-00-00', '', '', ''),
(677, 'IRWAN', 'password', '', 4, '1819125', 1, 10, '', '0000-00-00', '', '', ''),
(679, 'IWAN BULKINI', 'password', '', 4, '1819126', 1, 10, '', '0000-00-00', '', '', ''),
(681, 'JAENAL UMAR', 'password', '', 4, '1819127', 1, 10, '', '0000-00-00', '', '', ''),
(683, 'JAENUDIN', 'password', '', 4, '1819128', 1, 10, '', '0000-00-00', '', '', ''),
(685, 'JAENUDIN', 'password', '', 4, '1819129', 1, 10, '', '0000-00-00', '', '', ''),
(687, 'JAJA UHUM', 'password', '', 4, '1819130', 1, 10, '', '0000-00-00', '', '', ''),
(689, 'JARNI', 'password', '', 4, '1819131', 1, 10, '', '0000-00-00', '', '', ''),
(691, 'JESIKA', 'password', '', 4, '1819132', 1, 10, '', '0000-00-00', '', '', ''),
(692, 'MUHAMAD SURENDI', 'password', '', 4, '1819181', 1, 10, '', '0000-00-00', '', '', ''),
(693, 'JIDAN FIRMANSYAH', 'password', '', 4, '1819133', 1, 10, '', '0000-00-00', '', '', ''),
(695, 'JOLLIE DIVA J', 'password', '', 4, '1819134', 1, 10, '', '0000-00-00', '', '', ''),
(697, 'KARTIYAH', 'password', '', 4, '1819135', 1, 10, '', '0000-00-00', '', '', ''),
(699, 'KHOIRIL IMAM', 'password', '', 4, '1819136', 1, 10, '', '0000-00-00', '', '', ''),
(701, 'KIKI MULYADI', 'password', '', 4, '1819137', 1, 10, '', '0000-00-00', '', '', ''),
(703, 'KRISNA', 'password', '', 4, '1819138', 1, 10, '', '0000-00-00', '', '', ''),
(705, 'KURNIAWAN', 'password', '', 4, '1819139', 1, 10, '', '0000-00-00', '', '', ''),
(707, 'LARAS SRI GAYATRI', 'password', '', 4, '1819140', 1, 10, '', '0000-00-00', '', '', ''),
(709, 'LAURA AUSAHNI', 'password', '', 4, '1819141', 1, 10, '', '0000-00-00', '', '', ''),
(711, 'LIDIA', 'password', '', 4, '1819142', 1, 10, '', '0000-00-00', '', '', ''),
(713, 'LILI', 'password', '', 4, '1819143', 1, 10, '', '0000-00-00', '', '', ''),
(715, 'LIWA ULHAMDI', 'password', '', 4, '1819144', 1, 10, '', '0000-00-00', '', '', ''),
(717, 'LUCKY AGUSTIAN', 'password', '', 4, '1819145', 1, 10, '', '0000-00-00', '', '', ''),
(719, 'LUKY REZA', 'password', '', 4, '1819146', 1, 10, '', '0000-00-00', '', '', ''),
(721, 'LUTFIAH', 'password', '', 4, '1819147', 1, 10, '', '0000-00-00', '', '', ''),
(723, 'LUTFINA', 'password', '', 4, '1819148', 1, 10, '', '0000-00-00', '', '', ''),
(725, 'MAHMUD', 'password', '', 4, '1819149', 1, 10, '', '0000-00-00', '', '', ''),
(727, 'MARISA ASARI', 'password', '', 4, '1819150', 1, 10, '', '0000-00-00', '', '', ''),
(729, 'MARLINA', 'password', '', 4, '1819151', 1, 10, '', '0000-00-00', '', '', ''),
(731, 'MARSELA', 'password', '', 4, '1819152', 1, 10, '', '0000-00-00', '', '', ''),
(733, 'MAULANA YUSUP', 'password', '', 4, '1819153', 1, 10, '', '0000-00-00', '', '', ''),
(735, 'MIA SUPRIYANTI', 'password', '', 4, '1819154', 1, 10, '', '0000-00-00', '', '', ''),
(737, 'MIFTAHUL JANAH', 'password', '', 4, '1819155', 1, 10, '', '0000-00-00', '', '', ''),
(739, 'MIKO MARTINO', 'password', '', 4, '1819156', 1, 10, '', '0000-00-00', '', '', ''),
(741, 'MIRNA', 'password', '', 4, '1819157', 1, 10, '', '0000-00-00', '', '', ''),
(743, 'MIRNAWATI', 'password', '', 4, '1819158', 1, 10, '', '0000-00-00', '', '', ''),
(745, 'MISNA MAULANA', 'password', '', 4, '1819159', 1, 10, '', '0000-00-00', '', '', ''),
(747, 'MUHAMAD ADITIYA SAPUTRA', 'password', '', 4, '1819160', 1, 10, '', '0000-00-00', '', '', ''),
(749, 'RAINDRA PRIATAMA', 'password', '', 4, '1819161', 1, 10, '', '0000-00-00', '', '', ''),
(751, 'MUHAMAD ANDRIAN', 'password', '', 4, '1819162', 1, 10, '', '0000-00-00', '', '', ''),
(753, 'MUHAMAD BINTANG', 'password', '', 4, '1819163', 1, 10, '', '0000-00-00', '', '', ''),
(755, 'MUHAMAD DANDI SURYA BEKTI', 'password', '', 4, '1819164', 1, 10, '', '0000-00-00', '', '', ''),
(757, 'MUHAMAD DZIKRI A', 'password', '', 4, '1819165', 1, 10, '', '0000-00-00', '', '', ''),
(759, 'MUHAMAD FAUZI RENALDI', 'password', '', 4, '1819166', 1, 10, '', '0000-00-00', '', '', ''),
(761, 'MUHAMAD ILHAM AKBAR', 'password', '', 4, '1819167', 1, 10, '', '0000-00-00', '', '', ''),
(763, 'MUHAMAD INDRA PRATAMA', 'password', '', 4, '1819168', 1, 10, '', '0000-00-00', '', '', ''),
(765, 'MUHAMAD JALALUDIN', 'password', '', 4, '1819169', 1, 10, '', '0000-00-00', '', '', ''),
(767, 'M. fauzan Akmal', 'password', '', 4, '1819170', 1, 10, '', '0000-00-00', '', '', ''),
(769, 'MUHAMAD MELANDRIANO', 'password', '', 4, '1819171', 1, 10, '', '0000-00-00', '', '', ''),
(771, 'MUHAMAD NOVAN', 'password', '', 4, '1819172', 1, 10, '', '0000-00-00', '', '', ''),
(773, 'MUHAMAD RAFLI', 'password', '', 4, '1819173', 1, 10, '', '0000-00-00', '', '', ''),
(775, 'MUHAMAD REZA FIRDAUS', 'password', '', 4, '1819174', 1, 10, '', '0000-00-00', '', '', ''),
(777, 'MUHAMAD REZA MAULANA', 'password', '', 4, '1819175', 1, 10, '', '0000-00-00', '', '', ''),
(779, 'MUHAMAD RIFKI F', 'password', '', 4, '1819176', 1, 10, '', '0000-00-00', '', '', ''),
(781, 'MUHAMAD RIZKI BAHTIAR', 'password', '', 4, '1819177', 1, 10, '', '0000-00-00', '', '', ''),
(783, 'MUHAMAD RUSMANTA', 'password', '', 4, '1819178', 1, 10, '', '0000-00-00', '', '', ''),
(785, 'MUHAMAD SETIAWAN', 'password', '', 4, '1819179', 1, 10, '', '0000-00-00', '', '', ''),
(787, 'MUHAMAD SUPARMAN', 'password', '', 4, '1819180', 1, 10, '', '0000-00-00', '', '', ''),
(791, 'MUHAMAD TAJU SUBKI', 'password', '', 4, '1819182', 1, 10, '', '0000-00-00', '', '', ''),
(793, 'MUHAMAD YUSUF', 'password', '', 4, '1819183', 1, 10, '', '0000-00-00', '', '', ''),
(795, 'MULYADI', 'password', '', 4, '1819184', 1, 10, '', '0000-00-00', '', '', ''),
(797, 'NADILA YULIANA', 'password', '', 4, '1819185', 1, 10, '', '0000-00-00', '', '', ''),
(799, 'NANDA MULYA', 'password', '', 4, '1819186', 1, 10, '', '0000-00-00', '', '', ''),
(801, 'NASRULLOH', 'password', '', 4, '1819187', 1, 10, '', '0000-00-00', '', '', ''),
(803, 'rama hidayat', 'password', '', 4, '1819188', 1, 10, '', '0000-00-00', '', '', ''),
(804, 'RIZKY ANWARUDIN', 'password', '', 4, '1819237', 1, 10, '', '0000-00-00', '', '', ''),
(805, 'NENENG RISMAWATI', 'password', '', 4, '1819189', 1, 10, '', '0000-00-00', '', '', ''),
(807, 'NIA HEMIANTI', 'password', '', 4, '1819190', 1, 10, '', '0000-00-00', '', '', ''),
(809, 'NIKEN', 'password', '', 4, '1819191', 1, 10, '', '0000-00-00', '', '', ''),
(811, 'NINA JUNIATI', 'password', '', 4, '1819192', 1, 10, '', '0000-00-00', '', '', ''),
(813, 'NOPI AER LANGGA', 'password', '', 4, '1819193', 1, 10, '', '0000-00-00', '', '', ''),
(815, 'NUR FAJAR', 'password', '', 4, '1819194', 1, 10, '', '0000-00-00', '', '', ''),
(817, 'NUR HASANAH', 'password', '', 4, '1819195', 1, 10, '', '0000-00-00', '', '', ''),
(819, 'NUR MAR HIDAYAH', 'password', '', 4, '1819196', 1, 10, '', '0000-00-00', '', '', ''),
(821, 'NUR SYIFA FAJRIYANTI', 'password', '', 4, '1819197', 1, 10, '', '0000-00-00', '', '', ''),
(823, 'NURAENI', 'password', '', 4, '1819198', 1, 10, '', '0000-00-00', '', '', ''),
(825, 'NURFADILAH', 'password', '', 4, '1819199', 1, 10, '', '0000-00-00', '', '', ''),
(827, 'NURTI FITRIYANA', 'password', '', 4, '1819200', 1, 10, '', '0000-00-00', '', '', ''),
(829, 'NURTIARA RIFAI', 'password', '', 4, '1819201', 1, 10, '', '0000-00-00', '', '', ''),
(831, 'PARHAN', 'password', '', 4, '1819202', 1, 10, '', '0000-00-00', '', '', ''),
(833, 'PIRLI PRAWESTI', 'password', '', 4, '1819203', 1, 10, '', '0000-00-00', '', '', ''),
(835, 'PIRMANSYAH', 'password', '', 4, '1819204', 1, 10, '', '0000-00-00', '', '', ''),
(837, 'PRIYANTO', 'password', '', 4, '1819205', 1, 10, '', '0000-00-00', '', '', ''),
(839, 'PUJI AMALIAH', 'password', '', 4, '1819206', 1, 10, '', '0000-00-00', '', '', ''),
(841, 'PUTRA ADITYA', 'password', '', 4, '1819207', 1, 10, '', '0000-00-00', '', '', ''),
(843, 'RAHMAWATI', 'password', '', 4, '1819208', 1, 10, '', '0000-00-00', '', '', ''),
(845, 'RAHMAWATI', 'password', '', 4, '1819209', 1, 10, '', '0000-00-00', '', '', ''),
(847, 'RAMA HIDAYAH', 'password', '', 4, '1819210', 1, 10, '', '0000-00-00', '', '', ''),
(849, 'RAMA WIJAYA', 'password', '', 4, '1819211', 1, 10, '', '0000-00-00', '', '', ''),
(851, 'RAMDANA', 'password', '', 4, '1819212', 1, 10, '', '0000-00-00', '', '', ''),
(853, 'RAMDANI', 'password', '', 4, '1819213', 1, 10, '', '0000-00-00', '', '', ''),
(855, 'RATNASARI', 'password', '', 4, '1819214', 1, 10, '', '0000-00-00', '', '', ''),
(856, 'RENDI', 'password', '', 4, '1819215', 1, 10, '', '0000-00-00', '', '', ''),
(858, 'RENDI ERLANGGA', 'password', '', 4, '1819216', 1, 10, '', '0000-00-00', '', '', ''),
(860, 'RENI', 'password', '', 4, '1819217', 1, 10, '', '0000-00-00', '', '', ''),
(862, 'RESTI OKTAVIS NIRMALA', 'password', '', 4, '1819218', 1, 10, '', '0000-00-00', '', '', ''),
(864, 'RESTU APRIANSYAH', 'password', '', 4, '1819219', 1, 10, '', '0000-00-00', '', '', ''),
(866, 'RIAN FERDIANSYAH', 'password', '', 4, '1819220', 1, 10, '', '0000-00-00', '', '', ''),
(868, 'RIAN HIDAYAT', 'password', '', 4, '1819221', 1, 10, '', '0000-00-00', '', '', ''),
(870, 'RIAN SETIAWAN', 'password', '', 4, '1819222', 1, 10, '', '0000-00-00', '', '', ''),
(872, 'RIDHO RAMBU GILANG', 'password', '', 4, '1819223', 1, 10, '', '0000-00-00', '', '', ''),
(874, 'RIDWAN', 'password', '', 4, '1819224', 1, 10, '', '0000-00-00', '', '', ''),
(876, 'RIFKI DWI HERYANA', 'password', '', 4, '1819225', 1, 10, '', '0000-00-00', '', '', ''),
(878, 'RIFKI FAUZI', 'password', '', 4, '1819226', 1, 10, '', '0000-00-00', '', '', ''),
(880, 'RIKA AGUSTIN', 'password', '', 4, '1819227', 1, 10, '', '0000-00-00', '', '', ''),
(882, 'RIMA SHASHI', 'password', '', 4, '1819228', 1, 10, '', '0000-00-00', '', '', ''),
(884, 'RINI FEBRIANI', 'password', '', 4, '1819229', 1, 10, '', '0000-00-00', '', '', ''),
(886, 'RINI HARYANI', 'password', '', 4, '1819230', 1, 10, '', '0000-00-00', '', '', ''),
(888, 'RIO', 'password', '', 4, '1819231', 1, 10, '', '0000-00-00', '', '', ''),
(890, 'RIPALDI HIDAYAT', 'password', '', 4, '1819232', 1, 10, '', '0000-00-00', '', '', ''),
(892, 'RIRI MUHDIANI', 'password', '', 4, '1819233', 1, 10, '', '0000-00-00', '', '', ''),
(894, 'RISNA', 'password', '', 4, '1819234', 1, 10, '', '0000-00-00', '', '', ''),
(896, 'RITA KURNIASIH', 'password', '', 4, '1819235', 1, 10, '', '0000-00-00', '', '', ''),
(898, 'RIYADIL NUR HAMDI', 'password', '', 4, '1819236', 1, 10, '', '0000-00-00', '', '', ''),
(902, 'RIZKI MAULANA', 'password', '', 4, '1819238', 1, 10, '', '0000-00-00', '', '', ''),
(904, 'RIZKI MAULANA', 'password', '', 4, '1819239', 1, 10, '', '0000-00-00', '', '', ''),
(906, 'RIZKI NUR CAHYANA', 'password', '', 4, '1819240', 1, 10, '', '0000-00-00', '', '', ''),
(908, 'RIZKI RAMDANI', 'password', '', 4, '1819241', 1, 10, '', '0000-00-00', '', '', ''),
(910, 'ROBI RISNANDAR', 'password', '', 4, '1819242', 1, 10, '', '0000-00-00', '', '', ''),
(912, 'ROBIAH', 'password', '', 4, '1819243', 1, 10, '', '0000-00-00', '', '', ''),
(914, 'ROHAN HAIKAL', 'password', '', 4, '1819244', 1, 10, '', '0000-00-00', '', '', ''),
(916, 'ROHILA', 'password', '', 4, '1819245', 1, 10, '', '0000-00-00', '', '', ''),
(918, 'ROKIB', 'password', '', 4, '1819246', 1, 10, '', '0000-00-00', '', '', ''),
(920, 'ROMADHONA ALISIA M', 'password', '', 4, '1819247', 1, 10, '', '0000-00-00', '', '', ''),
(922, 'ROMDON GUNAWAN', 'password', '', 4, '1819248', 1, 10, '', '0000-00-00', '', '', ''),
(924, 'ROMDONI', 'password', '', 4, '1819249', 1, 10, '', '0000-00-00', '', '', ''),
(926, 'ROPI CANDRA', 'password', '', 4, '1819250', 1, 10, '', '0000-00-00', '', '', ''),
(928, 'ROPI ERLANGGA', 'password', '', 4, '1819251', 1, 10, '', '0000-00-00', '', '', ''),
(930, 'ROSDIANA', 'password', '', 4, '1819252', 1, 10, '', '0000-00-00', '', '', ''),
(932, 'ROSUL SAYYID AL FADLI', 'password', '', 4, '1819253', 1, 10, '', '0000-00-00', '', '', ''),
(933, 'RUDINI', 'password', '', 4, '1819254', 1, 10, '', '0000-00-00', '', '', ''),
(935, 'PAJAR PALAHUDIN T', 'password', '', 4, '1819255', 1, 10, '', '0000-00-00', '', '', ''),
(937, 'RYAN PRATAMA', 'password', '', 4, '1819256', 1, 10, '', '0000-00-00', '', '', ''),
(939, 'SABILATUL HASANAH', 'password', '', 4, '1819257', 1, 10, '', '0000-00-00', '', '', ''),
(941, 'SAEFUL BAHRI', 'password', '', 4, '1819258', 1, 10, '', '0000-00-00', '', '', ''),
(943, 'SUPRIYATNA', 'password', '', 4, '1819259', 1, 10, '', '0000-00-00', '', '', ''),
(945, 'SAEPUL TRISNA', 'password', '', 4, '1819260', 1, 10, '', '0000-00-00', '', '', ''),
(947, 'SAHRUL', 'password', '', 4, '1819261', 1, 10, '', '0000-00-00', '', '', ''),
(949, 'SAHRUL GUNAWAN', 'password', '', 4, '1819262', 1, 10, '', '0000-00-00', '', '', ''),
(952, 'SAKILAH', 'password', '', 4, '1819263', 1, 10, '', '0000-00-00', '', '', ''),
(954, 'SALSABILA', 'password', '', 4, '1819264', 1, 10, '', '0000-00-00', '', '', ''),
(956, 'SAMUEL', 'password', '', 4, '1819265', 1, 10, '', '0000-00-00', '', '', ''),
(958, 'SANTIKA', 'password', '', 4, '1819266', 1, 10, '', '0000-00-00', '', '', ''),
(960, 'SANUSI', 'password', '', 4, '1819267', 1, 10, '', '0000-00-00', '', '', ''),
(962, 'SARTINI', 'password', '', 4, '1819268', 1, 10, '', '0000-00-00', '', '', ''),
(964, 'SEH ABU W', 'password', '', 4, '1819269', 1, 10, '', '0000-00-00', '', '', ''),
(966, 'SERLI MARSELIANA', 'password', '', 4, '1819270', 1, 10, '', '0000-00-00', '', '', ''),
(969, 'SHURYADI', 'password', '', 4, '1819271', 1, 10, '', '0000-00-00', '', '', ''),
(970, 'SIGIT MAHPUDIN ARIANTO', 'password', '', 4, '1819272', 1, 10, '', '0000-00-00', '', '', ''),
(972, 'SILPA BERLIANA', 'password', '', 4, '1819273', 1, 10, '', '0000-00-00', '', '', ''),
(974, 'SINGGIH', 'password', '', 4, '1819274', 1, 10, '', '0000-00-00', '', '', ''),
(976, 'SINTA NAILA', 'password', '', 4, '1819275', 1, 10, '', '0000-00-00', '', '', ''),
(978, 'SISKA', 'password', '', 4, '1819276', 1, 10, '', '0000-00-00', '', '', ''),
(980, 'SISKA', 'password', '', 4, '1819277', 1, 10, '', '0000-00-00', '', '', ''),
(982, 'SITI JULIANI', 'password', '', 4, '1819278', 1, 10, '', '0000-00-00', '', '', ''),
(984, 'SITI KHODIJAH', 'password', '', 4, '1819279', 1, 10, '', '0000-00-00', '', '', ''),
(986, 'SITI MASITOH', 'password', '', 4, '1819280', 1, 10, '', '0000-00-00', '', '', ''),
(988, 'SITI NUR SEPTIANI', 'password', '', 4, '1819281', 1, 10, '', '0000-00-00', '', '', ''),
(990, 'SITI OKTAVIANI', 'password', '', 4, '1819282', 1, 10, '', '0000-00-00', '', '', ''),
(992, 'SITI PADILA', 'password', '', 4, '1819283', 1, 10, '', '0000-00-00', '', '', ''),
(994, 'SITI ROBIATUL ADAWIYAH', 'password', '', 4, '1819284', 1, 10, '', '0000-00-00', '', '', ''),
(996, 'SITI SUMIATI', 'password', '', 4, '1819285', 1, 10, '', '0000-00-00', '', '', ''),
(999, 'SOLEMAN', 'password', '', 4, '1819286', 1, 10, '', '0000-00-00', '', '', ''),
(1001, 'SRI ZALVIA ZALVA', 'password', '', 4, '1819287', 1, 10, '', '0000-00-00', '', '', ''),
(1003, 'SUANDI', 'password', '', 4, '1819288', 1, 10, '', '0000-00-00', '', '', ''),
(1005, 'SUGI RAHAYU', 'password', '', 4, '1819289', 1, 10, '', '0000-00-00', '', '', ''),
(1006, 'SUHENDI ', 'password', '', 4, '1819290', 1, 10, '', '0000-00-00', '', '', ''),
(1007, 'SUHENDRIK', 'password', '', 4, '1819291', 1, 10, '', '0000-00-00', '', '', ''),
(1008, 'SUHERDAH', 'password', '', 4, '1819292', 1, 10, '', '0000-00-00', '', '', ''),
(1009, 'SUKMA WIJAYA', 'password', '', 4, '1819293', 1, 10, '', '0000-00-00', '', '', ''),
(1010, 'SUKRI', 'password', '', 4, '1819294', 1, 10, '', '0000-00-00', '', '', ''),
(1011, 'SULIS SETIAWATI', 'password', '', 4, '1819295', 1, 10, '', '0000-00-00', '', '', ''),
(1012, 'SULISULANDARI', 'password', '', 4, '1819296', 1, 10, '', '0000-00-00', '', '', ''),
(1013, 'SULTONI', 'password', '', 4, '1819297', 1, 10, '', '0000-00-00', '', '', ''),
(1014, 'SUMARNA', 'password', '', 4, '1819298', 1, 10, '', '0000-00-00', '', '', ''),
(1015, 'SUMINAR', 'password', '', 4, '1819299', 1, 10, '', '0000-00-00', '', '', ''),
(1016, 'SUPERI', 'password', '', 4, '1819300', 1, 10, '', '0000-00-00', '', '', ''),
(1017, 'SURAHMAN', 'password', '', 4, '1819301', 1, 10, '', '0000-00-00', '', '', ''),
(1018, 'SURAHMAN', 'password', '', 4, '1819302', 1, 10, '', '0000-00-00', '', '', ''),
(1019, 'SYAHRUL FATAH', 'password', '', 4, '1819303', 1, 10, '', '0000-00-00', '', '', ''),
(1020, 'SYAHRUL GUNAWAN', 'password', '', 4, '1819304', 1, 10, '', '0000-00-00', '', '', ''),
(1021, 'SYAHRUL GUNAWAN', 'password', '', 4, '1819305', 1, 10, '', '0000-00-00', '', '', ''),
(1022, 'SYEHILATUL AKMALUDIN', 'password', '', 4, '1819306', 1, 10, '', '0000-00-00', '', '', ''),
(1023, 'TIA MUTI\'AH', 'password', '', 4, '1819307', 1, 10, '', '0000-00-00', '', '', ''),
(1024, 'TIRTA DANU SUARA NUR', 'password', '', 4, '1819308', 1, 10, '', '0000-00-00', '', '', ''),
(1025, 'TOFIK HIDAYAT', 'password', '', 4, '1819309', 1, 10, '', '0000-00-00', '', '', ''),
(1026, 'TRI DAYA WASKITO', 'password', '', 4, '1819310', 1, 10, '', '0000-00-00', '', '', ''),
(1027, 'UBAIDI AMIRULLLAH', 'password', '', 4, '1819311', 1, 10, '', '0000-00-00', '', '', ''),
(1028, 'UBAIDILLAH', 'password', '', 4, '1819312', 1, 10, '', '0000-00-00', '', '', ''),
(1029, 'UCU PAHRUDIN', 'password', '', 4, '1819313', 1, 10, '', '0000-00-00', '', '', ''),
(1030, 'UCU TRIYANDI', 'password', '', 4, '1819314', 1, 10, '', '0000-00-00', '', '', ''),
(1031, 'UJANG SETIAWAN', 'password', '', 4, '1819315', 1, 10, '', '0000-00-00', '', '', ''),
(1032, 'ULANDARI', 'password', '', 4, '1819316', 1, 10, '', '0000-00-00', '', '', ''),
(1033, 'UMAR BAIS', 'password', '', 4, '1819317', 1, 10, '', '0000-00-00', '', '', ''),
(1034, 'USEP HASANUDIN', 'password', '', 4, '1819318', 1, 10, '', '0000-00-00', '', '', ''),
(1035, 'VIKA OKTAVIA', 'password', '', 4, '1819319', 1, 10, '', '0000-00-00', '', '', ''),
(1036, 'VINA NURFAUZIAH', 'password', '', 4, '1819320', 1, 10, '', '0000-00-00', '', '', ''),
(1037, 'WAHYUDI', 'password', '', 4, '1819321', 1, 10, '', '0000-00-00', '', '', ''),
(1038, 'WANDI', 'password', '', 4, '1819322', 1, 10, '', '0000-00-00', '', '', ''),
(1039, 'WILLY YAMIN', 'password', '', 4, '1819323', 1, 10, '', '0000-00-00', '', '', ''),
(1040, 'WINDA', 'password', '', 4, '1819324', 1, 10, '', '0000-00-00', '', '', ''),
(1041, 'WINDA SRI MULYAWATI', 'password', '', 4, '1819325', 1, 10, '', '0000-00-00', '', '', ''),
(1042, 'WISNU ABIASYAH', 'password', '', 4, '1819326', 1, 10, '', '0000-00-00', '', '', ''),
(1043, 'WISNU AGUNG WARDANA', 'password', '', 4, '1819327', 1, 10, '', '0000-00-00', '', '', ''),
(1044, 'WISNU RIZAL', 'password', '', 4, '1819328', 1, 10, '', '0000-00-00', '', '', ''),
(1045, 'WISNU WASKITO', 'password', '', 4, '1819329', 1, 10, '', '0000-00-00', '', '', ''),
(1046, 'YATNA', 'password', '', 4, '1819330', 1, 10, '', '0000-00-00', '', '', ''),
(1047, 'YEKLIN HOBIRIN', 'password', '', 4, '1819331', 1, 10, '', '0000-00-00', '', '', ''),
(1048, 'YOGA PERMANA', 'password', '', 4, '1819332', 1, 10, '', '0000-00-00', '', '', ''),
(1049, 'YOPI ARYANA', 'password', '', 4, '1819333', 1, 10, '', '0000-00-00', '', '', ''),
(1050, 'YOSEP', 'password', '', 4, '1819334', 1, 10, '', '0000-00-00', '', '', ''),
(1051, 'YULIA SARI', 'password', '', 4, '1819335', 1, 10, '', '0000-00-00', '', '', ''),
(1052, 'YUSUPIANA', 'password', '', 4, '1819336', 1, 10, '', '0000-00-00', '', '', ''),
(1053, 'ZIKHAN RATU PAKS', 'password', '', 4, '1819337', 1, 10, '', '0000-00-00', '', '', ''),
(1054, 'Muhamad Yusuf', 'password', '', 4, '1819338', 1, 10, '', '0000-00-00', '', '', ''),
(1055, 'Wawan Sugihartono', 'password', '', 4, '1', 1, 1, '', '0000-00-00', '', '', ''),
(1056, 'Abdul Nur Nadhif', 'password', '', 4, '2', 1, 1, '', '0000-00-00', '', '', ''),
(1057, 'Elok Handayani', 'password', '', 4, '3', 1, 1, '', '0000-00-00', '', '', ''),
(1058, 'Iwan Setiawan S.Pd. I', 'password', '', 4, '4', 1, 1, '', '0000-00-00', '', '', ''),
(1059, 'Syarif Hidayat', 'password', '', 4, '5', 1, 1, '', '0000-00-00', '', '', ''),
(1060, 'Khusosi', 'password', '', 4, '6', 1, 1, '', '0000-00-00', '', '', ''),
(1061, 'Toimin', 'password', '', 4, '7', 1, 1, '', '0000-00-00', '', '', ''),
(1062, 'Gunawan Nur Cahyo', 'password', '', 4, '8', 1, 1, '', '0000-00-00', '', '', ''),
(1063, 'Iwan Setiawan S.Pd', 'password', '', 4, '9', 1, 1, '', '0000-00-00', '', '', ''),
(1064, 'Muhamad Zulfikar', 'password', '', 4, '10', 1, 1, '', '0000-00-00', '', '', ''),
(1065, 'Agus Supriyanto', 'password', '', 4, '11', 1, 1, '', '0000-00-00', '', '', ''),
(1066, 'Honorata Decavia', 'password', '', 4, '12', 1, 1, '', '0000-00-00', '', '', ''),
(1067, 'sandi Irfan', 'password', '', 4, '13', 1, 1, '', '0000-00-00', '', '', ''),
(1068, 'Pamuji', 'password', '', 4, '14', 1, 1, '', '0000-00-00', '', '', ''),
(1069, 'Fitriyana', 'password', '', 4, '15', 1, 1, '', '0000-00-00', '', '', ''),
(1070, 'Reni Mulyani', 'password', '', 4, '16', 1, 1, '', '0000-00-00', '', '', ''),
(1071, 'Muhamad Daud', 'password', '', 4, '17', 1, 1, '', '0000-00-00', '', '', ''),
(1072, 'Ridwanullah', 'password', '', 4, '18', 1, 1, '', '0000-00-00', '', '', ''),
(1073, 'Aditia Topan', 'password', '', 4, '19', 1, 1, '', '0000-00-00', '', '', ''),
(1074, 'Yoyok Hariyanto', 'password', '', 4, '20', 1, 1, '', '0000-00-00', '', '', ''),
(1075, 'Aida Nurul Syahara', 'password', '', 4, '21', 1, 1, '', '0000-00-00', '', '', ''),
(1076, 'Siti Lestiawati', 'password', '', 4, '22', 1, 1, '', '0000-00-00', '', '', ''),
(1077, 'Sukamto', 'password', '', 4, '23', 1, 1, '', '0000-00-00', '', '', ''),
(1078, 'Aminudin', 'password', '', 4, '24', 1, 1, '', '0000-00-00', '', '', ''),
(1079, 'Fredi Irawan', 'password', '', 4, '25', 1, 1, '', '0000-00-00', '', '', ''),
(1080, 'Lury Erwanda', 'password', '', 4, '26', 1, 1, '', '0000-00-00', '', '', ''),
(1081, 'Handriyana ', 'password', '', 4, '27', 1, 1, '', '0000-00-00', '', '', ''),
(1082, 'Tiara ', 'password', '', 4, '28', 1, 1, '', '0000-00-00', '', '', ''),
(1083, 'Nurcahyo', 'password', '', 4, '29', 1, 1, '', '0000-00-00', '', '', ''),
(1084, 'Dinda', 'password', '', 4, '30', 1, 1, '', '0000-00-00', '', '', ''),
(1085, 'Riyanto', 'password', '', 4, '31', 1, 1, '', '0000-00-00', '', '', ''),
(1086, 'Himawan', 'password', '', 4, '32', 1, 1, '', '0000-00-00', '', '', ''),
(1087, 'MUHAMAD SIHABUDIN', 'password', '', 4, '1819345', 1, 10, '', '0000-00-00', '', '', ''),
(1088, 'AANG ISKANDAR', 'password', '', 4, '1819002', 1, 10, '', '0000-00-00', '', '', ''),
(1089, 'EVIS DIAN S', 'password', '', 4, '1819339', 1, 10, '', '0000-00-00', '', '', ''),
(1090, 'HARIK ABDILAH', 'password', '', 4, '1819340', 1, 10, '', '0000-00-00', '', '', ''),
(1091, 'ADAM RAIHAN S', 'password', '', 4, '1819341', 1, 10, '', '0000-00-00', '', '', ''),
(1092, 'MUHAMAD SYAM', 'password', '', 4, '1819342', 1, 10, '', '0000-00-00', '', '', ''),
(1095, 'DIKA RAMDANI', 'password', '', 4, '1819346', 1, 10, '', '0000-00-00', '', '', ''),
(1096, 'LUKI REZA', 'password', '', 4, '1819347', 1, 10, '', '0000-00-00', '', '', ''),
(1097, 'abc', '12345', '', 4, '123', 1, 9, '', '0000-00-00', '', '', ''),
(1098, 'ani', 'password', '', 4, '1920001', 1, 11, '', '0000-00-00', '', '', ''),
(1099, 'agus', 'password', '', 2, '', 1, 0, '12345678', '0000-00-00', '', '', ''),
(1100, 'dimas', 'password', '', 4, '1920002', 1, 11, '', '0000-00-00', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`absensi_id`);

--
-- Indexes for table `grup`
--
ALTER TABLE `grup`
  ADD PRIMARY KEY (`grup_id`);

--
-- Indexes for table `grup_guru`
--
ALTER TABLE `grup_guru`
  ADD PRIMARY KEY (`grup_guru_id`);

--
-- Indexes for table `grup_siswa`
--
ALTER TABLE `grup_siswa`
  ADD PRIMARY KEY (`grup_siswa_id`);

--
-- Indexes for table `identity`
--
ALTER TABLE `identity`
  ADD PRIMARY KEY (`identity_name`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`jawaban_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kelas_id`);

--
-- Indexes for table `kelas_guru`
--
ALTER TABLE `kelas_guru`
  ADD PRIMARY KEY (`kelas_guru_id`);

--
-- Indexes for table `kelas_sekolah`
--
ALTER TABLE `kelas_sekolah`
  ADD PRIMARY KEY (`kelas_sekolah_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`materi_id`);

--
-- Indexes for table `matpel`
--
ALTER TABLE `matpel`
  ADD PRIMARY KEY (`matpel_id`);

--
-- Indexes for table `matpel_sekolah`
--
ALTER TABLE `matpel_sekolah`
  ADD PRIMARY KEY (`matpel_sekolah_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `refresh`
--
ALTER TABLE `refresh`
  ADD PRIMARY KEY (`refresh_id`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`sekolah_id`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`soal_id`);

--
-- Indexes for table `soal_umum`
--
ALTER TABLE `soal_umum`
  ADD PRIMARY KEY (`soal_umum_id`);

--
-- Indexes for table `tabungan`
--
ALTER TABLE `tabungan`
  ADD PRIMARY KEY (`tabungan_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_id`) USING BTREE;

--
-- Indexes for table `test_detail`
--
ALTER TABLE `test_detail`
  ADD PRIMARY KEY (`test_detail_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `absensi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grup`
--
ALTER TABLE `grup`
  MODIFY `grup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `grup_guru`
--
ALTER TABLE `grup_guru`
  MODIFY `grup_guru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `grup_siswa`
--
ALTER TABLE `grup_siswa`
  MODIFY `grup_siswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `jawaban_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kelas_guru`
--
ALTER TABLE `kelas_guru`
  MODIFY `kelas_guru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kelas_sekolah`
--
ALTER TABLE `kelas_sekolah`
  MODIFY `kelas_sekolah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `materi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `matpel`
--
ALTER TABLE `matpel`
  MODIFY `matpel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `matpel_sekolah`
--
ALTER TABLE `matpel_sekolah`
  MODIFY `matpel_sekolah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `refresh`
--
ALTER TABLE `refresh`
  MODIFY `refresh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `sekolah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `soal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soal_umum`
--
ALTER TABLE `soal_umum`
  MODIFY `soal_umum_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabungan`
--
ALTER TABLE `tabungan`
  MODIFY `tabungan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_detail`
--
ALTER TABLE `test_detail`
  MODIFY `test_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1900;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
