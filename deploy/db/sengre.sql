/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.31 : Database - sengre1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sengre1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sengre1`;

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Muscat');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','??\0sr\0org.quartz.JobDataMap????????\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap?????](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap?.?(v\n?\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap???`?\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj?KYt\0\0xpw\0\0?_?{?xt\00 0/30 * * * ?sr\0java.lang.Long;?????#?\0J\0valuexr\0java.lang.Number??????\0\0xp\0\0\0\0\0\0\0t\0renrent\0????????????sr\0java.lang.Integer??????8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('RenrenScheduler','DESKTOP-3FEMNPH1668073415511',1668074092429,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1668074400000,-1,5,'WAITING','CRON',1668073415000,0,NULL,2,'');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) DEFAULT NULL COMMENT '??????',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron?????????',
  `status` tinyint DEFAULT NULL COMMENT '????????????  0?????????  1?????????',
  `remark` varchar(255) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';

/*Data for the table `schedule_job` */

insert  into `schedule_job`(`job_id`,`bean_name`,`params`,`cron_expression`,`status`,`remark`,`create_time`) values (1,'testTask','renren','0 0/30 * * * ?',0,'????????????','2022-11-10 12:16:01');

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '????????????id',
  `job_id` bigint NOT NULL COMMENT '??????id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean??????',
  `params` varchar(2000) DEFAULT NULL COMMENT '??????',
  `status` tinyint NOT NULL COMMENT '????????????    0?????????    1?????????',
  `error` varchar(2000) DEFAULT NULL COMMENT '????????????',
  `times` int NOT NULL COMMENT '??????(???????????????)',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??????????????????';

/*Data for the table `schedule_job_log` */

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '?????????',
  `expire_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='???????????????';

/*Data for the table `sys_captcha` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint DEFAULT '1' COMMENT '??????   0?????????   1?????????',
  `remark` varchar(500) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='?????????????????????';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'?????????????????????');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '?????????',
  `operation` varchar(50) DEFAULT NULL COMMENT '????????????',
  `method` varchar(200) DEFAULT NULL COMMENT '????????????',
  `params` varchar(5000) DEFAULT NULL COMMENT '????????????',
  `time` bigint NOT NULL COMMENT '????????????(??????)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP??????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';

/*Data for the table `sys_log` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '?????????ID??????????????????0',
  `name` varchar(50) DEFAULT NULL COMMENT '????????????',
  `url` varchar(200) DEFAULT NULL COMMENT '??????URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '??????(??????????????????????????????user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '??????   0?????????   1?????????   2?????????',
  `icon` varchar(50) DEFAULT NULL COMMENT '????????????',
  `order_num` int DEFAULT NULL COMMENT '??????',
  `status` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`status`) values (1,0,'????????????',NULL,NULL,0,'system',0,1),(2,1,'???????????????','sys/user',NULL,1,'admin',1,1),(3,1,'????????????','sys/role',NULL,1,'role',2,1),(4,1,'????????????','sys/menu',NULL,1,'menu',3,1),(5,1,'SQL??????','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4,1),(6,1,'????????????','job/schedule',NULL,1,'job',5,1),(7,6,'??????',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0,1),(8,6,'??????',NULL,'sys:schedule:save',2,NULL,0,1),(9,6,'??????',NULL,'sys:schedule:update',2,NULL,0,1),(10,6,'??????',NULL,'sys:schedule:delete',2,NULL,0,1),(11,6,'??????',NULL,'sys:schedule:pause',2,NULL,0,1),(12,6,'??????',NULL,'sys:schedule:resume',2,NULL,0,1),(13,6,'????????????',NULL,'sys:schedule:run',2,NULL,0,1),(14,6,'????????????',NULL,'sys:schedule:log',2,NULL,0,1),(15,2,'??????',NULL,'sys:user:list,sys:user:info',2,NULL,0,1),(16,2,'??????',NULL,'sys:user:save,sys:role:select',2,NULL,0,1),(17,2,'??????',NULL,'sys:user:update,sys:role:select',2,NULL,0,1),(18,2,'??????',NULL,'sys:user:delete',2,NULL,0,1),(19,3,'??????',NULL,'sys:role:list,sys:role:info',2,NULL,0,1),(20,3,'??????',NULL,'sys:role:save,sys:menu:list',2,NULL,0,1),(21,3,'??????',NULL,'sys:role:update,sys:menu:list',2,NULL,0,1),(22,3,'??????',NULL,'sys:role:delete',2,NULL,0,1),(23,4,'??????',NULL,'sys:menu:list,sys:menu:info',2,NULL,0,1),(24,4,'??????',NULL,'sys:menu:save,sys:menu:select',2,NULL,0,1),(25,4,'??????',NULL,'sys:menu:update,sys:menu:select',2,NULL,0,1),(26,4,'??????',NULL,'sys:menu:delete',2,NULL,0,1),(27,1,'????????????','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6,1),(29,1,'????????????','sys/log','sys:log:list',1,'log',7,1),(30,1,'????????????','oss/oss','sys:oss:all',1,'oss',6,1);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL??????',
  `create_date` datetime DEFAULT NULL COMMENT '????????????',
  `file_type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '????????????',
  `remark` varchar(100) DEFAULT NULL COMMENT '??????',
  `create_user_id` bigint DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??????';

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '??????ID',
  `menu_id` bigint DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='???????????????????????????';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '?????????',
  `password` varchar(100) DEFAULT NULL COMMENT '??????',
  `salt` varchar(20) DEFAULT NULL COMMENT '???',
  `email` varchar(100) DEFAULT NULL COMMENT '??????',
  `mobile` varchar(100) DEFAULT NULL COMMENT '?????????',
  `status` tinyint DEFAULT NULL COMMENT '??????  0?????????   1?????????',
  `create_user_id` bigint DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `sort` int DEFAULT NULL COMMENT '??????',
  `tg_name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`,`sort`,`tg_name`,`nickname`) values (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11',NULL,NULL,NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '??????ID',
  `role_id` bigint DEFAULT NULL COMMENT '??????ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='???????????????????????????';

/*Data for the table `sys_user_role` */

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????????Token';

/*Data for the table `sys_user_token` */

/*Table structure for table `t_web_carousel` */

DROP TABLE IF EXISTS `t_web_carousel`;

CREATE TABLE `t_web_carousel` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(255) DEFAULT NULL COMMENT '??????',
  `type` int DEFAULT NULL COMMENT '1:?????? 2:??????',
  `status` int DEFAULT NULL COMMENT '0:?????? 1:??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_carousel` */

/*Table structure for table `t_web_commission_record` */

DROP TABLE IF EXISTS `t_web_commission_record`;

CREATE TABLE `t_web_commission_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `commission_user` varchar(255) DEFAULT NULL COMMENT '????????????',
  `commission` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `ref_bill_no` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `aget_node` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_level` int DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_commission_record` */

/*Table structure for table `t_web_country` */

DROP TABLE IF EXISTS `t_web_country`;

CREATE TABLE `t_web_country` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `img` varchar(255) DEFAULT NULL COMMENT '??????',
  `status` int DEFAULT NULL COMMENT '??????',
  `pxh` int DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_country` */

/*Table structure for table `t_web_day_report` */

DROP TABLE IF EXISTS `t_web_day_report`;

CREATE TABLE `t_web_day_report` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `to_day` date DEFAULT NULL COMMENT '??????',
  `top_up` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `withdraw` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `bet` decimal(10,4) DEFAULT NULL COMMENT '?????????',
  `in_come` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `commission` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `virtual_income` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `agent` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '???????????????',
  `agent_level` int DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_day_report` */

/*Table structure for table `t_web_dict` */

DROP TABLE IF EXISTS `t_web_dict`;

CREATE TABLE `t_web_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '???',
  `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '??????',
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '???',
  `type` int DEFAULT NULL COMMENT '1:????????????',
  `status` int DEFAULT NULL COMMENT '0:?????? 1:??????',
  `pxh` int DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_dict` */

/*Table structure for table `t_web_fund_record` */

DROP TABLE IF EXISTS `t_web_fund_record`;

CREATE TABLE `t_web_fund_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '???????????????',
  `serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '?????????',
  `ref_bill_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '???????????????',
  `amount` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `before_amount` decimal(10,4) DEFAULT NULL COMMENT '???????????????',
  `after_amount` decimal(10,0) DEFAULT NULL COMMENT '???????????????',
  `type` int DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `agent` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_node` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '???????????????',
  `agent_level` int DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SERIAL_NO` (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_fund_record` */

/*Table structure for table `t_web_level` */

DROP TABLE IF EXISTS `t_web_level`;

CREATE TABLE `t_web_level` (
  `id` int NOT NULL COMMENT 'id',
  `level_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `level_value` int DEFAULT NULL COMMENT '?????????',
  `min_balance` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `max_balance` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `product_price` double DEFAULT NULL COMMENT '????????????',
  `day_count` int DEFAULT NULL COMMENT '???????????????',
  `income` decimal(10,0) DEFAULT NULL COMMENT '???????????????',
  `agent1` double DEFAULT NULL COMMENT '??????1????????????????????????',
  `agent2` double DEFAULT NULL COMMENT '??????2????????????????????????',
  `agent3` double DEFAULT NULL COMMENT '??????3????????????????????????',
  `weekly_salary` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `level_type` int DEFAULT NULL COMMENT '?????? (1:???????????? 2:VIP??????)',
  `status` int DEFAULT NULL COMMENT '?????? (0:?????? 1:??????)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_level` */

/*Table structure for table `t_web_lucky_spin` */

DROP TABLE IF EXISTS `t_web_lucky_spin`;

CREATE TABLE `t_web_lucky_spin` (
  `id` int NOT NULL COMMENT 'id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `prize` varchar(255) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_lucky_spin` */

/*Table structure for table `t_web_lucky_spin_config` */

DROP TABLE IF EXISTS `t_web_lucky_spin_config`;

CREATE TABLE `t_web_lucky_spin_config` (
  `id` int NOT NULL COMMENT 'id',
  `prize` varchar(255) DEFAULT NULL COMMENT '??????',
  `probability` int DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_lucky_spin_config` */

/*Table structure for table `t_web_notice` */

DROP TABLE IF EXISTS `t_web_notice`;

CREATE TABLE `t_web_notice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '??????',
  `content` varchar(1024) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_notice` */

/*Table structure for table `t_web_order` */

DROP TABLE IF EXISTS `t_web_order`;

CREATE TABLE `t_web_order` (
  `id` int NOT NULL COMMENT 'id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `order_no` varchar(255) DEFAULT NULL COMMENT '?????????',
  `amount` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `income` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `virtual_income` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `product_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `product_url` varchar(255) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `modify_time` datetime DEFAULT NULL COMMENT '??????????????????',
  `agent` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_node` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `agent_level` int DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_ORDER_NO` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_order` */

/*Table structure for table `t_web_params` */

DROP TABLE IF EXISTS `t_web_params`;

CREATE TABLE `t_web_params` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `params_key` varchar(255) DEFAULT NULL COMMENT 'key',
  `params_value` text COMMENT 'value',
  `remake` varchar(255) DEFAULT NULL COMMENT '??????',
  `type` int DEFAULT NULL COMMENT '1:???????????? 2:html??????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_params` */

insert  into `t_web_params`(`id`,`params_key`,`params_value`,`remake`,`type`) values (1,'country_code','86','??????',1),(2,'register_ip','5','IP????????????',1),(3,'register_amount','88','??????????????????',1),(4,'usr_login_pwd_err_count','5','????????????????????????',1),(5,'invite_url','http://www.baidu.com','??????URL??????',1),(6,'agent_telegram','{\"default\":\"http://www.baidu.com\", \"nihaoma\":\"http://www.baidu.com\"}','??????????????????',1),(7,'question',NULL,'??????????????????',1),(8,'withdrawal_blacklist','nihaoma,zhaotiezhu','????????????????????????',1),(9,'withdraw_min_amount','100','??????????????????',1),(10,'withdraw_count','5','??????????????????',1),(11,'withdraw_fee','5','???????????????',1),(12,'usdt_exchange_rate','7.3','USDT??????',1),(13,'pay_callback_ip','127.0.0.1,192.168.0.239','?????????????????????',1),(14,'enable_week_reward','0','???????????????????????? 1:??? 0:???',1),(15,'minAmount','100','????????????????????????',1),(16,'topup_give_away','{\"min\": 100, \"max\": 500, \"percentage\": 5}','????????????????????????',1);

/*Table structure for table `t_web_pay_channel` */

DROP TABLE IF EXISTS `t_web_pay_channel`;

CREATE TABLE `t_web_pay_channel` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `channel_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `channel_type` int DEFAULT NULL COMMENT '1:?????? 2:??????',
  `pay_type` int DEFAULT NULL COMMENT '1:?????? 2:????????????',
  `merchant_code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `min_amount` decimal(10,0) DEFAULT NULL COMMENT '????????????',
  `max_amount` decimal(10,0) DEFAULT NULL COMMENT '????????????',
  `status` int DEFAULT NULL COMMENT '0:?????? 1:??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `modify_time` datetime DEFAULT NULL COMMENT '??????????????????',
  `pxh` int DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_pay_channel` */

/*Table structure for table `t_web_pay_merchant` */

DROP TABLE IF EXISTS `t_web_pay_merchant`;

CREATE TABLE `t_web_pay_merchant` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `merchant_code` varchar(255) DEFAULT NULL COMMENT '?????????',
  `merchant_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `merchant_key` varchar(255) DEFAULT NULL COMMENT '????????????',
  `top_url` varchar(255) DEFAULT NULL COMMENT '????????????',
  `withdraw_url` varchar(255) DEFAULT NULL COMMENT '????????????',
  `topup_notify_url` varchar(255) DEFAULT NULL COMMENT '????????????',
  `withdraw_notify_url` varchar(255) DEFAULT NULL COMMENT '????????????',
  `status` int DEFAULT NULL COMMENT '0:?????? 1:??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `modify_time` datetime DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_MERCHANT_CODE` (`merchant_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_pay_merchant` */

/*Table structure for table `t_web_product` */

DROP TABLE IF EXISTS `t_web_product`;

CREATE TABLE `t_web_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `product_img` varchar(255) DEFAULT NULL COMMENT '????????????',
  `level_value` int DEFAULT NULL COMMENT '?????????',
  `pxh` int DEFAULT NULL COMMENT '?????????(??????????????????)',
  `status` int DEFAULT NULL COMMENT '??????(0:?????? 1:??????)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_product` */

/*Table structure for table `t_web_question` */

DROP TABLE IF EXISTS `t_web_question`;

CREATE TABLE `t_web_question` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `question_id` int DEFAULT NULL COMMENT '??????ID',
  `answer` varchar(255) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_question` */

/*Table structure for table `t_web_test` */

DROP TABLE IF EXISTS `t_web_test`;

CREATE TABLE `t_web_test` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_test` */

/*Table structure for table `t_web_topup` */

DROP TABLE IF EXISTS `t_web_topup`;

CREATE TABLE `t_web_topup` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '?????????',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `amount` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `real_amount` decimal(10,4) DEFAULT NULL COMMENT '??????????????????',
  `type` int DEFAULT NULL COMMENT '??????',
  `pay_sign` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `pay_order_no` varchar(255) DEFAULT NULL COMMENT '??????????????????',
  `pay_curreny` int DEFAULT NULL COMMENT '1:inr 2:usdt',
  `ip` varchar(255) DEFAULT NULL COMMENT '??????IP',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `modify_time` datetime DEFAULT NULL COMMENT '??????????????????',
  `status` int DEFAULT NULL COMMENT '0:????????? 1:????????? 2:?????????',
  `merchant_code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `channel_code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_node` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `agent_level` int DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_ORDER_NO` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_topup` */

/*Table structure for table `t_web_user` */

DROP TABLE IF EXISTS `t_web_user`;

CREATE TABLE `t_web_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `area_code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `phone` varchar(255) DEFAULT NULL COMMENT '?????????',
  `email` varchar(255) DEFAULT NULL COMMENT '??????',
  `balance` decimal(10,4) DEFAULT NULL COMMENT '??????',
  `virtual_balance` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `unlock_virtual_balance` decimal(10,4) DEFAULT NULL COMMENT '????????????????????????',
  `login_pwd` varchar(255) DEFAULT NULL COMMENT '????????????',
  `invite_code` varchar(255) DEFAULT NULL COMMENT '?????????',
  `status` int DEFAULT NULL COMMENT '?????? 0:?????? 1:??????',
  `agent` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_node` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `agent_level` int DEFAULT NULL COMMENT '??????????????????',
  `reg_time` datetime DEFAULT NULL COMMENT '????????????',
  `reg_ip` varchar(255) DEFAULT NULL COMMENT '??????IP',
  `login_time` datetime DEFAULT NULL COMMENT '????????????',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '??????IP',
  `remake` varchar(255) DEFAULT NULL COMMENT '??????',
  `invite_qrcode` varchar(255) DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_PHONE` (`phone`),
  UNIQUE KEY `UNI_USER_NAME` (`user_name`),
  UNIQUE KEY `UNI_INVITE_CODE` (`invite_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_user` */

/*Table structure for table `t_web_user_log` */

DROP TABLE IF EXISTS `t_web_user_log`;

CREATE TABLE `t_web_user_log` (
  `id` int NOT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `login_ip_detail` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_user_log` */

/*Table structure for table `t_web_version` */

DROP TABLE IF EXISTS `t_web_version`;

CREATE TABLE `t_web_version` (
  `id` int NOT NULL COMMENT 'id',
  `app_version` varchar(255) DEFAULT NULL COMMENT '?????????',
  `app_url` varchar(255) DEFAULT NULL COMMENT '????????????',
  `app_index` int DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_version` */

/*Table structure for table `t_web_virtual_record` */

DROP TABLE IF EXISTS `t_web_virtual_record`;

CREATE TABLE `t_web_virtual_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `serial_no` varchar(255) DEFAULT NULL COMMENT '?????????',
  `ref_bill_no` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `amount` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `before_amount` decimal(10,4) DEFAULT NULL COMMENT '???????????????',
  `after_amount` decimal(10,4) DEFAULT NULL COMMENT '???????????????',
  `type` int DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `agent` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_node` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `agent_level` int DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_SERIAL_NO` (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_virtual_record` */

/*Table structure for table `t_web_weeksalary_record` */

DROP TABLE IF EXISTS `t_web_weeksalary_record`;

CREATE TABLE `t_web_weeksalary_record` (
  `id` int NOT NULL COMMENT 'id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `today` varchar(255) DEFAULT NULL COMMENT '????????????',
  `amount` decimal(10,4) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_USER_NAME` (`user_name`,`today`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_weeksalary_record` */

/*Table structure for table `t_web_withdraw` */

DROP TABLE IF EXISTS `t_web_withdraw`;

CREATE TABLE `t_web_withdraw` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_no` varchar(255) DEFAULT NULL COMMENT '?????????',
  `user_name` varchar(255) DEFAULT NULL COMMENT '?????????',
  `merchant_code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `channel_code` varchar(255) DEFAULT NULL COMMENT '????????????',
  `amount` decimal(10,4) DEFAULT NULL COMMENT '????????????(??????)',
  `real_amount` decimal(10,4) DEFAULT NULL COMMENT '??????????????????(??????)',
  `virtual_amount` decimal(10,4) DEFAULT NULL COMMENT '????????????(?????????)',
  `virtual_real_amount` decimal(10,4) DEFAULT NULL COMMENT '??????????????????(????????? )',
  `fee` decimal(10,4) DEFAULT NULL COMMENT '?????????',
  `pay_order_no` varchar(255) DEFAULT NULL COMMENT '??????????????????',
  `pay_sign` varchar(255) DEFAULT NULL COMMENT '???????????????',
  `type` int DEFAULT NULL COMMENT '1:?????? 2:?????????',
  `err_msg` varchar(255) DEFAULT NULL COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `modify_time` datetime DEFAULT NULL COMMENT '??????????????????',
  `status` int DEFAULT NULL COMMENT '0:????????? 1:?????? -1:??????',
  `agent` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_node` varchar(255) DEFAULT NULL COMMENT '????????????',
  `agent_level` int DEFAULT NULL COMMENT '??????????????????',
  `real_name` varchar(255) DEFAULT NULL COMMENT '????????????',
  `account` varchar(255) DEFAULT NULL COMMENT '??????',
  `mobile` varchar(255) DEFAULT NULL COMMENT '?????????',
  `ifc_code` varchar(255) DEFAULT NULL COMMENT 'ifc???',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_ORDER_NO` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `t_web_withdraw` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '?????????',
  `mobile` varchar(20) NOT NULL COMMENT '?????????',
  `password` varchar(64) DEFAULT NULL COMMENT '??????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='??????';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`) values (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
