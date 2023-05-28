-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2023 at 01:42 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baladeyti`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `id_adress` int(11) NOT NULL,
  `rue` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `code_postale` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`id_adress`, `rue`, `ville`, `code_postale`) VALUES
(1, 'Avenue Habib-Bourguiba,DarChaabane El Fehri', 'Nabeul', '8011');

-- --------------------------------------------------------

--
-- Table structure for table `citoyen`
--

CREATE TABLE `citoyen` (
  `id_citoyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gouvernorat`
--

CREATE TABLE `gouvernorat` (
  `id_gouvernorat` int(11) NOT NULL,
  `nom_gouvernorat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gouvernorat`
--

INSERT INTO `gouvernorat` (`id_gouvernorat`, `nom_gouvernorat`) VALUES
(1, 'Gouvernorat de l\'Ariana'),
(2, 'Gouvernorat de Béja'),
(3, 'Gouvernorat de Ben Arous'),
(4, 'Gouvernorat de Bizerte'),
(5, 'Gouvernorat de Gabès'),
(6, 'Gouvernorat de Gafsa'),
(7, 'Gouvernorat de Jendouba'),
(8, 'Gouvernorat de Kairouan'),
(9, 'Gouvernorat de Kasserine'),
(10, 'Gouvernorat de Kébili'),
(11, 'Gouvernorat du Kef'),
(12, 'Gouvernorat de Mahdia'),
(13, 'Gouvernorat de la Manouba'),
(14, 'Gouvernorat de Médenine'),
(15, 'Gouvernorat de Monastir'),
(16, 'Gouvernorat de Nabeul'),
(17, 'Gouvernorat de Sfax'),
(18, 'Gouvernorat de Sidi Bouzid'),
(19, 'Gouvernorat de Siliana'),
(20, 'Gouvernorat de Sousse'),
(21, 'Gouvernorat de Tataouine'),
(22, 'Gouvernorat de Tozeur'),
(23, 'Gouvernorat de Tunis'),
(24, 'Gouvernorat de Zaghouan');

-- --------------------------------------------------------

--
-- Table structure for table `gouvernorat_seq`
--

CREATE TABLE `gouvernorat_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gouvernorat_seq`
--

INSERT INTO `gouvernorat_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `guichet`
--

