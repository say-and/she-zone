/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - shezone
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shezone` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `shezone`;

/*Table structure for table `awarness` */

DROP TABLE IF EXISTS `awarness`;

CREATE TABLE `awarness` (
  `awarnessvideoid` int(11) NOT NULL AUTO_INCREMENT,
  `doctoid` int(11) DEFAULT NULL,
  `videourl` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`awarnessvideoid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `awarness` */

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` int(11) DEFAULT NULL,
  `sheduleid` int(11) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `booking` */

/*Table structure for table `bookyoga` */

DROP TABLE IF EXISTS `bookyoga`;

CREATE TABLE `bookyoga` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `yogaloginid` int(11) DEFAULT NULL,
  `userloginid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookyoga` */

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chatid` int(11) NOT NULL AUTO_INCREMENT,
  `fromid` int(11) DEFAULT NULL,
  `toid` int(11) DEFAULT NULL,
  `message` varchar(150) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `complaintid` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` int(11) DEFAULT NULL,
  `complaint` varchar(120) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reply` varchar(150) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`complaintid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaintid`,`loginid`,`complaint`,`date`,`reply`,`status`) values 
(1,1,'No Response','2022-09-17','Issue solved','Completed'),
(2,3,'Fee Reduction','2022-09-13','Can\'t reduce','Pending');

/*Table structure for table `cycleofpatient` */

DROP TABLE IF EXISTS `cycleofpatient`;

