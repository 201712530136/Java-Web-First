/*
SQLyog FULL v10.41 
MySQL - 5.6.21-log : Database - huangshandian
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`huangshandian` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `huangshandian`;

/*Table structure for table `activity` */

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `ID` int(4) DEFAULT NULL,
  `EndTime` varchar(20) DEFAULT NULL,
  `HeadLine` varchar(144) DEFAULT NULL,
  `ActivityName` varchar(288) DEFAULT NULL,
  `Decription` text,
  `Image1` varchar(576) DEFAULT NULL,
  `Image2` varchar(576) DEFAULT NULL,
  `code` int(2) DEFAULT NULL,
  `User` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `activity` */

insert  into `activity`(`ID`,`EndTime`,`HeadLine`,`ActivityName`,`Decription`,`Image1`,`Image2`,`code`,`User`) values (1,'2099-12-31','活动一','初进社区','新社区、留言室已建立，成为社区的一份子，为社区建设贡献一分力量吧！','images/1561208650661.jpg','images/12.jpg',0,'小赵、小董、莉莉丝、赵维威'),(3,'2019-05-31','活动三','交水电费','4月份的水电费已生成，请及时缴款充值，以免影响您的正常生活。','images/31.jpg','images/32.jpg',0,NULL),(5,'2019-05-22','活动五','设备检测','社区网站将会在2019年5月22日上午8点到中午12点进行定期维护，给您带来的不便敬请谅解。','images/51.jpg','images/52.jpg',0,NULL),(6,'2019-05-24','活动六','跳蚤市场','跳蚤市场又再次开始了啦，本次活动和上次一样，可以把闲置的东西拿出来卖，时间为5月24日。','images/61.jpg','images/62.jpg',1,NULL),(7,'2019-06-06','活动七','停电通知','因变电所站内检修计划开展零点检修工作，计划停电时间2109年6月5日晚22：00至2019年6月6日凌晨3：00.','images/71.jpg','images/72.jpg',0,NULL),(2,'2099-12-31','活动二','设备检测','社区网站将会在2019年5月22日上午8点到中午12点进行定期维护，给您带来的不便敬请谅解。','images/52.jpg','images/51.jpg',0,NULL),(8,'2019-06-06','活动八','这是一个测试','此公告用来测试后台功能能','images/1561261788220.JPG','images/1561261797206.JPG',0,NULL);

/*Table structure for table `id` */

DROP TABLE IF EXISTS `id`;

