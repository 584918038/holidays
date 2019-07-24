/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.29 : Database - jokes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jokes` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jokes`;

/*Table structure for table `tb_comments` */

DROP TABLE IF EXISTS `tb_comments`;

CREATE TABLE `tb_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jokeId` bigint(20) DEFAULT NULL,
  `content` text COMMENT '评论内容',
  `likeCount` bigint(255) DEFAULT '0' COMMENT '点赞数量',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父级Id',
  `isAnonymous` int(2) DEFAULT '0' COMMENT '是否匿名(  0.不匿名  1 匿名)',
  `trampleCount` bigint(20) DEFAULT '0' COMMENT '踩数量',
  `createUser` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `editUser` bigint(255) DEFAULT NULL COMMENT '修改人id',
  `editTime` datetime DEFAULT NULL COMMENT '修改时间',
  `isDel` int(2) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

/*Data for the table `tb_comments` */

/*Table structure for table `tb_file` */

DROP TABLE IF EXISTS `tb_file`;

CREATE TABLE `tb_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(2) DEFAULT NULL COMMENT '类型(0.图片 1.视频)',
  `associateType` int(2) DEFAULT NULL COMMENT '类型(1.段子 2. 评论)',
  `associateId` bigint(20) DEFAULT NULL COMMENT '关联id',
  `url` varchar(255) DEFAULT NULL,
  `createUser` bigint(255) DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime DEFAULT NULL COMMENT '创建人时间',
  `editUser` bigint(255) DEFAULT NULL COMMENT '更新人id',
  `editTime` datetime DEFAULT NULL COMMENT '更新时间',
  `isDel` int(2) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片和视频文件表';

/*Data for the table `tb_file` */

/*Table structure for table `tb_joke` */

DROP TABLE IF EXISTS `tb_joke`;

CREATE TABLE `tb_joke` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jokeTitle` varchar(255) DEFAULT NULL COMMENT '段子名称',
  `content` text COMMENT '内容',
  `readCount` bigint(255) DEFAULT '0' COMMENT '阅读数量',
  `likeCount` bigint(20) DEFAULT '0' COMMENT '点赞数量',
  `trampleCount` bigint(255) DEFAULT '0' COMMENT '踩数量',
  `createUser` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `editTime` datetime DEFAULT NULL COMMENT '更新时间',
  `editUser` bigint(255) DEFAULT NULL COMMENT '修改人id',
  `isDel` int(2) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='段子表';

/*Data for the table `tb_joke` */

/*Table structure for table `tb_sys_user` */

DROP TABLE IF EXISTS `tb_sys_user`;

CREATE TABLE `tb_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `openId` varchar(255) DEFAULT NULL COMMENT '用户openid',
  `attentionNumber` bigint(20) DEFAULT NULL COMMENT '被关注数量',
  `attentionOn` longtext COMMENT '被关注的人',
  `isPermitLogin` int(2) DEFAULT NULL COMMENT '是否允许登录',
  `createUser` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `editUser` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `editTime` datetime DEFAULT NULL COMMENT '修改时间',
  `isDel` int(2) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_sys_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