CREATE TABLE `guichet` (
  `id_guichet` int(11) NOT NULL,
  `num_guichet` int(11) NOT NULL,
  `id_municipalite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guichet_seq`
--

CREATE TABLE `guichet_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guichet_seq`
--

INSERT INTO `guichet_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `municipalite`
--

CREATE TABLE `municipalite` (
  `id_municipalite` int(11) NOT NULL,
  `nom_municipalite` varchar(255) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `id_gouvernorat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `municipalite`
--

INSERT INTO `municipalite` (`id_municipalite`, `nom_municipalite`, `id_adresse`, `id_gouvernorat`) VALUES
(1, 'Tunis', 1, 23),
(2, 'Sfax', 1, 17),
(3, 'Sousse', 1, 20),
(4, 'Kairouan', 1, 8),
(5, 'Bizerte', 1, 4),
(6, 'Gabès', 1, 5),
(7, 'La Soukra', 1, 1),
(8, 'Ariana', 1, 1),
(9, 'Sidi Hassine', 1, 23),
(10, 'El Mourouj', 1, 3),
(11, 'Gafsa', 1, 6),
(12, 'Raoued', 1, 1),
(13, 'Monastir', 1, 15),
(14, 'La Marsa', 1, 23),
(15, ' Mnihla', 1, 1),
(16, 'Ben Arous', 1, 3),
(17, 'Ettadhamen', 1, 1),
(18, 'Kasserine', 1, 9),
(19, 'Douar Hicher', 1, 13),
(20, 'Ben Gardane', 1, 14),
(21, 'Djerba - Houmt Souk', 1, 14),
(22, 'Le Kram', 1, 23),
(23, 'Hammamet', 1, 16),
(24, 'Zarzis', 1, 14),
(25, 'Le Bardo', 1, 23),
(26, 'Médenine', 1, 14),
(27, 'Nabeul', 1, 16),
(28, 'Tataouine', 1, 21),
(29, ' Mohamedia', 1, 3),
(30, 'Djerba - Midoun', 1, 14),
(31, 'Béja', 1, 2),
(32, 'M\'saken', 1, 20),
(33, 'Radès', 1, 3),
(34, 'Oued Ellil', 1, 13),
(35, 'Moknine', 1, 15),
(36, 'Le Kef', 1, 11),
(37, 'Menzel Bourguiba', 1, 4),
(38, 'Kalâa Kebira', 1, 20),
(39, 'Sakiet Ezzit', 1, 17),
(40, 'Mahdia', 1, 12),
(41, 'Jemmal', 1, 15),
(42, 'Ksar Hellal', 1, 15),
(43, 'Sidi Bouzid', 1, 18),
(44, 'Kélibia', 1, 16),
(45, ' Fouchana', 1, 3),
(46, 'Sakiet Eddaïer', 1, 17),
(47, 'La Goulette', 1, 23),
(48, 'Jendouba', 1, 7),
(49, 'El Aïn', 1, 17),
(50, 'Hammam Sousse', 1, 20),
(51, 'Hammam Lif', 1, 3),
(52, 'Dar Chaâbane', 1, 16),
(53, 'El Hamma', 1, 5),
(54, 'Gremda', 1, 17),
(55, 'Ennour', 1, 9),
(56, 'Bou Mhel el-Bassatine', 1, 3),
(57, 'Menzel Temime', 1, 16),
(58, 'Korba', 1, 16),
(59, 'Métlaoui', 1, 6),
(60, 'Soliman', 1, 16),
(61, 'Téboulba', 1, 15),
(62, 'Tozeur', 1, 22),
(63, 'Ezzahra', 1, 3),
(64, ' Ouabed Khazanet', 1, 17),
(65, 'Kalâa Seghira', 1, 20),
(66, 'Mateur', 1, 4),
(67, 'El Ksar', 1, 6),
(68, 'Thyna', 1, 17),
(69, 'La Manouba', 1, 13),
(70, 'Hammam Chott', 1, 3),
(71, 'Sisseb-Driaat', 1, 8),
(72, 'Siliana', 1, 19),
(73, ' El Amra', 1, 17),
(74, 'Balta-Bou Aouane', 1, 7),
(75, 'Douz', 1, 10),
(76, ' Zarzis Nord', 1, 14),
(77, 'Mornag', 1, 3),
(78, 'Fériana', 1, 9),
(79, ' Joumine', 1, 4),
(80, 'Ksour Essef', 1, 12),
(81, 'Djedeida', 1, 13),
(82, 'Ras Jebel', 1, 4),
(83, 'Naassen', 1, 3),
(84, 'Ghannouch', 1, 5),
(85, 'Tebourba', 1, 13),
(86, 'Akouda', 1, 20),
(87, ' Ghezala', 1, 4),
(88, 'Mégrine', 1, 3),
(89, 'Den Den', 1, 13),
(90, 'Chihia', 1, 17),
(91, 'Redeyef', 1, 6),
(92, 'Sbeïtla', 1, 9),
(93, 'Grombalia', 1, 16),
(94, 'Djerba - Ajim', 1, 14),
(95, 'Raqqada', 1, 8),
(96, 'Chrayaa-Machrek Chams', 1, 9),
(97, 'El Fahs', 1, 24),
(98, 'Fondouk Jedid-Seltene', 1, 16),
(99, ' Essaïda', 1, 18),
(100, 'Ouled Chamekh', 1, 12),
(101, 'Menzel Jemil', 1, 4),
(102, 'Chebba', 1, 12),
(103, 'Faiedh Bennour', 1, 18),
(104, 'Takelsa', 1, 16),
(105, 'Ouchtata-Jmila', 1, 2),
(106, ' Ezzouhour', 1, 9),
(107, 'Ouerdanine', 1, 15),
(108, ' Teboulbou', 1, 5),
(109, ' Souk Jedid', 1, 18),
(110, 'Nefta', 1, 22),
(111, 'Medjez el-Bab', 1, 2),
(112, 'Bou Salem', 1, 7),
(113, 'Béni Khiar', 1, 16),
(114, 'Moularès', 1, 6),
(115, 'El Jem', 1, 12),
(116, 'Tinja', 1, 4),
(117, ' Sidi Zid-Awled Moulahem', 1, 12),
(118, ' Nadhour-Sidi Ali Ben Abed', 1, 17),
(119, 'Zaghouan', 1, 24),
(120, 'Zaouiet Sousse', 1, 20),
(121, 'Kébili', 1, 10),
(122, ' Utique', 1, 4),
(123, 'Mornaguia', 1, 13),
(124, 'Tabarka', 1, 7),
(125, 'Ghardimaou', 1, 7),
(126, ' Hadjeb', 1, 17),
(127, ' Lessouda', 1, 18),
(128, ' Hassi El Ferid', 1, 9),
(129, 'Habib Thameur Bouatouch', 1, 5),
(130, ' El Ayoun', 1, 9),
(131, 'Menzel Abderrahmane', 1, 4),
(132, 'Sahline Moôtmar', 1, 15),
(133, 'Grimet-Hicher', 1, 20),
(134, ' Hazeg Ellouza', 1, 17),
(135, 'Souk Lahad', 1, 10),
(136, 'Menzel Bouzelfa', 1, 16),
(137, 'El Hachachna', 1, 4),
(138, 'El Alia', 1, 4),
(139, 'Thala', 1, 9),
(140, 'Kalâat el-Andalous', 1, 1),
(141, 'Bekalta', 1, 15),
(142, ' Aachech-Aouadna-Boujarbou-Majel Draj', 1, 17),
(143, 'Tajerouine', 1, 11),
(144, 'Ezzouhour', 1, 20),
(145, 'Carthage', 1, 23),
(146, ' Ennasr', 1, 17),
(147, 'Zéramdine', 1, 15),
(148, 'Jouaouda', 1, 7),
(149, ' Tlelsa', 1, 12),
(150, 'Bembla-Mnara', 1, 15),
(151, 'Mahrès', 1, 17),
(152, 'Baten Ghzal', 1, 18),
(153, 'Kerkennah', 1, 17),
(154, 'Béni Khalled', 1, 16),
(155, ' Faouar', 1, 10),
(156, 'Tazougrane-Boukrim-Zaouiet El Mgaies', 1, 16),
(157, 'Zannouch', 1, 6),
(158, 'Abida', 1, 8),
(159, 'Aïn Sobh-Nadhour', 1, 7),
(160, 'Rakhmat', 1, 9),
(161, 'Chenini Nahal', 1, 5),
(162, ' Smâr', 1, 21),
(163, ' Belkhir', 1, 6),
(164, 'Meknassy', 1, 18),
(165, 'Bouzguem', 1, 9),
(166, 'Sidi Morched', 1, 19),
(167, 'Sidi Jedidi', 1, 15),
(168, 'Bennane-Bodheur', 1, 15),
(169, 'El Guettar', 1, 6),
(170, ' Hkaima', 1, 12),
(171, 'El Bassatine', 1, 13),
(172, 'Makthar', 1, 19),
(173, 'Kalaa-Maaden-Farksan', 1, 7),
(174, 'Aïn Khmaissia', 1, 9),
(175, 'Testour', 1, 2),
(176, 'Kettana', 1, 5),
(177, 'Bou Arada', 1, 19),
(178, 'Ksibet el-Médiouni', 1, 15),
(179, 'Souk Sebt', 1, 7),
(180, 'Dahmani', 1, 11),
(181, 'Sayada', 1, 15),
(182, 'Aïn El Beïdha', 1, 8),
(183, 'Menzel Hayet', 1, 15),
(184, 'Messaadine', 1, 20),
(185, 'Khmouda', 1, 9),
(186, 'Zaafrana-Dir Kef', 1, 11),
(187, 'Mdhilla', 1, 6),
(188, ' Saouaf', 1, 24),
(189, 'Chrifet-Boucharray', 1, 16),
(190, ' Bouchemma', 1, 5),
(191, 'Khmairia', 1, 7),
(192, 'Le Sers', 1, 11),
(193, ' Zelba', 1, 12),
(194, 'El Amaiem', 1, 24),
(195, 'Bou Argoub', 1, 16),
(196, 'Skhira', 1, 17),
(197, 'Téboursouk', 1, 2),
(198, 'Zriba', 1, 24),
(199, 'Bechli-Blidet-Jerssin', 1, 10),
(200, 'Menzel Ennour', 1, 15),
(201, 'Mareth', 1, 5),
(202, 'Ksibet Thrayet', 1, 20),
(203, 'Agareb', 1, 17),
(204, 'Chaouachi', 1, 8),
(205, 'Regueb', 1, 18),
(206, 'Sidi Thabet', 1, 1),
(207, 'Khniss', 1, 15),
(208, ' Thibar', 1, 2),
(209, 'Enfida', 1, 20),
(210, ' Lela', 1, 6),
(211, 'Rejiche', 1, 12),
(212, 'Métouia', 1, 5),
(213, 'Hajeb El Ayoun', 1, 8),
(214, 'Chraitia-Ksour', 1, 8),
(215, 'Gaâfour', 1, 19),
(216, 'Sidi Bou Ali', 1, 20),
(217, 'Dkhilet Toujane', 1, 5),
(218, ' Menzel El Habib', 1, 5),
(219, ' Sidi Aïch', 1, 6),
(220, 'Sidi Ismaïl', 1, 2),
(221, 'Oudhref', 1, 5),
(222, 'Bouficha', 1, 20),
(223, 'Metline', 1, 4),
(224, 'Raf Raf', 1, 4),
(225, 'Jérissa', 1, 11),
(226, 'Aïn Draham', 1, 7),
(227, 'Mansoura', 1, 18),
(228, 'Ghomrassen', 1, 21),
(229, 'Sened', 1, 6),
(230, 'El Haouaria', 1, 16),
(231, 'Tazarka', 1, 16),
(232, 'Sidi Ali Ben Aoun', 1, 18),
(233, 'Jhina', 1, 8),
(234, 'Hammam Ghezèze', 1, 16),
(235, 'Oueslatia', 1, 8),
(236, 'Bechri-Fatnassa', 1, 10),
(237, 'Beni Hassen', 1, 15),
(238, 'Khalidia', 1, 3),
(239, 'Menzel Kamel', 1, 15),
(240, 'Haffouz', 1, 8),
(241, 'Sidi Ameur-Mesjed-Aïssa', 1, 15),
(242, 'Rahal', 1, 18),
(243, 'Bir Mcherga', 1, 24),
(244, 'Bohra', 1, 11),
(245, 'Kalaat Senan', 1, 11),
(246, 'Amiret Hajjaj', 1, 15),
(247, 'El Maâmoura', 1, 16),
(248, 'Sbikha', 1, 8),
(249, 'Bir Lahmar', 1, 21),
(250, 'El Golâa', 1, 10),
(251, 'Degache', 1, 22),
(252, 'Zaouiet Djedidi', 1, 16),
(253, 'El Krib', 1, 19),
(254, 'Bou Hajla', 1, 8),
(255, 'El Maâgoula', 1, 2),
(256, 'Foussana', 1, 9),
(257, 'Hbabsa', 1, 19),
(258, 'El Hencha', 1, 17),
(259, 'Nadhour', 1, 24),
(260, 'Tataouine Sud', 1, 21),
(261, 'Nouvelle Matmata', 1, 5),
(262, 'Sidi Alouane', 1, 12),
(263, 'Kerker', 1, 12),
(264, 'Hergla', 1, 20),
(265, 'El Bradâa', 1, 12),
(266, 'Mezzouna', 1, 18),
(267, 'Slouguia', 1, 2),
(268, 'Nefza', 1, 2),
(269, 'Chott Meriem', 1, 20),
(270, 'Touza', 1, 15),
(271, 'Jemna', 1, 10),
(272, 'Jebiniana', 1, 17),
(273, 'Menzel Bouzaiane', 1, 18),
(274, 'Somâa', 1, 16),
(275, 'Thélepte', 1, 9),
(276, 'Zaouiet Kontoch', 1, 15),
(277, 'Boughrara', 1, 14),
(278, 'Melloulèche', 1, 12),
(279, 'Borj El Amri', 1, 13),
(280, 'Sbiba', 1, 9),
(281, 'Bir El Hafey', 1, 18),
(282, 'Majel Bel Abbès', 1, 9),
(283, 'El Batan', 1, 13),
(284, 'El Hamma du Jérid', 1, 22),
(285, 'Sakiet Sidi Youssef', 1, 11),
(286, 'Remada', 1, 21),
(287, 'Amiret Touazra', 1, 15),
(288, 'Bouhjar', 1, 15),
(289, 'Sidi Bou Saïd', 1, 23),
(290, 'El Ksour', 1, 11),
(291, 'Jilma', 1, 18),
(292, 'Lamta', 1, 15),
(293, 'Chorbane', 1, 12),
(294, 'Sejnane', 1, 4),
(295, 'Zarat', 1, 5),
(296, 'El Marja', 1, 11),
(297, 'Essouassi', 1, 12),
(298, 'Ghar El Melh', 1, 4),
(299, 'Djebel Oust', 1, 24),
(300, 'Amiret El Fhoul', 1, 15),
(301, 'Menzel Horr', 1, 16),
(302, 'Amdoun', 1, 2),
(303, 'Aousja', 1, 4),
(304, 'El Ghnada', 1, 15),
(305, 'Azmour', 1, 16),
(306, 'Nasrallah', 1, 8),
(307, 'Bargou', 1, 19),
(308, 'Bir Ali Ben Khalifa', 1, 17),
(309, 'El Masdour-Menzel Harb', 1, 15),
(310, ' Hazoua', 1, 22),
(311, 'Rouhia', 1, 19),
(312, 'Dar Allouch', 1, 16),
(313, 'Sidi Bennour', 1, 15),
(314, 'Cherahil', 1, 15),
(315, 'Jedelienne', 1, 9),
(316, 'Bou Merdes', 1, 12),
(317, 'Dehiba', 1, 21),
(318, ' Rjim Maatoug', 1, 10),
(319, 'El Mida', 1, 16),
(320, 'Goubellat', 1, 2),
(321, 'Sidi Boubaker', 1, 6),
(322, 'Menzel Mehiri', 1, 8),
(323, 'Fernana', 1, 7),
(324, 'Kondar', 1, 20),
(325, 'Menzel Fersi', 1, 15),
(326, 'Korbous', 1, 16),
(327, 'Haïdra', 1, 9),
(328, 'Cebbala Ouled Asker', 1, 18),
(329, 'Nebeur', 1, 11),
(330, 'El Alâa', 1, 8),
(331, 'Sidi Bou Rouis', 1, 19),
(332, 'Graïba', 1, 17),
(333, 'Hebira', 1, 12),
(334, 'Sidi Makhlouf', 1, 14),
(335, 'Beni Khedache', 1, 14),
(336, 'Chebika', 1, 8),
(337, 'El Aroussa', 1, 19),
(338, 'Sidi El Hani', 1, 20),
(339, 'Kesra', 1, 19),
(340, 'Kalâat Khasba', 1, 11),
(341, 'Ouled Haffouz', 1, 18),
(342, 'Oued Meliz', 1, 7),
(343, 'Tamerza', 1, 22),
(344, 'Menzel Chaker', 1, 17),
(345, 'Touiref', 1, 11),
(346, 'Matmata', 1, 5),
(347, 'Menzel Salem', 1, 11),
(348, 'Aïn Djeloula', 1, 8),
(349, 'Echrarda', 1, 8),
(350, 'Beni M\'Tir', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `municipalite_seq`
--

CREATE TABLE `municipalite_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `municipalite_seq`
--

INSERT INTO `municipalite_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE `personne` (
  `id_personne` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `adresse` int(11) DEFAULT NULL,
  `role` enum('ROLE_ADMIN','ROLE_EMPLOYE','ROLE_CLIENT','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `email`, `password`, `adresse`, `role`) VALUES
(0, 'admin', 'admin', 'admin@gmail.com', '$2a$12$iz12HinbWvMvQAIHkdNNveWX.RjqKRC.6wQCB8vjgjr.u2e2wqyRi', NULL, 'ROLE_ADMIN'),
(33, 'Boumaiza', 'amine', 'amienne@gmail.com', '$2a$10$b174u7whO95KDO4KXeOUiOzjUeDH0J1eXYB3ahSdhkYhSgOYBHP/W', 1, 'ROLE_CLIENT'),
(35, 'Abbessi', 'Alaa', 'alaa@gmail.com', '$2a$10$yYtbfGk0AoneS/zmM3/JBe.pOT2KI4jhEfLGBY4YYHbRH3uohVsZi', 1, 'ROLE_CLIENT'),
(45, 'Taguez', 'nabila', 'nabila@gmail.com', '$2a$10$aA2qkxIBFa8A6TrcbmUpiOeZe4ZUpJ3tO1WXWvcRMWhFAfsW0MB0q', NULL, 'ROLE_CLIENT'),
(46, 'Ben Ali', 'Saber', 'saber@gmail.com', '$2a$10$2.Ad5MSGNFr.WvFGK./WbutdaqNQ/VPpeVSnciwNLw.5UuQE6WuYW', NULL, 'ROLE_CLIENT'),
(52, 'Yengui', 'Ahmad', 'yengui@gmail.com', '$2a$10$qJ./BN3rN5bG4CdYt4MPFuQL4dYV8jgDPgvy9Wxzj4Duai1J/4zfm', NULL, 'ROLE_CLIENT'),
(53, 'Hamdi', 'Helmi', 'helmi@gmail.com', '$2a$10$.nlkywM.JO6vj3r6nWQ9rOpNCwwHgwlZ67F.uaakAgjc7hAUnyioS', NULL, 'ROLE_EMPLOYE'),
(54, 'Taguez', 'Nabila', 'nabilaaa@gmail.com', '$2a$10$chPqQ8zcNgnjiRwWQr7QoeLwWFDeMy.N9YWtBIQJQZ6RKdi.s2fhO', NULL, 'ROLE_EMPLOYE'),
(55, 'oussama', 'oussama', 'oussma@gmail.com', '$2a$10$ruvnj6kub2j5fEsJO5intukPSKoOj5yZJaDkJdrAjKmDkMwAO6lsu', NULL, 'ROLE_EMPLOYE'),
(60, 'Harzallah', 'Mohamed', 'hrouz@gmail.com', '$2a$10$zi6MkS6dwq27AORP24RdIe1c/aVeI9chYeEHoYBM8/CXUrcmH03Fi', NULL, 'ROLE_EMPLOYE'),
(62, 'Gourar', 'Yassine', 'gou@gmail.com', '$2a$10$1r49PB8DWTaO7sYSZCTPPOhSxlYELGEpzw.vVXzvsRa3qhBI9QIoa', NULL, 'ROLE_EMPLOYE');

-- --------------------------------------------------------

--
-- Table structure for table `refresh_token`
--

CREATE TABLE `refresh_token` (
  `id` int(11) NOT NULL,
  `expiration` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(255) NOT NULL,
  `personne_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refresh_token`
--

INSERT INTO `refresh_token` (`id`, `expiration`, `token`, `personne_id`) VALUES
(64, '2023-05-18 14:59:42', 'ea7dc2c1-999d-40f0-afac-c1bccdb87f8f', 33),
(65, '2023-05-18 15:01:45', 'cee6be1c-e9f3-4712-91ee-18656f42d407', 33),
(66, '2023-05-18 15:08:36', '9e6e49f0-5cd7-4385-bfdd-53ce804161bd', 0),
(67, '2023-05-20 21:53:00', '38e83d28-0acf-40de-b6b1-4aea840d16dd', 35),
(68, '2023-05-20 23:11:45', 'd02b32fa-89ea-43a3-a919-0e39cb27c397', 35),
(69, '2023-05-20 23:14:22', '49be9789-7522-4399-8806-c2b152033106', 35),
(70, '2023-05-20 23:18:28', 'af788840-48f9-4098-886e-13bcb0cefb2d', 35),
(71, '2023-05-20 23:26:10', '5b653e16-aa9d-4bf7-9313-3378445cc8fe', 35),
(72, '2023-05-20 23:28:33', 'e477076d-b976-4d11-89d3-ffdcfffe978f', 35),
(73, '2023-05-20 23:54:24', '915f4fae-0e78-4447-a979-aec4e77e0d58', 35),
(74, '2023-05-20 23:57:42', '9a9e6ede-cdbe-4e29-89ed-5af224202811', 35),
(75, '2023-05-21 00:03:33', '9cfddbd3-3c23-40ea-959c-544340ed622c', 35),
(76, '2023-05-21 00:12:30', 'eef3e161-3463-41af-b05d-10ed15e99749', 35),
(77, '2023-05-21 00:14:52', 'afb77b75-bcb5-480b-a7be-286ccc66c7ff', 35),
(78, '2023-05-21 00:20:56', '66006e68-98ca-4115-bfc4-48f37c040865', 35),
(79, '2023-05-21 00:25:28', 'ec61a5ab-7465-4dd6-92b3-f514c5234fa6', 35),
(80, '2023-05-21 00:56:34', 'e7063b31-b5cd-4fde-b899-bc910283306b', 35),
(81, '2023-05-21 01:06:52', '7fb182dc-775e-4820-8a35-06e8def74ccc', 35),
(82, '2023-05-21 01:30:02', '27097a85-5441-401d-9ca3-1c304e8a94e0', 35),
(83, '2023-05-23 00:12:40', 'f31ade71-1df3-4a76-8cdc-c69b49c08553', 35),
(84, '2023-05-23 00:15:54', 'acdaa369-c32f-4023-a6aa-ba434551f7d7', 35),
(85, '2023-05-23 00:16:33', '784ad536-a0b0-47c5-ba06-cba22a650251', 35),
(86, '2023-05-23 00:23:16', '30e0037a-aecd-4040-ac20-229f17793c7c', 35),
(87, '2023-05-23 00:26:42', '9d3b2441-0f39-4b01-b9c7-15a98fc51155', 35),
(88, '2023-05-23 00:32:01', '31ac82e8-f9a5-4eb3-94bd-06d4363132ea', 35),
(89, '2023-05-23 00:36:10', '1cf7f506-ee78-4206-a62c-b14fd73d27c3', 35),
(90, '2023-05-23 00:36:40', '01e1507a-8a39-4dcd-b5be-ff5322910f34', 35),
(91, '2023-05-23 00:38:06', '51743716-16ca-43ff-a0c5-426eb7caa793', 35),
(92, '2023-05-23 00:43:53', '4e478932-bea2-4358-987e-0310a4b2d1ea', 35),
(93, '2023-05-23 00:54:46', '7c0cddde-ffe0-4a6e-bcb3-a108442783c0', 35),
(94, '2023-05-23 00:55:34', '76b737e6-60e5-46e6-9f75-06d0bfd2f3ad', 35),
(95, '2023-05-23 00:56:28', '95cf8422-ca7e-4817-b5a9-868b8dc0731e', 35),
(96, '2023-05-23 00:58:00', '63517074-b0ec-4b43-a358-8f507c8f0781', 35),
(97, '2023-05-23 00:58:55', '0aaa4f6a-7390-4821-b6c9-0615555056ef', 35),
(98, '2023-05-23 01:00:01', 'e14bf423-7d26-46a2-a4c2-1c1b6e3b587a', 35),
(99, '2023-05-23 01:07:20', 'e0cff903-f485-40a3-bb1d-7b357a49bf7c', 35),
(100, '2023-05-23 01:08:05', 'bf8c3bab-42fe-4126-b9c1-4c33007ffe2c', 35);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role` enum('ROLE_CLIENT','ROLE_ADMIN','ROLE_EMPLOYE','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `role`) VALUES
(1, 'ROLE_CLIENT'),
(2, 'ROLE_EMPLOYE'),
(3, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `nom_service` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id_service`, `nom_service`) VALUES
(1, 'Copie conforme'),
(2, 'Extrait de naissance'),
(3, 'ta3rif bl imdha');

-- --------------------------------------------------------

--
-- Table structure for table `service_seq`
--

CREATE TABLE `service_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_seq`
--

INSERT INTO `service_seq` (`next_val`) VALUES
(201);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_municipalite` int(11) NOT NULL,
  `id_citoyen` int(11) NOT NULL,
  `num_ticket` varchar(100) NOT NULL,
  `date_reservation` datetime NOT NULL,
  `etat` enum('en_cours','annulé','traité','en_attente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `travail`
--

CREATE TABLE `travail` (
  `id_service` int(11) NOT NULL,
  `id_citoyen` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_municipalite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `travail`
--

INSERT INTO `travail` (`id_service`, `id_citoyen`, `date`, `id_municipalite`) VALUES
(1, 62, '2023-05-28', 1),
(2, 55, '2023-05-26', 1),
(2, 60, '2023-05-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adress`);

--
-- Indexes for table `citoyen`
--
ALTER TABLE `citoyen`
  ADD PRIMARY KEY (`id_citoyen`);

--
-- Indexes for table `gouvernorat`
--
ALTER TABLE `gouvernorat`
  ADD PRIMARY KEY (`id_gouvernorat`);

--
-- Indexes for table `guichet`
--
ALTER TABLE `guichet`
  ADD PRIMARY KEY (`id_guichet`),
  ADD KEY `id_municipalite` (`id_municipalite`);

--
-- Indexes for table `municipalite`
--
ALTER TABLE `municipalite`
  ADD PRIMARY KEY (`id_municipalite`),
  ADD KEY `id_adresse` (`id_adresse`),
  ADD KEY `FKfk1a5b0ltoxtwouiom5g1kugr` (`id_gouvernorat`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id_personne`),
  ADD KEY `adresse` (`adresse`);

--
-- Indexes for table `refresh_token`
--
ALTER TABLE `refresh_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personne_id` (`personne_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD UNIQUE KEY `num_ticket` (`num_ticket`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `ticket_ibfk_1` (`id_citoyen`),
  ADD KEY `ticket_ibfk_2` (`id_municipalite`);

--
-- Indexes for table `travail`
--
ALTER TABLE `travail`
  ADD PRIMARY KEY (`id_service`,`id_citoyen`),
  ADD KEY `id_citoyen` (`id_citoyen`) USING BTREE,
  ADD KEY `FKe3uov3620g75towhp34hw6mas` (`id_municipalite`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_ibfk_2` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guichet`
--
ALTER TABLE `guichet`
  MODIFY `id_guichet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipalite`
--
ALTER TABLE `municipalite`
  MODIFY `id_municipalite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `refresh_token`
--
ALTER TABLE `refresh_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `citoyen`
--
ALTER TABLE `citoyen`
  ADD CONSTRAINT `citoyen_ibfk_1` FOREIGN KEY (`id_citoyen`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guichet`
--
ALTER TABLE `guichet`
  ADD CONSTRAINT `guichet_ibfk_1` FOREIGN KEY (`id_municipalite`) REFERENCES `municipalite` (`id_municipalite`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `municipalite`
--
ALTER TABLE `municipalite`
  ADD CONSTRAINT `FKfk1a5b0ltoxtwouiom5g1kugr` FOREIGN KEY (`id_gouvernorat`) REFERENCES `gouvernorat` (`id_gouvernorat`),
  ADD CONSTRAINT `municipalite_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adress`);

--
-- Constraints for table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `personne_ibfk_1` FOREIGN KEY (`adresse`) REFERENCES `adresse` (`id_adress`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `refresh_token`
--
ALTER TABLE `refresh_token`
  ADD CONSTRAINT `refresh_token_ibfk_1` FOREIGN KEY (`personne_id`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_citoyen`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_municipalite`) REFERENCES `municipalite` (`id_municipalite`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `travail`
--
ALTER TABLE `travail`
  ADD CONSTRAINT `FKe3uov3620g75towhp34hw6mas` FOREIGN KEY (`id_municipalite`) REFERENCES `municipalite` (`id_municipalite`),
  ADD CONSTRAINT `FKjs0kr2tkga3xxmwc8gd7yp3cj` FOREIGN KEY (`id_citoyen`) REFERENCES `personne` (`id_personne`),
  ADD CONSTRAINT `travail_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
