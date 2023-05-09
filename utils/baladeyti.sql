-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2023 at 02:05 AM
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
  `nom_gouvernorat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gouvernorat`
--

INSERT INTO `gouvernorat` (`id_gouvernorat`, `nom_gouvernorat`) VALUES
(1, 'Ariana'),
(2, 'Béja'),
(3, 'Ben Arous'),
(4, 'Bizerte'),
(5, 'Gabès'),
(6, 'Gafsa'),
(7, 'Jendouba'),
(8, 'Kairouan'),
(9, 'Kasserine'),
(10, 'Kébili'),
(11, 'Le Kef'),
(12, 'Mahdia'),
(13, 'La Manouba'),
(14, 'Médenine'),
(15, 'Monastir'),
(16, 'Nabeul'),
(17, 'Sfax'),
(18, 'Sidi Bouzid'),
(19, 'Siliana'),
(20, 'Sousse'),
(21, 'Tataouine'),
(22, 'Tozeur'),
(23, 'Tunis'),
(24, 'Zaghouan');

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
  `nom_municipalite` varchar(30) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `id_gouvernorat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `municipalite`
--

INSERT INTO `municipalite` (`id_municipalite`, `nom_municipalite`, `id_adresse`, `id_gouvernorat`) VALUES
(1, 'Dar Chaabane El Fehri', 1, 16);

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
(33, 'admin', 'amine', 'amienne@gmail.com', '$2a$10$b174u7whO95KDO4KXeOUiOzjUeDH0J1eXYB3ahSdhkYhSgOYBHP/W', NULL, 'ROLE_CLIENT'),
(34, 'admin', '', 'admin@gmail.com', '$2a$12$iz12HinbWvMvQAIHkdNNveWX.RjqKRC.6wQCB8vjgjr.u2e2wqyRi', NULL, 'ROLE_ADMIN');

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
(66, '2023-05-18 15:08:36', '9e6e49f0-5cd7-4385-bfdd-53ce804161bd', 34),
(67, '2023-05-18 23:01:52', 'cdb1c2dd-f92d-4f20-a2f5-dc9e507d2096', 34);

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
(1, 'copie conforme');

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
(1);

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

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `id_service`, `id_municipalite`, `id_citoyen`, `num_ticket`, `date_reservation`, `etat`) VALUES
(13, 1, 1, 33, '1-1-1', '2023-05-08 17:03:34', 'en_attente');

-- --------------------------------------------------------

--
-- Table structure for table `travail`
--

CREATE TABLE `travail` (
  `id_service` int(11) NOT NULL,
  `id_citoyen` int(11) NOT NULL,
  `id_guichet` int(11) NOT NULL,
  `date` date NOT NULL
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
  ADD KEY `id_gouvernorat` (`id_gouvernorat`);

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
  ADD PRIMARY KEY (`id_service`,`id_citoyen`,`id_guichet`),
  ADD KEY `id_citoyen` (`id_citoyen`) USING BTREE,
  ADD KEY `id_guichet` (`id_guichet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gouvernorat`
--
ALTER TABLE `gouvernorat`
  MODIFY `id_gouvernorat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `guichet`
--
ALTER TABLE `guichet`
  MODIFY `id_guichet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipalite`
--
ALTER TABLE `municipalite`
  MODIFY `id_municipalite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `refresh_token`
--
ALTER TABLE `refresh_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  ADD CONSTRAINT `municipalite_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adress`),
  ADD CONSTRAINT `municipalite_ibfk_2` FOREIGN KEY (`id_gouvernorat`) REFERENCES `gouvernorat` (`id_gouvernorat`);

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
  ADD CONSTRAINT `FKjs0kr2tkga3xxmwc8gd7yp3cj` FOREIGN KEY (`id_citoyen`) REFERENCES `personne` (`id_personne`),
  ADD CONSTRAINT `travail_ibfk_1` FOREIGN KEY (`id_citoyen`) REFERENCES `citoyen` (`id_citoyen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travail_ibfk_2` FOREIGN KEY (`id_guichet`) REFERENCES `guichet` (`id_guichet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travail_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
