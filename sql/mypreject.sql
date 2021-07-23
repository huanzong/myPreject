/*
Navicat MySQL Data Transfer

Source Server         : 39.96.24.165
Source Server Version : 80017
Source Host           : 39.96.24.165:3306
Source Database       : mypreject

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2021-07-23 09:37:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('SAScheduler', 'JOB_3', 'MY_TRIGGER_GROUP', '0 0/5 * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('SAScheduler', 'JOB_4', 'MY_TRIGGER_GROUP', '0 0/5 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('SAScheduler', 'JOB_3', 'MY_JOB_GROUP_NAME', null, 'com.spring.job.utils.SysJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400074A4F425F4B45597372001E636F6D2E737072696E672E6A6F622E706F6A6F2E5379734A6F62496E666F00000000000000010200094C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000269647400134C6A6176612F6C616E672F496E74656765723B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E000B4C000A75706461746554696D6571007E000A7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000162DB77E6F87874000D3020302F35202A202A202A203F737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000374000568656C6C6F74000B68656C6C6F20776F726C6474000CE69C89E58F82E696B9E6B3957371007E0011000000007371007E000E770800000162DC983790787800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('SAScheduler', 'JOB_4', 'MY_JOB_GROUP_NAME', null, 'com.spring.job.utils.SysJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400074A4F425F4B45597372001E636F6D2E737072696E672E6A6F622E706F6A6F2E5379734A6F62496E666F00000000000000010200094C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000269647400134C6A6176612F6C616E672F496E74656765723B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E000B4C000A75706461746554696D6571007E000A7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000162DBA9F7607874000D3020302F35202A202A202A203F737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000474000668656C6C6F3274000074000CE697A0E58F82E696B9E6B3957371007E0011000000007371007E000E770800000162DBA9F760787800);

-- ----------------------------
-- Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('SAScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
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
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('SAScheduler', 'JOB_3', 'MY_TRIGGER_GROUP', 'JOB_3', 'MY_JOB_GROUP_NAME', null, '1626923100000', '-1', '5', 'PAUSED', 'CRON', '1626922940000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400074A4F425F4B45597372001E636F6D2E737072696E672E6A6F622E706F6A6F2E5379734A6F62496E666F00000000000000010200094C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000269647400134C6A6176612F6C616E672F496E74656765723B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E000B4C000A75706461746554696D6571007E000A7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000162DB77E6F87874000D3020302F35202A202A202A203F737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000374000568656C6C6F74000B68656C6C6F20776F726C6474000CE69C89E58F82E696B9E6B3957371007E0011000000007371007E000E770800000162DC983790787800);
INSERT INTO `QRTZ_TRIGGERS` VALUES ('SAScheduler', 'JOB_4', 'MY_TRIGGER_GROUP', 'JOB_4', 'MY_JOB_GROUP_NAME', null, '1626923100000', '-1', '5', 'PAUSED', 'CRON', '1626922940000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400074A4F425F4B45597372001E636F6D2E737072696E672E6A6F622E706F6A6F2E5379734A6F62496E666F00000000000000010200094C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C000269647400134C6A6176612F6C616E672F496E74656765723B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E000B4C000A75706461746554696D6571007E000A7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000162DBA9F7607874000D3020302F35202A202A202A203F737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000474000668656C6C6F3274000074000CE697A0E58F82E696B9E6B3957371007E0011000000007371007E000E770800000162DBA9F760787800);

-- ----------------------------
-- Table structure for `schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(200) DEFAULT NULL COMMENT '方法名',
  `params` varchar(1000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态,1表示正常; 0表示暂停',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('3', 'testTask', 'hello', 'hello world', '0 0/5 * * * ?', '0', '有参方法', '2018-04-19 09:14:51', '2018-04-19 14:29:46');
INSERT INTO `schedule_job` VALUES ('4', 'testTask', 'hello2', '', '0 0/5 * * * ?', '0', '无参方法', '2018-04-19 10:09:32', '2018-04-19 10:09:32');

-- ----------------------------
-- Table structure for `schedule_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` int(11) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(200) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NOT NULL COMMENT '任务状态，0:成功,1:失败',
  `msg` text COMMENT '运行信息',
  `runtime` bigint(20) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `dept_desc` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `order_no` int(11) DEFAULT NULL COMMENT '排序值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '集团总部', '负责整个集团业务', '0', '1', '2018-03-23 09:30:51', '2018-03-23 09:30:53');
INSERT INTO `sys_dept` VALUES ('2', '销售部', '负责销售', '1', '3', '2018-03-22 14:56:24', '2018-03-22 14:56:30');
INSERT INTO `sys_dept` VALUES ('3', '技术部', '负责技术', '1', '2', '2018-03-22 14:56:33', '2018-03-22 14:56:35');
INSERT INTO `sys_dept` VALUES ('4', '技术一部', '负责系统一开发', '3', '4', '2018-03-22 14:56:24', '2018-03-22 14:56:24');
INSERT INTO `sys_dept` VALUES ('5', '销售一部', '负责一区销售', '2', '6', '2018-03-22 14:56:24', '2018-03-22 14:56:24');
INSERT INTO `sys_dept` VALUES ('6', '技术二部', '负责系统二开发', '3', '5', '2018-03-22 16:45:58', '2018-03-22 16:46:00');

-- ----------------------------
-- Table structure for `sys_exp`
-- ----------------------------
DROP TABLE IF EXISTS `sys_exp`;
CREATE TABLE `sys_exp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `expection` text COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统异常';

-- ----------------------------
-- Records of sys_exp
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_head`
-- ----------------------------
DROP TABLE IF EXISTS `sys_head`;
CREATE TABLE `sys_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `src_img_name` varchar(500) DEFAULT NULL COMMENT '头像原图片地址',
  `head_img_name` varchar(500) DEFAULT NULL COMMENT '头像图片地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统头像表';

-- ----------------------------
-- Records of sys_head
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `ip` varchar(50) DEFAULT NULL COMMENT '请求地址',
  `url` varchar(500) DEFAULT NULL COMMENT '请求url',
  `method` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `param` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `runtime` bigint(20) DEFAULT NULL COMMENT '执行时长,单位毫秒',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '登录系统', '0:0:0:0:0:0:0:1', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626671845067\",\"captcha\":\"c554\",\"username\":\"admin\"}', '7', '2021-07-19 13:17:25');
INSERT INTO `sys_log` VALUES ('2', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626671861835\"}', '43', '2021-07-19 13:17:42');
INSERT INTO `sys_log` VALUES ('3', 'admin', '查询角色', '0:0:0:0:0:0:0:1', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626671865531\"}', '12', '2021-07-19 13:17:46');
INSERT INTO `sys_log` VALUES ('4', 'admin', '查询资源', '0:0:0:0:0:0:0:1', '/sys/res/list', 'GET', '{\"resName\":\"\"}', '32', '2021-07-19 13:17:49');
INSERT INTO `sys_log` VALUES ('5', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626671908460\"}', '16', '2021-07-19 13:18:29');
INSERT INTO `sys_log` VALUES ('6', 'admin', '查询角色', '0:0:0:0:0:0:0:1', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626671909387\"}', '16', '2021-07-19 13:18:30');
INSERT INTO `sys_log` VALUES ('7', 'admin', '查询资源', '0:0:0:0:0:0:0:1', '/sys/res/list', 'GET', '{\"resName\":\"\"}', '32', '2021-07-19 13:18:34');
INSERT INTO `sys_log` VALUES ('8', 'admin', '查询部门', '0:0:0:0:0:0:0:1', '/sys/dept/list', 'GET', '{\"deptName\":\"\"}', '12', '2021-07-19 13:18:42');
INSERT INTO `sys_log` VALUES ('9', 'admin', '查询参数', '0:0:0:0:0:0:0:1', '/sys/param/list', 'GET', '{\"paramKey\":\"\",\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626671929718\"}', '12', '2021-07-19 13:18:50');
INSERT INTO `sys_log` VALUES ('10', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626672375897\"}', '7', '2021-07-19 13:26:16');
INSERT INTO `sys_log` VALUES ('11', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"p\",\"status\":\"\",\"_\":\"1626672375898\"}', '8', '2021-07-19 13:26:28');
INSERT INTO `sys_log` VALUES ('12', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626672375899\"}', '6', '2021-07-19 13:26:31');
INSERT INTO `sys_log` VALUES ('13', 'admin', '查询角色', '0:0:0:0:0:0:0:1', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626674733386\"}', '16', '2021-07-19 14:05:34');
INSERT INTO `sys_log` VALUES ('14', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"sortName\":\"id\",\"sortOrder\":\"asc\",\"username\":\"\",\"status\":\"\",\"_\":\"1626672375900\"}', '5', '2021-07-19 14:05:58');
INSERT INTO `sys_log` VALUES ('15', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626672375901\"}', '16', '2021-07-19 14:05:58');
INSERT INTO `sys_log` VALUES ('16', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"sortName\":\"id\",\"sortOrder\":\"asc\",\"username\":\"\",\"status\":\"\",\"_\":\"1626672375902\"}', '6', '2021-07-19 14:06:10');
INSERT INTO `sys_log` VALUES ('17', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626672375903\"}', '17', '2021-07-19 14:06:10');
INSERT INTO `sys_log` VALUES ('18', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626672375904\"}', '7', '2021-07-19 14:06:32');
INSERT INTO `sys_log` VALUES ('19', 'admin', '查询资源', '0:0:0:0:0:0:0:1', '/sys/res/list', 'GET', '{\"resName\":\"\"}', '32', '2021-07-19 14:06:35');
INSERT INTO `sys_log` VALUES ('20', 'admin', '查询部门', '0:0:0:0:0:0:0:1', '/sys/dept/list', 'GET', '{\"deptName\":\"\"}', '5', '2021-07-19 14:06:35');
INSERT INTO `sys_log` VALUES ('21', 'admin', '查询参数', '0:0:0:0:0:0:0:1', '/sys/param/list', 'GET', '{\"paramKey\":\"\",\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626674796092\"}', '5', '2021-07-19 14:06:36');
INSERT INTO `sys_log` VALUES ('22', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626675068936\"}', '5', '2021-07-19 14:11:09');
INSERT INTO `sys_log` VALUES ('23', 'admin', '查询角色', '0:0:0:0:0:0:0:1', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626675071460\"}', '6', '2021-07-19 14:11:12');
INSERT INTO `sys_log` VALUES ('24', 'admin', '查询资源', '0:0:0:0:0:0:0:1', '/sys/res/list', 'GET', '{\"resName\":\"\"}', '25', '2021-07-19 14:11:13');
INSERT INTO `sys_log` VALUES ('25', 'admin', '查询部门', '0:0:0:0:0:0:0:1', '/sys/dept/list', 'GET', '{\"deptName\":\"\"}', '23', '2021-07-19 14:11:13');
INSERT INTO `sys_log` VALUES ('26', 'admin', '查询参数', '0:0:0:0:0:0:0:1', '/sys/param/list', 'GET', '{\"paramKey\":\"\",\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626675074759\"}', '5', '2021-07-19 14:11:15');
INSERT INTO `sys_log` VALUES ('27', 'admin', '修改参数', '0:0:0:0:0:0:0:1', '/sys/param/update', 'POST', '{}', '76', '2021-07-19 14:11:30');
INSERT INTO `sys_log` VALUES ('28', 'admin', '查询参数', '0:0:0:0:0:0:0:1', '/sys/param/list', 'GET', '{\"paramKey\":\"\",\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626675089880\"}', '6', '2021-07-19 14:11:30');
INSERT INTO `sys_log` VALUES ('29', 'admin', '立即执行Job', '0:0:0:0:0:0:0:1', '/sys/job/run', 'POST', '{}', '39', '2021-07-19 14:11:48');
INSERT INTO `sys_log` VALUES ('30', 'admin', '立即执行Job', '0:0:0:0:0:0:0:1', '/sys/job/run', 'POST', '{}', '26', '2021-07-19 14:12:07');
INSERT INTO `sys_log` VALUES ('31', 'admin', '登录系统', '0:0:0:0:0:0:0:1', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626760264946\",\"captcha\":\"3585\",\"username\":\"admin\"}', '63', '2021-07-20 13:51:05');
INSERT INTO `sys_log` VALUES ('32', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626760267574\"}', '27', '2021-07-20 13:51:08');
INSERT INTO `sys_log` VALUES ('33', 'admin', '查询角色', '0:0:0:0:0:0:0:1', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626760297276\"}', '20', '2021-07-20 13:51:37');
INSERT INTO `sys_log` VALUES ('34', 'admin', '查询资源', '0:0:0:0:0:0:0:1', '/sys/res/list', 'GET', '{\"resName\":\"\"}', '32', '2021-07-20 13:51:39');
INSERT INTO `sys_log` VALUES ('35', 'admin', '查询部门', '0:0:0:0:0:0:0:1', '/sys/dept/list', 'GET', '{\"deptName\":\"\"}', '14', '2021-07-20 13:51:42');
INSERT INTO `sys_log` VALUES ('36', 'admin', '查询参数', '0:0:0:0:0:0:0:1', '/sys/param/list', 'GET', '{\"paramKey\":\"\",\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626760304607\"}', '28', '2021-07-20 13:51:45');
INSERT INTO `sys_log` VALUES ('37', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626760392049\"}', '17', '2021-07-20 13:53:12');
INSERT INTO `sys_log` VALUES ('38', 'admin', '查询角色', '0:0:0:0:0:0:0:1', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626760434020\"}', '5', '2021-07-20 13:53:54');
INSERT INTO `sys_log` VALUES ('39', 'admin', '登录系统', '0:0:0:0:0:0:0:1', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626771400373\",\"captcha\":\"awp8\",\"username\":\"admin\"}', '14', '2021-07-20 16:56:40');
INSERT INTO `sys_log` VALUES ('40', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626771405949\"}', '10', '2021-07-20 16:56:46');
INSERT INTO `sys_log` VALUES ('41', 'admin', '查询角色', '0:0:0:0:0:0:0:1', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626771407158\"}', '13', '2021-07-20 16:56:47');
INSERT INTO `sys_log` VALUES ('42', 'admin', '查询资源', '0:0:0:0:0:0:0:1', '/sys/res/list', 'GET', '{\"resName\":\"\"}', '33', '2021-07-20 16:56:48');
INSERT INTO `sys_log` VALUES ('43', 'admin', '查询部门', '0:0:0:0:0:0:0:1', '/sys/dept/list', 'GET', '{\"deptName\":\"\"}', '6', '2021-07-20 16:56:49');
INSERT INTO `sys_log` VALUES ('44', 'admin', '查询参数', '0:0:0:0:0:0:0:1', '/sys/param/list', 'GET', '{\"paramKey\":\"\",\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626771411220\"}', '8', '2021-07-20 16:56:51');
INSERT INTO `sys_log` VALUES ('45', 'admin', '查询用户', '0:0:0:0:0:0:0:1', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626772455882\"}', '7', '2021-07-20 17:14:16');
INSERT INTO `sys_log` VALUES ('46', 'admin', '登录系统', '27.223.103.170', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626922960711\",\"captcha\":\"7n4y\",\"username\":\"admin\"}', '75', '2021-07-22 11:02:41');
INSERT INTO `sys_log` VALUES ('47', 'admin', '登录系统', '27.223.103.170', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626923585814\",\"captcha\":\"gynn\",\"username\":\"admin\"}', '21', '2021-07-22 11:13:06');
INSERT INTO `sys_log` VALUES ('48', 'admin', '登录系统', '27.223.103.170', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626924119645\",\"captcha\":\"wym6\",\"username\":\"admin\"}', '72', '2021-07-22 11:22:00');
INSERT INTO `sys_log` VALUES ('49', 'admin', '查询用户', '27.223.103.170', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626924123436\"}', '408', '2021-07-22 11:22:04');
INSERT INTO `sys_log` VALUES ('50', 'admin', '登录系统', '27.223.103.170', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626936347295\",\"captcha\":\"en3y\",\"username\":\"admin\"}', '9', '2021-07-22 14:45:47');
INSERT INTO `sys_log` VALUES ('51', 'admin', '查询用户', '27.223.103.170', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626936350475\"}', '191', '2021-07-22 14:45:51');
INSERT INTO `sys_log` VALUES ('52', 'admin', '登录系统', '27.223.103.170', '/login', 'POST', '{\"password\":\"***\",\"t\":\"1626936669904\",\"captcha\":\"p6ny\",\"username\":\"admin\"}', '79', '2021-07-22 14:51:10');
INSERT INTO `sys_log` VALUES ('53', 'admin', '查询用户', '27.223.103.170', '/sys/user/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"username\":\"\",\"status\":\"\",\"_\":\"1626936673134\"}', '216', '2021-07-22 14:51:13');
INSERT INTO `sys_log` VALUES ('54', 'admin', '查询角色', '27.223.103.170', '/sys/role/list', 'GET', '{\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626936673864\"}', '230', '2021-07-22 14:51:14');
INSERT INTO `sys_log` VALUES ('55', 'admin', '查询资源', '27.223.103.170', '/sys/res/list', 'GET', '{\"resName\":\"\"}', '15', '2021-07-22 14:51:15');
INSERT INTO `sys_log` VALUES ('56', 'admin', '查询部门', '27.223.103.170', '/sys/dept/list', 'GET', '{\"deptName\":\"\"}', '55', '2021-07-22 14:51:16');
INSERT INTO `sys_log` VALUES ('57', 'admin', '查询参数', '27.223.103.170', '/sys/param/list', 'GET', '{\"paramKey\":\"\",\"pageNumber\":\"1\",\"sortName\":\"id\",\"sortOrder\":\"asc\",\"pageSize\":\"10\",\"_\":\"1626936676568\"}', '174', '2021-07-22 14:51:17');

-- ----------------------------
-- Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `param_key` varchar(200) DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(2000) DEFAULT NULL COMMENT '参数键值',
  `param_desc` varchar(200) DEFAULT NULL COMMENT '参数描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统参数';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES ('1', 'user.reset.pwd', '123456', '系统用户重置密码', '2018-08-26 14:38:58', '2021-07-19 14:11:30');
INSERT INTO `sys_param` VALUES ('2', 'sys.default.skin', 'defaultSkin', '系统默认皮肤', '2018-08-26 17:04:09', '2018-08-26 17:59:42');

-- ----------------------------
-- Table structure for `sys_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `res_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `res_desc` varchar(200) DEFAULT NULL COMMENT '资源描述',
  `res_url` varchar(200) DEFAULT NULL COMMENT '资源URL',
  `res_type` tinyint(1) DEFAULT NULL COMMENT '资源类型, 0表示目录，1表示菜单；2表示按钮',
  `res_perms` varchar(200) DEFAULT NULL COMMENT '资源授权标识，如：user:add:list',
  `res_icon` varchar(50) DEFAULT NULL COMMENT '资源图标',
  `parent_id` int(11) DEFAULT NULL COMMENT '父资源ID，一级资源为0',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='系统资源';

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', '系统管理', '管理系统', '', '0', '', 'fa fa-desktop', '0', '1', '2018-03-28 10:53:46', '2018-03-28 18:50:48');
INSERT INTO `sys_res` VALUES ('2', '用户管理', '用户管理模块', 'sys/user', '1', '', 'fa fa-user', '1', '1', '2018-03-28 10:55:18', '2018-04-13 11:12:42');
INSERT INTO `sys_res` VALUES ('3', '查询', '查询按钮', '', '2', 'sys:user:list', '', '2', '3', '2018-03-28 11:04:36', '2018-04-09 16:41:23');
INSERT INTO `sys_res` VALUES ('4', '资源管理', '资源管理模块', 'sys/res', '1', '', 'fa fa-list', '1', '3', '2018-03-29 10:23:09', '2018-04-13 11:13:08');
INSERT INTO `sys_res` VALUES ('5', '角色管理', '角色管理模块', 'sys/role', '1', '', 'fa fa-sitemap', '1', '2', '2018-03-29 15:22:31', '2018-04-13 11:12:32');
INSERT INTO `sys_res` VALUES ('6', '新增', '新增按钮', '', '2', 'sys:user:add', '', '2', '5', '2018-03-29 17:24:08', '2018-03-29 17:25:41');
INSERT INTO `sys_res` VALUES ('7', '部门管理', '部门管理模块', 'sys/dept', '1', '', 'fa fa-user-circle', '1', '4', '2018-03-29 17:36:18', '2018-04-13 11:12:59');
INSERT INTO `sys_res` VALUES ('8', '系统监控', '监控系统', '', '0', '', 'fa fa-video-camera', '0', '10', '2018-04-09 10:06:04', '2018-04-09 10:59:25');
INSERT INTO `sys_res` VALUES ('9', '图表管理', '统计图表', '', '0', '', 'fa fa-bar-chart-o', '0', '12', '2018-04-09 11:21:09', '2018-04-12 10:19:20');
INSERT INTO `sys_res` VALUES ('10', '系统日志', '系统日志', 'sys/log', '1', '', 'fa fa-file-text-o', '8', '11', '2018-04-09 15:54:45', '2018-04-10 20:13:38');
INSERT INTO `sys_res` VALUES ('11', '编辑', '编辑按钮', '', '2', 'sys:user:edit', '', '2', '6', '2018-04-09 16:41:09', '2018-04-09 16:41:38');
INSERT INTO `sys_res` VALUES ('12', '删除', '删除按钮', '', '2', 'sys:user:delete', '', '2', '7', '2018-04-09 16:42:07', '2018-04-09 16:42:14');
INSERT INTO `sys_res` VALUES ('13', '查询', '查询按钮', null, '2', 'sys:res:list', null, '4', '1', '2018-03-28 10:53:46', '2018-03-28 10:53:46');
INSERT INTO `sys_res` VALUES ('14', '新增', '新增按钮', null, '2', 'sys:res:add', null, '4', '2', '2018-03-28 10:53:46', '2018-03-28 10:53:46');
INSERT INTO `sys_res` VALUES ('15', '编辑', '编辑按钮', null, '2', 'sys:res:edit', null, '4', '3', '2018-03-28 10:53:46', '2018-03-28 10:53:46');
INSERT INTO `sys_res` VALUES ('17', '删除', '删除按钮', '', '2', 'sys:res:delete', '', '4', '4', '2018-04-09 17:12:16', '2018-04-09 17:12:16');
INSERT INTO `sys_res` VALUES ('18', '查询', '查询按钮', '', '2', 'sys:role:list', '', '5', '1', '2018-03-28 11:04:36', '2018-04-09 16:41:23');
INSERT INTO `sys_res` VALUES ('19', '新增', '新增按钮', '', '2', 'sys:role:add', '', '5', '2', '2018-03-29 17:24:08', '2018-03-29 17:25:41');
INSERT INTO `sys_res` VALUES ('20', '编辑', '编辑按钮', '', '2', 'sys:role:edit', '', '5', '3', '2018-04-09 16:41:09', '2018-04-09 16:41:38');
INSERT INTO `sys_res` VALUES ('21', '删除', '删除按钮', '', '2', 'sys:role:delete', '', '5', '4', '2018-04-09 16:42:07', '2018-04-09 16:42:14');
INSERT INTO `sys_res` VALUES ('22', '查询', '查询按钮', '', '2', 'sys:dept:list', '', '7', '1', '2018-03-28 11:04:36', '2018-04-09 17:16:39');
INSERT INTO `sys_res` VALUES ('23', '新增', '新增按钮', '', '2', 'sys:dept:add', '', '7', '2', '2018-03-29 17:24:08', '2018-03-29 17:25:41');
INSERT INTO `sys_res` VALUES ('24', '编辑', '编辑按钮', '', '2', 'sys:dept:edit', '', '7', '3', '2018-04-09 16:41:09', '2018-04-09 16:41:38');
INSERT INTO `sys_res` VALUES ('25', '删除', '删除按钮', '', '2', 'sys:dept:delete', '', '7', '4', '2018-04-09 16:42:07', '2018-04-09 16:42:14');
INSERT INTO `sys_res` VALUES ('26', '分配权限', '分配权限按钮', null, '2', 'sys:role:perm', null, '4', '5', '2018-03-29 17:24:08', '2018-03-29 17:24:08');
INSERT INTO `sys_res` VALUES ('27', '查询', '查询按钮', '', '2', 'sys:log:list', '', '10', '1', '2018-04-10 20:15:05', '2018-04-10 20:15:05');
INSERT INTO `sys_res` VALUES ('28', 'Druid监控', 'SQL监控', 'druid/index.html', '1', '', 'fa fa-film', '8', '2', '2018-04-12 14:24:15', '2018-04-12 16:31:52');
INSERT INTO `sys_res` VALUES ('29', 'ECharts', '百度图表', 'chart/echarts.html', '1', '', 'fa fa-line-chart', '9', '1', '2018-04-12 15:02:24', '2018-04-23 10:45:52');
INSERT INTO `sys_res` VALUES ('30', '系统异常', '系统异常', 'sys/exp', '1', '', 'fa fa-exclamation-circle', '8', '8', '2018-04-12 15:33:47', '2018-04-12 15:40:48');
INSERT INTO `sys_res` VALUES ('31', '查询', '查询按钮', '', '2', 'sys:exp:list', '', '30', '1', '2018-04-12 15:34:36', '2018-04-12 15:34:36');
INSERT INTO `sys_res` VALUES ('32', '系统工具', '常用工具', '', '0', '', 'fa fa-th', '0', '12', '2018-04-12 20:28:39', '2018-08-11 19:07:00');
INSERT INTO `sys_res` VALUES ('33', '代码生成器', '生成代码', 'sys/gen', '1', '', 'fa fa-th-large', '32', '1', '2018-04-12 20:29:45', '2018-04-12 20:29:45');
INSERT INTO `sys_res` VALUES ('34', '查询', '查询按钮', '', '2', 'sys:gen:list', '', '33', '1', '2018-04-12 20:35:41', '2018-04-12 20:35:41');
INSERT INTO `sys_res` VALUES ('35', '生成代码', '生成代码按钮', '', '2', 'sys:gen:code', '', '33', '2', '2018-04-12 20:36:16', '2018-04-12 20:36:16');
INSERT INTO `sys_res` VALUES ('36', '任务管理', '任务管理', '', '0', '', 'fa fa-th-list', '0', '10', '2018-04-18 17:49:28', '2018-04-18 17:49:53');
INSERT INTO `sys_res` VALUES ('37', '定时JOB', '', 'sys/job', '1', '', 'fa fa-list-ul', '36', '1', '2018-04-18 17:54:27', '2018-04-18 17:55:01');
INSERT INTO `sys_res` VALUES ('38', '查询', '查询按钮', '', '2', 'sys:job:list', '', '37', '1', '2018-04-18 17:57:18', '2018-04-18 17:57:18');
INSERT INTO `sys_res` VALUES ('39', '新增', '新增按钮', '', '2', 'sys:job:add', '', '37', '2', '2018-04-18 17:57:18', '2018-04-18 17:57:18');
INSERT INTO `sys_res` VALUES ('40', '修改', '修改按钮', '', '2', 'sys:job:edit', '', '37', '3', '2018-04-18 17:57:18', '2018-04-18 17:57:18');
INSERT INTO `sys_res` VALUES ('41', '删除', '删除按钮', '', '2', 'sys:job:delete', '', '37', '4', '2018-04-18 17:57:18', '2018-04-18 17:57:18');
INSERT INTO `sys_res` VALUES ('42', '暂停', '暂停按钮', '', '2', 'sys:job:pause', '', '37', '5', '2018-04-18 17:57:18', '2018-04-18 17:57:18');
INSERT INTO `sys_res` VALUES ('43', '恢复', '暂停按钮', '', '2', 'sys:job:resume', '', '37', '6', '2018-04-18 17:57:18', '2018-04-18 17:57:18');
INSERT INTO `sys_res` VALUES ('44', '立即执行', '立即执行按钮', '', '2', 'sys:job:run', '', '37', '7', '2018-04-18 17:57:18', '2018-04-18 17:57:18');
INSERT INTO `sys_res` VALUES ('45', '查询', '查询按钮', '', '2', 'sys:joblog:list', '', '46', '8', '2018-04-18 17:57:18', '2018-04-19 15:38:20');
INSERT INTO `sys_res` VALUES ('46', '定时JOB日志', '', 'sys/joblog', '1', '', 'fa fa-calendar', '36', '1', '2018-04-19 15:23:46', '2018-04-19 15:38:31');
INSERT INTO `sys_res` VALUES ('47', 'Swagger2', 'API 文档', 'swagger/index.html', '1', '', 'fa fa-file-text-o', '32', '2', '2018-08-11 17:50:49', '2018-08-11 19:02:41');
INSERT INTO `sys_res` VALUES ('48', '参数管理', '参数设置', 'sys/param', '1', '', 'fa fa-list-ol', '1', '5', '2018-08-26 11:10:08', '2018-08-26 11:10:08');
INSERT INTO `sys_res` VALUES ('49', '查询', '查询按钮', '', '2', 'sys:param:list', '', '48', '1', '2018-08-26 11:46:46', '2018-08-26 11:46:46');
INSERT INTO `sys_res` VALUES ('50', '新增', '新增按钮', '', '2', 'sys:param:add', '', '48', '2', '2018-08-26 11:47:33', '2018-08-26 11:47:33');
INSERT INTO `sys_res` VALUES ('51', '编辑', '编辑按钮', '', '2', 'sys:param:edit', '', '48', '3', '2018-08-26 11:47:58', '2018-08-26 11:47:58');
INSERT INTO `sys_res` VALUES ('52', '删除', '删除按钮', '', '2', 'sys:param:delete', '', '48', '4', '2018-08-26 11:48:23', '2018-08-26 11:48:23');
INSERT INTO `sys_res` VALUES ('53', '重置密码', '重置密码按钮', '', '2', 'sys:user:resetPwd', '', '2', '8', '2018-09-16 15:26:56', '2018-09-16 15:26:56');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '管理员角色', '2018-03-19 15:28:38', '2018-03-30 15:32:50');
INSERT INTO `sys_role` VALUES ('2', '普通用户', '普通用户角色', '2018-03-19 15:28:38', '2018-03-30 15:32:59');

-- ----------------------------
-- Table structure for `sys_role_res`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `res_id` bigint(20) NOT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应';

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('1', '1', '1');
INSERT INTO `sys_role_res` VALUES ('2', '1', '2');
INSERT INTO `sys_role_res` VALUES ('3', '1', '3');
INSERT INTO `sys_role_res` VALUES ('4', '2', '1');
INSERT INTO `sys_role_res` VALUES ('5', '2', '2');
INSERT INTO `sys_role_res` VALUES ('6', '2', '3');
INSERT INTO `sys_role_res` VALUES ('7', '2', '6');
INSERT INTO `sys_role_res` VALUES ('8', '2', '11');
INSERT INTO `sys_role_res` VALUES ('9', '2', '12');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `username` varchar(50) NOT NULL COMMENT '账号',
  `realname` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '加盐',
  `phone` varchar(100) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态,1表示正常; 0表示禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '某某某', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', '18812345678', 'pan@bigcat.com', '1', '1', '2018-03-09 00:00:00', '2018-04-12 10:29:33');
INSERT INTO `sys_user` VALUES ('2', 'pan', '某某某', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', '18812345678', 'pan@bigcat.com', '4', '1', '2018-05-01 10:25:13', '2018-05-01 10:25:13');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动编号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('37', '2', '2');
