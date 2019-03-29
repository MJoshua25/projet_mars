-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 28 mars 2019 à 23:39
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pnode`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` int(11) NOT NULL,
  `titre` varchar(250) COLLATE utf8_bin NOT NULL,
  `contenu` text COLLATE utf8_bin NOT NULL,
  `auteur` int(11) NOT NULL,
  `d_cre` datetime NOT NULL,
  `img` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `f_commentaires`
--

DROP TABLE IF EXISTS `f_commentaires`;
CREATE TABLE IF NOT EXISTS `f_commentaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sujet` int(11) NOT NULL,
  `crea` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  `date_commentaire` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `f_post`
--

DROP TABLE IF EXISTS `f_post`;
CREATE TABLE IF NOT EXISTS `f_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sujet` int(11) NOT NULL,
  `message` varchar(250) COLLATE utf8_bin NOT NULL,
  `crea` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `f_sujet`
--

DROP TABLE IF EXISTS `f_sujet`;
CREATE TABLE IF NOT EXISTS `f_sujet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` int(11) NOT NULL,
  `titre` varchar(250) COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `auteur` int(11) NOT NULL,
  `crea` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `themes`
--

INSERT INTO `themes` (`id`, `nom`, `description`) VALUES
(6, 'Régime minceur', 'Ici vous trouverez tout pour perdre du poid'),
(7, 'Prise de poid', 'Vous souhaitez bien grossir, on va vous y aider'),
(8, 'Nouvelle maman', 'Avec vous depuis le debut et même après la grossesse'),
(9, 'astuces santé', 'Des recettes traditionnelles'),
(10, 'Bien manger', 'de bons repas rien que pour vous');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(250) COLLATE utf8_bin NOT NULL,
  `sexe` varchar(5) COLLATE utf8_bin NOT NULL,
  `pseudo` varchar(250) COLLATE utf8_bin NOT NULL,
  `birth` date NOT NULL,
  `img` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `pass` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
