/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.20-MariaDB : Database - monprojet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`monprojet` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `monprojet`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `book` */

insert  into `book`(`id`,`user_id`,`status_id`) values 
(1,3,2),
(2,2,2),
(3,5,2),
(4,4,2),
(5,6,2),
(6,1,2),
(7,1,2),
(8,2,3),
(9,1,2),
(10,1,3),
(11,8,1);

/*Table structure for table `book_item` */

DROP TABLE IF EXISTS `book_item`;

CREATE TABLE `book_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `book_item_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `book_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

/*Data for the table `book_item` */

insert  into `book_item`(`id`,`book_id`,`item_id`,`price`,`quantite`) values 
(1,1,12,47,2),
(2,2,1,25,2),
(3,2,6,25,1),
(4,2,7,25,1),
(5,3,3,25,5),
(6,3,4,25,3),
(7,4,8,25,10),
(8,5,2,25,4),
(9,5,5,25,7),
(10,6,10,11,14),
(11,7,4,25,4),
(12,8,3,25,1),
(13,9,8,25,5),
(14,10,1,25,1),
(15,11,9,21,1);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `img` varchar(255) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `detailed_descr` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

insert  into `products`(`id`,`title`,`price`,`img`,`descr`,`detailed_descr`) values 
(1,'Caf?? en grains Colombie',25,'public/img/articles/cafe en grains colombie.jpg','Fruit?? et l??g??ret??. Intensit?? 7/10','Ce caf?? est produit au c??ur de la Sierra Nevada, en bordure de la mer des Cara??bes. Reconnu par les Nations Unies comme R??serve de Biosph??re, ce massif c??tier le plus ??lev?? du monde (5 800 m d???altitude) abrite l???un des ??cosyst??mes les plus riches et mieux pr??serv?? du pays. C???est aussi le chef-lieu de plusieurs tribus am??rindiennes (Arhuacos, Wiwa, Kogis et Kankuamos), peuples h??ritiers des mayas, qui se sont r??fugi??s dans les plus hautes vall??es au moment de la colonie espagnole.'),
(2,'Caf?? en grains Cremoso',25,'public/img/articles/cafe en grains cremoso.jpg','Doux et ??quilibr??. Intensit?? 5/10','Parfait assemblage d???Arabicas d???Am??rique du Sud avec une pointe de Robusta, CREMOSO est un expresso doux et velout?? au corps fin et raffin??.\r\nCREMOSO est un caf?? ??quilibr?? associant des douces notes de c??r??ales anim??es par de subtiles notes fruit??es, surmont?? d???une mousse incroyablement onctueuse.\r\nLaissez-vous envo??ter par un moment de d??gustation intense.\r\n\r\n'),
(3,'Caf?? en grains Br??sil',25,'public/img/articles/cafe en grains bresil.jpg','D??licat et doux. Intensit?? 5/10','Nous avons s??lectionn?? notre caf?? de la gamme BRESIL dans la r??gion de Minas Gerais au Br??sil, sur des plantations ?? 950m au dessus du niveau de la mer.\r\nLes plantations sur les vall??es volcaniques aux sols fertiles et riches en min??raux garantissent un caf?? de qualit??, doux, ??quilibr?? et sans acidit??.\r\nLes cerises de caf?? sont r??colt??es manuellement ?? maturit?? puis s??ch??es au soleil avant d\'??tre d??pulp??es.'),
(4,'Caf?? en grains D??caf??in??',25,'public/img/articles/cafe en grains decafeine.jpg','Puissance et finesse. Intensit?? 7/10','M??lange somptueux d???Arabicas du M??xique, notre caf?? D??CAF??IN?? pr??sente de subtiles notes harmonieuses de cacao et de c??r??ales grill??es au corps dense et onctueux.\r\n\r\nUn m??lange sublime riche en saveurs obtenu gr??ce ?? notre torr??faction artisanale lente et progressive.\r\n\r\nLes ar??mes sont soigneusement pr??serv??es lors du proc??d?? naturel de d??caf??ination, sans aucune substance chimique.'),
(5,'Caf?? en grains Guatemala',25,'public/img/articles/cafe en grains guatemala.jpg','D??licat et doux. Intensit?? 6/10','Notre caf?? GUATEMALA vous transportera sur les hautes plaines volcaniques du Guatemala, au coeur de la r??gion Atitlan.\r\n\r\nIl se r??v??le par son corps intense et son caract??re puissant, envelopp?? par la douceur harmonique de ses notes gourmandes d\'amandes grill??es et son acidit?? ??l??gante.\r\n\r\nUn caf?? exceptionnel, ??quilibr?? et gourmand, offrant une belle fra??cheur et longueur en bouche.'),
(6,'Caf?? en grains Lungo',25,'public/img/articles/cafe en grains lungo.jpg','Equilibre parfait. Intensit?? 6/10','M??lange somptueux d\'Arabica et de Robusta d\'exception, Lungo est un caf?? au go??t intense et g??n??reux, parfaitement ??quilibr??.\r\n\r\nNotre gamme Lungo d??voile les saveurs d??licates d\'un caf?? onctueux sublim?? par des notes c??r??ales grill??s\r\n\r\nLaissez vous emporter par son ??l??gance.'),
(7,'Caf?? en grains Moka',25,'public/img/articles/cafe en grains moka.png','D??licat et doux. Intensit?? 4/10','Notre gamme Moka est un m??lange exclusif 100% Arabica de culture traditionnelle du sud de l\'??thiopie.\r\n\r\nBerceau du caf??, l???Ethiopie est r??put?? pour ses caf??s Arabica avec ses hauts plateaux volcaniques offrant au caf?? un go??t subtilement aromatique.\r\nNotre Torr??faction Artisanale progressive apportera ?? notre MOKA une cr??me naturellement d??licate.'),
(8,'Caf?? en grains Ristretto',25,'public/img/articles/cafe en grains ristretto.png','Intense et puissant. Intensit?? 10/10','La combinaison parfaite du Robusta et de l???Arabica permet d???exprimer toute la richesse aromatique de RISTRETTO.\r\nSa puissante amertume et ses notes bois??es s???expriment dans une texture dense et soyeuse.\r\nNe manquez pas l\'exp??rience de ce caf?? intense et profond au go??t si puissant.'),
(9,'Pack Arabica',21,'public/img/articles/pack arabica.jpg','4 sachets de 250gr de caf??s en grains','Pack Arabica unique compos?? de caf??s en grains class??s Grands Crus BIO: Pure origine et Blend 100% Arabica.\r\nContient 1 sachet de 250gr de Guatemala, Moka, Colombie et Br??sil.'),
(10,'Pack Velours',11,'public/img/articles/pack velours.jpg','2 sachets de 250gr de caf?? en grains','Notre pack coup de coeur ?? prix mini!\r\n2 sachets de grain 250g de notre Collection Grand Cru Bio. Contient 1 sachet de grain Ristretto de 250gr et 1 sachet de grain Cremoso de 250gr.'),
(11,'Pack D??lice',21,'public/img/articles/pack delice.jpg','4 sachets de 150gr de caf?? en grains','Pack D??lice comprenant 1 sachet de 250gr de Cremoso, Guatemala, Moka et Lungo'),
(12,'Pack Saveurs',47,'public/img/articles/pack saveurs.jpg','8 sachets de 150gr de caf?? en grains\r\n','Pack Saveurs complet afin de vous faire d??couvrir les 8 saveurs riches et vari??es de notre Collection de caf??s Grand Crus Bio.\r\nChaque Grand Cru d??voilera des notes aromatiques sp??cifiques ?? ses origines et sa torr??faction: des saveurs vari??es, fleuries, gourmandes, intenses pour satisfaire toute la famille, ?? d??guster selon vos envies.\r\nDes m??langes sublimes et riches en saveurs gr??ce ?? notre torr??faction artisanale lente et progressive.\r\n\r\nD??couvrez les ar??mes de chaque Grand Cru Green Coffee Monaco, gr??ce ?? notre s??lection de 8 sachets de 250g, compos?? d\'un sachet Moka, d\'un sachet Cremoso, d\'un sachet Br??sil, d\'un sachet Guatemala, d\'un sachet Colombie, d\'un sachet Lungo, d\'un sachet D??caf??ini??,  et d\'un sachet Ristretto.');

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `status` */

insert  into `status`(`id`,`name`) values 
(1,'En attente'),
(2,'Accept??e'),
(3,'Refus??e');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`id`,`login`,`password`,`mail`,`type`) values 
(1,'tmansy','$2y$10$EQyAz9GHxA8jctO4AA4/u.gTh43jgYNZHiSIvK1pHtMadghVKL51K','theo.mansy@gmail.com','admin'),
(2,'Elisa','$2y$10$3gCp3DKpIxxSFAGqUe5CeeGoX16MEL5rxD4KZpgXEWLe3gQcukTR.','elisa.genicot2@gmail.com','user'),
(3,'Isabelle','$2y$10$V81d89ltH9BQs/7.rzKaMO4FDvS5kJDfwE8ZiOHaaAkHMIXo4JcLW','isabelle.franquet@gmail.com','user'),
(4,'Olivier','$2y$10$0IfIfp17dGF4AJ/D2vvBlOI508IX8YfXEjwwPwlOsvbVos8DenRF.','olivier.mansy@gmail.com','user'),
(5,'Lison','$2y$10$jgL0hQW/GBtMtip6Ii0S0.PE17mTOvXu9KSKuIFwTcfOvcxsbbGYC','lison.mansy@gmail.com','user'),
(6,'zmansy','$2y$10$63Mp5d17F6oT63/BYRP53.VUraKgTN3UZSxitPhk2P4GYLen2q.yC','zoe.mansy@gmail.com','user'),
(8,'admin','$2y$10$FDxiX4M.9ykhuJoPhowf4O/1VDfWI.fKyP5pZmzjlFhI1h2NkuwtG','admin@gmail.com','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