CREATE TABLE `id` (
  `id` varchar(19) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `id` */

insert  into `id`(`id`,`username`) values ('10001','赵维威'),('10002','董莹'),('10003','bb');

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `Image` varchar(10000) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `images` */

insert  into `images`(`Image`,`Title`) values ('images/g7.jpg','Library'),('images/g9.jpg','Volleyball'),('images/g3.jpg','Computer Lab'),('images/g4.jpg','Meditation'),('images/g1.jpg','Science'),('images/g6.jpg','Group Discussion'),('images/g2.jpg','Chemical Lab'),('images/g5.jpg','Sports'),('images/g8.jpg','Seminar');

/*Table structure for table `liuyanban2` */

DROP TABLE IF EXISTS `liuyanban2`;

CREATE TABLE `liuyanban2` (
  `liuyanren` varchar(2700) DEFAULT NULL,
  `liuyanneirong` varchar(2700) DEFAULT NULL,
  `liuyanshijian` varchar(2700) DEFAULT NULL,
  `biaoti` varchar(2700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `liuyanban2` */

insert  into `liuyanban2`(`liuyanren`,`liuyanneirong`,`liuyanshijian`,`biaoti`) values ('赵维威','天气太冷，不想出门','2019-6-11 15:33:40','太冷'),('董莹','以为是太热','2019-6-11 15:33:40','不想在家啦'),('111213','天气太冷，不想出门','2019-6-11 15:35:37','太冷'),('133113','天气太冷，不想出门','2019-6-11 15:35:40','太冷'),('232321','天气太冷，不想出门','2019-6-11 15:36:15','太冷'),('23231','天气太冷，不想出门','2019-6-11 15:38:36','太冷'),(NULL,NULL,'2019-6-21 16:04:15',NULL),('赵维威',NULL,'2019-6-21 16:05:04',NULL),(NULL,NULL,'2019-6-21 19:21:11',NULL),(NULL,NULL,'2019-6-21 19:25:38',NULL),(NULL,NULL,'2019-6-21 19:26:01',NULL),(NULL,NULL,'2019-6-21 19:30:38',NULL),(NULL,NULL,'2019-6-21 19:31:22',NULL),(NULL,NULL,'2019-6-21 19:32:14',NULL),(NULL,NULL,'2019-6-21 19:34:49',NULL),(NULL,NULL,'2019-6-21 19:34:54',NULL),(NULL,NULL,'2019-6-21 19:34:54',NULL),(NULL,NULL,'2019-6-21 19:35:02',NULL),(NULL,NULL,'2019-6-21 19:35:25',NULL),(NULL,NULL,'2019-6-21 19:36:14',NULL),(NULL,NULL,'2019-6-21 19:36:37',NULL),(NULL,NULL,'2019-6-21 19:41:59',NULL),(NULL,NULL,'2019-6-21 19:47:36',NULL),(NULL,NULL,'2019-6-21 19:52:46',NULL),(NULL,NULL,'2019-6-21 20:03:36',NULL),(NULL,NULL,'2019-6-21 20:09:06',NULL),(NULL,NULL,'2019-6-21 20:10:25',NULL),(NULL,NULL,'2019-6-21 20:11:46',NULL),(NULL,NULL,'2019-6-21 20:11:52',NULL),(NULL,NULL,'2019-6-21 20:12:10',NULL),(NULL,NULL,'2019-6-21 20:12:46',NULL),(NULL,NULL,'2019-6-21 20:12:54',NULL),(NULL,NULL,'2019-6-21 20:18:44',NULL),(NULL,NULL,'2019-6-21 20:22:59',NULL),(NULL,NULL,'2019-6-21 20:23:07',NULL),(NULL,NULL,'2019-6-21 20:23:21',NULL),(NULL,NULL,'2019-6-21 20:31:57',NULL),(NULL,NULL,'2019-6-21 20:31:59',NULL),(NULL,NULL,'2019-6-21 20:32:01',NULL),(NULL,NULL,'2019-6-21 20:33:03',NULL),(NULL,NULL,'2019-6-21 20:39:18',NULL),('管理员',NULL,'2019-6-22 12:14:14',NULL),('管理员',NULL,'2019-6-22 12:14:22',NULL),('管理员',NULL,'2019-6-22 12:14:33',NULL),('管理员',NULL,'2019-6-22 12:15:16',NULL),('管理员',NULL,'2019-6-22 19:36:37',NULL),('管理员',NULL,'2019-6-22 19:37:10',NULL),('赵维威',NULL,'2019-6-22 20:09:24',NULL),('赵维威','讲道理，工作真的有点多','2019-6-22 20:10:11','讲道理'),('管理员',NULL,'2019-6-22 20:16:42',NULL),('管理员',NULL,'2019-6-22 20:17:47',NULL),('管理员',NULL,'2019-6-22 20:17:54',NULL),('管理员','都别吵吵','2019-6-22 20:18:26','安静'),('管理员',NULL,'2019-6-22 20:19:24',NULL),('管理员',NULL,'2019-6-22 20:19:44',NULL),('管理员',NULL,'2019-6-22 20:19:50',NULL),('管理员',NULL,'2019-6-22 20:21:04',NULL),('管理员',NULL,'2019-6-22 20:22:58',NULL),('管理员','就只是想留个言','2019-6-22 20:23:14','我想留个言'),('管理员','就只是想留个言','2019-6-22 20:23:32','我想留个言'),('管理员',NULL,'2019-6-23 14:01:11',NULL),('管理员',NULL,'2019-6-23 14:01:20',NULL),('管理员',NULL,'2019-6-23 14:03:21',NULL),('赵维威',NULL,'2019-6-23 14:07:13',NULL),('赵维威',NULL,'2019-6-23 14:09:35',NULL),('管理员',NULL,'2019-6-23 14:10:21',NULL);

/*Table structure for table `user1` */

DROP TABLE IF EXISTS `user1`;

CREATE TABLE `user1` (
  `id` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `userpass` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `company` varchar(80) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `role` int(1) DEFAULT NULL,
  `gold` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user1` */

insert  into `user1`(`id`,`username`,`userpass`,`email`,`phone`,`company`,`address`,`role`,`gold`) values ('10001','赵维威','1111','123@qq.com',1234567,'zzxy','202',0,'1000'),('10002','董莹','2222','1442121@qq.com',150394099,'仓库','283',0,'9999999'),('10003','管理员','1111','2388433@qq.com',132472182,'黄山店社区',NULL,1,'99999999');

/*Table structure for table `volunteers` */

DROP TABLE IF EXISTS `volunteers`;

CREATE TABLE `volunteers` (
  `voNUM` varchar(100) DEFAULT NULL,
  `voName` varchar(20) DEFAULT NULL,
  `voBirth` varchar(20) DEFAULT NULL,
  `voGender` varchar(20) DEFAULT NULL,
  `voE_mail` varchar(20) DEFAULT NULL,
  `voPhone` varchar(20) DEFAULT NULL,
  `voJob` varchar(20) DEFAULT NULL,
  `voDress` varchar(20) DEFAULT NULL,
  `voVO` varchar(20) DEFAULT NULL,
  `voText` text,
  `voJobA` text,
  `voVie` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `volunteers` */

insert  into `volunteers`(`voNUM`,`voName`,`voBirth`,`voGender`,`voE_mail`,`voPhone`,`voJob`,`voDress`,`voVO`,`voText`,`voJobA`,`voVie`) values ('1','赵维威','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','232','通过','经验丰富，资格老道','交通指挥',1),('2','刘华强','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','232','不通过','心狠手辣，没有责任感',NULL,1),('3','刘华文','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','442','不通过',NULL,NULL,1),('4','董莹','12/31/1997','女','1759723233@qq.com','15065317248','社区志愿者','333','通过','有责任心','担任社区教师',1),('5','铁球','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','121','不通过',NULL,NULL,1),('6','钢弹','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','121','不通过',NULL,NULL,1),('7','挖掘机','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','324','不通过',NULL,NULL,1),('8','钟振贤','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','553','不通过',NULL,NULL,1),('9','文将军','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','323','不通过',NULL,NULL,1),('10','Jsmil','12/31/1997','男','1759723233@qq.com','15065317248','社区志愿者','111','不通过',NULL,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
