/*
 Navicat Premium Data Transfer

 Source Server         : hadoop102
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : hadoop102:3306
 Source Schema         : heaven

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 04/12/2022 01:09:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
                                       `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                       `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
                                       PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                       CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
                                   `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                   `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
                                   `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
                                   PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
                                       `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                       `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
                                       `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
                                       PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                       CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
                                        `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                        `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
                                        `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                        `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                        `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
                                        `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
                                        `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
                                        `priority` int(11) NOT NULL COMMENT '优先级',
                                        `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
                                        `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
                                        `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
                                        `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
                                        `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
                                        PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
                                     `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                     `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
                                     `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
                                     `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
                                     `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
                                     `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
                                     `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
                                     `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
                                     `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
                                     `job_data` blob NULL COMMENT '存放持久化job对象',
                                     PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E72756F79692E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018405A8E2A878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E72756F79692E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018405A8E2A878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E72756F79692E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000018405A8E2A878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
                               `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                               `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
                               PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
                                             `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                             `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                             PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
                                         `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                         `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
                                         `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
                                         `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
                                         PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'DESKTOP-BF1TUI31666796438701', 1666800202363, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
                                         `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                         `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                         `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                         `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
                                         `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
                                         `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
                                         PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                         CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
                                          `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                          `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                          `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                          `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
                                          `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
                                          `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
                                          `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
                                          `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
                                          `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
                                          `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
                                          `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
                                          `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
                                          `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
                                          `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
                                          PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                          CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
                                  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
                                  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
                                  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
                                  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
                                  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
                                  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
                                  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
                                  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
                                  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
                                  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
                                  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
                                  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
                                  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
                                  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
                                  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
                                  `job_data` blob NULL COMMENT '存放持久化job对象',
                                  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
                                  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
                                  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1666796440000, -1, 5, 'PAUSED', 'CRON', 1666796439000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1666796445000, -1, 5, 'PAUSED', 'CRON', 1666796439000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1666796440000, -1, 5, 'PAUSED', 'CRON', 1666796439000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for data_converge_business_datadomain
-- ----------------------------
DROP TABLE IF EXISTS `data_converge_business_datadomain`;
CREATE TABLE `data_converge_business_datadomain`  (
                                                      `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                      `section_id` bigint(20) NOT NULL COMMENT '业务板块id',
                                                      `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
                                                      `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                                                      `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                                      `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                      `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                                      `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                      `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                                      `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
                                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据模块-数据汇聚-数据域' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_converge_business_datadomain
-- ----------------------------
INSERT INTO `data_converge_business_datadomain` VALUES (1, 1, '采购域', 1, '', '2022-11-29 13:11:31', '', NULL, '采购域', '0');
INSERT INTO `data_converge_business_datadomain` VALUES (2, 2, '采购域21', 21, '', '2022-11-29 13:11:29', '', '2022-11-29 14:03:06', '采购域1', '1');

-- ----------------------------
-- Table structure for data_converge_business_section
-- ----------------------------
DROP TABLE IF EXISTS `data_converge_business_section`;
CREATE TABLE `data_converge_business_section`  (
                                                   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                   `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
                                                   `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                                                   `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                                   `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                   `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                                   `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                   `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                                   `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
                                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据模块-数据汇聚-业务板块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_converge_business_section
-- ----------------------------
INSERT INTO `data_converge_business_section` VALUES (1, '营销板块', 1, '', '2022-11-25 15:29:14', '', '2022-11-25 17:31:28', '这是营销板块', '0');
INSERT INTO `data_converge_business_section` VALUES (2, '举报板块', 2, '', '2022-11-25 15:29:28', '', '2022-11-25 17:40:47', '这是举报板块', '0');
INSERT INTO `data_converge_business_section` VALUES (3, '地产板块', 3, '', '2022-11-25 19:30:25', '', NULL, '这是地产板块', '0');
INSERT INTO `data_converge_business_section` VALUES (4, '金融板块', 4, '', '2022-11-25 19:30:43', '', '2022-11-25 19:31:10', '这是金融板块', '0');
INSERT INTO `data_converge_business_section` VALUES (5, '策略板块', 1, '', '2022-11-26 03:45:19', '', NULL, '111', NULL);

-- ----------------------------
-- Table structure for data_converge_business_source
-- ----------------------------
DROP TABLE IF EXISTS `data_converge_business_source`;
CREATE TABLE `data_converge_business_source`  (
                                                  `business_section_id` bigint(20) NOT NULL COMMENT '业务板块id',
                                                  `source_id` bigint(20) NOT NULL COMMENT '数据源id',
                                                  PRIMARY KEY (`business_section_id`, `source_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务板块与数据源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_converge_business_source
-- ----------------------------
INSERT INTO `data_converge_business_source` VALUES (1, 38);
INSERT INTO `data_converge_business_source` VALUES (1, 39);
INSERT INTO `data_converge_business_source` VALUES (1, 41);
INSERT INTO `data_converge_business_source` VALUES (1, 45);
INSERT INTO `data_converge_business_source` VALUES (1, 46);
INSERT INTO `data_converge_business_source` VALUES (1, 49);
INSERT INTO `data_converge_business_source` VALUES (1, 50);
INSERT INTO `data_converge_business_source` VALUES (2, 38);
INSERT INTO `data_converge_business_source` VALUES (2, 41);
INSERT INTO `data_converge_business_source` VALUES (2, 45);
INSERT INTO `data_converge_business_source` VALUES (2, 47);
INSERT INTO `data_converge_business_source` VALUES (2, 50);
INSERT INTO `data_converge_business_source` VALUES (3, 39);
INSERT INTO `data_converge_business_source` VALUES (3, 42);
INSERT INTO `data_converge_business_source` VALUES (3, 44);
INSERT INTO `data_converge_business_source` VALUES (3, 48);
INSERT INTO `data_converge_business_source` VALUES (3, 49);
INSERT INTO `data_converge_business_source` VALUES (4, 39);
INSERT INTO `data_converge_business_source` VALUES (4, 40);
INSERT INTO `data_converge_business_source` VALUES (4, 43);
INSERT INTO `data_converge_business_source` VALUES (5, 44);

-- ----------------------------
-- Table structure for data_converge_source
-- ----------------------------
DROP TABLE IF EXISTS `data_converge_source`;
CREATE TABLE `data_converge_source`  (
                                         `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                         `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
                                         `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置',
                                         `source_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源类型:1:FILE 2:JDBC 3:HTTP',
                                         `child_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '例如JDBC:MYSQL',
                                         `order_num` int(4) NOT NULL DEFAULT 0 COMMENT '显示顺序',
                                         `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                         `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                         `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                         `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                         `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                         `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源类型:0:业务数据源 1:数仓数据源',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_converge_source
-- ----------------------------
INSERT INTO `data_converge_source` VALUES (38, '测试mysql', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:mysql://1\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"com.mysql.cj.jdbc.Driver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'MYSQL', 1, 'admin', '2022-11-26 11:17:55', '', NULL, 'MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一', '1');
INSERT INTO `data_converge_source` VALUES (39, '测试oracle', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'ORACLE', 2, 'admin', '2022-11-26 11:19:19', '', NULL, 'Oracle公司（甲骨文）是全球最大的信息管理软件及服务供应商，成立于1977年，总部位于美国加州Redwood shore，面向全球开放oracle认证。Oracle开发的关系数据库产品因性能卓越而闻名，Oracle数据库产品为财富排行榜上的前1000家公司所采用', '1');
INSERT INTO `data_converge_source` VALUES (40, '测试DB2', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'DB2', 3, 'admin', '2022-11-26 11:19:19', '', NULL, 'DB2 是美国IBM公司开发的一套关系型数据库管理系统，它主要的运行环境为UNIX（包括IBM自家的AIX）、Linux、IBM i（旧称OS/400）、z/OS，以及Windows服务器版本。', '1');
INSERT INTO `data_converge_source` VALUES (41, '测试SPARK', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'SPARK', 4, 'admin', '2022-11-26 11:19:19', '', NULL, 'Spark是UC Berkeley AMP lab (加州大学伯克利分校的AMP实验室)所开源的类Hadoop MapReduce的通用并行框架，Spark，拥有Hadoop MapReduce所具有的优点', '0');
INSERT INTO `data_converge_source` VALUES (42, '测试mysql2', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'MYSQL', 5, 'admin', '2022-11-26 11:19:19', '', NULL, 'MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一', '1');
INSERT INTO `data_converge_source` VALUES (43, '测试oracle2', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'ORACLE', 6, 'admin', '2022-11-26 11:19:19', '', NULL, 'Oracle公司（甲骨文）是全球最大的信息管理软件及服务供应商，成立于1977年，总部位于美国加州Redwood shore，面向全球开放oracle认证。Oracle开发的关系数据库产品因性能卓越而闻名，Oracle数据库产品为财富排行榜上的前1000家公司所采用', '1');
INSERT INTO `data_converge_source` VALUES (44, '测试DB2', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'DB2', 7, 'admin', '2022-11-26 11:19:19', '', NULL, 'DB2 是美国IBM公司开发的一套关系型数据库管理系统，它主要的运行环境为UNIX（包括IBM自家的AIX）、Linux、IBM i（旧称OS/400）、z/OS，以及Windows服务器版本。', '1');
INSERT INTO `data_converge_source` VALUES (45, '测试HIVE', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:hive2://1\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'HIVE', 8, 'admin', '2022-11-26 13:26:03', '', NULL, 'HIVE是基于Hadoop的一个数据仓库工具，用来进行数据提取、转化、加载，这是一种可以存储、查询和分析存储在Hadoop中的大规模数据的机制。', '0');
INSERT INTO `data_converge_source` VALUES (46, '测试HIVE2', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:hive2://1\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'HIVE', 9, 'admin', '2022-11-26 13:26:03', '', NULL, 'HIVE是基于Hadoop的一个数据仓库工具，用来进行数据提取、转化、加载，这是一种可以存储、查询和分析存储在Hadoop中的大规模数据的机制。', '0');
INSERT INTO `data_converge_source` VALUES (47, '测试DB2', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'DB2', 10, 'admin', '2022-11-26 11:19:19', '', NULL, 'DB2 是美国IBM公司开发的一套关系型数据库管理系统，它主要的运行环境为UNIX（包括IBM自家的AIX）、Linux、IBM i（旧称OS/400）、z/OS，以及Windows服务器版本。', '1');
INSERT INTO `data_converge_source` VALUES (48, '测试SPARK', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:oracle:thin:@\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"oracle.jdbc.driver.OracleDriver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'SPARK', 11, 'admin', '2022-11-26 11:19:19', '', NULL, 'Spark是UC Berkeley AMP lab (加州大学伯克利分校的AMP实验室)所开源的类Hadoop MapReduce的通用并行框架，Spark，拥有Hadoop MapReduce所具有的优点', '0');
INSERT INTO `data_converge_source` VALUES (49, '测试mysql3', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:mysql://1\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\",\"driverName\":\"com.mysql.cj.jdbc.Driver\",\"enableSyncSchemas\":false,\"properties\":{},\"username\":\"1\"}', '2', 'MYSQL', 12, 'admin', '2022-11-26 20:13:42', '', NULL, 'MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一', '1');
INSERT INTO `data_converge_source` VALUES (50, '测试mysql-01', '{\"syncInterval\":\"1\",\"enableServerAggregate\":false,\"url\":\"jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"enableSpecialSQL\":false,\"password\":\"_encrypted_8SXo8VjsdCL5CAtPGxqKHw==\",\"driverName\":\"com.mysql.cj.jdbc.Driver\",\"enableSyncSchemas\":false,\"properties\":{\"maxActive\":\"10\"},\"username\":\"root\"}', '2', 'MYSQL', 13, 'admin', '2022-11-26 20:15:02', '', NULL, 'MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一', '1');

-- ----------------------------
-- Table structure for data_converge_source_schemas
-- ----------------------------
DROP TABLE IF EXISTS `data_converge_source_schemas`;
CREATE TABLE `data_converge_source_schemas`  (
                                                 `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                                                 `source_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                                                 `schemas` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                                 `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                                 `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                 `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                                 `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                 `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                                 PRIMARY KEY (`id`) USING BTREE,
                                                 UNIQUE INDEX `source_id`(`source_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_converge_source_schemas
-- ----------------------------

-- ----------------------------
-- Table structure for data_schedule_command
-- ----------------------------
DROP TABLE IF EXISTS `data_schedule_command`;
CREATE TABLE `data_schedule_command`  (
                                          `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                          `command_type` tinyint(4) NULL DEFAULT NULL COMMENT '命令类型: 0 start workflow, 1 start execution from current node, 2 resume fault-tolerant workflow, 3 resume pause process, 4 start execution from failed node, 5 complement, 6 schedule, 7 rerun, 8 pause, 9 stop, 10 resume waiting thread',
                                          `process_definition_id` bigint(20) NOT NULL COMMENT '流程定义id',
                                          `process_definition_version` int(11) NULL DEFAULT 0 COMMENT '流程定义版本',
                                          `process_instance_id` int(11) NULL DEFAULT 0 COMMENT '流程实例id',
                                          `command_param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json命令参数',
                                          `task_depend_type` tinyint(4) NULL DEFAULT NULL COMMENT '节点依赖类型: 0 current node, 1 forward, 2 backward',
                                          `failure_strategy` tinyint(4) NULL DEFAULT 0 COMMENT '失败策略: 0 end, 1 continue',
                                          `warning_type` tinyint(4) NULL DEFAULT 0 COMMENT '告警类型: 0 is not sent, 1 process is sent successfully, 2 process is sent failed, 3 process is sent successfully and all failures are sent',
                                          `schedule_time` datetime(0) NULL DEFAULT NULL COMMENT '调度时间',
                                          `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
                                          `executor_id` int(11) NULL DEFAULT NULL COMMENT '执行id',
                                          `process_instance_priority` int(11) NULL DEFAULT NULL COMMENT '流程实例优先级: 0 Highest,1 High,2 Medium,3 Low,4 Lowest',
                                          `dry_run` tinyint(4) NULL DEFAULT 0 COMMENT '排练：0 normal, 1 dry run',
                                          `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                          `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                          `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                          `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          INDEX `priority_id_index`(`process_instance_priority`, `id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_schedule_command
-- ----------------------------

-- ----------------------------
-- Table structure for data_schedule_process_definition
-- ----------------------------
DROP TABLE IF EXISTS `data_schedule_process_definition`;
CREATE TABLE `data_schedule_process_definition`  (
                                                     `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                     `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程定义名称',
                                                     `version` int(11) NULL DEFAULT 0 COMMENT '流程定义版本',
                                                     `project_code` bigint(20) NOT NULL COMMENT 'project code',
                                                     `release_state` tinyint(4) NULL DEFAULT NULL COMMENT '0:上线,1:下线',
                                                     `global_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局参数',
                                                     `flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用0:可用, 1:不可用',
                                                     `locations` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Node节点位置',
                                                     `warning_group_id` int(11) NULL DEFAULT NULL COMMENT 'alert group id',
                                                     `timeout` int(11) NULL DEFAULT 0 COMMENT '超时时间 单位:分',
                                                     `execution_type` tinyint(4) NULL DEFAULT 0 COMMENT '执行类型: 0:并行,1:串行等待,2:串行抛弃,3:串行优先',
                                                     `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                                     `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                     `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                                     `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                     `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                                     PRIMARY KEY (`id`) USING BTREE,
                                                     UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据调度-流程定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_schedule_process_definition
-- ----------------------------

-- ----------------------------
-- Table structure for data_schedule_process_instance
-- ----------------------------
DROP TABLE IF EXISTS `data_schedule_process_instance`;
CREATE TABLE `data_schedule_process_instance`  (
                                                   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                   `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
                                                   `process_definition_version` int(11) NULL DEFAULT 0 COMMENT '版本',
                                                   `process_definition_id` bigint(20) NOT NULL COMMENT 'process_definition_id',
                                                   `state` tinyint(4) NULL DEFAULT NULL COMMENT '状态: 0 commit succeeded, 1 running, 2 prepare to pause, 3 pause, 4 prepare to stop, 5 stop, 6 fail, 7 succeed, 8 need fault tolerance, 9 kill, 10 wait for thread, 11 wait for dependency to complete',
                                                   `recovery` tinyint(4) NULL DEFAULT NULL COMMENT 'process instance failover flag：0:normal,1:failover instance',
                                                   `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
                                                   `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
                                                   `run_times` int(11) NULL DEFAULT NULL COMMENT '运行时间',
                                                   `host` varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主机名',
                                                   `command_type` tinyint(4) NULL DEFAULT NULL COMMENT '命令类型',
                                                   `command_param` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json命令参数',
                                                   `task_depend_type` tinyint(4) NULL DEFAULT NULL COMMENT '任务依赖类型. 0: only current node,1:before the node,2:later nodes',
                                                   `max_try_times` tinyint(4) NULL DEFAULT 0 COMMENT '最大重试次数',
                                                   `failure_strategy` tinyint(4) NULL DEFAULT 0 COMMENT '失败策略. 0:end the process when node failed,1:continue running the other nodes when node failed',
                                                   `warning_type` tinyint(4) NULL DEFAULT 0 COMMENT '告警类型. 0:no warning,1:warning if process success,2:warning if process failed,3:warning if success',
                                                   `schedule_time` datetime(0) NULL DEFAULT NULL COMMENT 'schedule time',
                                                   `command_start_time` datetime(0) NULL DEFAULT NULL COMMENT '命令开始时间',
                                                   `global_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '全局参数',
                                                   `flag` tinyint(4) NULL DEFAULT 1 COMMENT 'flag',
                                                   `is_sub_process` int(11) NULL DEFAULT 0 COMMENT '是否是子进程',
                                                   `executor_id` int(11) NOT NULL COMMENT '执行id',
                                                   `history_cmd` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '历史，命令',
                                                   `process_instance_priority` int(11) NULL DEFAULT NULL COMMENT '流程实例优先级. 0 Highest,1 High,2 Medium,3 Low,4 Lowest',
                                                   `timeout` int(11) NULL DEFAULT 0 COMMENT '超时时间',
                                                   `var_pool` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'var_pool',
                                                   `dry_run` tinyint(4) NULL DEFAULT 0 COMMENT '尝试运行标识：0 normal, 1 dry run',
                                                   `next_process_instance_id` int(11) NULL DEFAULT 0 COMMENT '下一个流程实例id',
                                                   `restart_time` datetime(0) NULL DEFAULT NULL COMMENT '流程实例重启时间',
                                                   `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                                   `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                   `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                                   `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                   PRIMARY KEY (`id`) USING BTREE,
                                                   INDEX `start_time_index`(`start_time`, `end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_schedule_process_instance
-- ----------------------------

-- ----------------------------
-- Table structure for data_schedule_schedules
-- ----------------------------
DROP TABLE IF EXISTS `data_schedule_schedules`;
CREATE TABLE `data_schedule_schedules`  (
                                            `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                            `process_definition_id` bigint(20) NOT NULL COMMENT '流程定义id',
                                            `start_time` datetime(0) NOT NULL COMMENT '开始时间',
                                            `end_time` datetime(0) NOT NULL COMMENT '结束时间',
                                            `timezone_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'schedule timezone id',
                                            `crontab` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'crontab 表达式',
                                            `failure_strategy` tinyint(4) NOT NULL COMMENT '失败策略. 0:end,1:continue',
                                            `release_state` tinyint(4) NOT NULL COMMENT '上线状态. 0:offline,1:online ',
                                            `warning_type` tinyint(4) NOT NULL COMMENT '告警类型: 0 is not sent, 1 process is sent successfully, 2 process is sent failed, 3 process is sent successfully and all failures are sent',
                                            `process_instance_priority` int(11) NULL DEFAULT NULL COMMENT '流程实例优先级：0 Highest,1 High,2 Medium,3 Low,4 Lowest',
                                            `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                            `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                            `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                            `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_schedule_schedules
-- ----------------------------

-- ----------------------------
-- Table structure for data_schedule_task_definition
-- ----------------------------
DROP TABLE IF EXISTS `data_schedule_task_definition`;
CREATE TABLE `data_schedule_task_definition`  (
                                                  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                  `code` bigint(20) NOT NULL COMMENT 'code值唯一',
                                                  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
                                                  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
                                                  `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务类型',
                                                  `task_params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'job custom parameters',
                                                  `flag` tinyint(2) NULL DEFAULT NULL COMMENT '是否可用',
                                                  `task_priority` tinyint(4) NULL DEFAULT NULL COMMENT '任务优先级',
                                                  `worker_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'worker grouping',
                                                  `fail_retry_times` int(11) NULL DEFAULT NULL COMMENT '失败策略',
                                                  `fail_retry_interval` int(11) NULL DEFAULT NULL COMMENT '重试次数',
                                                  `timeout_flag` tinyint(2) NULL DEFAULT 0 COMMENT '是否过期',
                                                  `timeout_notify_strategy` tinyint(4) NULL DEFAULT NULL COMMENT '失败通知策略: 0 warning, 1 fail',
                                                  `timeout` int(11) NULL DEFAULT 0 COMMENT '超时时间,unit: minute',
                                                  `delay_time` int(11) NULL DEFAULT 0 COMMENT '延迟执行时间,unit: minute',
                                                  `resource_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '资源id',
                                                  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                                  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                                  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_schedule_task_definition
-- ----------------------------

-- ----------------------------
-- Table structure for data_schedule_task_instance
-- ----------------------------
DROP TABLE IF EXISTS `data_schedule_task_instance`;
CREATE TABLE `data_schedule_task_instance`  (
                                                `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                                `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'task name',
                                                `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'task type',
                                                `process_instance_id` int(11) NULL DEFAULT NULL COMMENT 'process instance id',
                                                `state` tinyint(4) NULL DEFAULT NULL COMMENT 'Status: 0 commit succeeded, 1 running, 2 prepare to pause, 3 pause, 4 prepare to stop, 5 stop, 6 fail, 7 succeed, 8 need fault tolerance, 9 kill, 10 wait for thread, 11 wait for dependency to complete',
                                                `submit_time` datetime(0) NULL DEFAULT NULL COMMENT 'task submit time',
                                                `start_time` datetime(0) NULL DEFAULT NULL COMMENT 'task start time',
                                                `end_time` datetime(0) NULL DEFAULT NULL COMMENT 'task end time',
                                                `host` varchar(135) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'host of task running on',
                                                `execute_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'task execute path in the host',
                                                `log_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'task log path',
                                                `alert_flag` tinyint(4) NULL DEFAULT NULL COMMENT 'whether alert',
                                                `retry_times` int(4) NULL DEFAULT 0 COMMENT 'task retry times',
                                                `pid` int(4) NULL DEFAULT NULL COMMENT 'pid of task',
                                                `app_link` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'yarn app id',
                                                `task_params` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'job custom parameters',
                                                `flag` tinyint(4) NULL DEFAULT 1 COMMENT '0 not available, 1 available',
                                                `retry_interval` int(4) NULL DEFAULT NULL COMMENT 'retry interval when task failed ',
                                                `max_retry_times` int(2) NULL DEFAULT NULL COMMENT 'max retry times',
                                                `task_instance_priority` int(11) NULL DEFAULT NULL COMMENT 'task instance priority:0 Highest,1 High,2 Medium,3 Low,4 Lowest',
                                                `environment_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'this config contains many environment variables config',
                                                `executor_id` int(11) NULL DEFAULT NULL,
                                                `first_submit_time` datetime(0) NULL DEFAULT NULL COMMENT 'task first submit time',
                                                `delay_time` int(4) NULL DEFAULT 0 COMMENT 'task delay execution time',
                                                `var_pool` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'var_pool',
                                                `dry_run` tinyint(4) NULL DEFAULT 0 COMMENT 'dry run flag: 0 normal, 1 dry run',
                                                `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                                `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                                `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                                `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                                `code` int(11) NULL DEFAULT NULL COMMENT 'code值唯一',
                                                PRIMARY KEY (`id`) USING BTREE,
                                                INDEX `process_instance_id`(`process_instance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_schedule_task_instance
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
                              `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                              `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
                              `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
                              `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
                              `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
                              `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
                              `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                              `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
                              `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
                              `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
                              `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
                              `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
                              `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                              `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                              `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
                              `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                              `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                              `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_config', '参数配置表', NULL, NULL, 'SysConfig', 'crud', 'com.heaven.system', 'system', 'config', '参数配置', 'heaven', '0', '/', '{}', 'admin', '2022-11-17 00:19:20', '', '2022-11-19 21:25:43', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_dict_data', '字典数据表', NULL, NULL, 'SysDictData', 'crud', 'com.heaven.system', 'system', 'data', '字典数据', 'heaven', '0', '/', NULL, 'admin', '2022-11-17 17:03:08', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_dict_type', '字典类型表', NULL, NULL, 'SysDictType', 'crud', 'com.heaven.system', 'system', 'type', '字典类型', 'heaven', '0', '/', NULL, 'admin', '2022-11-17 17:03:08', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_role_dept', '角色和部门关联表', NULL, NULL, 'SysRoleDept', 'crud', 'com.heaven.system', 'system', 'dept', '角色和部门关联', 'Vicene', '0', '/', NULL, 'admin', '2022-11-18 00:43:17', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_post', '岗位信息表', NULL, NULL, 'SysPost', 'crud', 'com.heaven.system', 'system', 'post', '岗位信息', 'Vicene', '0', '/', NULL, 'admin', '2022-11-18 00:48:12', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'data_converge_source', '数据源表', NULL, NULL, 'DataConvergeSource', 'crud', 'com.heaven.dataconverge', 'source', 'source', '数据源', 'Vicene', '0', '/', '{}', 'admin', '2022-11-21 19:13:42', '', '2022-11-21 19:16:46', '');
INSERT INTO `gen_table` VALUES (9, 'data_converge_business_section', '数据模块-数据汇聚-业务板块', NULL, NULL, 'DataConvergeBusinessSection', 'crud', 'com.heaven.dataconverge', 'BusinessSection', 'BusinessSection', '数据模块-数据汇聚-业务板块', 'Vicene', '0', '/', '{}', 'admin', '2022-11-24 23:57:53', '', '2022-11-25 15:23:16', NULL);
INSERT INTO `gen_table` VALUES (10, 'data_converge_business_source', '业务板块与数据源关联表', NULL, NULL, 'DataConvergeBusinessSource', 'crud', 'com.heaven.dataconverge', 'dataconverge', 'businessSource', '业务板块与数据源关联', 'Vicene', '0', '/', '{}', 'admin', '2022-11-24 23:57:53', '', '2022-11-25 00:05:56', NULL);
INSERT INTO `gen_table` VALUES (11, 'data_converge_business_datadomain', '数据域', NULL, NULL, 'DataConvergeBusinessDatadomain', 'crud', 'com.heaven.dataconverge', 'Datadomain', 'datadomain', '数据模块-数据汇聚-数据域', 'Vicene', '0', '/', '{}', 'admin', '2022-11-29 11:27:48', '', '2022-11-29 11:35:17', NULL);
INSERT INTO `gen_table` VALUES (12, 'data_schedule_process_definition', '数据调度-流程定义表', NULL, NULL, 'DataScheduleProcessDefinition', 'crud', 'com.heaven.dataschedule', 'schedule', 'processDefinition', '数据调度-流程定义', 'Vicene', '0', '/', '{}', 'admin', '2022-12-02 13:55:26', '', '2022-12-02 15:34:14', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
                                     `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
                                     `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
                                     `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
                                     `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
                                     `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
                                     `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
                                     `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
                                     `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
                                     `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
                                     `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
                                     `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                     `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                     `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
                                     `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
                                     `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                     `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                     `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                     `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
                                     `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                     `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                     `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                     PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'config_id', '参数主键', 'int(5)', 'Integer', 'configId', '1', '1', NULL, '1', '1', '1', '1', 'NE', 'select', 'sys_user_sex', 1, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (2, '1', 'config_name', '参数名称', 'varchar(100)', 'String', 'configName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (3, '1', 'config_key', '参数键名', 'varchar(100)', 'String', 'configKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (4, '1', 'config_value', '参数键值', 'varchar(500)', 'String', 'configValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (5, '1', 'config_type', '系统内置（Y是 N否）', 'char(1)', 'String', 'configType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (6, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (7, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (8, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (9, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (10, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-11-17 00:19:20', '', '2022-12-04 01:00:20');
INSERT INTO `gen_table_column` VALUES (24, '3', 'dict_code', '字典编码', 'bigint(20)', 'Long', 'dictCode', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '3', 'dict_sort', '字典排序', 'int(4)', 'Integer', 'dictSort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '3', 'dict_label', '字典标签', 'varchar(100)', 'String', 'dictLabel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '3', 'dict_value', '字典键值', 'varchar(100)', 'String', 'dictValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '3', 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '3', 'css_class', '样式属性（其他样式扩展）', 'varchar(100)', 'String', 'cssClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '3', 'list_class', '表格回显样式', 'varchar(100)', 'String', 'listClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '3', 'is_default', '是否默认（Y是 N否）', 'char(1)', 'String', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '3', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '4', 'dict_id', '字典主键', 'bigint(20)', 'Long', 'dictId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '4', 'dict_name', '字典名称', 'varchar(100)', 'String', 'dictName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '4', 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '4', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2022-11-17 17:03:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '5', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-18 00:43:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '5', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2022-11-18 00:43:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '6', 'post_id', '岗位ID', 'bigint(20)', 'Long', 'postId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '6', 'post_code', '岗位编码', 'varchar(64)', 'String', 'postCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '6', 'post_name', '岗位名称', 'varchar(50)', 'String', 'postName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '6', 'post_sort', '显示顺序', 'int(4)', 'Integer', 'postSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '6', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '6', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-11-18 00:48:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '8', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '8', 'name', '名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '8', 'config', '配置', 'text', 'String', 'config', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '8', 'source_type', '数据源类型:1:FILE 2:JDBC 3:HTTP', 'char(1)', 'String', 'sourceType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, '8', 'child_type', '例如JDBC:MYSQL', 'varchar(50)', 'String', 'childType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, '8', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '8', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '8', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2022-11-21 19:13:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '9', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '9', 'name', '名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '9', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '9', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, '9', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, '9', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, '9', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, '9', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2022-11-24 23:57:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, '10', 'business_section_id', '业务板块id', 'bigint(20)', 'Long', 'businessSectionId', '1', '0', '1', '1', '1', '1', '1', 'NE', 'input', '', 1, 'admin', '2022-11-24 23:57:53', '', '2022-11-29 15:25:12');
INSERT INTO `gen_table_column` VALUES (95, '10', 'source_id', '数据源id', 'bigint(20)', 'Long', 'sourceId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2022-11-24 23:57:53', '', '2022-11-29 15:25:12');
INSERT INTO `gen_table_column` VALUES (96, '11', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, '11', 'section_id', '业务板块id', 'bigint(20)', 'Long', 'sectionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, '11', 'name', '名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, '11', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, '11', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, '11', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, '11', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, '11', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, '11', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '11', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2022-11-29 11:27:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '12', 'id', 'id', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '12', 'name', '流程定义名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '12', 'version', '流程定义版本', 'int(11)', 'Long', 'version', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '12', 'project_code', 'project code', 'bigint(20)', 'Long', 'projectCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '12', 'release_state', '0:上线,1:下线', 'tinyint(4)', 'Integer', 'releaseState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '12', 'global_params', '全局参数', 'text', 'String', 'globalParams', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '12', 'flag', '是否可用0:可用, 1:不可用', 'char(1)', 'String', 'flag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '12', 'locations', 'Node节点位置', 'text', 'String', 'locations', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '12', 'warning_group_id', 'alert group id', 'int(11)', 'Long', 'warningGroupId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '12', 'timeout', '超时时间 单位:分', 'int(11)', 'Long', 'timeout', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '12', 'execution_type', '执行类型: 0:并行,1:串行等待,2:串行抛弃,3:串行优先', 'tinyint(4)', 'Integer', 'executionType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 11, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, '12', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-12-02 13:55:26', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, '12', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2022-12-02 13:55:26', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
                               `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                               `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
                               `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
                               `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
                               `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                               `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-10-24 00:24:25', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-10-24 00:24:25', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-10-24 00:24:25', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-10-24 00:24:25', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
                             `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
                             `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
                             `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
                             `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
                             `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                             `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
                             `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
                             `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '极限编程组织', 0, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'vicene', '15888888888', '505543479@qq.com', '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL);
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '南昌分公司', 1, '李文杰', '13716364676', '505543479@qq.com', '0', '0', 'admin', '2022-11-07 01:38:47', '', NULL);
INSERT INTO `sys_dept` VALUES (111, 118, '0,118', '南昌公司-01', 3, '李', '13716364676', '50443479@qq.com', '0', '0', 'admin', '2022-11-07 11:20:15', 'admin', '2022-11-08 11:22:16');
INSERT INTO `sys_dept` VALUES (112, 0, '0', '11', 11, '李1', '13711364676', '505513479@qq.com', '0', '2', 'admin', '2022-11-07 12:17:19', 'admin', '2022-11-08 00:30:21');
INSERT INTO `sys_dept` VALUES (116, 100, '0,100', '1-1', 1, '11', '13716364676', '505543479@qq.com', '0', '2', 'admin', '2022-11-07 23:50:57', 'admin', '2022-11-08 00:37:24');
INSERT INTO `sys_dept` VALUES (117, 111, '0,118,111', '南昌公司-01-011', 1, '南昌公司-01-011', '13716364676', '505543479@qq.com', '0', '0', 'admin', '2022-11-08 00:33:03', 'admin', '2022-11-16 00:40:39');
INSERT INTO `sys_dept` VALUES (118, 0, '0', '第三个子节点', 4, '1', '13716364676', '50554379@qq.com', '0', '0', 'admin', '2022-11-08 00:34:20', '', NULL);
INSERT INTO `sys_dept` VALUES (119, 0, '0', '第四个节点', 1, '李文杰', '13716364676', '505543479@qq.com', '0', '2', 'admin', '2022-11-08 11:23:08', '', NULL);
INSERT INTO `sys_dept` VALUES (120, 100, '0,100', '4-11', 11, '111', '13716364671', '505543479@qq.com', '0', '0', 'admin', '2022-11-12 13:58:10', 'admin', '2022-11-12 14:00:20');
INSERT INTO `sys_dept` VALUES (121, 100, '0,100', '测试部门1', 11, 'li1', '13716364671', '505543471@qq.com', '1', '2', 'admin', '2022-11-15 23:57:52', 'admin', '2022-11-15 23:58:10');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
                                  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
                                  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
                                  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
                                  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
                                  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100044 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (99999, 1, '好', '0', 'sys_user_type', '', 'primary', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '用户类型好');
INSERT INTO `sys_dict_data` VALUES (100000, 2, '坏', '0', 'sys_user_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '用户类型坏');
INSERT INTO `sys_dict_data` VALUES (100001, 1, 'FILE', '0', 'data_source_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '数据源类型JDBC');
INSERT INTO `sys_dict_data` VALUES (100002, 2, 'HTTP', '1', 'data_source_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '数据源类型HTTP');
INSERT INTO `sys_dict_data` VALUES (100003, 3, 'JDBC', '2', 'data_source_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '数据源类型JDBC');
INSERT INTO `sys_dict_data` VALUES (100004, 1, 'MYSQL', 'MYSQL', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'MYSQL');
INSERT INTO `sys_dict_data` VALUES (100005, 2, 'ORACLE', 'ORACLE', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'ORACLE');
INSERT INTO `sys_dict_data` VALUES (100006, 3, 'H2', 'H2', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100007, 4, 'HIVE', 'HIVE', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100008, 5, 'HSQLDB', 'HSQLDB', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100009, 6, 'INFOBRIGHT', 'INFOBRIGHT', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100010, 7, 'INFORMIX', 'INFORMIX', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100011, 8, 'INGRES', 'INGRES', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100012, 9, 'INTERBASE', 'INTERBASE', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100013, 10, 'JETHRO', 'JETHRO', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100014, 11, 'LUCIDDB', 'LUCIDDB', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100015, 12, 'MSSQL', 'MSSQL', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100016, 13, 'NEOVIEW', 'NEOVIEW', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100017, 14, 'NETEZZA', 'NETEZZA', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100018, 15, 'PHOENIX', 'PHOENIX', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100019, 16, 'POSTGRESQL', 'POSTGRESQL', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100020, 17, 'PRESTO', 'PRESTO', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100021, 18, 'SPARK', 'SPARK', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100022, 19, 'SQLSTREAM', 'SQLSTREAM', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100023, 20, 'SYBASE', 'SYBASE', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100024, 21, 'TERADATA', 'TERADATA', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100025, 22, 'VERTICA', 'VERTICA', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100026, 23, 'ACCESS', 'ACCESS', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100027, 24, 'BIG_QUERY', 'BIG_QUERY', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100028, 25, 'CALCITE', 'CALCITE', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100029, 26, 'CLICKHOUSE', 'CLICKHOUSE', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100030, 27, 'DERBY', 'DERBY', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100031, 28, 'DB2', 'DB2', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100032, 29, 'DM', 'DM', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100033, 30, 'FIREBIRD', 'FIREBIRD', 'data_source_child_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100034, 1, 'SHELL', 'SHELL', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100035, 2, 'SQL', 'SQL', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100036, 3, 'SPARK', 'SPARK', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100037, 4, 'FLINK', 'FLINK', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100038, 5, 'DATAX', 'DATAX', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100039, 6, 'SQOOP', 'SQOOP', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100040, 7, 'SEATUNNEL', 'SEATUNNEL', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100041, 7, 'MAPREDUCE', 'MAPREDUCE', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100042, 7, 'PYTHON', 'PYTHON', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');
INSERT INTO `sys_dict_data` VALUES (100043, 7, 'ZEPPELIN', 'ZEPPELIN', 'process_task_type', '', 'danger', 'N', '0', 'admin', '2022-10-24 00:24:25', '', NULL, 'H2');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
                                  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
                                  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                                  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                                  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`dict_id`) USING BTREE,
                                  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100015 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (99999, '人物好坏', 'sys_user_type', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '人物好坏列表');
INSERT INTO `sys_dict_type` VALUES (100008, 'aaa1', 'sysaaaa1', '1', 'admin', '2022-11-06 15:01:14', 'admin', '2022-11-12 01:27:15', 'aaaa1');
INSERT INTO `sys_dict_type` VALUES (100009, '123', 'sys_aa_bb2', '1', 'admin', '2022-11-06 15:50:05', 'admin', '2022-11-08 00:17:51', '备注23');
INSERT INTO `sys_dict_type` VALUES (100010, '测试字典22', 'sys_test_01222', '0', 'admin', '2022-11-08 01:00:42', 'admin', '2022-11-08 01:00:59', 'sys_test_0122');
INSERT INTO `sys_dict_type` VALUES (100011, 't111', 'sys_t11', '0', 'admin', '2022-11-12 12:19:19', 'admin', '2022-11-16 00:40:55', 't111');
INSERT INTO `sys_dict_type` VALUES (100012, '数据源类型', 'data_source_type', '0', 'admin', '2022-11-12 12:19:19', 'admin', '2022-11-16 00:40:55', '数据源类型');
INSERT INTO `sys_dict_type` VALUES (100013, '数据源子类型', 'data_source_child_type', '0', 'admin', '2022-11-12 12:19:19', 'admin', '2022-11-16 00:40:55', '数据源子类型');
INSERT INTO `sys_dict_type` VALUES (100014, '工作流任务类型', 'process_task_type', '0', 'admin', '2022-11-12 12:19:19', 'admin', '2022-11-16 00:40:55', '工作流任务类型');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
                            `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                            `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
                            `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                            `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
                            `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
                            `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                            `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                            `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                            `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                            `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                            `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
                            PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-10-24 00:24:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-10-24 00:24:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-10-24 00:24:25', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
                                `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                                `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
                                `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
                                `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
                                `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
                                `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                                `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
                                `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
                                   `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                   `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
                                   `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
                                   `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                   `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
                                   `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
                                   PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 368 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-26 01:05:41');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-26 17:34:56');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-26 17:46:20');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-30 16:23:47');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-30 16:23:51');
INSERT INTO `sys_logininfor` VALUES (107, 'ruoyi', '127.0.0.1', '1', '登录用户不存在', '2022-10-31 00:27:12');
INSERT INTO `sys_logininfor` VALUES (108, 'ry', '127.0.0.1', '1', '密码输入错误1次', '2022-10-31 00:28:38');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-10-31 00:30:11');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '1', '密码输入错误2次', '2022-10-31 00:31:23');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-31 00:34:42');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 18:02:47');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '1', '用户密码不在指定范围', '2022-11-02 19:54:27');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 20:28:57');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 20:29:33');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 20:30:04');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 20:30:50');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 20:31:25');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 20:32:46');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 20:35:18');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 21:57:34');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 21:59:40');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:15:19');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:15:54');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:16:58');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '1', '登录用户不存在', '2022-11-02 22:18:24');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:18:42');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:25:20');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:44:21');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:46:16');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:52:01');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '1', '登录用户不存在', '2022-11-02 22:53:04');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '1', '登录用户不存在', '2022-11-02 22:53:48');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:54:13');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 22:57:58');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:01:54');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:03:21');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:05:43');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:06:57');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:08:37');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:19:10');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:23:12');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:23:42');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:24:19');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:24:54');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:25:15');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:26:44');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:29:01');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:30:00');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:34:03');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:41:29');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:44:36');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:44:54');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:46:40');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-02 23:55:32');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-02 23:56:06');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 00:08:14');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-03 00:17:45');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 00:19:03');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 23:16:44');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 23:20:05');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-03 23:45:47');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 00:06:13');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 00:09:49');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:22:07');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:24:31');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:25:19');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:26:13');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:36:54');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:37:50');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:49:30');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 01:55:58');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 02:20:37');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 11:22:40');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 11:29:04');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 11:39:49');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 16:00:30');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 16:01:20');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 16:03:27');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 16:05:52');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 16:12:41');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 16:17:58');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 18:51:21');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 19:12:30');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 19:18:10');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 19:37:11');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 21:22:17');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-04 22:37:15');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-05 14:14:05');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 14:14:15');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-05 20:40:57');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 13:14:16');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 13:41:40');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-06 13:45:08');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 13:45:26');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 15:00:18');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 20:21:47');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 20:52:10');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 21:19:18');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-06 22:18:33');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 10:59:12');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-07 22:41:59');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-08 10:51:42');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-08 16:00:11');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 11:22:28');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 14:09:49');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:16:44');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:17:05');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:19:14');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:21:09');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:21:13');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:21:20');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:21:24');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:21:30');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:21:52');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:23:46');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:29:04');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 16:29:13');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:02:39');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:02:46');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:15:11');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:15:16');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:15:25');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:15:34');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:16:16');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 17:30:51');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 18:04:06');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 18:59:26');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 18:59:49');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:00:17');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:01:25');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:02:07');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:04:07');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:04:38');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:41:36');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:44:51');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:49:41');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:49:49');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:51:01');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:51:50');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 19:54:36');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 21:09:49');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 21:09:58');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 21:10:57');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-09 22:38:57');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-10 00:16:00');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-10 20:21:01');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-10 23:13:15');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-11 17:14:16');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 17:14:25');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 17:27:07');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 21:32:39');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 22:35:19');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 23:34:22');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-11 23:36:30');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 23:37:02');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-11 23:37:54');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-11-12 00:01:54');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 00:02:06');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 00:03:35');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 00:14:35');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 01:26:27');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 12:09:38');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 16:37:00');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 16:37:14');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 17:57:26');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 17:57:32');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 17:57:46');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 17:59:16');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 17:59:38');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:00:39');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:01:26');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:01:39');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:02:16');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:03:52');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:05:57');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:07:34');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:09:43');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:10:26');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:12:06');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:17:06');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:20:43');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:21:00');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:21:43');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:22:10');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:22:20');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:22:39');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:22:47');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:23:30');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:24:21');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:26:24');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:34:38');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:34:50');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:35:09');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:35:54');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:36:41');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:37:32');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:38:13');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:41:31');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:41:47');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 18:53:10');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 19:05:27');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 21:31:16');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 22:22:22');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 22:23:38');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 22:58:55');
INSERT INTO `sys_logininfor` VALUES (307, 'vicene', '127.0.0.1', '0', '登录成功', '2022-11-12 22:59:48');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-12 23:07:31');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-13 17:31:44');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-14 01:55:47');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-14 11:14:39');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-15 00:40:57');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-15 11:05:12');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-15 18:56:38');
INSERT INTO `sys_logininfor` VALUES (315, 'Vicene', '127.0.0.1', '0', '登录成功', '2022-11-15 19:41:58');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-15 19:42:11');
INSERT INTO `sys_logininfor` VALUES (317, 'Vicene', '127.0.0.1', '0', '登录成功', '2022-11-15 19:44:25');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-15 20:08:07');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-16 00:52:55');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-16 12:51:14');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-16 16:24:58');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-16 21:30:44');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-16 22:41:32');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-16 23:31:57');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-17 11:07:30');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-17 12:34:17');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-17 18:57:59');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-17 19:15:02');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-17 20:01:07');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-18 14:20:20');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-19 13:39:14');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-20 00:12:30');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-20 12:18:43');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 18:52:34');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 19:29:27');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-21 20:17:54');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-22 01:23:07');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-22 12:00:15');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-22 13:15:48');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-22 14:17:29');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-22 22:19:46');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-23 01:19:50');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-23 01:24:39');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-24 15:16:54');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-24 16:47:29');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-25 14:56:22');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-25 19:56:07');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-25 21:56:14');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-26 14:03:58');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-26 15:37:58');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-27 15:38:19');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-28 14:36:55');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-28 19:18:00');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-29 01:31:24');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-29 20:43:44');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-30 14:38:30');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-01 00:43:53');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-01 00:44:24');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-01 00:58:13');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-02 16:58:38');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 11:12:23');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-03 19:37:16');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2022-12-04 00:23:10');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-04 00:23:18');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-04 00:53:43');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-04 00:54:56');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '0', '登录成功', '2022-12-04 00:59:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                             `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
                             `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
                             `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
                             `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
                             `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
                             `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
                             `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
                             `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
                             `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                             `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                             `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
                             `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
                             PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1063 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 'system(系统管理)', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-10-24 00:24:25', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, 'welcome(欢迎)', 0, 1, 'welcome', 'welcome', '', 1, 0, 'M', '0', '0', '', 'welcome', 'admin', '2022-10-24 00:24:25', 'admin', '2022-11-16 00:40:10', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (3, 'dataConverge(数据汇聚)', 0, 5, 'dataConverge', '', '', 1, 0, 'M', '0', '0', '', 'dataConverge', 'admin', '2022-10-24 00:24:25', '', NULL, '数据汇聚菜单');
INSERT INTO `sys_menu` VALUES (4, 'tool(系统工具)', 0, 3, 'tool', '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-10-24 00:24:25', '', NULL, '系统工具菜单');
INSERT INTO `sys_menu` VALUES (5, 'dataScheduler(数据调度)', 0, 6, 'dataScheduler', '', '', 1, 0, 'M', '0', '0', '', 'dataScheduler', 'admin', '2022-10-24 00:24:25', '', NULL, '数据调度菜单');
INSERT INTO `sys_menu` VALUES (100, 'user(用户管理)', 1, 1, 'user', 'system/user', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-10-24 00:24:25', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, 'role(角色管理)', 1, 2, 'role', 'system/role', '', 1, 0, 'C', '0', '0', 'system:role:list', 'role', 'admin', '2022-10-24 00:24:25', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, 'menu(菜单管理)', 1, 3, 'menu', 'system/menu', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'menu', 'admin', '2022-10-24 00:24:25', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, 'dept(部门管理)', 1, 4, 'dept', 'system/dept', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'dept', 'admin', '2022-10-24 00:24:25', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, 'post(岗位管理)', 1, 5, 'post', 'system/post', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-10-24 00:24:25', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, 'dict(字典管理)', 1, 6, 'dict', 'system/dict', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-10-24 00:24:25', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, 'config(配置管理)', 1, 7, 'config', 'system/config', '', 1, 0, 'C', '0', '1', 'system:config:list', 'config', 'admin', '2022-10-24 00:24:25', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, 'log(日志管理)', 0, 4, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-10-24 00:24:25', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (108, 'source(数据源管理)', 3, 1, 'source', 'dataConverge/Source', '', 1, 0, 'C', '0', '0', 'dataConverge:source:list', 'dataSource', 'admin', '2022-10-24 00:24:25', '', NULL, '数据源管理菜单');
INSERT INTO `sys_menu` VALUES (109, 'code(代码生成)', 4, 1, 'code', 'tool/code', '', 1, 0, 'C', '0', '0', 'tool:code:list', 'user', 'admin', '2022-10-24 00:24:25', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (110, 'businessSection(业务板块)', 3, 3, 'businessSection', 'dataConverge/BusinessSection', '', 1, 0, 'C', '0', '0', 'dataConverge:businessSection:list', 'businessSection', 'admin', '2022-10-24 00:24:25', '', NULL, '数据源管理菜单');
INSERT INTO `sys_menu` VALUES (111, 'workflowDefinition(工作流定义)', 5, 1, 'workflowDefinition', 'dataScheduler/workflowDefinition', '', 1, 0, 'C', '0', '0', 'dataScheduler:workflowDefinition:list', 'workflowDefinition', 'admin', '2022-10-24 00:24:25', '', NULL, '工作流定义菜单');
INSERT INTO `sys_menu` VALUES (112, 'dataDomain(数据域)', 3, 2, 'dataDomain', 'dataConverge/dataDomain', '', 1, 0, 'C', '0', '0', 'dataConverge:dataDomain:list', 'dataDomain', 'admin', '2022-10-24 00:24:25', '', NULL, '数据域菜单');
INSERT INTO `sys_menu` VALUES (113, 'dag(有向无环图)', 5, 4, 'dag', 'dataScheduler/dag', '', 1, 0, 'C', '0', '1', 'dataScheduler:dag:list', 'dag', 'admin', '2022-10-24 00:24:25', '', NULL, 'dag');
INSERT INTO `sys_menu` VALUES (501, 'logininfor(登录日志)', 107, 1, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-10-24 00:24:25', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1062, 'operateLog(操作日志)', 107, 2, 'operateLog', 'log/operateLog', '无', 1, 1, 'C', '0', '0', 'system:operlog:list', 'operateLog', 'admin', '2022-11-12 23:09:07', '', NULL, '操作日志菜单');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
                               `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                               `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
                               `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
                               `notice_content` longblob NULL COMMENT '公告内容',
                               `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                               `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                               `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                               `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                               `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                               PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-10-24 00:24:25', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-10-24 00:24:25', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
                                 `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                 `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
                                 `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                 `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
                                 `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
                                 `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                 `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
                                 `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
                                 `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
                                 `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
                                 `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
                                 `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
                                 `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
                                 `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
                                 `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
                                 `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
                                 PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 420 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"1\",\"dictType\":\"sys_aa_bb\",\"params\":{},\"remark\":\"备注\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 20:50:54');
INSERT INTO `sys_oper_log` VALUES (2, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"1\",\"dictType\":\"sys_test_demo\",\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 21:11:06');
INSERT INTO `sys_oper_log` VALUES (3, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/10000,10001', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-05 21:43:31');
INSERT INTO `sys_oper_log` VALUES (4, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/10000', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-05 21:47:38');
INSERT INTO `sys_oper_log` VALUES (5, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/10000', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-05 21:47:45');
INSERT INTO `sys_oper_log` VALUES (6, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/1', '127.0.0.1', '', NULL, NULL, 1, '用户性别已分配,不能删除', '2022-11-05 21:48:34');
INSERT INTO `sys_oper_log` VALUES (7, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/99999', '127.0.0.1', '', NULL, NULL, 1, '人物好坏已分配,不能删除', '2022-11-05 21:48:45');
INSERT INTO `sys_oper_log` VALUES (8, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/99999,100000', '127.0.0.1', '', NULL, NULL, 1, '人物好坏已分配,不能删除', '2022-11-05 21:49:06');
INSERT INTO `sys_oper_log` VALUES (9, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/100000,100001', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 21:49:28');
INSERT INTO `sys_oper_log` VALUES (10, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"11\",\"dictType\":\"sys_a_demo\",\"params\":{},\"remark\":\"aaa\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 21:51:47');
INSERT INTO `sys_oper_log` VALUES (11, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/100002', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 21:57:16');
INSERT INTO `sys_oper_log` VALUES (12, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"1\",\"dictType\":\"sys\",\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 21:57:40');
INSERT INTO `sys_oper_log` VALUES (13, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictName\":\"2\",\"dictType\":\"sys\",\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', '{\"msg\":\"新增字典\'2\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2022-11-05 21:57:51');
INSERT INTO `sys_oper_log` VALUES (14, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictName\":\"2\",\"dictType\":\"sys\",\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', '{\"msg\":\"新增字典\'2\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2022-11-05 21:58:08');
INSERT INTO `sys_oper_log` VALUES (15, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"3\",\"dictType\":\"ss\",\"params\":{},\"remark\":\"111\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 21:58:27');
INSERT INTO `sys_oper_log` VALUES (16, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/100004,100003', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 21:58:57');
INSERT INTO `sys_oper_log` VALUES (17, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"22\",\"dictType\":\"sys_111a\",\"params\":{},\"remark\":\"11\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 22:19:49');
INSERT INTO `sys_oper_log` VALUES (18, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"111\",\"dictType\":\"sys_aaaaaaa\",\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-05 22:20:13');
INSERT INTO `sys_oper_log` VALUES (19, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"11111\",\"dictType\":\"sys\",\"params\":{},\"remark\":\"111\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 00:26:25');
INSERT INTO `sys_oper_log` VALUES (20, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictName\":\"111\",\"dictType\":\"sys\",\"params\":{},\"remark\":\"11\",\"status\":\"0\"}', '{\"msg\":\"修改字典\'111\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2022-11-06 00:50:21');
INSERT INTO `sys_oper_log` VALUES (21, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100007,\"dictName\":\"11111\",\"dictType\":\"sys\",\"params\":{},\"remark\":\"111\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 01:09:29');
INSERT INTO `sys_oper_log` VALUES (22, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100007,\"dictName\":\"1111122\",\"dictType\":\"sys_11\",\"params\":{},\"remark\":\"2222\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 01:09:51');
INSERT INTO `sys_oper_log` VALUES (23, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/99999,100005,100006,100007', '127.0.0.1', '', NULL, NULL, 1, '人物好坏已分配,不能删除', '2022-11-06 01:14:21');
INSERT INTO `sys_oper_log` VALUES (24, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/99999', '127.0.0.1', '', NULL, NULL, 1, '人物好坏已分配,不能删除', '2022-11-06 01:15:18');
INSERT INTO `sys_oper_log` VALUES (25, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/99999', '127.0.0.1', '', NULL, NULL, 1, '人物好坏已分配,不能删除', '2022-11-06 01:16:18');
INSERT INTO `sys_oper_log` VALUES (26, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/100005', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 01:16:26');
INSERT INTO `sys_oper_log` VALUES (27, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/100006', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 01:16:31');
INSERT INTO `sys_oper_log` VALUES (28, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"aaa\",\"dictType\":\"sysaaaa\",\"params\":{},\"remark\":\"aaaa\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 15:01:14');
INSERT INTO `sys_oper_log` VALUES (29, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100007,\"dictName\":\"11111221111\",\"dictType\":\"sys_11\",\"params\":{},\"remark\":\"2222\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 15:46:06');
INSERT INTO `sys_oper_log` VALUES (30, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"1\",\"dictType\":\"sys_aa_bb\",\"params\":{},\"remark\":\"备注\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 15:50:05');
INSERT INTO `sys_oper_log` VALUES (31, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100009,\"dictName\":\"12\",\"dictType\":\"sys_aa_bb2\",\"params\":{},\"remark\":\"备注2\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-06 15:53:55');
INSERT INTO `sys_oper_log` VALUES (32, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"南昌分公司\",\"email\":\"505543479@qq.com\",\"leader\":\"李文杰\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 01:38:47');
INSERT INTO `sys_oper_log` VALUES (33, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,110\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"南昌公司-01\",\"email\":\"50443479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":110,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 11:20:15');
INSERT INTO `sys_oper_log` VALUES (34, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1111\",\"email\":\"505543479@qq.com\",\"leader\":\"说\",\"orderNum\":2,\"params\":{},\"phone\":\"13716364676\",\"status\":\"0\"}', NULL, 1, '', '2022-11-07 11:44:18');
INSERT INTO `sys_oper_log` VALUES (35, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"111\",\"email\":\"505543479@qq.com\",\"leader\":\"里\",\"orderNum\":1,\"params\":{},\"phone\":\"13716364676\",\"status\":\"1\"}', NULL, 1, '', '2022-11-07 11:46:04');
INSERT INTO `sys_oper_log` VALUES (36, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"111\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"phone\":\"13716364676\",\"status\":\"0\"}', NULL, 1, '', '2022-11-07 11:58:19');
INSERT INTO `sys_oper_log` VALUES (37, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"1\",\"orderNum\":1,\"params\":{},\"phone\":\"13716364676\",\"status\":\"0\"}', NULL, 1, '', '2022-11-07 11:59:15');
INSERT INTO `sys_oper_log` VALUES (38, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"phone\":\"13716364676\",\"status\":\"0\"}', NULL, 1, '', '2022-11-07 12:12:39');
INSERT INTO `sys_oper_log` VALUES (39, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"phone\":\"13716364676\",\"status\":\"0\"}', NULL, 1, '', '2022-11-07 12:13:10');
INSERT INTO `sys_oper_log` VALUES (40, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"1\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\"}', NULL, 1, '', '2022-11-07 12:15:20');
INSERT INTO `sys_oper_log` VALUES (41, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 12:17:19');
INSERT INTO `sys_oper_log` VALUES (42, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,,112\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"11\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 12:18:02');
INSERT INTO `sys_oper_log` VALUES (43, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,,112\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"1\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 23:45:27');
INSERT INTO `sys_oper_log` VALUES (44, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,,112\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1-2\",\"email\":\"505543479@qq.com\",\"leader\":\"li1\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 23:49:48');
INSERT INTO `sys_oper_log` VALUES (45, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,112\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-07 23:50:57');
INSERT INTO `sys_oper_log` VALUES (46, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,112\",\"children\":[],\"deptId\":116,\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"parentName\":\"1\",\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:08:51');
INSERT INTO `sys_oper_log` VALUES (47, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,112\",\"children\":[],\"deptId\":116,\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"parentName\":\"1\",\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:12:41');
INSERT INTO `sys_oper_log` VALUES (48, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"deptId\":112,\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:15:11');
INSERT INTO `sys_oper_log` VALUES (49, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"deptId\":112,\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:17:34');
INSERT INTO `sys_oper_log` VALUES (50, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100009,\"dictName\":\"123\",\"dictType\":\"sys_aa_bb2\",\"params\":{},\"remark\":\"备注23\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:17:52');
INSERT INTO `sys_oper_log` VALUES (51, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"deptId\":112,\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:19:05');
INSERT INTO `sys_oper_log` VALUES (52, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"deptId\":112,\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:20:54');
INSERT INTO `sys_oper_log` VALUES (53, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"deptId\":112,\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:23:35');
INSERT INTO `sys_oper_log` VALUES (54, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"deptId\":112,\"deptName\":\"1\",\"email\":\"505543479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:23:56');
INSERT INTO `sys_oper_log` VALUES (55, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"deptId\":112,\"deptName\":\"11\",\"email\":\"505513479@qq.com\",\"leader\":\"李1\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"phone\":\"13711364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:30:21');
INSERT INTO `sys_oper_log` VALUES (56, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,110,111\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"南昌公司-01-01\",\"email\":\"505543479@qq.com\",\"leader\":\"南昌公司-01-01\",\"orderNum\":1,\"params\":{},\"parentId\":111,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:33:03');
INSERT INTO `sys_oper_log` VALUES (57, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"第三个子节点\",\"email\":\"50554379@qq.com\",\"leader\":\"1\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:34:20');
INSERT INTO `sys_oper_log` VALUES (58, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,112\",\"children\":[],\"deptId\":116,\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"parentName\":\"118\",\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:34:43');
INSERT INTO `sys_oper_log` VALUES (59, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,112\",\"children\":[],\"deptId\":116,\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":112,\"parentName\":\"112\",\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:35:09');
INSERT INTO `sys_oper_log` VALUES (60, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,118\",\"children\":[],\"deptId\":116,\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":118,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:36:52');
INSERT INTO `sys_oper_log` VALUES (61, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":116,\"deptName\":\"1-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 00:37:24');
INSERT INTO `sys_oper_log` VALUES (62, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"测试字典\",\"dictType\":\"sys_test_01\",\"params\":{},\"remark\":\"sys_test_01\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 01:00:42');
INSERT INTO `sys_oper_log` VALUES (63, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100010,\"dictName\":\"测试字典22\",\"dictType\":\"sys_test_01222\",\"params\":{},\"remark\":\"sys_test_0122\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 01:00:59');
INSERT INTO `sys_oper_log` VALUES (64, '部门管理', 3, 'com.heaven.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/112', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 01:08:13');
INSERT INTO `sys_oper_log` VALUES (65, '部门管理', 3, 'com.heaven.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/100', '127.0.0.1', '', NULL, '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2022-11-08 01:08:21');
INSERT INTO `sys_oper_log` VALUES (66, '部门管理', 3, 'com.heaven.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/116', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 01:08:29');
INSERT INTO `sys_oper_log` VALUES (67, '部门管理', 3, 'com.heaven.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/100', '127.0.0.1', '', NULL, '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2022-11-08 01:22:22');
INSERT INTO `sys_oper_log` VALUES (68, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,110\",\"children\":[],\"deptId\":111,\"deptName\":\"南昌公司-01\",\"email\":\"50443479@qq.com\",\"leader\":\"李\",\"orderNum\":1,\"params\":{},\"parentId\":110,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 11:21:52');
INSERT INTO `sys_oper_log` VALUES (69, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,110\",\"children\":[],\"deptId\":111,\"deptName\":\"南昌公司-01\",\"email\":\"50443479@qq.com\",\"leader\":\"李\",\"orderNum\":2,\"params\":{},\"parentId\":110,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 11:21:58');
INSERT INTO `sys_oper_log` VALUES (70, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,110\",\"children\":[],\"deptId\":111,\"deptName\":\"南昌公司-01\",\"email\":\"50443479@qq.com\",\"leader\":\"李\",\"orderNum\":3,\"params\":{},\"parentId\":110,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 11:22:02');
INSERT INTO `sys_oper_log` VALUES (71, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,118\",\"children\":[],\"deptId\":111,\"deptName\":\"南昌公司-01\",\"email\":\"50443479@qq.com\",\"leader\":\"李\",\"orderNum\":3,\"params\":{},\"parentId\":118,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 11:22:16');
INSERT INTO `sys_oper_log` VALUES (72, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"第四个节点\",\"email\":\"505543479@qq.com\",\"leader\":\"李文杰\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 11:23:08');
INSERT INTO `sys_oper_log` VALUES (73, '岗位管理', 1, 'com.heaven.system.controller.SysPostController.add()', 'POST', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"pm\",\"postId\":5,\"postName\":\"产品经理\",\"postSort\":\"5\",\"remark\":\"产品经理\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 15:10:06');
INSERT INTO `sys_oper_log` VALUES (74, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm1\",\"postName\":\"产品经理1\",\"postSort\":\"2\",\"remark\":\"产品经理1\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-08 15:18:30');
INSERT INTO `sys_oper_log` VALUES (75, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm1\",\"postName\":\"产品经理1\",\"postSort\":\"51\",\"remark\":\"产品经理1\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-08 15:21:33');
INSERT INTO `sys_oper_log` VALUES (76, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm1\",\"postName\":\"产品经理1\",\"postSort\":\"51\",\"remark\":\"产品经理1\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-08 15:22:09');
INSERT INTO `sys_oper_log` VALUES (77, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm\",\"postName\":\"产品经理1\",\"postSort\":\"5\",\"remark\":\"产品经理\",\"status\":\"0\"}', '{\"msg\":\"修改岗位\'产品经理1\'失败，岗位编码已存在\",\"code\":500}', 0, NULL, '2022-11-08 15:24:27');
INSERT INTO `sys_oper_log` VALUES (78, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm\",\"postName\":\"产品经理1\",\"postSort\":\"5\",\"remark\":\"产品经理1\",\"status\":\"0\"}', '{\"msg\":\"修改岗位\'产品经理1\'失败，岗位编码已存在\",\"code\":500}', 0, NULL, '2022-11-08 15:25:35');
INSERT INTO `sys_oper_log` VALUES (79, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm\",\"postId\":5,\"postName\":\"产品经理1\",\"postSort\":\"5\",\"remark\":\"产品经理1\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 15:28:58');
INSERT INTO `sys_oper_log` VALUES (80, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm1\",\"postId\":5,\"postName\":\"产品经理11\",\"postSort\":\"51\",\"remark\":\"产品经理11\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 15:31:01');
INSERT INTO `sys_oper_log` VALUES (81, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"11\",\"isFrame\":\"0\",\"menuName\":\"11\",\"menuType\":\"0\",\"orderNum\":111,\"params\":{},\"parentId\":1,\"path\":\"11\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'11\'失败，地址必须以http(s)://开头\",\"code\":500}', 0, NULL, '2022-11-08 21:42:22');
INSERT INTO `sys_oper_log` VALUES (82, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"11\",\"isFrame\":\"0\",\"menuName\":\"111\",\"menuType\":\"0\",\"orderNum\":111,\"params\":{},\"parentId\":1,\"path\":\"111\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'111\'失败，地址必须以http(s)://开头\",\"code\":500}', 0, NULL, '2022-11-08 21:43:10');
INSERT INTO `sys_oper_log` VALUES (83, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"11\",\"isFrame\":\"0\",\"menuName\":\"11\",\"menuType\":\"0\",\"orderNum\":111,\"params\":{},\"parentId\":1,\"path\":\"11\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'11\'失败，地址必须以http(s)://开头\",\"code\":500}', 0, NULL, '2022-11-08 21:43:43');
INSERT INTO `sys_oper_log` VALUES (84, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"1\",\"isFrame\":\"0\",\"menuName\":\"1\",\"menuType\":\"0\",\"orderNum\":111,\"params\":{},\"parentId\":1,\"path\":\"http://111.com\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-08 21:44:29');
INSERT INTO `sys_oper_log` VALUES (85, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"aaa\",\"createBy\":\"admin\",\"icon\":\"aa\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuName\":\"菜单1\",\"menuType\":\"1\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"https://\",\"perms\":\"aa\",\"query\":\"aaa\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-09 11:28:29');
INSERT INTO `sys_oper_log` VALUES (86, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"b\",\"createBy\":\"admin\",\"icon\":\"b\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuName\":\"bb\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"https://b\",\"perms\":\"b\",\"query\":\"b\",\"status\":\"1\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-09 11:30:58');
INSERT INTO `sys_oper_log` VALUES (87, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"1\",\"isFrame\":\"0\",\"menuName\":\"目录1\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"http://\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-09 12:11:06');
INSERT INTO `sys_oper_log` VALUES (88, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"aa1\",\"isFrame\":\"0\",\"menuName\":\"菜单11\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"https://1\",\"status\":\"0\",\"visible\":\"0\"}', NULL, 1, '', '2022-11-09 12:48:38');
INSERT INTO `sys_oper_log` VALUES (89, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"b1\",\"isFrame\":\"0\",\"menuId\":1063,\"menuName\":\"bb1\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"https://b1\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-09 12:53:39');
INSERT INTO `sys_oper_log` VALUES (90, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"1\",\"isFrame\":\"0\",\"menuId\":1061,\"menuName\":\"1\",\"menuType\":\"M\",\"orderNum\":111,\"params\":{},\"parentId\":1,\"path\":\"http://111.com\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-09 12:56:34');
INSERT INTO `sys_oper_log` VALUES (91, '菜单管理', 3, 'com.heaven.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1063', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-09 13:12:14');
INSERT INTO `sys_oper_log` VALUES (92, '菜单管理', 3, 'com.heaven.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1061', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-09 13:12:18');
INSERT INTO `sys_oper_log` VALUES (93, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/100007', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 01:26:58');
INSERT INTO `sys_oper_log` VALUES (94, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100008,\"dictName\":\"aaa1\",\"dictType\":\"sysaaaa1\",\"params\":{},\"remark\":\"aaaa1\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 01:27:15');
INSERT INTO `sys_oper_log` VALUES (95, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"t1\",\"dictType\":\"sys_t1\",\"params\":{},\"remark\":\"t1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 12:19:19');
INSERT INTO `sys_oper_log` VALUES (96, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100011,\"dictName\":\"t11\",\"dictType\":\"sys_t11\",\"params\":{},\"remark\":\"t11\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 12:26:03');
INSERT INTO `sys_oper_log` VALUES (97, '岗位管理', 1, 'com.heaven.system.controller.SysPostController.add()', 'POST', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"1\",\"postId\":6,\"postName\":\"1\",\"postSort\":\"11\",\"remark\":\"11\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 12:54:21');
INSERT INTO `sys_oper_log` VALUES (98, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"12\",\"postId\":6,\"postName\":\"12\",\"postSort\":\"112\",\"remark\":\"112\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 12:54:30');
INSERT INTO `sys_oper_log` VALUES (99, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,119\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"4-1\",\"email\":\"505543479@qq.com\",\"leader\":\"11\",\"orderNum\":1,\"params\":{},\"parentId\":119,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 13:58:10');
INSERT INTO `sys_oper_log` VALUES (100, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":120,\"deptName\":\"4-11\",\"email\":\"505543479@qq.com\",\"leader\":\"111\",\"orderNum\":11,\"params\":{},\"parentId\":100,\"phone\":\"13716364671\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 14:00:20');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"11\",\"isFrame\":\"0\",\"menuName\":\"1\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"path\":\"http://11\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 14:40:02');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"111\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"11\",\"menuType\":\"M\",\"orderNum\":111,\"params\":{},\"path\":\"http://111\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 14:40:36');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 3, 'com.heaven.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1061', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 14:43:27');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'vicene', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"log/operateLog\",\"icon\":\"operateLog\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"operateLog(操作日志)\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":107,\"path\":\"operateLog\",\"perms\":\"system:operlog:list\",\"query\":\"operateLog\",\"status\":\"0\",\"visible\":\"0\"}', NULL, 1, 'system:menu:add', '2022-11-12 23:05:39');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"log/operateLog\",\"createBy\":\"admin\",\"icon\":\"operateLog\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"operateLog(操作日志)\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":107,\"path\":\"operateLog\",\"perms\":\"system:operlog:list\",\"query\":\"无\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-12 23:09:07');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:09:05');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:09:48');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:11:45');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:14:07');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:15:12');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:15:32');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:15:59');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:17:17');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:20:17');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.heaven.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/sys_oper_log', '127.0.0.1', '', NULL, NULL, 1, '', '2022-11-14 02:20:24');
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 1, 'com.heaven.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2,1,107],\"params\":{},\"remark\":\"1\",\"roleId\":3,\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 16:04:02');
INSERT INTO `sys_oper_log` VALUES (117, '角色管理', 1, 'com.heaven.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2,1,100,101,102,103,104,105,106,107,1062],\"params\":{},\"remark\":\"1\",\"roleId\":4,\"roleKey\":\"test2\",\"roleName\":\"测试角色2\",\"roleSort\":\"4\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 16:29:46');
INSERT INTO `sys_oper_log` VALUES (118, '角色管理', 2, 'com.heaven.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"remark\":\"1\",\"roleId\":4,\"roleKey\":\"test2\",\"roleName\":\"测试角色2\",\"roleSort\":\"4\",\"status\":\"0\",\"updateBy\":\"admin\"}', NULL, 1, '', '2022-11-14 21:00:11');
INSERT INTO `sys_oper_log` VALUES (119, '角色管理', 1, 'com.heaven.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[100,101,103,104,106,1062,107],\"params\":{},\"remark\":\"1\",\"roleId\":5,\"roleKey\":\"test3\",\"roleName\":\"测试角色3\",\"roleSort\":\"4\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 21:29:39');
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 2, 'com.heaven.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[107,1062,2],\"params\":{},\"remark\":\"4\",\"roleId\":5,\"roleKey\":\"test4\",\"roleName\":\"测试角色4\",\"roleSort\":\"5\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 21:36:46');
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 2, 'com.heaven.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[100,101],\"params\":{},\"remark\":\"4\",\"roleId\":5,\"roleKey\":\"test4\",\"roleName\":\"测试角色4\",\"roleSort\":\"5\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 22:32:08');
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 3, 'com.heaven.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-14 22:33:23');
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 2, 'com.heaven.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2,1,107],\"params\":{},\"remark\":\"1\",\"roleId\":3,\"roleKey\":\"test\",\"roleName\":\"测试角色\",\"roleSort\":\"3\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 15:07:35');
INSERT INTO `sys_oper_log` VALUES (124, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":110,\"email\":\"505543479@qq.com\",\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"13716364676\",\"postIds\":[4,3],\"remark\":\"1\",\"roleIds\":[5],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"test\"}', '{\"msg\":\"新增用户\'test\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-11-15 15:57:22');
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":101,\"email\":\"505543479@qq.com\",\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"13716364676\",\"postIds\":[4,3],\"remark\":\"11\",\"roleIds\":[5,2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"test\"}', '{\"msg\":\"新增用户\'test\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-11-15 15:58:33');
INSERT INTO `sys_oper_log` VALUES (126, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":101,\"email\":\"5055543479@qq.com\",\"nickName\":\"test\",\"params\":{},\"phonenumber\":\"13716364676\",\"postIds\":[2,3],\"remark\":\"1\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":3,\"userName\":\"testc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 15:59:56');
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"5055543471@qq.com\",\"nickName\":\"test1\",\"params\":{},\"phonenumber\":\"13716364671\",\"postIds\":[2,3,4],\"remark\":\"11\",\"roleIds\":[2,3],\"sex\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"testc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 19:23:17');
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505543479@qq.com\",\"nickName\":\"test1\",\"params\":{},\"phonenumber\":\"13716364646\",\"postIds\":[2,4],\"remark\":\"11\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"test1\"}', '{\"msg\":\"新增用户\'test1\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-11-15 19:37:08');
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505543479@qq.com\",\"nickName\":\"1111\",\"params\":{},\"phonenumber\":\"13716364676\",\"postIds\":[2],\"remark\":\"11\",\"roleIds\":[5],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"11111\"}', '{\"msg\":\"新增用户\'11111\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-11-15 19:40:38');
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"505443479@qq.com\",\"nickName\":\"test3\",\"params\":{},\"phonenumber\":\"13716364676\",\"postIds\":[4],\"remark\":\"111\",\"roleIds\":[2],\"sex\":\"2\",\"status\":\"0\",\"userId\":4,\"userName\":\"test3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 19:41:18');
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":105,\"email\":\"505543479@qq.com\",\"nickName\":\"Vicene\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"Vicene\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 19:44:03');
INSERT INTO `sys_oper_log` VALUES (132, '用户管理', 3, 'com.heaven.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 20:13:01');
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"111\",\"email\":\"505543479@qq.com\",\"leader\":\"111\",\"orderNum\":4,\"params\":{},\"phone\":\"13716364676\",\"status\":\"0\"}', NULL, 1, '', '2022-11-15 20:21:16');
INSERT INTO `sys_oper_log` VALUES (134, '字典类型', 1, 'com.heaven.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"test1\",\"dictType\":\"test_1\",\"params\":{},\"remark\":\"111\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:52:27');
INSERT INTO `sys_oper_log` VALUES (135, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100012,\"dictName\":\"test11\",\"dictType\":\"test_11\",\"params\":{},\"remark\":\"1111\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:52:46');
INSERT INTO `sys_oper_log` VALUES (136, '字典类型', 3, 'com.heaven.system.controller.SysDictTypeController.remove()', 'DELETE', 1, 'admin', NULL, '/dict/type/100012', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:52:50');
INSERT INTO `sys_oper_log` VALUES (137, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"121\",\"postId\":6,\"postName\":\"121\",\"postSort\":\"1121\",\"remark\":\"1121\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:53:06');
INSERT INTO `sys_oper_log` VALUES (138, '岗位管理', 3, 'com.heaven.system.controller.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/post/6', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:56:59');
INSERT INTO `sys_oper_log` VALUES (139, '岗位管理', 3, 'com.heaven.system.controller.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/post/5,4', '127.0.0.1', '', NULL, NULL, 1, '普通员工已分配,不能删除', '2022-11-15 23:57:12');
INSERT INTO `sys_oper_log` VALUES (140, '部门管理', 1, 'com.heaven.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"email\":\"505543479@qq.com\",\"leader\":\"li\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"13716364676\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:57:52');
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":121,\"deptName\":\"测试部门1\",\"email\":\"505543471@qq.com\",\"leader\":\"li1\",\"orderNum\":11,\"params\":{},\"parentId\":100,\"phone\":\"13716364671\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:58:11');
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 3, 'com.heaven.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/121', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:58:24');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"11\",\"createBy\":\"admin\",\"icon\":\"11\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"新菜单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"path\":\"11\",\"perms\":\"11\",\"query\":\"11\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-15 23:59:13');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"11\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"new(新菜单)\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"path\":\"11\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:00:10');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"11\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"new1111(新菜单)\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"path\":\"11\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:00:38');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"11\",\"icon\":\"11\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"new1111(新菜单)\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"path\":\"11\",\"perms\":\"11\",\"query\":\"11\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:00:45');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.heaven.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1063', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:01:29');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.heaven.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"a\",\"isFrame\":\"1\",\"menuName\":\"new(目录)\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"path\":\"11\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:02:01');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"11\",\"icon\":\"a\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"new(目录)\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"path\":\"11\",\"perms\":\"1\",\"query\":\"11\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:02:33');
INSERT INTO `sys_oper_log` VALUES (150, '角色管理', 1, 'com.heaven.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1,100,101,102,103,104,105,106],\"params\":{},\"remark\":\"11\",\"roleId\":6,\"roleKey\":\"13123\",\"roleName\":\"测试角色5\",\"roleSort\":\"5\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:08:38');
INSERT INTO `sys_oper_log` VALUES (151, '角色管理', 2, 'com.heaven.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[100,101,103],\"params\":{},\"remark\":\"11\",\"roleId\":6,\"roleKey\":\"13123\",\"roleName\":\"测试角色5\",\"roleSort\":\"9\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:08:55');
INSERT INTO `sys_oper_log` VALUES (152, '角色管理', 3, 'com.heaven.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/6', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:09:08');
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"505442437@qq.com\",\"nickName\":\"测试2\",\"params\":{},\"phonenumber\":\"13616364676\",\"postIds\":[2,3],\"remark\":\"11\",\"roleIds\":[2,5],\"sex\":\"1\",\"status\":\"1\",\"userId\":5,\"userName\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:09:47');
INSERT INTO `sys_oper_log` VALUES (154, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505442431@qq.com\",\"nickName\":\"测试2111\",\"params\":{},\"phonenumber\":\"13616364671\",\"postIds\":[2,3,4],\"remark\":\"1111\",\"roleIds\":[2,5,3],\"sex\":\"1\",\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":5,\"userName\":\"测试2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:10:07');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.heaven.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/1064', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:12:11');
INSERT INTO `sys_oper_log` VALUES (156, '用户管理', 3, 'com.heaven.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/4,5', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:15:23');
INSERT INTO `sys_oper_log` VALUES (157, '角色管理', 2, 'com.heaven.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[100,101,102],\"params\":{},\"remark\":\"4\",\"roleId\":5,\"roleKey\":\"test4\",\"roleName\":\"测试角色4\",\"roleSort\":\"5\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:31:15');
INSERT INTO `sys_oper_log` VALUES (158, '角色管理', 2, 'com.heaven.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[100,101,102],\"params\":{},\"remark\":\"46\",\"roleId\":5,\"roleKey\":\"test4\",\"roleName\":\"测试角色46\",\"roleSort\":\"5\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:39:47');
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":105,\"email\":\"505543479@qq.com\",\"nickName\":\"Vicene1\",\"params\":{},\"phonenumber\":\"15666666661\",\"postIds\":[2],\"remark\":\"测试员1\",\"roleIds\":[2],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"Vicene\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:39:57');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.heaven.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"icon\":\"welcome\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"welcome(欢迎)\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"path\":\"welcome\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:40:10');
INSERT INTO `sys_oper_log` VALUES (161, '部门管理', 3, 'com.heaven.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/119', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:40:17');
INSERT INTO `sys_oper_log` VALUES (162, '部门管理', 3, 'com.heaven.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/118', '127.0.0.1', '', NULL, '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2022-11-16 00:40:23');
INSERT INTO `sys_oper_log` VALUES (163, '部门管理', 2, 'com.heaven.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,118,111\",\"children\":[],\"deptId\":117,\"deptName\":\"南昌公司-01-011\",\"email\":\"505543479@qq.com\",\"leader\":\"南昌公司-01-011\",\"orderNum\":1,\"params\":{},\"parentId\":111,\"phone\":\"13716364676\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:40:39');
INSERT INTO `sys_oper_log` VALUES (164, '岗位管理', 2, 'com.heaven.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"flag\":false,\"params\":{},\"postCode\":\"pm1\",\"postId\":5,\"postName\":\"产品经理111\",\"postSort\":\"51\",\"remark\":\"产品经理111\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:40:48');
INSERT INTO `sys_oper_log` VALUES (165, '字典类型', 2, 'com.heaven.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"dictId\":100011,\"dictName\":\"t111\",\"dictType\":\"sys_t11\",\"params\":{},\"remark\":\"t111\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 00:40:55');
INSERT INTO `sys_oper_log` VALUES (166, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"50553444@qq.com\",\"nickName\":\"test1\",\"params\":{},\"phonenumber\":\"1371636476\",\"postIds\":[2],\"roleIds\":[5,2],\"sex\":\"0\",\"status\":\"0\",\"userId\":6,\"userName\":\"lwj\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 11:00:57');
INSERT INTO `sys_oper_log` VALUES (167, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"555544449@qq.com\",\"nickName\":\"test2\",\"params\":{},\"phonenumber\":\"13716364676\",\"postIds\":[2],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"lwj\"}', '{\"msg\":\"新增用户\'lwj\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2022-11-16 11:01:32');
INSERT INTO `sys_oper_log` VALUES (168, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"505543478@qq.com\",\"nickName\":\"aa\",\"params\":{},\"phonenumber\":\"13716334676\",\"postIds\":[2],\"remark\":\"1\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":7,\"userName\":\"来我家\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 11:03:05');
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505543478@qq.com\",\"nickName\":\"帅的一笔\",\"params\":{},\"phonenumber\":\"13716334676\",\"postIds\":[2],\"remark\":\"1\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"来我家\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 11:03:19');
INSERT INTO `sys_oper_log` VALUES (170, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"50553444@qq.com\",\"nickName\":\"抽的一笔\",\"params\":{},\"phonenumber\":\"1371636476\",\"postIds\":[2],\"remark\":\"\",\"roleIds\":[2,5],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":6,\"userName\":\"lwj\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 11:03:30');
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"505543447@qq.com\",\"nickName\":\"牛的一笔\",\"params\":{},\"phonenumber\":\"1371634763\",\"postIds\":[2],\"remark\":\"1\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":8,\"userName\":\"test5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 11:04:10');
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505543479@qq.com\",\"nickName\":\"猛犸付款最帅\",\"params\":{},\"phonenumber\":\"13716364676\",\"postIds\":[2],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"mengma\"}', '{\"msg\":\"新增用户\'mengma\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2022-11-16 11:04:51');
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"547895055@qq.com\",\"nickName\":\"猛犸付款最帅\",\"params\":{},\"phonenumber\":\"13346670602\",\"postIds\":[2],\"remark\":\"11\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":9,\"userName\":\"mengma2022\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 11:05:34');
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 1, 'com.heaven.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"505544247@qq.com\",\"nickName\":\"笑傲江湖\",\"params\":{},\"phonenumber\":\"13716364674\",\"postIds\":[2],\"remark\":\"1\",\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":10,\"userName\":\"test8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 11:06:17');
INSERT INTO `sys_oper_log` VALUES (175, '登录日志', 3, 'com.heaven.system.controller.SysLogininforController.remove()', 'DELETE', 1, 'admin', NULL, '/logininfor/101,102', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 14:46:49');
INSERT INTO `sys_oper_log` VALUES (176, '数据源管理', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-16 23:35:37');
INSERT INTO `sys_oper_log` VALUES (177, '数据源管理', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-16 23:36:11');
INSERT INTO `sys_oper_log` VALUES (178, '数据源管理', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-16 23:36:40');
INSERT INTO `sys_oper_log` VALUES (179, '数据源管理', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-16 23:36:50');
INSERT INTO `sys_oper_log` VALUES (180, '数据源管理', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-16 23:37:15');
INSERT INTO `sys_oper_log` VALUES (181, '数据源管理', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-16 23:38:19');
INSERT INTO `sys_oper_log` VALUES (182, '数据源管理', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"id\":1,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-16 23:39:56');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"sys_config\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 00:19:21');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 00:21:58');
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 00:22:03');
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 00:22:32');
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 8, 'com.heaven.gen.controller.GenController.download()', 'GET', 1, 'admin', NULL, '/gen/download/sys_config', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 00:23:52');
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 8, 'com.heaven.gen.controller.GenController.download()', 'GET', 1, 'admin', NULL, '/gen/download/sys_config', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 00:23:58');
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"data_converge_source\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 00:25:04');
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 8, 'com.heaven.gen.controller.GenController.download()', 'GET', 1, 'admin', NULL, '/gen/download/data_converge_source', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 00:25:12');
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"sys_dict_data,sys_dict_type\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 17:03:08');
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 2, 'com.heaven.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/sys_config', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 17:30:40');
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 2, 'com.heaven.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/data_converge_source', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 17:31:01');
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.heaven.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/data_converge_source', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-17 17:32:39');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 17:43:32');
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 17:43:36');
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 17:43:39');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 17:44:14');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 17:44:18');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 18:17:34');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 18:20:37');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 18:27:13');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 18:42:58');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 18:43:19');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:01:24');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:04:05');
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:15:27');
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:16:21');
INSERT INTO `sys_oper_log` VALUES (209, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:19:55');
INSERT INTO `sys_oper_log` VALUES (210, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:21:35');
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:23:00');
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:23:50');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:35:21');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:43:18');
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 19:44:06');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:01:50');
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:01:53');
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:02:05');
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:02:45');
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:04:47');
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:04:58');
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:13:00');
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:15:32');
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:21:36');
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:25:37');
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-17 20:26:31');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-18 00:27:25');
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"sys_role_dept\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-18 00:43:25');
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"sys_post\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-18 00:48:12');
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 2, 'com.heaven.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/sys_config', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-19 14:47:49');
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":true,\"functionAuthor\":\"heaven\",\"functionName\":\"111111\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.heaven.system\",\"params\":{},\"sub\":false,\"tableComment\":\"1111\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"crud\",\"tree\":false}', NULL, 1, '', '2022-11-19 20:28:41');
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":true,\"functionAuthor\":\"heaven\",\"functionName\":\"1\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.heaven.system\",\"params\":{},\"sub\":false,\"tableComment\":\"1\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"crud\",\"tree\":false}', NULL, 1, '', '2022-11-19 20:31:10');
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 2, 'com.heaven.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/data_converge_source', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-19 20:45:01');
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":false,\"functionAuthor\":\"heaven\",\"functionName\":\"菜单数据源\",\"genType\":\"0\",\"moduleName\":\"dataconverge\",\"packageName\":\"com.heaven.data\",\"params\":{},\"parentMenuId\":\"3\",\"remark\":\"数据模块-数据汇聚-数据源表\",\"sub\":false,\"tableComment\":\"数据模块-数据汇聚-数据源表\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"tree\",\"tree\":true}', NULL, 1, '树编码字段不能为空', '2022-11-19 20:51:39');
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":false,\"functionAuthor\":\"heaven\",\"functionName\":\"菜单数据源\",\"genType\":\"0\",\"moduleName\":\"system\",\"packageName\":\"com.heaven.system\",\"params\":{},\"parentMenuId\":\"3\",\"remark\":\"数据模块-数据汇聚-数据源表\",\"sub\":false,\"tableComment\":\"数据模块-数据汇聚-数据源表\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"tree\",\"tree\":true}', NULL, 1, '树编码字段不能为空', '2022-11-19 21:15:15');
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":false,\"functionAuthor\":\"heaven\",\"functionName\":\"菜单数据源\",\"genType\":\"0\",\"moduleName\":\"system\",\"packageName\":\"com.heaven.system\",\"params\":{},\"parentMenuId\":\"3\",\"remark\":\"数据模块-数据汇聚-数据源表\",\"sub\":false,\"tableComment\":\"数据模块-数据汇聚-数据源表\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"tree\",\"tree\":true}', NULL, 1, '树编码字段不能为空', '2022-11-19 21:15:28');
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":false,\"functionAuthor\":\"heaven\",\"functionName\":\"数据源表\",\"genType\":\"0\",\"moduleName\":\"dataconverge\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"treeParentCode\\\":\\\"parent_id\\\",\\\"treeName\\\":\\\"converge_source_name\\\"}\",\"packageName\":\"com.heaven.data\",\"params\":{\"treeCode\":\"id\",\"treeParentCode\":\"parent_id\",\"treeName\":\"converge_source_name\"},\"parentMenuId\":\"3\",\"remark\":\"数据模块-数据汇聚-数据源表\",\"sub\":false,\"tableComment\":\"数据模块-数据汇聚-数据源表\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"tree\",\"tree\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-19 21:17:06');
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"config\",\"className\":\"SysConfig\",\"crud\":true,\"functionAuthor\":\"heaven\",\"functionName\":\"参数配置\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.heaven.system\",\"params\":{},\"sub\":false,\"tableComment\":\"参数配置表\",\"tableId\":1,\"tableName\":\"sys_config\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-19 21:23:59');
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":false,\"functionAuthor\":\"heaven\",\"functionName\":\"数据源表\",\"genType\":\"0\",\"moduleName\":\"dataconverge\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"treeParentCode\\\":\\\"parent_id\\\",\\\"treeName\\\":\\\"converge_source_name\\\",\\\"parentMenuId\\\":\\\"converge_source_name\\\"}\",\"packageName\":\"com.heaven.data\",\"params\":{\"treeCode\":\"id\",\"treeParentCode\":\"parent_id\",\"treeName\":\"converge_source_name\",\"parentMenuId\":\"converge_source_name\"},\"remark\":\"数据模块-数据汇聚-数据源表\",\"sub\":false,\"tableComment\":\"数据模块-数据汇聚-数据源表\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"tree\",\"tree\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-19 21:25:10');
INSERT INTO `sys_oper_log` VALUES (240, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"config\",\"className\":\"SysConfig\",\"crud\":true,\"functionAuthor\":\"heaven\",\"functionName\":\"参数配置\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.heaven.system\",\"params\":{},\"sub\":false,\"tableComment\":\"参数配置表\",\"tableId\":1,\"tableName\":\"sys_config\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-19 21:25:43');
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":false,\"functionAuthor\":\"heaven\",\"functionName\":\"数据源表\",\"genType\":\"0\",\"moduleName\":\"dataconverge\",\"options\":\"{\\\"treeCode\\\":\\\"id\\\",\\\"treeParentCode\\\":\\\"parent_id\\\",\\\"treeName\\\":\\\"converge_source_name\\\",\\\"parentMenuId\\\":3}\",\"packageName\":\"com.heaven.data\",\"params\":{\"treeCode\":\"id\",\"treeParentCode\":\"parent_id\",\"treeName\":\"converge_source_name\",\"parentMenuId\":3},\"remark\":\"数据模块-数据汇聚-数据源表\",\"sub\":false,\"tableComment\":\"数据模块-数据汇聚-数据源表\",\"tableId\":2,\"tableName\":\"data_converge_source\",\"tplCategory\":\"tree\",\"tree\":true}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-19 21:26:15');
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSaveColumn()', 'PUT', 1, 'admin', NULL, '/gen/column', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-20 16:02:35');
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSaveColumn()', 'PUT', 1, 'admin', NULL, '/gen/column', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-20 16:06:32');
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSaveColumn()', 'PUT', 1, 'admin', NULL, '/gen/column', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-20 16:10:07');
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 3, 'com.heaven.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 18:59:48');
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"data_converge_source\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 19:00:07');
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 3, 'com.heaven.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/7', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 19:03:17');
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"data_converge_source\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 19:13:42');
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"source\",\"className\":\"DataConvergeSource\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"数据源\",\"genType\":\"0\",\"moduleName\":\"source\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataconverge\",\"params\":{},\"remark\":\"\",\"sub\":false,\"tableComment\":\"数据源表\",\"tableId\":8,\"tableName\":\"data_converge_source\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-21 19:16:47');
INSERT INTO `sys_oper_log` VALUES (250, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-21 19:16:54');
INSERT INTO `sys_oper_log` VALUES (251, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (252, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (253, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (254, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/5', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (255, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (256, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (257, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (258, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/6', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (259, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/8', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (260, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (261, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (262, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/7', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (263, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/5', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (264, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/6', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (265, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/7', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (266, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/8', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:35:42');
INSERT INTO `sys_oper_log` VALUES (267, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:46:06');
INSERT INTO `sys_oper_log` VALUES (268, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:46:06');
INSERT INTO `sys_oper_log` VALUES (269, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:46:06');
INSERT INTO `sys_oper_log` VALUES (270, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/5', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:46:06');
INSERT INTO `sys_oper_log` VALUES (271, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:46:06');
INSERT INTO `sys_oper_log` VALUES (272, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:46:07');
INSERT INTO `sys_oper_log` VALUES (273, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:46:07');
INSERT INTO `sys_oper_log` VALUES (274, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:46:07');
INSERT INTO `sys_oper_log` VALUES (275, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:46:07');
INSERT INTO `sys_oper_log` VALUES (276, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/5', '127.0.0.1', '', NULL, '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-23 20:46:07');
INSERT INTO `sys_oper_log` VALUES (277, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:48:45');
INSERT INTO `sys_oper_log` VALUES (278, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:49:23');
INSERT INTO `sys_oper_log` VALUES (279, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-23 20:50:31');
INSERT INTO `sys_oper_log` VALUES (280, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"jdbc-data-provider\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-24 15:17:12');
INSERT INTO `sys_oper_log` VALUES (281, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"jdbc-data-provider\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\",\"type\":\"JDBC\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-24 16:00:50');
INSERT INTO `sys_oper_log` VALUES (282, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-24 16:03:12');
INSERT INTO `sys_oper_log` VALUES (283, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-24 16:08:06');
INSERT INTO `sys_oper_log` VALUES (284, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-24 16:14:25');
INSERT INTO `sys_oper_log` VALUES (285, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-24 16:16:44');
INSERT INTO `sys_oper_log` VALUES (286, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-24 16:17:57');
INSERT INTO `sys_oper_log` VALUES (287, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root111\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-24 16:18:55');
INSERT INTO `sys_oper_log` VALUES (288, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root111\"},\"sourceType\":\"JDBC\"}', NULL, 1, 'java.sql.SQLException: Access denied for user \'root111\'@\'192.168.24.1\' (using password: YES)', '2022-11-24 16:20:52');
INSERT INTO `sys_oper_log` VALUES (289, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"MYSQL\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root111\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-11-24 16:27:00');
INSERT INTO `sys_oper_log` VALUES (290, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root111\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-11-24 16:36:03');
INSERT INTO `sys_oper_log` VALUES (291, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root111\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-11-24 16:36:36');
INSERT INTO `sys_oper_log` VALUES (292, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root111\"},\"sourceType\":\"JDBC\"}', NULL, 1, '没有对应驱动异常', '2022-11-24 16:37:36');
INSERT INTO `sys_oper_log` VALUES (293, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchemas\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root111\"},\"sourceType\":\"JDBC\"}', NULL, 1, '没有对应驱动异常', '2022-11-24 19:51:10');
INSERT INTO `sys_oper_log` VALUES (294, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', NULL, 1, '没有对应驱动异常', '2022-11-24 20:08:21');
INSERT INTO `sys_oper_log` VALUES (295, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', NULL, 1, '没有对应驱动异常', '2022-11-24 20:08:39');
INSERT INTO `sys_oper_log` VALUES (296, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', NULL, 1, '没有对应驱动异常', '2022-11-24 20:14:43');
INSERT INTO `sys_oper_log` VALUES (297, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"data_converge_business_section,data_converge_business_source\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-24 23:57:53');
INSERT INTO `sys_oper_log` VALUES (298, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-24 23:58:01');
INSERT INTO `sys_oper_log` VALUES (299, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"businessSection\",\"className\":\"DataConvergeBusinessSource\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"业务板块与数据源关联\",\"genType\":\"0\",\"moduleName\":\"dataconverge\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataconverge\",\"params\":{},\"sub\":false,\"tableComment\":\"业务板块与数据源关联表\",\"tableId\":10,\"tableName\":\"data_converge_business_source\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-24 23:59:33');
INSERT INTO `sys_oper_log` VALUES (300, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-24 23:59:35');
INSERT INTO `sys_oper_log` VALUES (301, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-25 00:01:29');
INSERT INTO `sys_oper_log` VALUES (302, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"businessSection\",\"className\":\"DataConvergeBusinessSection\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"业务板块与数据源关联\",\"genType\":\"0\",\"moduleName\":\"dataconverge\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataconverge\",\"params\":{},\"sub\":false,\"tableComment\":\"业务板块与数据源关联表\",\"tableId\":10,\"tableName\":\"data_converge_business_source\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 00:02:39');
INSERT INTO `sys_oper_log` VALUES (303, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-25 00:02:40');
INSERT INTO `sys_oper_log` VALUES (304, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"businessSource\",\"className\":\"DataConvergeBusinessSource\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"业务板块与数据源关联\",\"genType\":\"0\",\"moduleName\":\"dataconverge\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataconverge\",\"params\":{},\"sub\":false,\"tableComment\":\"业务板块与数据源关联表\",\"tableId\":10,\"tableName\":\"data_converge_business_source\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 00:05:56');
INSERT INTO `sys_oper_log` VALUES (305, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-25 00:06:06');
INSERT INTO `sys_oper_log` VALUES (306, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-25 00:06:26');
INSERT INTO `sys_oper_log` VALUES (307, '业务板块与数据源关联', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"params\":{},\"remark\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessSectionMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessSectionMapper.insertDataConvergeBusinessSection-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_source\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2022-11-25 15:18:47');
INSERT INTO `sys_oper_log` VALUES (308, '业务板块与数据源关联', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"params\":{},\"remark\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessSectionMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessSectionMapper.insertDataConvergeBusinessSection-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_source\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2022-11-25 15:18:54');
INSERT INTO `sys_oper_log` VALUES (309, '业务板块与数据源关联', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"params\":{},\"remark\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessSectionMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessSectionMapper.insertDataConvergeBusinessSection-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_source\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2022-11-25 15:20:15');
INSERT INTO `sys_oper_log` VALUES (310, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-25 15:21:58');
INSERT INTO `sys_oper_log` VALUES (311, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"BusinessSection\",\"className\":\"DataConvergeBusinessSection\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"数据模块-数据汇聚-业务板块\",\"genType\":\"0\",\"moduleName\":\"BusinessSection\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataconverge\",\"params\":{},\"sub\":false,\"tableComment\":\"数据模块-数据汇聚-业务板块\",\"tableId\":9,\"tableName\":\"data_converge_business_section\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 15:23:16');
INSERT INTO `sys_oper_log` VALUES (312, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-25 15:23:19');
INSERT INTO `sys_oper_log` VALUES (313, '数据模块-数据汇聚-业务板块', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"createTime\":\"2022-11-25 15:29:14.055\",\"id\":1,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 15:29:14');
INSERT INTO `sys_oper_log` VALUES (314, '数据模块-数据汇聚-业务板块', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"createTime\":\"2022-11-25 15:29:27.963\",\"id\":2,\"name\":\"2\",\"orderNum\":2,\"params\":{},\"remark\":\"2\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 15:29:27');
INSERT INTO `sys_oper_log` VALUES (315, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"name\":\"23\",\"orderNum\":23,\"params\":{},\"remark\":\"23\",\"status\":\"0\",\"updateTime\":\"2022-11-25 15:31:40.529\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-25 15:31:40');
INSERT INTO `sys_oper_log` VALUES (316, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"name\":\"23\",\"orderNum\":23,\"params\":{},\"remark\":\"23\",\"status\":\"0\",\"updateTime\":\"2022-11-25 15:31:46.177\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-25 15:31:46');
INSERT INTO `sys_oper_log` VALUES (317, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"name\":\"12\",\"orderNum\":12,\"params\":{},\"remark\":\"12\",\"status\":\"1\",\"updateTime\":\"2022-11-25 15:33:52.287\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-25 15:33:52');
INSERT INTO `sys_oper_log` VALUES (318, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"name\":\"12\",\"orderNum\":12,\"params\":{},\"remark\":\"12\",\"status\":\"1\",\"updateTime\":\"2022-11-25 15:33:57.658\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-25 15:33:57');
INSERT INTO `sys_oper_log` VALUES (319, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"name\":\"12\",\"orderNum\":12,\"params\":{},\"remark\":\"12\",\"status\":\"1\",\"updateTime\":\"2022-11-25 15:34:14.25\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-25 15:34:14');
INSERT INTO `sys_oper_log` VALUES (320, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"name\":\"11\",\"orderNum\":1,\"params\":{},\"remark\":\"1\",\"status\":\"0\",\"updateTime\":\"2022-11-25 15:34:46.772\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-11-25 15:35:00');
INSERT INTO `sys_oper_log` VALUES (321, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"id\":1,\"name\":\"11\",\"orderNum\":11,\"params\":{},\"remark\":\"11\",\"status\":\"1\",\"updateTime\":\"2022-11-25 15:35:47.777\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 15:35:55');
INSERT INTO `sys_oper_log` VALUES (322, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"id\":1,\"name\":\"11\",\"orderNum\":11,\"params\":{},\"remark\":\"11\",\"status\":\"1\",\"updateTime\":\"2022-11-25 15:36:01.547\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 15:36:04');
INSERT INTO `sys_oper_log` VALUES (323, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"id\":1,\"name\":\"11去\",\"orderNum\":111,\"params\":{},\"remark\":\"111\",\"status\":\"0\",\"updateTime\":\"2022-11-25 15:37:40.867\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 15:37:44');
INSERT INTO `sys_oper_log` VALUES (324, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"id\":1,\"name\":\"营销板块\",\"orderNum\":1,\"params\":{},\"remark\":\"这是营销板块\",\"status\":\"0\",\"updateTime\":\"2022-11-25 17:31:28.286\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:31:31');
INSERT INTO `sys_oper_log` VALUES (325, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"id\":2,\"name\":\"举报板块\",\"orderNum\":2,\"params\":{},\"remark\":\"这是举报板块\",\"status\":\"0\",\"updateTime\":\"2022-11-25 17:40:47.492\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 17:40:47');
INSERT INTO `sys_oper_log` VALUES (326, '数据模块-数据汇聚-业务板块', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"createTime\":\"2022-11-25 19:30:25.343\",\"id\":3,\"name\":\"地产板块\",\"orderNum\":3,\"params\":{},\"remark\":\"这是地产板块\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 19:30:25');
INSERT INTO `sys_oper_log` VALUES (327, '数据模块-数据汇聚-业务板块', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"createTime\":\"2022-11-25 19:30:42.911\",\"id\":4,\"name\":\"金融板块\",\"orderNum\":4,\"params\":{},\"remark\":\"这是金融板块\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 19:30:42');
INSERT INTO `sys_oper_log` VALUES (328, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"id\":4,\"name\":\"金融板块\",\"orderNum\":4,\"params\":{},\"remark\":\"这是金融板块\",\"status\":\"1\",\"updateTime\":\"2022-11-25 19:30:48.999\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 19:30:48');
INSERT INTO `sys_oper_log` VALUES (329, '数据模块-数据汇聚-业务板块', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.edit()', 'PUT', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"id\":4,\"name\":\"金融板块\",\"orderNum\":4,\"params\":{},\"remark\":\"这是金融板块\",\"status\":\"0\",\"updateTime\":\"2022-11-25 19:31:09.877\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 19:31:09');
INSERT INTO `sys_oper_log` VALUES (330, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 19:56:54');
INSERT INTO `sys_oper_log` VALUES (331, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 19:57:04');
INSERT INTO `sys_oper_log` VALUES (332, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 19:57:17');
INSERT INTO `sys_oper_log` VALUES (333, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 19:59:06');
INSERT INTO `sys_oper_log` VALUES (334, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 20:03:14');
INSERT INTO `sys_oper_log` VALUES (335, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 20:11:18');
INSERT INTO `sys_oper_log` VALUES (336, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 20:47:07');
INSERT INTO `sys_oper_log` VALUES (337, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 20:47:59');
INSERT INTO `sys_oper_log` VALUES (338, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"aaaaaaaaa1\",\"properties\":{\"dbType\":\"HIVE\",\"driverClass\":\"org.apache.hive.jdbc.HiveDriver\",\"enableSpecialSQL\":false,\"enableSyncSchema\":true,\"properties\":{},\"serverAggregate\":false,\"syncInterval\":\"1\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"user\":\"root\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-25 21:46:17');
INSERT INTO `sys_oper_log` VALUES (339, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"dbType\\\":\\\"MYSQL\\\",\\\"driverClass\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSpecialSQL\\\":true,\\\"enableSyncSchemas\\\":false,\\\"password\\\":\\\"1\\\",\\\"serverAggregate\\\":true,\\\"syncInterval\\\":\\\"1\\\",\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"user\\\":\\\"1\\\",\\\"properties\\\":{\\\"a\\\":\\\"1\\\",\\\"bb\\\":\\\"abv\\\"}}\",\"createTime\":\"2022-11-25 23:19:14.553\",\"id\":22,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 23:19:14');
INSERT INTO `sys_oper_log` VALUES (340, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"10\\\",\\\"url\\\":\\\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\\\",\\\"enableSpecialSQL\\\":true,\\\"password\\\":\\\"8SXo8VjsdCL5CAtPGxqKHw==\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{\\\"a\\\":\\\"1\\\",\\\"b\\\":\\\"abc\\\"}}\",\"createTime\":\"2022-11-25 23:35:36.986\",\"id\":23,\"name\":\"正式数据源mysql\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 23:35:37');
INSERT INTO `sys_oper_log` VALUES (341, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/22', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 23:35:53');
INSERT INTO `sys_oper_log` VALUES (342, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[2,3],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":true,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{\\\"a\\\":\\\"1\\\"}}\",\"createTime\":\"2022-11-25 23:53:52.458\",\"id\":24,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 23:53:52');
INSERT INTO `sys_oper_log` VALUES (343, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":true,\\\"password\\\":\\\"_encrypted_NOCO44pyYCkTkR6xRonjrw==\\\",\\\"enableSyncSchemas\\\":true,\\\"properties\\\":{\\\"a\\\":\\\"1\\\"}}\",\"createTime\":\"2022-11-25 23:55:24.842\",\"id\":25,\"name\":\"2\",\"orderNum\":2,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 23:55:24');
INSERT INTO `sys_oper_log` VALUES (344, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":true,\\\"password\\\":\\\"_encrypted_NOCO44pyYCkTkR6xRonjrw==\\\",\\\"enableSyncSchemas\\\":true,\\\"properties\\\":{\\\"a\\\":\\\"1\\\"}}\",\"createTime\":\"2022-11-25 23:56:36.906\",\"id\":26,\"name\":\"2\",\"orderNum\":2,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-25 23:57:46');
INSERT INTO `sys_oper_log` VALUES (345, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2,4,3],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":true,\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":true,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":true,\\\"properties\\\":{\\\"a\\\":\\\"2\\\",\\\"啊\\\":\\\"1\\\"},\\\"username\\\":\\\"1\\\"}\",\"createTime\":\"2022-11-26 00:02:10.247\",\"id\":27,\"name\":\"3\",\"orderNum\":3,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 00:02:19');
INSERT INTO `sys_oper_log` VALUES (346, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":true,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:11:19.509\",\"id\":28,\"name\":\"3-27\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:11:19');
INSERT INTO `sys_oper_log` VALUES (347, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2,3],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:13:02.435\",\"id\":29,\"name\":\"3-28\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:13:02');
INSERT INTO `sys_oper_log` VALUES (348, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[2,1],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:14:45.864\",\"id\":30,\"name\":\"3-29\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:14:45');
INSERT INTO `sys_oper_log` VALUES (349, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:17:20.083\",\"id\":31,\"name\":\"11\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:17:20');
INSERT INTO `sys_oper_log` VALUES (350, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1],\"childType\":\"ORACLE\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:oracle:thin:@\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"oracle.jdbc.driver.OracleDriver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:17:44.73\",\"id\":32,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:17:44');
INSERT INTO `sys_oper_log` VALUES (351, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,3],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:26:28.176\",\"id\":33,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:26:28');
INSERT INTO `sys_oper_log` VALUES (352, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:30:57.206\",\"id\":34,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:30:57');
INSERT INTO `sys_oper_log` VALUES (353, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:33:19.535\",\"id\":35,\"name\":\"1\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:33:19');
INSERT INTO `sys_oper_log` VALUES (354, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:34:59.167\",\"id\":36,\"name\":\"2\",\"orderNum\":2,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:34:59');
INSERT INTO `sys_oper_log` VALUES (355, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"2\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_b8806wFp2LpF/lpf4KSDJA==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"2\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 03:36:17.453\",\"id\":37,\"name\":\"2\",\"orderNum\":2,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:36:17');
INSERT INTO `sys_oper_log` VALUES (356, '数据模块-数据汇聚-业务板块', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"createTime\":\"2022-11-26 03:43:43.236\",\"name\":\"策略板块\",\"orderNum\":5,\"params\":{},\"remark\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessSectionMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessSectionMapper.insertDataConvergeBusinessSection-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_section          ( name,             order_num,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2022-11-26 03:43:43');
INSERT INTO `sys_oper_log` VALUES (357, '数据模块-数据汇聚-业务板块', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"createTime\":\"2022-11-26 03:44:44.577\",\"name\":\"1\",\"orderNum\":1,\"params\":{},\"remark\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessSectionMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessSectionMapper.insertDataConvergeBusinessSection-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_section          ( name,             order_num,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2022-11-26 03:44:44');
INSERT INTO `sys_oper_log` VALUES (358, '数据模块-数据汇聚-业务板块', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessSectionController.add()', 'POST', 1, 'admin', NULL, '/businessSection', '127.0.0.1', '', '{\"createTime\":\"2022-11-26 03:45:19.07\",\"id\":5,\"name\":\"策略板块\",\"orderNum\":1,\"params\":{},\"remark\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 03:45:19');
INSERT INTO `sys_oper_log` VALUES (359, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 11:17:55.413\",\"id\":38,\"name\":\"测试mysql\",\"orderNum\":1,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 11:17:55');
INSERT INTO `sys_oper_log` VALUES (360, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,4,3],\"childType\":\"ORACLE\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:oracle:thin:@\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"oracle.jdbc.driver.OracleDriver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 11:19:19.074\",\"id\":39,\"name\":\"测试oracle\",\"orderNum\":2,\"params\":{},\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 11:19:19');
INSERT INTO `sys_oper_log` VALUES (361, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,4,3,2,5],\"childType\":\"SPARK\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:hive2://\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"org.apache.hive.jdbc.HiveDriver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 12:21:01.32\",\"id\":40,\"name\":\"测试spark\",\"orderNum\":3,\"params\":{},\"remark\":\"111\",\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 12:21:01');
INSERT INTO `sys_oper_log` VALUES (362, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1],\"childType\":\"DB2\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:db2://1\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.ibm.db2.jdbc.jcc.DB2Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 12:22:15.786\",\"id\":41,\"name\":\"测试DB2\",\"orderNum\":4,\"params\":{},\"remark\":\"1\",\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 12:22:15');
INSERT INTO `sys_oper_log` VALUES (363, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/41', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 13:08:44');
INSERT INTO `sys_oper_log` VALUES (364, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/40', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 13:11:23');
INSERT INTO `sys_oper_log` VALUES (365, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"HIVE\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:hive2://1\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"org.apache.hive.jdbc.HiveDriver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 13:26:03.091\",\"id\":45,\"name\":\"测试HIVE\",\"orderNum\":8,\"params\":{},\"remark\":\"1\",\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 13:26:03');
INSERT INTO `sys_oper_log` VALUES (366, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"测试mysql\",\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"2\"}', NULL, 1, '', '2022-11-26 19:38:41');
INSERT INTO `sys_oper_log` VALUES (367, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"测试mysql\",\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"2\"}', NULL, 1, '', '2022-11-26 19:39:46');
INSERT INTO `sys_oper_log` VALUES (368, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"测试mysql\",\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"2\"}', NULL, 1, '', '2022-11-26 19:41:40');
INSERT INTO `sys_oper_log` VALUES (369, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"测试mysql\",\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"2\"}', NULL, 1, '', '2022-11-26 19:47:27');
INSERT INTO `sys_oper_log` VALUES (370, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"测试mysql123\",\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-26 20:11:17');
INSERT INTO `sys_oper_log` VALUES (371, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"name\":\"测试mysql123\",\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-26 20:11:38');
INSERT INTO `sys_oper_log` VALUES (372, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,3],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 20:13:42.202\",\"id\":49,\"name\":\"测试mysql3\",\"orderNum\":21,\"params\":{},\"remark\":\"11\",\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 20:13:42');
INSERT INTO `sys_oper_log` VALUES (373, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://hadoop102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_8SXo8VjsdCL5CAtPGxqKHw==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{\\\"maxActive\\\":\\\"10\\\"},\\\"username\\\":\\\"root\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-26 20:15:02.448\",\"id\":50,\"name\":\"测试mysql-01\",\"orderNum\":21,\"params\":{},\"remark\":\"11\",\"sourceType\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-26 20:15:02');
INSERT INTO `sys_oper_log` VALUES (374, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql:////192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-11-26 20:58:16');
INSERT INTO `sys_oper_log` VALUES (375, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-26 20:58:25');
INSERT INTO `sys_oper_log` VALUES (376, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-11-26 20:58:30');
INSERT INTO `sys_oper_log` VALUES (377, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-11-26 20:58:32');
INSERT INTO `sys_oper_log` VALUES (378, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-11-26 20:58:35');
INSERT INTO `sys_oper_log` VALUES (379, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-26 20:59:30');
INSERT INTO `sys_oper_log` VALUES (380, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-26 20:59:31');
INSERT INTO `sys_oper_log` VALUES (381, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-26 20:59:33');
INSERT INTO `sys_oper_log` VALUES (382, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{},\"sourceType\":\"JDBC\"}', NULL, 1, '', '2022-11-26 21:04:01');
INSERT INTO `sys_oper_log` VALUES (383, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{},\"sourceType\":\"JDBC\"}', NULL, 1, '', '2022-11-26 21:04:03');
INSERT INTO `sys_oper_log` VALUES (384, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{},\"sourceType\":\"JDBC\"}', NULL, 1, '', '2022-11-26 21:04:06');
INSERT INTO `sys_oper_log` VALUES (385, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://192.168.24.102:3306/heaven?useUnicode=true&characterEncoding=UTF-8\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-26 21:04:28');
INSERT INTO `sys_oper_log` VALUES (386, '数据源', 1, 'com.heaven.dataconverge.controller.DataConvergeSourceController.add()', 'POST', 1, 'admin', NULL, '/source', '127.0.0.1', '', '{\"businessSectionIds\":[1,2],\"childType\":\"MYSQL\",\"config\":\"{\\\"syncInterval\\\":\\\"1\\\",\\\"enableServerAggregate\\\":false,\\\"url\\\":\\\"jdbc:mysql://1\\\",\\\"enableSpecialSQL\\\":false,\\\"password\\\":\\\"_encrypted_fcVzXMSa1VQzYa0YGwSm2A==\\\",\\\"driverName\\\":\\\"com.mysql.cj.jdbc.Driver\\\",\\\"enableSyncSchemas\\\":false,\\\"properties\\\":{},\\\"username\\\":\\\"1\\\"}\",\"createBy\":\"admin\",\"createTime\":\"2022-11-27 02:01:56.83\",\"id\":51,\"name\":\"测试mysql2\",\"orderNum\":100,\"params\":{},\"remark\":\"11\",\"sourceType\":\"2\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-27 02:01:59');
INSERT INTO `sys_oper_log` VALUES (387, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{},\"sourceType\":\"JDBC\"}', NULL, 1, '', '2022-11-27 20:30:07');
INSERT INTO `sys_oper_log` VALUES (388, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"data_converge_business_datadomain\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 11:27:48');
INSERT INTO `sys_oper_log` VALUES (389, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"datadomain\",\"className\":\"DataConvergeBusinessDatadomain\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"数据模块-数据汇聚-数据域\",\"genType\":\"0\",\"moduleName\":\"Datadomain\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataconverge\",\"params\":{},\"sub\":false,\"tableComment\":\"数据域\",\"tableId\":11,\"tableName\":\"data_converge_business_datadomain\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 11:35:17');
INSERT INTO `sys_oper_log` VALUES (390, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-11-29 11:36:26');
INSERT INTO `sys_oper_log` VALUES (391, '数据模块-数据汇聚-数据域', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessDatadomainController.add()', 'POST', 1, 'admin', NULL, '/datadomain', '127.0.0.1', '', '{\"createTime\":\"2022-11-29 13:07:40.587\",\"name\":\"采购域3\",\"orderNum\":12,\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'section_id\' doesn\'t have a default value\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessDatadomainMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessDatadomainMapper.insertDataConvergeBusinessDatadomain-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_datadomain          ( name,             order_num,                          create_time,                                       remark,             status )           values ( ?,             ?,                          ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'section_id\' doesn\'t have a default value\n; Field \'section_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'section_id\' doesn\'t have a default value', '2022-11-29 13:07:43');
INSERT INTO `sys_oper_log` VALUES (392, '数据模块-数据汇聚-数据域', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessDatadomainController.add()', 'POST', 1, 'admin', NULL, '/datadomain', '127.0.0.1', '', '{\"createTime\":\"2022-11-29 13:07:52.138\",\"name\":\"1\",\"orderNum\":1,\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'section_id\' doesn\'t have a default value\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessDatadomainMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessDatadomainMapper.insertDataConvergeBusinessDatadomain-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_datadomain          ( name,             order_num,                          create_time,                                       remark,             status )           values ( ?,             ?,                          ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'section_id\' doesn\'t have a default value\n; Field \'section_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'section_id\' doesn\'t have a default value', '2022-11-29 13:07:54');
INSERT INTO `sys_oper_log` VALUES (393, '数据模块-数据汇聚-数据域', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessDatadomainController.add()', 'POST', 1, 'admin', NULL, '/datadomain', '127.0.0.1', '', '{\"createTime\":\"2022-11-29 13:10:16.865\",\"name\":\"1\",\"orderNum\":1,\"params\":{},\"remark\":\"1\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'section_id\' doesn\'t have a default value\r\n### The error may exist in file [I:\\work\\workspace\\heaven\\heaven-data\\heaven-data-converge\\target\\classes\\mapper\\source\\DataConvergeBusinessDatadomainMapper.xml]\r\n### The error may involve com.heaven.dataconverge.mapper.DataConvergeBusinessDatadomainMapper.insertDataConvergeBusinessDatadomain-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into data_converge_business_datadomain          ( name,             order_num,                          create_time,                                       remark,             status )           values ( ?,             ?,                          ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'section_id\' doesn\'t have a default value\n; Field \'section_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'section_id\' doesn\'t have a default value', '2022-11-29 13:10:30');
INSERT INTO `sys_oper_log` VALUES (394, '数据模块-数据汇聚-数据域', 1, 'com.heaven.dataconverge.controller.DataConvergeBusinessDatadomainController.add()', 'POST', 1, 'admin', NULL, '/datadomain', '127.0.0.1', '', '{\"createTime\":\"2022-11-29 13:11:15.248\",\"id\":6,\"name\":\"采购域3\",\"orderNum\":1,\"params\":{},\"remark\":\"3\",\"sectionId\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 13:11:20');
INSERT INTO `sys_oper_log` VALUES (395, '数据模块-数据汇聚-数据域', 3, 'com.heaven.dataconverge.controller.DataConvergeBusinessDatadomainController.remove()', 'DELETE', 1, 'admin', NULL, '/datadomain/6', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 13:32:34');
INSERT INTO `sys_oper_log` VALUES (396, '数据模块-数据汇聚-数据域', 2, 'com.heaven.dataconverge.controller.DataConvergeBusinessDatadomainController.edit()', 'PUT', 1, 'admin', NULL, '/datadomain', '127.0.0.1', '', '{\"id\":2,\"name\":\"采购域21\",\"orderNum\":21,\"params\":{},\"remark\":\"采购域1\",\"sectionId\":2,\"status\":\"1\",\"updateTime\":\"2022-11-29 14:03:05.891\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 14:03:08');
INSERT INTO `sys_oper_log` VALUES (397, '代码生成', 2, 'com.heaven.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/sys_config', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 15:19:30');
INSERT INTO `sys_oper_log` VALUES (398, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505544247@qq.com\",\"nickName\":\"笑傲江湖\",\"params\":{},\"phonenumber\":\"13716364674\",\"postIds\":[2,3],\"remark\":\"1\",\"roleIds\":[2,5],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":10,\"userName\":\"test8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 15:24:08');
INSERT INTO `sys_oper_log` VALUES (399, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSaveColumn()', 'PUT', 1, 'admin', NULL, '/gen/column', '127.0.0.1', '', '[{\"capJavaField\":\"BusinessSectionId\",\"columnComment\":\"业务板块id\",\"columnId\":94,\"columnName\":\"business_section_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-11-24 23:57:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"businessSectionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"NE\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SourceId\",\"columnComment\":\"数据源id\",\"columnId\":95,\"columnName\":\"source_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-11-24 23:57:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"sourceId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false}]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 15:25:12');
INSERT INTO `sys_oper_log` VALUES (400, '数据源', 3, 'com.heaven.dataconverge.controller.DataConvergeSourceController.remove()', 'DELETE', 1, 'admin', NULL, '/source/51', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-29 16:23:05');
INSERT INTO `sys_oper_log` VALUES (401, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://hadoop102:3306/heaven\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-11-30 03:28:13');
INSERT INTO `sys_oper_log` VALUES (402, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{},\"sourceType\":\"JDBC\"}', NULL, 1, '', '2022-11-30 18:11:30');
INSERT INTO `sys_oper_log` VALUES (403, '代码生成', 6, 'com.heaven.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"data_schedule_process_definition\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-02 13:55:26');
INSERT INTO `sys_oper_log` VALUES (404, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"schedule\",\"className\":\"DataScheduleProcessDefinition\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"数据调度-流程定义\",\"genType\":\"0\",\"moduleName\":\"schedule\",\"options\":\"{}\",\"packageName\":\"com.heaven.data\",\"params\":{},\"sub\":false,\"tableComment\":\"数据调度-流程定义表\",\"tableId\":12,\"tableName\":\"data_schedule_process_definition\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-02 13:56:53');
INSERT INTO `sys_oper_log` VALUES (405, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-12-02 13:56:57');
INSERT INTO `sys_oper_log` VALUES (406, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"schedule\",\"className\":\"DataScheduleProcessDefinition\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"数据调度-流程定义\",\"genType\":\"0\",\"moduleName\":\"schedule\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataschedule\",\"params\":{},\"sub\":false,\"tableComment\":\"数据调度-流程定义表\",\"tableId\":12,\"tableName\":\"data_schedule_process_definition\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-02 13:57:48');
INSERT INTO `sys_oper_log` VALUES (407, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-12-02 13:57:51');
INSERT INTO `sys_oper_log` VALUES (408, '代码生成', 2, 'com.heaven.gen.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/gen', '127.0.0.1', '', '{\"businessName\":\"processDefinition\",\"className\":\"DataScheduleProcessDefinition\",\"crud\":true,\"functionAuthor\":\"Vicene\",\"functionName\":\"数据调度-流程定义\",\"genType\":\"0\",\"moduleName\":\"schedule\",\"options\":\"{}\",\"packageName\":\"com.heaven.dataschedule\",\"params\":{},\"sub\":false,\"tableComment\":\"数据调度-流程定义表\",\"tableId\":12,\"tableName\":\"data_schedule_process_definition\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-02 15:34:14');
INSERT INTO `sys_oper_log` VALUES (409, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-12-02 15:34:16');
INSERT INTO `sys_oper_log` VALUES (410, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-12-03 11:12:55');
INSERT INTO `sys_oper_log` VALUES (411, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://localhost:3306/heaven\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', NULL, 1, '测试连接异常,请修改参数', '2022-12-04 00:41:08');
INSERT INTO `sys_oper_log` VALUES (412, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://hadoop102:3306/heaven\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-12-04 00:41:25');
INSERT INTO `sys_oper_log` VALUES (413, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":true,\"deptId\":103,\"email\":\"505543479@163.com\",\"nickName\":\"管理员\",\"params\":{},\"phonenumber\":\"15888888888\",\"postIds\":[1,2,3],\"remark\":\"管理员\",\"roleIds\":[1,2],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2022-12-04 00:53:58');
INSERT INTO `sys_oper_log` VALUES (414, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505543478@qq.com\",\"nickName\":\"编号89757\",\"params\":{},\"phonenumber\":\"13716334676\",\"postIds\":[2,3],\"remark\":\"1\",\"roleIds\":[2,3],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"来我家\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-04 00:55:09');
INSERT INTO `sys_oper_log` VALUES (415, '代码生成', 8, 'com.heaven.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-12-04 00:56:16');
INSERT INTO `sys_oper_log` VALUES (416, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://hadoop102:3306\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-12-04 00:56:50');
INSERT INTO `sys_oper_log` VALUES (417, '用户管理', 2, 'com.heaven.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":100,\"email\":\"505543478@qq.com\",\"nickName\":\"编号89757\",\"params\":{},\"phonenumber\":\"13716334676\",\"postIds\":[2,3,4],\"remark\":\"1\",\"roleIds\":[2,3,5],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"来我家\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-04 00:59:20');
INSERT INTO `sys_oper_log` VALUES (418, '岗位管理', 3, 'com.heaven.system.controller.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/post/5', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-04 01:00:01');
INSERT INTO `sys_oper_log` VALUES (419, '数据源', 10, 'com.heaven.dataconverge.controller.DataConvergeSourceController.testConn()', 'POST', 1, 'admin', NULL, '/source/testConn', '127.0.0.1', '', '{\"properties\":{\"dbType\":\"MYSQL\",\"user\":\"root\",\"url\":\"jdbc:mysql://hadoop102:3306\",\"driverClass\":\"com.mysql.cj.jdbc.Driver\"},\"sourceType\":\"JDBC\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":true}', 0, NULL, '2022-12-04 01:01:04');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
                             `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                             `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
                             `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
                             `post_sort` int(4) NOT NULL COMMENT '显示顺序',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-10-24 00:24:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-10-24 00:24:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-10-24 00:24:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-10-24 00:24:25', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                             `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
                             `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
                             `role_sort` int(4) NOT NULL COMMENT '显示顺序',
                             `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                             `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
                             `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-10-24 00:24:25', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '测试角色', 'test', 3, '1', 0, 0, '1', '0', 'admin', '2022-11-14 16:04:01', 'admin', '2022-11-15 15:07:35', '1');
INSERT INTO `sys_role` VALUES (4, '测试角色2', 'test2', 4, '1', 0, 0, '0', '2', 'admin', '2022-11-14 16:29:46', '', NULL, '1');
INSERT INTO `sys_role` VALUES (5, '测试角色46', 'test4', 5, '1', 0, 0, '0', '0', 'admin', '2022-11-14 21:29:39', 'admin', '2022-11-16 00:39:47', '46');
INSERT INTO `sys_role` VALUES (6, '测试角色5', '13123', 9, '1', 0, 0, '0', '2', 'admin', '2022-11-16 00:08:38', 'admin', '2022-11-16 00:08:55', '11');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
                                  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
                                  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (5, 100);
INSERT INTO `sys_role_menu` VALUES (5, 101);
INSERT INTO `sys_role_menu` VALUES (5, 102);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
                             `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                             `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
                             `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
                             `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
                             `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
                             `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
                             `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
                             `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                             `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
                             `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
                             `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                             `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                             `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
                             `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', '505543479@163.com', '15888888888', '1', 'https://oscimg.oschina.net/oscnet/up-a7f0bc76f35932d4f250683bfcdfc3d3.jpg?t=1668092954232', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-10-24 00:24:25', 'admin', '2022-10-24 00:24:25', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'Vicene', 'Vicene1', '00', '505543479@qq.com', '15666666661', '1', 'https://oscimg.oschina.net/oscnet/up-a7f0bc76f35932d4f250683bfcdfc3d3.jpg?t=1668092954232', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-10-24 00:24:25', 'admin', '2022-10-24 00:24:25', 'admin', '2022-11-16 00:39:57', '测试员1');
INSERT INTO `sys_user` VALUES (3, 100, 'testc', 'test1', '00', '5055543471@qq.com', '13716364671', '2', 'https://oscimg.oschina.net/oscnet/up-a7f0bc76f35932d4f250683bfcdfc3d3.jpg?t=1668092954232', '$2a$10$PFBZykAILtUFAWIQNaiLjOtUTIPaMGIzRTBCtBQY3yJpqbkdEdRkm', '0', '2', '', NULL, 'admin', '2022-11-15 15:59:52', 'admin', '2022-11-15 19:23:16', '11');
INSERT INTO `sys_user` VALUES (4, 100, 'test3', 'test3', '00', '505443479@qq.com', '13716364676', '2', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', '$2a$10$Bm9i0ZIhK5b47xF8RrjpPe2k2qdpTMxgCUXtG0.0E58C.Ke5gyf0u', '0', '2', '', NULL, 'admin', '2022-11-15 19:41:18', '', NULL, '111');
INSERT INTO `sys_user` VALUES (5, 100, '测试2', '测试2111', '00', '505442431@qq.com', '13616364671', '1', 'https://oscimg.oschina.net/oscnet/up-a7f0bc76f35932d4f250683bfcdfc3d3.jpg?t=1668092954232', '$2a$10$l3wiOepjVEgCc0vvqlFYVuWB9zn9QDRwE/umXYRsF6FBPuXeiji3G', '1', '2', '', NULL, 'admin', '2022-11-16 00:09:47', 'admin', '2022-11-16 00:10:07', '1111');
INSERT INTO `sys_user` VALUES (6, 100, 'lwj', '用户234', '00', '50553444@qq.com', '1371636476', '0', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', '$2a$10$VCtPegrcI4i.2/bb1qHSaeGfeOs2bLkD22GnGAsqwWVV4ZKZVHMMW', '0', '0', '', NULL, 'admin', '2022-11-16 11:00:57', 'admin', '2022-11-16 11:03:30', '');
INSERT INTO `sys_user` VALUES (7, 100, '来我家', '编号89757', '00', '505543478@qq.com', '13716334676', '0', 'https://oscimg.oschina.net/oscnet/up-a7f0bc76f35932d4f250683bfcdfc3d3.jpg?t=1668092954232', '$2a$10$Xq.ORZEoFtVAqb3feHlHPeaaJKogrvN.260KhDnsuknz1iEaNj2uS', '0', '0', '', NULL, 'admin', '2022-11-16 11:03:05', 'admin', '2022-12-04 00:59:20', '1');
INSERT INTO `sys_user` VALUES (8, 100, 'test5', '风格', '00', '505543447@qq.com', '1371634763', '0', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', '$2a$10$8HiFNCbLs5dqHz3wfGCTQujCBZY9AQDzeHdfkkMptZ2EdAkMhyKia', '0', '0', '', NULL, 'admin', '2022-11-16 11:04:10', '', NULL, '1');
INSERT INTO `sys_user` VALUES (9, 100, 'mengma2022', '枫', '00', '547895055@qq.com', '13346670602', '0', 'https://oscimg.oschina.net/oscnet/up-a7f0bc76f35932d4f250683bfcdfc3d3.jpg?t=1668092954232', '$2a$10$FjYs7LtkyMBDDtmT4BTPdu.VE4MEYsgV3wy79okkZcZ8roLQHVMbW', '0', '0', '', NULL, 'admin', '2022-11-16 11:05:34', '', NULL, '11');
INSERT INTO `sys_user` VALUES (10, 100, 'test8', '笑傲江湖', '00', '505544247@qq.com', '13716364674', '0', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', '$2a$10$POtoxmRQfvqZ096KT.yJbeujyDwb6I8LytTYuDAMUoXslj4SJBHtm', '0', '0', '', NULL, 'admin', '2022-11-16 11:06:17', 'admin', '2022-11-29 15:24:07', '1');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
                                  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
                                  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (6, 2);
INSERT INTO `sys_user_post` VALUES (7, 2);
INSERT INTO `sys_user_post` VALUES (7, 3);
INSERT INTO `sys_user_post` VALUES (7, 4);
INSERT INTO `sys_user_post` VALUES (8, 2);
INSERT INTO `sys_user_post` VALUES (9, 2);
INSERT INTO `sys_user_post` VALUES (10, 2);
INSERT INTO `sys_user_post` VALUES (10, 3);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
                                  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
                                  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
                                  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (6, 5);
INSERT INTO `sys_user_role` VALUES (7, 2);
INSERT INTO `sys_user_role` VALUES (7, 3);
INSERT INTO `sys_user_role` VALUES (7, 5);
INSERT INTO `sys_user_role` VALUES (8, 2);
INSERT INTO `sys_user_role` VALUES (9, 2);
INSERT INTO `sys_user_role` VALUES (10, 2);
INSERT INTO `sys_user_role` VALUES (10, 5);

SET FOREIGN_KEY_CHECKS = 1;
