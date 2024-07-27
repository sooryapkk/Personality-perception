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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(52,'Can view chat_table',13,'view_chat_table'),
(53,'Can add upload_ history',14,'add_upload_history'),
(54,'Can change upload_ history',14,'change_upload_history'),
(55,'Can delete upload_ history',14,'delete_upload_history'),
(56,'Can view upload_ history',14,'view_upload_history');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$D3rrTBAYzSId0pCVeJGi0t$+s+okuZZVmSQaQL2w1LsW/k4A6SPYjLjzhd4XU+MMnQ=','2024-05-25 07:22:56.867218',1,'admin','','','admin@gmail.com',1,1,'2024-04-30 06:02:32.692393');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(14,'perception_app','upload_history'),
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-04-30 05:49:52.805662'),
(2,'auth','0001_initial','2024-04-30 05:49:53.808751'),
(3,'admin','0001_initial','2024-04-30 05:49:54.045619'),
(4,'admin','0002_logentry_remove_auto_add','2024-04-30 05:49:54.060580'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-04-30 05:49:54.074543'),
(6,'contenttypes','0002_remove_content_type_name','2024-04-30 05:49:54.205166'),
(7,'auth','0002_alter_permission_name_max_length','2024-04-30 05:49:54.303942'),
(8,'auth','0003_alter_user_email_max_length','2024-04-30 05:49:54.347010'),
(9,'auth','0004_alter_user_username_opts','2024-04-30 05:49:54.360033'),
(10,'auth','0005_alter_user_last_login_null','2024-04-30 05:49:54.494544'),
(11,'auth','0006_require_contenttypes_0002','2024-04-30 05:49:54.504792'),
(12,'auth','0007_alter_validators_add_error_messages','2024-04-30 05:49:54.534834'),
(13,'auth','0008_alter_user_username_max_length','2024-04-30 05:49:54.663781'),
(14,'auth','0009_alter_user_last_name_max_length','2024-04-30 05:49:54.747671'),
(15,'auth','0010_alter_group_name_max_length','2024-04-30 05:49:54.804641'),
(16,'auth','0011_update_proxy_permissions','2024-04-30 05:49:54.829644'),
(17,'auth','0012_alter_user_first_name_max_length','2024-04-30 05:49:54.954139'),
(18,'perception_app','0001_initial','2024-04-30 05:49:55.773931'),
(19,'perception_app','0002_alter_feedback_table_rating','2024-04-30 05:49:55.889700'),
(20,'perception_app','0003_alter_tips_table_tips','2024-04-30 05:49:55.913636'),
(21,'sessions','0001_initial','2024-04-30 05:49:55.957586'),
(22,'perception_app','0004_upload_history','2024-05-17 09:46:51.100318');

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
('0trdto3l4edly5tijf4ufwdg6k4is61f','.eJxVjDkOwyAUBe9CHSGzf1Km9xnQZwtOLJCMXUW5e4Lkxu3MvPch6xLJHW7E4bEXd_S0uUEIIxfmMbxTHSK-sD4bDa3u2-LpSOhpO51bTOvjbC8HBXv5rw34hMhUlpoDoA-MG4NacyGRC4MebdaST0HkmHNUkgelQFqwGrOdgHx_WCY5zQ:1sAlk0:6jN_gBx2ixkxaqrqIeqS0qUyeUUSM2NJyKboTDnq078','2024-06-08 07:22:56.979776');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_chat_table` */

insert  into `perception_app_chat_table`(`id`,`message`,`date`,`FROMID_id`,`TOID_id`) values 
(1,'Haai','2024-04-30',3,2),
(2,'hai','2024-04-30',2,3),
(3,'hoiii','2024-04-30',3,2),
(9,'Haii','2024-05-02',3,5),
(10,'','2024-05-02',3,2),
(11,'Ha','2024-05-02',3,2),
(12,'Hai','2024-05-06',7,2),
(13,'Haiii','2024-05-06',7,8),
(14,'hi','2024-05-10',2,4),
(15,'Hai','2024-05-11',3,2),
(16,'Hai','2024-05-11',3,2),
(17,'Hai','2024-05-11',3,2),
(18,'Hai','2024-05-11',3,2),
(19,'Hai','2024-05-11',3,2),
(20,'Hai','2024-05-11',3,2),
(21,'Hai','2024-05-11',3,2),
(22,'Hai','2024-05-11',3,2),
(23,'','2024-05-11',3,2),
(24,'Hai','2024-05-11',3,2),
(25,'','2024-05-11',3,2),
(26,'Hai','2024-05-11',3,2),
(27,'Hai','2024-05-11',3,6),
(28,'Hai','2024-05-11',3,6),
(29,'Hai','2024-05-11',3,6),
(30,'Hai','2024-05-11',3,6),
(31,'Hai','2024-05-11',3,8),
(32,'Hai','2024-05-11',3,8),
(33,'Hai','2024-05-11',3,8),
(34,'Hai','2024-05-11',3,8),
(35,'Hai','2024-05-11',3,6),
(36,'Hai','2024-05-11',3,6),
(37,'Hai','2024-05-11',3,8),
(38,'Hai','2024-05-11',3,6),
(39,'Hai','2024-05-11',3,8),
(40,'Hai','2024-05-11',3,8),
(41,'Hai','2024-05-11',3,8),
(42,'Hai','2024-05-11',3,6),
(43,'haiii','2024-05-13',8,3),
(44,'hai','2024-05-13',8,4),
(45,'haii','2024-05-13',8,7),
(46,'Hai','2024-05-13',9,2),
(47,'hai','2024-05-13',8,9),
(48,'hai','2024-05-14',5,3),
(49,'hai','2024-05-14',5,4),
(50,'hai','2024-05-14',5,7),
(51,'hai','2024-05-14',5,9),
(52,'haii','2024-05-14',3,5),
(53,'hi','2024-05-14',3,2),
(54,'hello','2024-05-14',3,2),
(55,'haii','2024-05-14',5,3),
(56,'hi','2024-05-14',3,5),
(57,'hai','2024-05-14',5,3),
(58,'hello','2024-05-14',3,5),
(59,'hai','2024-05-19',8,3),
(60,'hai','2024-05-19',8,4),
(61,'hai','2024-05-19',8,7),
(62,'hai','2024-05-19',8,9),
(63,'hai','2024-05-20',3,6),
(64,'hai','2024-05-20',3,6),
(65,'hai','2024-05-20',3,6),
(66,'hai','2024-05-20',3,6),
(67,'hai','2024-05-20',3,6),
(68,'hai','2024-05-20',3,6),
(69,'hai','2024-05-20',10,2),
(70,'soorya','2024-05-20',10,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_complaint_table` */

insert  into `perception_app_complaint_table`(`id`,`complaint`,`date`,`reply`,`USER_id`) values 
(1,'more time required','2024-04-30','pending',1),
(3,'more time required','2024-05-06','sorry\r\n',3),
(4,'ffgggghh','2024-05-14','fghh',1),
(5,'very bad app','2024-05-20','Sorry,its our mistake',5),
(6,'wrong prediction ','2024-05-20','pending',5),
(7,'bad','2024-05-25','pending',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_expert_table` */

insert  into `perception_app_expert_table`(`id`,`fname`,`lname`,`place`,`post`,`pin`,`phone`,`Email`,`LOGIN_id`) values 
(1,'soorya','p k','poonoor','Thamarassery',673574,9895429855,'soorya@gmail.com',2),
(2,'Fasna ','M M','Nilambur','mlpr',673676,9876543298,'fas@gmail.com',5),
(3,'Ihzan','p k','kottakkal','mlpr',786543,9876543293,'ihzn@gmail.com',6),
(4,'sanitha ','k k ','Nilambur','mlpr',786548,9876553293,'sani@gmail.com',8);

/*Table structure for table `perception_app_feedback_table` */

DROP TABLE IF EXISTS `perception_app_feedback_table`;

CREATE TABLE `perception_app_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_feedb_USER_id_8a6fc032_fk_perceptio` (`USER_id`),
  CONSTRAINT `perception_app_feedb_USER_id_8a6fc032_fk_perceptio` FOREIGN KEY (`USER_id`) REFERENCES `perception_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_feedback_table` */

insert  into `perception_app_feedback_table`(`id`,`feedback`,`rating`,`date`,`USER_id`) values 
(1,'Amazing accurate app! the app really understands me !',3.5,'2024-04-30',1),
(2,'poraa',1.5,'2024-05-02',2),
(3,'good',3.5,'2024-05-14',1),
(4,'good',5,'2024-05-20',5);

/*Table structure for table `perception_app_login_table` */

DROP TABLE IF EXISTS `perception_app_login_table`;

CREATE TABLE `perception_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_login_table` */

insert  into `perception_app_login_table`(`id`,`username`,`password`,`Type`) values 
(1,'admin','123','admin'),
(2,'Soorya','Suml1234','expert'),
(3,'sou','S123','user'),
(4,'vishnu','vishnu15','user'),
(5,'fas','Fasna1232','expert'),
(6,'ihzan','Ihzan1232','expert'),
(7,'Aju','A123','user'),
(8,'sani','Sani1234','expert'),
(9,'Arch','Arch1234','user'),
(10,'Abhi','abhisha123','user');

/*Table structure for table `perception_app_tips_table` */

DROP TABLE IF EXISTS `perception_app_tips_table`;

CREATE TABLE `perception_app_tips_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tips` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_tips__EXPERT_id_6ed07927_fk_perceptio` (`EXPERT_id`),
  CONSTRAINT `perception_app_tips__EXPERT_id_6ed07927_fk_perceptio` FOREIGN KEY (`EXPERT_id`) REFERENCES `perception_app_expert_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_tips_table` */

insert  into `perception_app_tips_table`(`id`,`tips`,`date`,`EXPERT_id`) values 
(1,'1. Personality prediction apps are not exact sciences, and results should be taken as suggestions rather than absolute truths.\r\n','2024-04-30',1),
(2,'Personality prediction apps are not exact sciences, and results should be taken as suggestions rather than absolute truths.','2024-05-13',2),
(3,'Personality prediction apps are not exact sciences, and results should be taken as suggestions rather than absolute truths.','2024-05-13',3),
(4,'Personality prediction apps are not exact sciences, and results should be taken as suggestions rather than absolute truths.','2024-05-13',4);

/*Table structure for table `perception_app_upload_history` */

DROP TABLE IF EXISTS `perception_app_upload_history`;

CREATE TABLE `perception_app_upload_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `result` varchar(50) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perception_app_uploa_USER_id_43e4503f_fk_perceptio` (`USER_id`),
  CONSTRAINT `perception_app_uploa_USER_id_43e4503f_fk_perceptio` FOREIGN KEY (`USER_id`) REFERENCES `perception_app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_upload_history` */

insert  into `perception_app_upload_history`(`id`,`file`,`date`,`result`,`USER_id`) values 
(1,'AudioRecording_kqJmq7L.3gp','2024-05-18','neutral',1),
(2,'AudioRecording_V9ktddM.3gp','2024-05-18','neutral',1),
(3,'AudioRecording_SIz876Y.3gp','2024-05-18','neutral',1),
(4,'AudioRecording_cRXh8ha.3gp','2024-05-18','neutral',1),
(5,'AudioRecording_0mKewsv.3gp','2024-05-18','Fear',1),
(6,'AudioRecording_N5jUWNs.3gp','2024-05-19','neutral',1),
(7,'AudioRecording_lHTTEjL.3gp','2024-05-19','Sad',1),
(8,'AudioRecording_tH8BeWC.3gp','2024-05-19','neutral',1),
(9,'AudioRecording_ysHtwDz.3gp','2024-05-20','neutral',1),
(10,'AudioRecording_qlzGcnA.3gp','2024-05-20','Pleasant',1),
(11,'AudioRecording_Z6auJGf.3gp','2024-05-20','neutral',1),
(12,'AudioRecording_tXolvUm.3gp','2024-05-20','Pleasant',1),
(13,'AudioRecording_kCQSR2j.3gp','2024-05-20','Pleasant',1),
(14,'AudioRecording_5ir9lVO.3gp','2024-05-20','Sad',1),
(15,'AudioRecording_ZNx4Nbb.3gp','2024-05-20','Pleasant',1),
(16,'AudioRecording_enUh77q.3gp','2024-05-20','Sad',1),
(17,'AudioRecording_ZZOa2e0.3gp','2024-05-20','neutral',1),
(18,'AudioRecording_0qapyOc.3gp','2024-05-20','happy',1),
(19,'AudioRecording_Ck3n20V.3gp','2024-05-20','neutral',5),
(20,'AudioRecording_5sWdLeG.3gp','2024-05-20','neutral',5),
(21,'AudioRecording_HyXEWiH.3gp','2024-05-20','neutral',5),
(22,'AudioRecording_m3HeYOo.3gp','2024-05-20','neutral',5),
(23,'AudioRecording_kKK6kNx.3gp','2024-05-20','Pleasant',5),
(24,'AudioRecording_xwLil19.3gp','2024-05-20','neutral',5),
(25,'AudioRecording_NMbfnsH.3gp','2024-05-20','neutral',5),
(26,'AudioRecording_NpU6LEP.3gp','2024-05-25','neutral',1),
(27,'AudioRecording_ax7lh7o.3gp','2024-05-25','neutral',1),
(28,'AudioRecording_cCCh41Q.3gp','2024-05-25','neutral',1),
(29,'AudioRecording_PFTIwIM.3gp','2024-05-25','neutral',1),
(30,'AudioRecording_Gec3jlb.3gp','2024-05-25','Pleasant',1),
(31,'AudioRecording_HIWGSlu.3gp','2024-05-25','neutral',1),
(32,'AudioRecording_AYJHo2C.3gp','2024-05-25','neutral',1),
(33,'AudioRecording_UoszTiF.3gp','2024-05-25','neutral',1),
(34,'AudioRecording_EyNu2uh.3gp','2024-05-25','Sad',1),
(35,'AudioRecording_jaDXvYC.3gp','2024-05-25','neutral',1),
(36,'AudioRecording_aFVRSRm.3gp','2024-05-25','neutral',1),
(37,'AudioRecording_vx3Y2bD.3gp','2024-05-25','neutral',1),
(38,'AudioRecording_fc33gKW.3gp','2024-05-25','neutral',1),
(39,'AudioRecording_EicJBfh.3gp','2024-05-25','neutral',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_user_table` */

insert  into `perception_app_user_table`(`id`,`Fname`,`Lname`,`place`,`post`,`pin`,`phone`,`Email`,`DOB`,`Photo`,`LOGIN_id`) values 
(1,'Sourav','pk','poonoor','kkd',673674,9876543215,'sourav@gmail.com','2004-11-17','IMG_20240428_205922_224_0ekHXXS.jpg',3),
(2,'athira','n','Calicut ','karad',679339,9961129615,'athiramnair420@gmail.com','2000-06-22','IMG-20240310-WA0058.jpg',4),
(3,'Aju','p','mlpm','mlpm',673457,9845652398,'aju@gmail.com','2000-06-25','IMG_20240420_192615.jpg',7),
(4,'Archana','k p ','kkd','kkd',673576,9854236598,'arch@gmail.com','2001-10-25','IMG_20230705_073556.jpg',9),
(5,'Abhisha','Bhaskaran','Nadavayal','Nadavayal',670721,9961261589,'abhishabhaskaran103@gmail.com','2014-10-15','Screenshot_2024-05-20-09-06-25-780_com.instagram.android.jpg',10);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