CREATE TABLE `cycleofpatient` (
  `cycleid` int(11) NOT NULL AUTO_INCREMENT,
  `patientloginid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`cycleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cycleofpatient` */

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctorid` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalid` int(11) DEFAULT NULL,
  `doctorname` varchar(55) DEFAULT NULL,
  `department` varchar(55) DEFAULT NULL,
  `qualification` varchar(55) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `contactno` varchar(18) DEFAULT NULL,
  `photo` varchar(55) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`doctorid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

insert  into `doctor`(`doctorid`,`hospitalid`,`doctorname`,`department`,`qualification`,`gender`,`experience`,`contactno`,`photo`,`login_id`) values 
(1,2,'DR.Somu','Gynacologist','10th fail','female',5,'1234567999',NULL,NULL),
(2,3,'DR.Manu','mental','9th fail','other',1,'1234599999',NULL,NULL),
(3,4,'DR.Shaji','neurologist','9th pass','other',3,'9999999999',NULL,NULL),
(4,5,'DR.Babu','cancer','9th pass','female',9,'8989898989',NULL,NULL),
(5,NULL,'kyjmtnhrbg',NULL,'7k6uyhtgfr','male',5,'987654',NULL,NULL),
(6,NULL,'uyjnthbgv',NULL,'umkjnyhbtgvrf','male',5,'987654','staticcat_face_glasses_thick_65455_1920x1200.jpg',NULL);

/*Table structure for table `facility` */

DROP TABLE IF EXISTS `facility`;

CREATE TABLE `facility` (
  `facilityid` int(11) NOT NULL AUTO_INCREMENT,
  `yogatrainerloginid` int(11) DEFAULT NULL,
  `facilityname` varchar(55) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`facilityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facility` */

/*Table structure for table `healthtips` */

DROP TABLE IF EXISTS `healthtips`;

CREATE TABLE `healthtips` (
  `healthtipid` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`healthtipid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `healthtips` */

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `place` varchar(55) DEFAULT NULL,
  `post` varchar(55) DEFAULT NULL,
  `pin` varchar(6) DEFAULT NULL,
  `district` varchar(55) DEFAULT NULL,
  `contactno` varchar(18) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `hospitaltype` varchar(55) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `hospital` */

insert  into `hospital`(`hospital_id`,`name`,`place`,`post`,`pin`,`district`,`contactno`,`email`,`hospitaltype`,`login_id`) values 
(1,'Asha hospital','vatakara','nadakkuthazha','673104','kozhikode','04962556874','asha@gmail.com','private',3),
(2,'GOVT.hospital','orkkatteri','madappally','673212','kozhikode','0496754312','govt@gmail.com','GOVT',5),
(3,'Sahakarana hospital','vatakara','vatakara','674321','kozhikode','0496753211','sahakarana@gmail.com','co-operative',6),
(4,'Baby memorial hospital','kozhikode','kozhikode','675432','kozhikode','049675311','Baby@gamil.com','private',8),
(5,' Mytra hospital','kollam','kollam','675421','kozhikode','049674333','mytra@gmail.com','private',0),
(6,'kollam','kollam','673317','kozhik','9988776655','manoj123@gmail.com','private','manoj123',0),
(7,'vadakara','kollam','98765','kozhik','9988776655','somanoola@gmail.co','private','zxcvb',0),
(8,'aswin','vadakara','payyoli','99999','kozhikkode','9999999966','kumara09@gmail.com','private',7),
(9,'','','','','','','','',17);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(55) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  `usertype` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'somanoola@gmail.com','zxcvb','hospital'),
(2,'aswin@gmail.com','4567','hospital'),
(3,'aswin@gmail.com','4567','hospital'),
(4,'aswin@gmail.com','7890','hospital'),
(5,'aswin@gmail.com','67890','hospital'),
(6,'kumara09@gmail.com','99999','hospital'),
(7,'kumara09@gmail.com','mnbv','hospital'),
(8,'fvfs','3333','hospital'),
(9,'y8okiyjuthy','987654','hospital'),
(10,'y8okiyjuthy','987654','hospital'),
(11,'vadakara','3333','hospital'),
(12,'etyykrydtj','3333','hospital'),
(13,'etyykrydtj','3333','hospital'),
(14,'etyykrydtj','876543','hospital'),
(15,'7iklj5hytg','987654','hospital'),
(16,'umyjnthbgrf','987654','hospital'),
(17,'','','hospital');

/*Table structure for table `shedule` */

DROP TABLE IF EXISTS `shedule`;

CREATE TABLE `shedule` (
  `sheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `doctorid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `fromtime` time DEFAULT NULL,
  `totime` time DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`sheduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shedule` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `photo` varchar(55) DEFAULT NULL,
  `place` varchar(55) DEFAULT NULL,
  `post` varchar(55) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `district` varchar(55) DEFAULT NULL,
  `dob` varchar(25) DEFAULT NULL,
  `contact` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`userid`,`loginid`,`name`,`gender`,`photo`,`place`,`post`,`pin`,`district`,`dob`,`contact`) values 
(1,2,'soman','female',NULL,'vadakara','madappally',673102,'kozhikode','01/04/2009',1234567890),
(2,3,'manoj','other',NULL,'kollam','moodadi',673524,'kozhikkode','29/04/2099',2134567890),
(3,4,'shaji','other',NULL,'parambath','thalakkulathur',673317,'kozikode','09/09/2009',3124567890),
(4,5,'babu','female',NULL,'ulampara','kuthiravattam',999999,'ooty','19/09/2999',4123567890);

/*Table structure for table `yogatrainee` */

DROP TABLE IF EXISTS `yogatrainee`;

CREATE TABLE `yogatrainee` (
  `yogatrainerid` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` int(11) DEFAULT NULL,
  `photo` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `place` varchar(55) DEFAULT NULL,
  `post` varchar(55) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `district` varchar(55) DEFAULT NULL,
  `contactno` varchar(18) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `qualification` varchar(55) DEFAULT NULL,
  `experience` varchar(55) DEFAULT NULL,
  `time` varchar(55) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`yogatrainerid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `yogatrainee` */

insert  into `yogatrainee`(`yogatrainerid`,`loginid`,`photo`,`name`,`place`,`post`,`pin`,`district`,`contactno`,`email`,`qualification`,`experience`,`time`,`gender`) values 
(1,2,NULL,'kollam kumaran','kollam','koyilandi',463156,'kozhikode','2345678926','kollamkumu@gmail.com','naramb','9','9am-9pm','other'),
(2,3,NULL,'roadside soman','kuthiravattam','vatakara',782655,'kozhikode','6248927865','roadside@gmail.com','bed yoga','6','6am-9am','male'),
(3,4,NULL,'aakri manoj','kollam','kollam',891369,'kozhikode','8634962785','aakri@gmail.com','aakri yoga','4','9am-12pm','female'),
(4,5,NULL,'babu nambuthiri','meppayur','meppayur',856895,'calicut','8779528566','babu@gmail.com','nambu yoga','5','10am-11am','female'),
(5,6,NULL,'rubber kumaran','kollam','kollam',486236,'calicut','4896353235','rubber@gmail.com','rubber yoga','9','9pm-10pm','male'),
(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
