-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 17 mai 2022 à 11:06
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce_grpc`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`) VALUES
(9, 'Cinema'),
(10, 'Culture'),
(11, 'Conférence'),
(12, 'Exposition'),
(13, 'Festival'),
(14, 'Sport');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `user_id`, `produit_id`, `contenu`, `created_at`) VALUES
(121, 20, 30, 'incroyable', '2022-05-17 01:01:38');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `nom`, `prenom`, `email`, `contenu`, `created_at`) VALUES
(1, 'oj', 'oij', 'oji@uo.com', 'ozhef', '2022-05-05 17:11:00'),
(2, 'tefdsf', 'wesh', 'gregre@gmail.com', 'tezgzevfzevc', '2022-05-05 17:11:45'),
(3, 'Baptiste Bouquier', 'Baptiste', 'baptiste.bouquier@gmail.com', 'gergergergerg', '2022-05-06 16:38:34');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220503140943', '2022-05-03 16:09:59', 3983),
('DoctrineMigrations\\Version20220505143558', '2022-05-05 16:36:11', 606),
('DoctrineMigrations\\Version20220517084232', '2022-05-17 10:42:39', 37);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `capacite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `categorie_id`, `user_id`, `nom`, `description`, `prix`, `image`, `updated_at`, `capacite`) VALUES
(26, 13, 18, 'CBD', 'De la beuh de qualité, un indice élevé de thc pour vos meilleurs soirées', 30, '627905eaab939437160051.jpg', '2022-05-09 14:15:38', 0),
(27, 13, 18, 'Huile de CBD', 'Tester l\'huile de CBD avec les bienfaits du cannabis sur votre corps, pour améliorer votre humeur et votre santé. Prenez en vite !', 25.99, '627906a871540568723132.jfif', '2022-05-09 14:18:48', 0),
(28, 13, 18, 'Sucette au CBD', 'Prenez cette sucette au gout unique en son genre. Ne contient pas une grosse quantité de CBD, il apporte juste un petit gout en plus. Il faut absolument gouter la sucette', 4.99, '627907b76f506032953581.jpg', '2022-05-09 14:23:19', 0),
(29, 10, 18, 'Cigarette électronique jetable', 'Cette cigarette électronique jetable a une capacité de 400 taf en moyenne. Cigarette électronique gout mangue. Cette cigarette possède un gout très fruité et un taux de nicotine a 1.5', 15.99, '627908b7b43ad285788189.jpg', '2022-05-09 14:27:35', 0),
(30, 9, 18, 'Cigare Romeo et Juliette', 'Voici un des Cigares les plus réputés, le Cigare Romeo et Juliette possède un gout prononcé mais facile a fumer pour les nouveaux fumeurs de cigare.', 7.98, '62790b65827f4353683378.jpg', '2022-05-09 14:38:58', 0),
(38, 11, 20, 'Test', 'test', 10, '6282e0499c1e6628594570.png', '2022-05-17 01:37:45', 0),
(39, 13, 20, 'test', 'fête', 2, '62836101a243a604565598.jpg', '2022-05-17 10:46:57', 20);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(8, 'dorothee09@dbmail.com', '[]', 'E9[\"&(,q)}j{[+XXo', 'lucas46'),
(9, 'zbertin@hotmail.fr', '[]', 'mQTb6qpf', 'david.boutin'),
(10, 'iroux@tele2.fr', '[]', '\"(P$,E', 'martineau.sebastien'),
(11, 'emeunier@bazin.fr', '[]', 'kjx:J7V3%H9ZN8)', 'julien76'),
(12, 'victor.guillaume@tele2.fr', '[]', 'gpX|`/?', 'barthelemy.thomas'),
(13, 'adelaide04@hotmail.fr', '[]', 'OSE_ahyM', 'madeleine.richard'),
(14, 'joseph52@live.com', '[]', '+[D8Wovk', 'ulebon'),
(15, 'jeanne93@auger.fr', '[]', ').]A7~N', 'ybernier'),
(16, 'test@gmail.com', '[]', '$2y$13$ICzHDcYd3jp68sfv2nYsbO8O3If9J3dE/IE5aiEEfuptH.mMPYEGW', 'test'),
(17, 'baptiste.bouquier@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7OJ1UjiQWmEyc5AEl275quzbIiL3KMGhUVziNX6bkPw1dTfJmCBQa', 'Baptiste3001'),
(18, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$luOHzMHQquEwNiFOqjFxjOLrqaP/K/lvE1l7OgN008f7nwvIq/BYO', 'Admin'),
(19, 'baptiste.bouquier@free.fr', '[]', '$2y$13$Ej53At4brR/yySCCa3hlIeOVQfW/Nk9DGYdtaNFuKfo8JX0DzT7Yy', 'Batistou15'),
(20, 'testest@gmail.com', '[\"ROLE_USER\",\"ROLE_ORGA\"]', '$2y$13$pIxMA.6jL8DnzKm3hIO7J.IQpO9MP6v6cVuZZZtWxkI8kougOBeGW', 'tesqtrege'),
(21, 'clement.roc@gmail.com', '[]', '$2y$13$h8b6Y3tYHHurs.vrzZOcuez1TDFvZWQJh04osK3hxMymK5NUSI8.e', 'Atypox');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCA76ED395` (`user_id`),
  ADD KEY `IDX_67F068BCF347EFB` (`produit_id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_29A5EC27A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_67F068BCF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
