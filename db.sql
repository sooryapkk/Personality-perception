/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - personality
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`personality` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `personality`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add expert_table',7,'add_expert_table'),
(26,'Can change expert_table',7,'change_expert_table'),
(27,'Can delete expert_table',7,'delete_expert_table'),
(28,'Can view expert_table',7,'view_expert_table'),
(29,'Can add login_table',8,'add_login_table'),
(30,'Can change login_table',8,'change_login_table'),
(31,'Can delete login_table',8,'delete_login_table'),
(32,'Can view login_table',8,'view_login_table'),
(33,'Can add user_table',9,'add_user_table'),
(34,'Can change user_table',9,'change_user_table'),
(35,'Can delete user_table',9,'delete_user_table'),
(36,'Can view user_table',9,'view_user_table'),
(37,'Can add tips_table',10,'add_tips_table'),
(38,'Can change tips_table',10,'change_tips_table'),
(39,'Can delete tips_table',10,'delete_tips_table'),
(40,'Can view tips_table',10,'view_tips_table'),
(41,'Can add feedback_table',11,'add_feedback_table'),
(42,'Can change feedback_table',11,'change_feedback_table'),
(43,'Can delete feedback_table',11,'delete_feedback_table'),
(44,'Can view feedback_table',11,'view_feedback_table'),
(45,'Can add complaint_table',12,'add_complaint_table'),
(46,'Can change complaint_table',12,'change_complaint_table'),
(47,'Can delete complaint_table',12,'delete_complaint_table'),
(48,'Can view complaint_table',12,'view_complaint_table'),
(49,'Can add chat_table',13,'add_chat_table'),
(50,'Can change chat_table',13,'change_chat_table'),
(51,'Can delete chat_table',13,'delete_chat_table'),
(52,'Can view chat_table',13,'view_chat_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(13,'perception_app','chat_table'),
(12,'perception_app','complaint_table'),
(7,'perception_app','expert_table'),
(11,'perception_app','feedback_table'),
(8,'perception_app','login_table'),
(10,'perception_app','tips_table'),
(9,'perception_app','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-02-26 08:08:38.904921'),
(2,'auth','0001_initial','2024-02-26 08:08:39.732005'),
(3,'admin','0001_initial','2024-02-26 08:08:39.913023'),
(4,'admin','0002_logentry_remove_auto_add','2024-02-26 08:08:39.927982'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-02-26 08:08:39.942942'),
(6,'contenttypes','0002_remove_content_type_name','2024-02-26 08:08:40.060627'),
(7,'auth','0002_alter_permission_name_max_length','2024-02-26 08:08:40.132436'),
(8,'auth','0003_alter_user_email_max_length','2024-02-26 08:08:40.184298'),
(9,'auth','0004_alter_user_username_opts','2024-02-26 08:08:40.203246'),
(10,'auth','0005_alter_user_last_login_null','2024-02-26 08:08:40.293006'),
(11,'auth','0006_require_contenttypes_0002','2024-02-26 08:08:40.298333'),
(12,'auth','0007_alter_validators_add_error_messages','2024-02-26 08:08:40.311748'),
(13,'auth','0008_alter_user_username_max_length','2024-02-26 08:08:40.387089'),
(14,'auth','0009_alter_user_last_name_max_length','2024-02-26 08:08:40.466000'),
(15,'auth','0010_alter_group_name_max_length','2024-02-26 08:08:40.497929'),
(16,'auth','0011_update_proxy_permissions','2024-02-26 08:08:40.513167'),
(17,'auth','0012_alter_user_first_name_max_length','2024-02-26 08:08:40.584474'),
(18,'perception_app','0001_initial','2024-02-26 08:08:41.180238'),
(19,'sessions','0001_initial','2024-02-26 08:08:41.226430');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('hponzoaohh2f686g2et3jgfujwo5ix39','eyJsaWQiOjEwfQ:1rkKmN:OTAod4elJU81LQ5aZOWE3umCnBFXcQWQWpH11XWHuMg','2024-03-27 09:20:07.281990');

/*Table structure for table `perception_app_chat_table` */

DROP TABLE IF EXISTS `perception_app_chat_table`;

CREATE TABLE `perception_app_chat_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `FROMID_id` bigint NOT NULL,
  `TOID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_chat__FROMID_id_17b8efa8_fk_perceptio` (`FROMID_id`),
  KEY `perception_app_chat__TOID_id_96a664ad_fk_perceptio` (`TOID_id`),
  CONSTRAINT `perception_app_chat__FROMID_id_17b8efa8_fk_perceptio` FOREIGN KEY (`FROMID_id`) REFERENCES `perception_app_login_table` (`id`),
  CONSTRAINT `perception_app_chat__TOID_id_96a664ad_fk_perceptio` FOREIGN KEY (`TOID_id`) REFERENCES `perception_app_login_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_chat_table` */

/*Table structure for table `perception_app_complaint_table` */

DROP TABLE IF EXISTS `perception_app_complaint_table`;

CREATE TABLE `perception_app_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_compl_USER_id_615cf74c_fk_perceptio` (`USER_id`),
  CONSTRAINT `perception_app_compl_USER_id_615cf74c_fk_perceptio` FOREIGN KEY (`USER_id`) REFERENCES `perception_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_complaint_table` */

insert  into `perception_app_complaint_table`(`id`,`complaint`,`date`,`reply`,`USER_id`) values 
(1,'adgkjjgff','2024-03-13','.',1);

/*Table structure for table `perception_app_expert_table` */

DROP TABLE IF EXISTS `perception_app_expert_table`;

CREATE TABLE `perception_app_expert_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `phone` bigint NOT NULL,
  `Email` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_exper_LOGIN_id_57101421_fk_perceptio` (`LOGIN_id`),
  CONSTRAINT `perception_app_exper_LOGIN_id_57101421_fk_perceptio` FOREIGN KEY (`LOGIN_id`) REFERENCES `perception_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_expert_table` */

insert  into `perception_app_expert_table`(`id`,`fname`,`lname`,`place`,`post`,`pin`,`phone`,`Email`,`LOGIN_id`) values 
(4,'fasna','mm','vaikkadavu','nilambur',673573,9875433324,'',10);

/*Table structure for table `perception_app_feedback_table` */

DROP TABLE IF EXISTS `perception_app_feedback_table`;

CREATE TABLE `perception_app_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `rating` int NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_feedb_USER_id_8a6fc032_fk_perceptio` (`USER_id`),
  CONSTRAINT `perception_app_feedb_USER_id_8a6fc032_fk_perceptio` FOREIGN KEY (`USER_id`) REFERENCES `perception_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_feedback_table` */

/*Table structure for table `perception_app_login_table` */

DROP TABLE IF EXISTS `perception_app_login_table`;

CREATE TABLE `perception_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_login_table` */

insert  into `perception_app_login_table`(`id`,`username`,`password`,`Type`) values 
(10,'fas','fas','expert'),
(14,'admin','123','admin'),
(15,'user','234','user');

/*Table structure for table `perception_app_tips_table` */

DROP TABLE IF EXISTS `perception_app_tips_table`;

CREATE TABLE `perception_app_tips_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tips` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_tips__EXPERT_id_6ed07927_fk_perceptio` (`EXPERT_id`),
  CONSTRAINT `perception_app_tips__EXPERT_id_6ed07927_fk_perceptio` FOREIGN KEY (`EXPERT_id`) REFERENCES `perception_app_expert_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_tips_table` */

insert  into `perception_app_tips_table`(`id`,`tips`,`date`,`EXPERT_id`) values 
(2,'fsdbjjkk','2024-03-13',4);

/*Table structure for table `perception_app_user_table` */

DROP TABLE IF EXISTS `perception_app_user_table`;

CREATE TABLE `perception_app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Fname` varchar(100) NOT NULL,
  `Lname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `phone` bigint NOT NULL,
  `Email` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `Photo` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_user__LOGIN_id_3f068c1b_fk_perceptio` (`LOGIN_id`),
  CONSTRAINT `perception_app_user__LOGIN_id_3f068c1b_fk_perceptio` FOREIGN KEY (`LOGIN_id`) REFERENCES `perception_app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_user_table` */

insert  into `perception_app_user_table`(`id`,`Fname`,`Lname`,`place`,`post`,`pin`,`phone`,`Email`,`DOB`,`Photo`,`LOGIN_id`) values 
(1,'suml','p','calicut','calicut',657544,9865432654,'suml@2000','2000-11-22','.',15);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
