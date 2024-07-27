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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$D3rrTBAYzSId0pCVeJGi0t$+s+okuZZVmSQaQL2w1LsW/k4A6SPYjLjzhd4XU+MMnQ=','2024-04-30 06:29:30.708347',1,'admin','','','admin@gmail.com',1,1,'2024-04-30 06:02:32.692393');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(21,'sessions','0001_initial','2024-04-30 05:49:55.957586');

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
('6qj1wdi4g9ntgo6zrtjkmx6oxwnkkrtd','.eJxVjDsOwjAQBe_iGlnx-k9Jzxms9WdxANlSnFSIu0OkFNC-mXkvFnBba9hGWcKc2ZkJdvrdIqZHaTvId2y3zlNv6zJHviv8oINfey7Py-H-HVQc9VtbFwui0KQMOIcxCbAWjQGpEKTFiJ6MgilJykRZK0haO-WdN0h-cuz9AeP6N7I:1s1gza:L7sWUJzzmp1UTvmfI30DgIrtsTIANh_xg1SSfy9D9mc','2024-05-14 06:29:30.708347');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_chat_table` */

insert  into `perception_app_chat_table`(`id`,`message`,`date`,`FROMID_id`,`TOID_id`) values 
(1,'Haai','2024-04-30',3,2),
(2,'hai','2024-04-30',2,3),
(3,'hoiii','2024-04-30',3,2);

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
(1,'more time required','2024-04-30','pending',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_expert_table` */

insert  into `perception_app_expert_table`(`id`,`fname`,`lname`,`place`,`post`,`pin`,`phone`,`Email`,`LOGIN_id`) values 
(1,'soorya','p k','poonoor','Thamarassery',673574,9895429855,'soorya@gmail.com',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_feedback_table` */

insert  into `perception_app_feedback_table`(`id`,`feedback`,`rating`,`date`,`USER_id`) values 
(1,'Amazing accurate app! the app really understands me !',3.5,'2024-04-30',1);

/*Table structure for table `perception_app_login_table` */

DROP TABLE IF EXISTS `perception_app_login_table`;

CREATE TABLE `perception_app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_login_table` */

insert  into `perception_app_login_table`(`id`,`username`,`password`,`Type`) values 
(1,'admin','123','admin'),
(2,'Soorya','Suml1234','expert'),
(3,'sou','S123','user');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perception_app_tips_table` */

insert  into `perception_app_tips_table`(`id`,`tips`,`date`,`EXPERT_id`) values 
(1,'1. Personality prediction apps are not exact sciences, and results should be taken as suggestions rather than absolute truths.\r\n','2024-04-30',1);

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
(1,'Sourav','pk','poonoor','kkd',673674,9876543215,'sourav@gmail.com','2004-11-17','IMG_20240428_205922_224_0ekHXXS.jpg',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
