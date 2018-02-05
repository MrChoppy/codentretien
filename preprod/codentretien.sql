-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 05 fév. 2018 à 07:47
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `codentretien`
--

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `idGroup` int(11) NOT NULL AUTO_INCREMENT,
  `labelGroup` varchar(32) NOT NULL,
  PRIMARY KEY (`idGroup`),
  UNIQUE KEY `idGroup` (`idGroup`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `group`
--

INSERT INTO `group` (`idGroup`, `labelGroup`) VALUES
(1, 'Administrateur'),
(2, 'Modérateur'),
(3, 'Testeur'),
(4, 'Développeur');

-- --------------------------------------------------------

--
-- Structure de la table `map_permissions`
--

DROP TABLE IF EXISTS `map_permissions`;
CREATE TABLE IF NOT EXISTS `map_permissions` (
  `idPermission` int(11) NOT NULL,
  `idGroup` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `map_permissions`
--

INSERT INTO `map_permissions` (`idPermission`, `idGroup`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `idPermission` int(11) NOT NULL AUTO_INCREMENT,
  `labalPermission` varchar(32) NOT NULL,
  PRIMARY KEY (`idPermission`),
  UNIQUE KEY `idPermission` (`idPermission`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`idPermission`, `labalPermission`) VALUES
(1, 'Panneau d\'administration'),
(2, 'Gestion des permissions'),
(3, 'troisieme permission'),
(4, 'Administration');

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_label` varchar(30) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `room`
--

INSERT INTO `room` (`room_id`, `room_label`) VALUES
(1, 'C115');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_creation` date NOT NULL,
  `ticket_editDate` date NOT NULL,
  `ticket_description` longtext NOT NULL,
  `ticket_title` varchar(50) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `ticket_eventDate` date NOT NULL,
  `ticket_option` int(11) NOT NULL,
  `ticket_disposition` int(11) NOT NULL,
  `ticket_type` int(11) NOT NULL,
  `ticket_isAccepted` tinyint(1) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `ticket_creation`, `ticket_editDate`, `ticket_description`, `ticket_title`, `room_id`, `user_id`, `status_id`, `ticket_eventDate`, `ticket_option`, `ticket_disposition`, `ticket_type`, `ticket_isAccepted`) VALUES
(1, '2018-02-08', '2018-02-09', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dapibus porttitor turpis, vitae consectetur orci hendrerit et. Suspendisse molestie ex varius augue facilisis, vitae aliquet diam consequat. Nullam luctus blandit enim a porttitor. Quisque pretium vehicula velit sed pulvinar. Vestibulum placerat purus vehicula leo sollicitudin, sed commodo ipsum efficitur. Integer congue lorem in tempor tempor. Nullam sed ex eros. Phasellus purus lacus, faucibus sit amet augue convallis, ultrices sodales orci. Integer sodales risus vel turpis commodo egestas. In hac habitasse platea dictumst. Nam vestibulum bibendum massa nec porttitor.', 'Ménage', 1, 1, 1, '2018-02-15', 1, 1, 1, 1),
(2, '2018-02-14', '2018-02-16', 'kdlj flsjfkl djslkfjds jfajdldj kkjds lj lk fljaeoirj kl jdfslj fdso iueoijvdfkl jdlsfj lksdjgdlfkh glkj fldj gdlf ghfg lkkh kj g gjh gejgvk fkghfdjhkjh kfhd gkjdfh', 'lorem bitsum', 1, 2, 1, '2018-02-16', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(32) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_idGroup` int(11) NOT NULL,
  `user_email` varchar(64) NOT NULL,
  `user_birthday` date DEFAULT NULL,
  `user_gender` int(11) NOT NULL,
  `user_numberPhone` varchar(20) NOT NULL,
  `user_firstName` varchar(50) NOT NULL,
  `user_lastName` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_password`, `user_idGroup`, `user_email`, `user_birthday`, `user_gender`, `user_numberPhone`, `user_firstName`, `user_lastName`) VALUES
(1, 'admin', 'admin', 1, 'nicolas6720@gmail.com', '1997-06-13', 1, '0687916339', 'Nicolas', 'KLEIN'),
(2, 'test', 'test', 3, 'dfsdsfds@hfghgf.fr', '2018-02-06', 0, '', '', '0'),
(3, 'xyliaris', 'xyliaris', 1, 'xyliaris@gmail.com', NULL, 0, '', '', '0'),
(19, 'Nicolas67205', 'Nicolas97', 1, 'nicolas6720@gmail.com', '1997-06-13', 1, '0687916339', 'Nicolas', 'KLEIN'),
(17, 'xyxy67', 'Nicolas97', 1, 'nicolas6720@gmail.com', '2018-02-06', 1, '465464654', 'fdsfds', 'fdsfdsfds'),
(13, 'Aryastys', '44553272123', 1, 'admin@xyliaris.fr', '1998-08-02', 1, '0666666666', 'Mawsence', 'Chaver'),
(14, 'Nicolas6720', 'Nicolascaca', 1, 'nicolas6720@gmail.com', '2018-02-13', 1, '0687916339', 'Nicolas', 'KLEIN'),
(15, 'Frate', '12345', 4, 'tayfunyilmaz67130@gmail.com', '1998-01-07', 1, '0619691741', 'Tayfun', 'Yilmaz'),
(16, 'Nicolas_KLEIN', 'nicolas97', 1, 'nicolas6720@gmail.com', '2018-02-13', 1, '0656565', 'nicolas', 'nicolas'),
(18, 'kjkjkj', 'Nico123', 1, 'klein.nicolas.9@facebook.com', '2018-02-27', 2, '654654645', 'gfdgfd', 'fgdgfd'),
(20, 'Nicolas67205', 'Nicolas97', 1, 'nicolas6720@gmail.com', '1997-06-13', 1, '0687916339', 'Nicolas', 'Klein'),
(21, 'MrChoppy', 'Nicolas97', 1, 'nicolas6720@gmail.com', '1997-06-13', 1, '0687916339', 'Nicolas', 'Petrovich');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
