-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2023 at 03:52 AM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `id_adress` int(11) NOT NULL,
  `rue` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `code_postale` varchar(20) NOT NULL,
  `id_municipalite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`id_adress`, `rue`, `ville`, `code_postale`, `id_municipalite`) VALUES
(1, 'Avenue Habib-Bourguiba,DarChaabane El Fehri', 'Nabeul', '8011', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `citoyen`
--

CREATE TABLE `citoyen` (
  `id_citoyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id_employe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `id_adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `municipalite`
--

INSERT INTO `municipalite` (`id_municipalite`, `nom_municipalite`, `id_adresse`) VALUES
(1, 'Dar Chaabane El Fehri', 1);

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
  `matricule` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `adresse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id_personne`, `matricule`, `nom`, `prenom`, `email`, `password`, `adresse`) VALUES
(30, 1111, 'admin', 'amine', 'amien@gmail.com', '$2a$10$MBsUBk.jJ04O.76a3LxwRONU25MjG2IV6eISkeRpTPgZCIFGCogsK', NULL),
(31, 1111, 'admin', 'amine', 'amienn@gmail.com', '$2a$10$I9qKYEab/oYq3pG9lBFf8eTmxUetkYNaQY8e6L1bCXaVAbG7pUJTC', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personne_roles`
--

CREATE TABLE `personne_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(38, '2023-05-01 14:18:26', 'ae76746d-2b88-4dc8-9736-d0f8babd3442', 30),
(39, '2023-05-10 22:27:08', '2664f75d-ece3-4b10-9fe7-3bcf934d3fb8', 30),
(40, '2023-05-10 22:28:57', 'da45f289-9f96-437c-be8b-ede8efd591f8', 30),
(41, '2023-05-10 22:29:09', '923c5d94-bacd-471a-a48b-b3738e7f2aa9', 30),
(42, '2023-05-10 22:35:52', '131a5391-533a-4b93-9f92-3bf663790f9a', 30),
(43, '2023-05-10 22:53:32', 'c36a98f6-16d7-4fc6-a99e-2bf97283f5aa', 30),
(44, '2023-05-15 11:21:55', 'a70fefea-b90a-4444-a75f-fc0d488f3353', 30),
(45, '2023-05-15 11:23:19', '7f7504bb-1da7-4350-9854-a3022a5f208e', 30),
(46, '2023-05-15 11:23:53', 'd6bdc3ac-fb62-4604-a260-271c77581362', 30),
(47, '2023-05-15 11:24:18', '03d407de-dfbf-456a-9cc3-abba05ecbe31', 30),
(48, '2023-05-15 11:24:48', 'e9e38f84-d7b0-4e17-aa3b-22c16c787b0b', 30),
(49, '2023-05-15 11:25:53', 'ac21dfdc-5cbf-45c5-801b-283b89ce0d7e', 30),
(50, '2023-05-15 11:26:52', '743b0c94-bd03-4921-b198-8ca52fe3394d', 30),
(51, '2023-05-15 12:30:25', '5f490ced-d235-45ef-9cf1-67911853fd6c', 30),
(52, '2023-05-15 12:54:01', 'c30897a9-8310-46e8-a857-88ce298032ea', 30),
(53, '2023-05-16 11:39:40', 'e2ed3710-a0a7-4d82-8f05-346f3e03c357', 30),
(54, '2023-05-16 12:30:17', 'd2873bf3-77ce-4c34-982d-36794ab54d5a', 30),
(55, '2023-05-16 13:03:36', '8830cb26-49e8-48c4-ac8b-ec5a0bd0fdaa', 31),
(56, '2023-05-16 23:25:03', 'c6c49f85-2717-4930-bf4b-3ef3df5c9618', 30),
(57, '2023-05-17 22:06:17', 'af3f1a21-8eee-439a-beb2-6b6b447f8db2', 30),
(58, '2023-05-17 23:39:50', 'ec59d41b-a247-4033-836a-b01bfc13e8ba', 30),
(59, '2023-05-18 00:45:48', 'e71f9674-71d5-4d1a-9745-459c27ee2e98', 30);

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
(2, 1, 1, 30, 'Dar Chaabane El Fehri-copie conforme-1', '2023-05-07 01:47:49', 'en_attente'),
(3, 1, 1, 30, 'Dar Chaabane El Fehri-copie conforme-2', '2023-05-07 01:47:55', 'en_attente'),
(5, 1, 1, 30, 'Dar Chaabane El Fehri-copie conforme-3', '2023-05-08 01:39:59', 'en_attente');

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

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(30, 2),
(30, 3),
(31, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adress`),
  ADD KEY `id_municipalite` (`id_municipalite`);

--
-- Indexes for table `citoyen`
--
ALTER TABLE `citoyen`
  ADD PRIMARY KEY (`id_citoyen`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_employe`);

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
  ADD KEY `id_adresse` (`id_adresse`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id_personne`),
  ADD KEY `adresse` (`adresse`);

--
-- Indexes for table `personne_roles`
--
ALTER TABLE `personne_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`);

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
  MODIFY `id_municipalite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `refresh_token`
--
ALTER TABLE `refresh_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `adresse_ibfk_2` FOREIGN KEY (`id_municipalite`) REFERENCES `municipalite` (`id_municipalite`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `citoyen`
--
ALTER TABLE `citoyen`
  ADD CONSTRAINT `citoyen_ibfk_1` FOREIGN KEY (`id_citoyen`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guichet`
--
ALTER TABLE `guichet`
  ADD CONSTRAINT `guichet_ibfk_1` FOREIGN KEY (`id_municipalite`) REFERENCES `municipalite` (`id_municipalite`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `municipalite`
--
ALTER TABLE `municipalite`
  ADD CONSTRAINT `municipalite_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adress`);

--
-- Constraints for table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `personne_ibfk_1` FOREIGN KEY (`adresse`) REFERENCES `adresse` (`id_adress`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personne_roles`
--
ALTER TABLE `personne_roles`
  ADD CONSTRAINT `FKq4uh20w2vxet2jbx3symoijgu` FOREIGN KEY (`user_id`) REFERENCES `personne` (`id_personne`);

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
