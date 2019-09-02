/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : beam

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2019-09-02 10:45:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_article
-- ----------------------------
DROP TABLE IF EXISTS `b_article`;
CREATE TABLE `b_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `short_code` varchar(64) DEFAULT NULL COMMENT '短码',
  `head_img` varchar(255) DEFAULT '' COMMENT '头像',
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `content` longtext COMMENT '内容',
  `frozen` tinyint(1) DEFAULT '1' COMMENT '是否可用',
  `read_num` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `text_type` smallint(4) DEFAULT '0' COMMENT '0：markdown 1：富文本',
  `tag` varchar(64) DEFAULT '' COMMENT '标签',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of b_article
-- ----------------------------
INSERT INTO `b_article` VALUES ('19', 'beam-parent文档', '000eZ9dw', 'http://img.hsshy.cn/head_img.jpg', 'yellow_shy', '# beam-parent\n\n#### 演示地址（演示账号只提供界面展示，没有按钮权限即看不到按钮）\nhttp://www.hsshy.com/#/login\n演示账户：test 123456\n\n#### 项目介绍\n\n- 基于SpringBoot 2，一款快速开发的脚手架。\n- 有配套的代码生成器可供使用。\n- 基础模块：\n  -  **用户管理**\n  -  **角色管理** \n  -  **菜单管理**\n  -  **部门管理**\n  -  **定时任务**\n  -  **字典管理**\n  -  **登陆日志**\n  -  **业务日志**\n  -  **博客管理**\n- 项目特点：\n  - **持久层：mybatis持久化，使用MyBatis-Plus优化，减少sql开发量；Transtraction注解事务。**\n  - **使用SpringBoot自动装配，配置简便，开箱即用**\n  - **将service、dao、entity接口提为公共模块，接口模块与后台管理系统可共用。不共用，只需将相应的模块放在对应的子工程中**\n  - **接口模块已添加拦截和post请求签名，提高了安全性**\n  - **后端可使用map+wrapper返回方式返回字段的字典值，无需再前端一一对应字典值所对应的中文名称**\n  - **前后端分离**\n  - **异步插入日志**\n  - **实现了用户角色菜单权限动态配置，精确到按钮级别**\n  - **线上日志分类**\n  - **图片存储（七牛云）（注册地址：https://portal.qiniu.com/signup?code=1h8cpibemhb9u）**\n  - **定时任务：Quartz，已搭建成界面化方式，配置即可使用**\n  - **工具类：excel导入导出，汉字转拼音，字符串工具类，数字工具类，发送邮件，redis工具类，MD5加密，HTTP工具类，防注入工具类,i18n 国际化多语言工具等等。**\n#### 技术选型\n- 核心框架：Spring Boot 2.1.5\n- 安全框架：Apache Shiro 1.4\n- 视图框架：Spring MVC 5.0\n- 持久层框架：MyBatis-Plus 3.1.2\n- 定时器：Quartz 2.3\n- 数据库连接池：hikari\n- 后台管理系统前端：Vue2.x\n- 缓存：Redis\n- 图片存储：七牛云（七牛云注册便有10G免费空间，注册地址：https://portal.qiniu.com/signup?code=1h8cpibemhb9u）。\n#### 项目结构\n````\nbeam-parent\n├─beam-common     公共模块\n│ \n├─beam-admin     管理后台\n│        └─resources \n│           ├─application.yml  配置文件\n│           ├─logback-spring.xml  日志配置文件\n│ \n├─beam-rest        API服务 （post请求签名、token)\n│             \n│ \n├─beam-web  公用实体类、dao、service\n│   \n│ \n├─html/beam-manager-system 前端代码\n│ \n├─doc  数据库sql文件\n│ \n│ \n│ \n````\n#### 软件需求\n- IntelliJ IDEA\n- JetBrains WebStorm\n- JDK1.8\n- MySQL5.5+\n- Maven3.0+\n- Redis\n- lombok插件\n\n#### 运行流程\n###### 指定运行环境\n![image.png](http://img.hsshy.cn/upload/20190821/2683498c87f24613886694f813f44c2e.png)\n![image.png](http://img.hsshy.cn/upload/20190821/31332a378a604e13947e6525cb81c43b.png)\n\n#### 部署流程\n\n##### 软件安装（Linux）\n- Java环境：http://www.hsshy.com/#/blog/detail/00qGckBh\n- Redis：http://www.hsshy.com/#/blog/detail/00P8pnLd\n- MySQL：http://www.hsshy.com/#/blog/detail/00Pivdjt\n- Nginx：http://www.hsshy.com/#/blog/detail/00qhyABC\n##### 后端：\n- 服务器选的是阿里云（注册地址：https://chuangke.aliyun.com/invite?userCode=647hkjjy）\n- 打包：```package -Dmaven.test.skip```\n- 运行：```nohup java -jar xxx.jar --spring.profiles.active=prod >/dev/null 2>&1 &```\n- 查看运行日志：```tail -f beam-admin-logs/log_total.log```\n- doc目录下提供运行脚本，脚本与jar包放在同级目录下即可。```chmod 777 deploy.sh```（添加读写执行权限），脚本运行报错（执行dos2unix deploy.sh，window环境下与Linux环境下文本格式有所不同）\n\n##### 前端（这边是用nginx进行部署）：\n- 打包：npm run build\n- 上传：进入dist文件夹，scp -r * root@xx.xx.xx.xx:/etc/nginx/html/beam-manage-system/\n- 给文件夹设置权限。\n- nginx配置请参考doc下的beam.conf文件,可直接传到服务器下的nginx/conf.d/下进行使用，记得删除默认的default.conf文件。\n\n#### 部署可能出现的问题\n- 出现表不存在（定时任务相关的表改成大写或者将数据库改成大小写不敏感）\n- 脚本运行报错（执行dos2unix deploy.sh，window环境下与Linux环境下文本格式有所不同）\n- Nginx 403：给前端文件夹设置可读写的权限。\n- Nginx 404：后台管理系统接口要与前端对应上，详情看doc下beam.conf的配置。\n#### 常见问题\n- 上传图片失败，请修改sys_config中的七牛云配置，改为自己的七牛云配置。（七牛云注册便有10G免费空间，注册地址：https://portal.qiniu.com/signup?code=1h8cpibemhb9u）。\n- 提示账户验证失败，检查是否安装Redis，以及用户名密码是否正确。\n- set、get报红，请安装Lombok插件。详情请参照软件需求。\n\n<br>\n\n### 代码生成器\n#### https://gitee.com/hsshy/beam-generator\n\n#### Spring Boot其他案例：https://gitee.com/hsshy/beam-example\n- 秒杀案例模块（加锁、aop加锁、redis锁、消息队列）\n- 动态数据源案例模块\n- Spring Boot 整合RabbitMQ案例\n- Spring Boot 整合dubbo消费者\n- Spring Boot 整合dubbo服务提供者\n- Spring Boot 整合email发送邮件（异步发送、消息队列发送）\n- Spring Boot 整合Kafka案例\n#### 有需要dubbo的请移至：https://gitee.com/hsshy/beam-dubbo\n\n#### 有问题请关注公众号回复消息\n![image.png](http://img.hsshy.cn/upload/20190821/04ce4ff9ddf64816a4831223654d588b.png)', '1', '36', '1', '0', '', '2019-08-21 09:07:35', '2019-08-22 08:31:47');

-- ----------------------------
-- Table structure for b_article_category
-- ----------------------------
DROP TABLE IF EXISTS `b_article_category`;
CREATE TABLE `b_article_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `frozen` tinyint(1) DEFAULT NULL COMMENT '是否可用',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of b_article_category
-- ----------------------------

-- ----------------------------
-- Table structure for b_article_category_ref
-- ----------------------------
DROP TABLE IF EXISTS `b_article_category_ref`;
CREATE TABLE `b_article_category_ref` (
  `article_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of b_article_category_ref
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1080345897063223297', 'DEFAULT', '0 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1080345897063223297', 'DEFAULT', null, 'com.hsshy.beam.common.quartz.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720033636F6D2E68737368792E6265616D2E6D6F64756C61722E7379732E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000269647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872002C636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E52657374456E74697479EE8CF07CFDCA369C0200024C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000A75706461746554696D6571007E000D78720030636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E4162737472616374456E74697479040721C4286B1A7C0200024A000B63757272656E74506167654A00087061676553697A6578720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C000000000000000102000078700000000000000000000000000000000A7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001680D307CA0787371007E001177080000016B0D3FF9E878740008746573745461736B74000B30202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700EFE28DE95011001740005746573743270740006E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0017000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'LAPTOP-JP1B0EBJ1567388114001', '1567388777612', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
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
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1080345897063223297', 'DEFAULT', 'TASK_1080345897063223297', 'DEFAULT', null, '1559702820000', '-1', '5', 'PAUSED', 'CRON', '1559702773000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720033636F6D2E68737368792E6265616D2E6D6F64756C61722E7379732E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000269647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7872002C636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E52657374456E74697479EE8CF07CFDCA369C0200024C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000A75706461746554696D6571007E000D78720030636F6D2E68737368792E6265616D2E636F6D6D6F6E2E626173652E656E746974792E4162737472616374456E74697479040721C4286B1A7C0200024A000B63757272656E74506167654A00087061676553697A6578720035636F6D2E62616F6D69646F752E6D796261746973706C75732E657874656E73696F6E2E6163746976657265636F72642E4D6F64656C000000000000000102000078700000000000000000000000000000000A7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001680D307CA0787371007E001177080000016B0D3FF9E878740008746573745461736B74000B30202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700EFE28DE95011001740005746573743270740006E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0017000000007800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2048) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"uTUUJ1fidpo5Hc6b7qJXd2i5SyVUzsBvQJgKn_N6\",\"qiniuBucketName\":\"hsshy\",\"qiniuDomain\":\"http://img.hsshy.cn\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"_XKtAamyCjnQN_rW-cqjSOb5X5bmDONgfDBknzbR\",\"type\":1}', '1', '云存储配置信息', '2019-08-27 16:00:09', '2019-08-27 16:00:11');
INSERT INTO `sys_config` VALUES ('2', 'MiniAppConfig', '{\"appId\":\"wxee7d54a4d020f91e\",\"originalId\":\"\",\"appSecret\":\"4a768565a9a8866e5e32c75fd7f41cd8\",\"mchId\":\"\",\"mchKey\":\"\",\"keyStoreFilePath\":\"\"}', '1', '小程序配置', '2019-08-27 16:00:09', '2019-08-27 16:00:11');
INSERT INTO `sys_config` VALUES ('3', 'BdAiConfig', '{\"imgIdentifyClientId\":\"GvRG8m4zbSv5pGIjjklgU6oo\",\"imgIdentifyClientSecret\":\"XE25zPo39Rh9YN4KOIRtf8rDUeIyh4BW\",\"wordIdentifyClientId\":\"pYyymWG9DnFf8hCuWz3UrtfI\",\"wordIdentifyClientSecret\":\"Ng8wB34nqNi2bHRkOr3O6OBrPCS1s9gu\"}', '1', '百度图片识别AI配置', '2019-08-27 16:02:36', '2019-08-27 16:02:39');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总公司', '0', '0', '2018-12-18 21:43:48', '2018-12-18 21:43:53');
INSERT INTO `sys_dept` VALUES ('2', '1', '厦门分公司', '1', '0', '2018-12-22 23:28:09', '2018-12-22 23:28:11');
INSERT INTO `sys_dept` VALUES ('3', '1', '福州分公司', '2', '0', '2018-12-22 23:28:14', '2018-12-22 23:28:16');
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', '0', '2018-12-22 23:28:18', '2018-12-22 23:28:21');
INSERT INTO `sys_dept` VALUES ('5', '2', '销售部', '1', '0', '2018-12-22 23:28:23', '2018-12-22 15:30:34');
INSERT INTO `sys_dept` VALUES ('1076499576671084546', '2', '技术部', '1', '0', '2018-12-22 15:27:54', '2018-12-22 15:27:54');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` bigint(20) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `code` varchar(255) DEFAULT NULL COMMENT '编码',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('16', '0', '状态', '', 'frozen', '1', '2019-04-12 10:50:21', '2019-04-13 07:30:04');
INSERT INTO `sys_dict` VALUES ('17', '16', '启用', null, '1', '1', '2019-04-12 10:50:25', '2019-04-12 10:50:28');
INSERT INTO `sys_dict` VALUES ('18', '16', '禁用', null, '0', '2', '2019-04-12 10:50:30', '2019-04-12 10:50:33');
INSERT INTO `sys_dict` VALUES ('29', '0', '性别', '', 'sex', '2', '2019-04-12 10:50:36', '2019-04-13 07:29:59');
INSERT INTO `sys_dict` VALUES ('30', '29', '男', null, '1', '1', '2019-04-12 10:50:41', '2019-04-12 10:50:43');
INSERT INTO `sys_dict` VALUES ('31', '29', '女', null, '2', '2', '2019-04-12 10:50:46', '2019-04-12 10:50:48');
INSERT INTO `sys_dict` VALUES ('32', '0', '菜单类型', null, 'menu_type', '3', '2019-04-12 18:30:54', '2019-04-12 18:30:57');
INSERT INTO `sys_dict` VALUES ('33', '32', '目录', null, '0', '1', '2019-04-12 18:31:48', '2019-04-12 18:31:50');
INSERT INTO `sys_dict` VALUES ('34', '32', '菜单', null, '1', '2', '2019-04-12 18:32:10', '2019-04-12 18:32:12');
INSERT INTO `sys_dict` VALUES ('35', '32', '按钮', null, '2', '3', '2019-04-12 18:32:25', '2019-04-12 18:32:28');
INSERT INTO `sys_dict` VALUES ('36', '0', '定时任务状态', null, 'schedule_status', '4', '2019-04-13 11:49:28', '2019-04-13 11:49:30');
INSERT INTO `sys_dict` VALUES ('37', '36', '正常', null, '1', '1', '2019-04-13 11:50:08', '2019-04-13 11:50:10');
INSERT INTO `sys_dict` VALUES ('38', '36', '暂停', null, '0', '2', '2019-04-13 11:50:24', '2019-04-13 11:50:27');
INSERT INTO `sys_dict` VALUES ('39', '0', '顶级', '顶级', null, '0', '2019-04-13 15:55:58', '2019-04-13 15:56:01');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_name` varchar(64) DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `succeed` varchar(32) DEFAULT NULL COMMENT '是否成功',
  `message` varchar(64) DEFAULT NULL COMMENT '消息',
  `ip_address` varchar(64) DEFAULT NULL COMMENT 'ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1163373813417713666 DEFAULT CHARSET=utf8mb4 COMMENT='登陆日志';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1116607692266295298', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 07:43:14', '2019-04-12 07:43:14');
INSERT INTO `sys_login_log` VALUES ('1116610428894478338', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 07:54:07', '2019-04-12 07:54:07');
INSERT INTO `sys_login_log` VALUES ('1116613559560773634', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 08:06:33', '2019-04-12 08:06:33');
INSERT INTO `sys_login_log` VALUES ('1116617330449788930', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 08:21:32', '2019-04-12 08:21:32');
INSERT INTO `sys_login_log` VALUES ('1116630937606553602', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 09:15:36', '2019-04-12 09:15:36');
INSERT INTO `sys_login_log` VALUES ('1116640975788244994', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 09:55:29', '2019-04-12 09:55:29');
INSERT INTO `sys_login_log` VALUES ('1116643733232709634', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:06:27', '2019-04-12 10:06:27');
INSERT INTO `sys_login_log` VALUES ('1116647553618681857', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:21:38', '2019-04-12 10:21:38');
INSERT INTO `sys_login_log` VALUES ('1116648308782178305', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:24:38', '2019-04-12 10:24:38');
INSERT INTO `sys_login_log` VALUES ('1116648642766176258', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-12 10:25:57', '2019-04-12 10:25:57');
INSERT INTO `sys_login_log` VALUES ('1116892866972930049', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 02:36:25', '2019-04-13 02:36:25');
INSERT INTO `sys_login_log` VALUES ('1116893706152497153', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 02:39:45', '2019-04-13 02:39:45');
INSERT INTO `sys_login_log` VALUES ('1116898478788104193', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 02:58:43', '2019-04-13 02:58:43');
INSERT INTO `sys_login_log` VALUES ('1116907040935505922', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 03:32:44', '2019-04-13 03:32:44');
INSERT INTO `sys_login_log` VALUES ('1116911588097863681', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 03:50:48', '2019-04-13 03:50:48');
INSERT INTO `sys_login_log` VALUES ('1116932311302459394', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 05:13:09', '2019-04-13 05:13:09');
INSERT INTO `sys_login_log` VALUES ('1116961679538049025', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 07:09:51', '2019-04-13 07:09:51');
INSERT INTO `sys_login_log` VALUES ('1116962286449688578', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-13 07:12:16', '2019-04-13 07:12:16');
INSERT INTO `sys_login_log` VALUES ('1117681444483776514', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-04-15 06:49:57', '2019-04-15 06:49:57');
INSERT INTO `sys_login_log` VALUES ('1117686787204988929', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-15 07:11:10', '2019-04-15 07:11:10');
INSERT INTO `sys_login_log` VALUES ('1118047087594897410', '登录日志', '1', '成功', null, '0:0:0:0:0:0:0:1', '2019-04-16 07:02:53', '2019-04-16 07:02:53');
INSERT INTO `sys_login_log` VALUES ('1118395174683222018', '登录日志', '1', '成功', null, '0:0:0:0:0:0:0:1', '2019-04-17 06:06:03', '2019-04-17 06:06:03');
INSERT INTO `sys_login_log` VALUES ('1120926408462315522', '登录日志', '1', '成功', null, '127.0.0.1', '2019-04-24 05:44:16', '2019-04-24 05:44:16');
INSERT INTO `sys_login_log` VALUES ('1128925802704957442', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-05-16 07:31:00', '2019-05-16 07:31:00');
INSERT INTO `sys_login_log` VALUES ('1128925891838111746', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-16 07:31:22', '2019-05-16 07:31:22');
INSERT INTO `sys_login_log` VALUES ('1128942753011494914', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-16 08:38:22', '2019-05-16 08:38:22');
INSERT INTO `sys_login_log` VALUES ('1129698393004158977', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-05-18 10:41:00', '2019-05-18 10:41:00');
INSERT INTO `sys_login_log` VALUES ('1132895713026375682', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-05-27 06:26:01', '2019-05-27 06:26:01');
INSERT INTO `sys_login_log` VALUES ('1132895853661388801', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-27 06:26:34', '2019-05-27 06:26:34');
INSERT INTO `sys_login_log` VALUES ('1132941859761491969', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-27 09:29:23', '2019-05-27 09:29:23');
INSERT INTO `sys_login_log` VALUES ('1134278263426813954', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 01:59:47', '2019-05-31 01:59:47');
INSERT INTO `sys_login_log` VALUES ('1134279799200583682', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 02:05:53', '2019-05-31 02:05:53');
INSERT INTO `sys_login_log` VALUES ('1134299265594593282', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 03:23:14', '2019-05-31 03:23:14');
INSERT INTO `sys_login_log` VALUES ('1134310894642171906', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-05-31 04:09:26', '2019-05-31 04:09:26');
INSERT INTO `sys_login_log` VALUES ('1134338247434969089', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-05-31 05:58:08', '2019-05-31 05:58:08');
INSERT INTO `sys_login_log` VALUES ('1134338334894596097', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-05-31 05:58:29', '2019-05-31 05:58:29');
INSERT INTO `sys_login_log` VALUES ('1134339287228096513', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 06:02:16', '2019-05-31 06:02:16');
INSERT INTO `sys_login_log` VALUES ('1134378368012206081', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 08:37:33', '2019-05-31 08:37:33');
INSERT INTO `sys_login_log` VALUES ('1134443713389408257', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 12:57:13', '2019-05-31 12:57:13');
INSERT INTO `sys_login_log` VALUES ('1134444172514701313', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 12:59:02', '2019-05-31 12:59:02');
INSERT INTO `sys_login_log` VALUES ('1134446023607918594', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 13:06:24', '2019-05-31 13:06:24');
INSERT INTO `sys_login_log` VALUES ('1134446421467013121', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 13:07:59', '2019-05-31 13:07:59');
INSERT INTO `sys_login_log` VALUES ('1134450053851738114', '登录日志', '1', '成功', null, '127.0.0.1', '2019-05-31 13:22:25', '2019-05-31 13:22:25');
INSERT INTO `sys_login_log` VALUES ('1134635631440392194', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-01 01:39:50', '2019-06-01 01:39:50');
INSERT INTO `sys_login_log` VALUES ('1134635766908022786', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-01 01:40:22', '2019-06-01 01:40:22');
INSERT INTO `sys_login_log` VALUES ('1134643138689662977', '登录日志', '1', '成功', null, '110.87.38.164', '2019-06-01 02:09:40', '2019-06-01 02:09:40');
INSERT INTO `sys_login_log` VALUES ('1134649284267769857', '登录日志', '1072429679148908546', '成功', null, '110.87.38.164', '2019-06-01 02:34:05', '2019-06-01 02:34:05');
INSERT INTO `sys_login_log` VALUES ('1134650000055107586', '登录日志', '1072429679148908546', '成功', null, '110.87.38.164', '2019-06-01 02:36:55', '2019-06-01 02:36:55');
INSERT INTO `sys_login_log` VALUES ('1134651022559313921', '登录日志', '1', '成功', null, '110.87.38.164', '2019-06-01 02:40:59', '2019-06-01 02:40:59');
INSERT INTO `sys_login_log` VALUES ('1134655631478652930', '登录日志', '1072429679148908546', '成功', null, '110.87.38.164', '2019-06-01 02:59:18', '2019-06-01 02:59:18');
INSERT INTO `sys_login_log` VALUES ('1134655732154531841', '登录日志', '1', '成功', null, '110.87.38.164', '2019-06-01 02:59:42', '2019-06-01 02:59:42');
INSERT INTO `sys_login_log` VALUES ('1134656100074684418', '登录日志', '1', '成功', null, '110.87.38.164', '2019-06-01 03:01:10', '2019-06-01 03:01:10');
INSERT INTO `sys_login_log` VALUES ('1134656354379530241', '登录日志', '1072429679148908546', '成功', null, '110.87.38.164', '2019-06-01 03:02:10', '2019-06-01 03:02:10');
INSERT INTO `sys_login_log` VALUES ('1135821878431137794', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-04 08:13:33', '2019-06-04 08:13:33');
INSERT INTO `sys_login_log` VALUES ('1135822114989883394', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-04 08:14:29', '2019-06-04 08:14:29');
INSERT INTO `sys_login_log` VALUES ('1135822975732310018', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-04 08:17:55', '2019-06-04 08:17:55');
INSERT INTO `sys_login_log` VALUES ('1135823045018017793', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-04 08:18:11', '2019-06-04 08:18:11');
INSERT INTO `sys_login_log` VALUES ('1135823298639192065', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-04 08:19:12', '2019-06-04 08:19:12');
INSERT INTO `sys_login_log` VALUES ('1135824351124283393', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-04 08:23:23', '2019-06-04 08:23:23');
INSERT INTO `sys_login_log` VALUES ('1135824502886764545', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-04 08:23:59', '2019-06-04 08:23:59');
INSERT INTO `sys_login_log` VALUES ('1135824975257669633', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-04 08:25:51', '2019-06-04 08:25:51');
INSERT INTO `sys_login_log` VALUES ('1135825256150208513', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-04 08:26:58', '2019-06-04 08:26:58');
INSERT INTO `sys_login_log` VALUES ('1135825301289308161', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-04 08:27:09', '2019-06-04 08:27:09');
INSERT INTO `sys_login_log` VALUES ('1135825919592669186', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-04 08:29:37', '2019-06-04 08:29:37');
INSERT INTO `sys_login_log` VALUES ('1135829205955678210', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-06-04 08:42:40', '2019-06-04 08:42:40');
INSERT INTO `sys_login_log` VALUES ('1135829865224777730', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-04 08:45:17', '2019-06-04 08:45:17');
INSERT INTO `sys_login_log` VALUES ('1135848728297517058', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-04 10:00:15', '2019-06-04 10:00:15');
INSERT INTO `sys_login_log` VALUES ('1136087437131395073', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-05 01:48:47', '2019-06-05 01:48:47');
INSERT INTO `sys_login_log` VALUES ('1136106160080896001', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-05 03:03:11', '2019-06-05 03:03:11');
INSERT INTO `sys_login_log` VALUES ('1136136004231524353', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-05 05:01:46', '2019-06-05 05:01:46');
INSERT INTO `sys_login_log` VALUES ('1136145776754417666', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-05 05:40:36', '2019-06-05 05:40:36');
INSERT INTO `sys_login_log` VALUES ('1136152637083762690', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-05 06:07:52', '2019-06-05 06:07:52');
INSERT INTO `sys_login_log` VALUES ('1136152832748044290', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-05 06:08:39', '2019-06-05 06:08:39');
INSERT INTO `sys_login_log` VALUES ('1136189793869303810', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-05 08:35:31', '2019-06-05 08:35:31');
INSERT INTO `sys_login_log` VALUES ('1139350701055520769', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-14 01:55:50', '2019-06-14 01:55:50');
INSERT INTO `sys_login_log` VALUES ('1139354571198541825', '登录日志', '1', '成功', null, '127.0.0.1', '2019-06-14 02:11:13', '2019-06-14 02:11:13');
INSERT INTO `sys_login_log` VALUES ('1148046413298905089', '登录日志', '1', '成功', null, '127.0.0.1', '2019-07-08 01:49:29', '2019-07-08 01:49:29');
INSERT INTO `sys_login_log` VALUES ('1148047320556232706', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-07-08 01:53:06', '2019-07-08 01:53:06');
INSERT INTO `sys_login_log` VALUES ('1148047394782830593', '登录日志', '1', '成功', null, '127.0.0.1', '2019-07-08 01:53:23', '2019-07-08 01:53:23');
INSERT INTO `sys_login_log` VALUES ('1153866740879441922', '登录日志', '1', '成功', null, '127.0.0.1', '2019-07-24 03:17:23', '2019-07-24 03:17:23');
INSERT INTO `sys_login_log` VALUES ('1159736538469269506', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-08-09 08:01:52', '2019-08-09 08:01:52');
INSERT INTO `sys_login_log` VALUES ('1159736626033754114', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-09 08:02:13', '2019-08-09 08:02:13');
INSERT INTO `sys_login_log` VALUES ('1160823016708374530', '登录日志', '1072429679148908546', '成功', null, '127.0.0.1', '2019-08-12 07:59:09', '2019-08-12 07:59:09');
INSERT INTO `sys_login_log` VALUES ('1160823112044904450', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-12 07:59:32', '2019-08-12 07:59:32');
INSERT INTO `sys_login_log` VALUES ('1160835846685855746', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-12 08:50:08', '2019-08-12 08:50:08');
INSERT INTO `sys_login_log` VALUES ('1160854252684341249', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-12 10:03:16', '2019-08-12 10:03:16');
INSERT INTO `sys_login_log` VALUES ('1160861475955306497', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-12 10:31:58', '2019-08-12 10:31:58');
INSERT INTO `sys_login_log` VALUES ('1161101148686409729', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-13 02:24:21', '2019-08-13 02:24:21');
INSERT INTO `sys_login_log` VALUES ('1161102396269555713', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-13 02:29:18', '2019-08-13 02:29:18');
INSERT INTO `sys_login_log` VALUES ('1161165016494272513', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-13 06:38:08', '2019-08-13 06:38:08');
INSERT INTO `sys_login_log` VALUES ('1161183213633208322', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-13 07:50:27', '2019-08-13 07:50:27');
INSERT INTO `sys_login_log` VALUES ('1161183947980374018', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-13 07:53:22', '2019-08-13 07:53:22');
INSERT INTO `sys_login_log` VALUES ('1161192953952182273', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-13 08:29:09', '2019-08-13 08:29:09');
INSERT INTO `sys_login_log` VALUES ('1161465166253035521', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-14 02:30:49', '2019-08-14 02:30:49');
INSERT INTO `sys_login_log` VALUES ('1161477211019030530', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-14 03:18:41', '2019-08-14 03:18:41');
INSERT INTO `sys_login_log` VALUES ('1161531625167663105', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-14 06:54:54', '2019-08-14 06:54:54');
INSERT INTO `sys_login_log` VALUES ('1161532419656921090', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-14 06:58:04', '2019-08-14 06:58:04');
INSERT INTO `sys_login_log` VALUES ('1162248603176046594', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 06:23:55', '2019-08-16 06:23:55');
INSERT INTO `sys_login_log` VALUES ('1162283157198733313', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 08:41:14', '2019-08-16 08:41:14');
INSERT INTO `sys_login_log` VALUES ('1162288519406747649', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 09:02:32', '2019-08-16 09:02:32');
INSERT INTO `sys_login_log` VALUES ('1162291051952656385', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 09:12:36', '2019-08-16 09:12:36');
INSERT INTO `sys_login_log` VALUES ('1162297259971440641', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 09:37:16', '2019-08-16 09:37:16');
INSERT INTO `sys_login_log` VALUES ('1162297976647954433', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 09:40:07', '2019-08-16 09:40:07');
INSERT INTO `sys_login_log` VALUES ('1162304396319571970', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 10:05:37', '2019-08-16 10:05:37');
INSERT INTO `sys_login_log` VALUES ('1162306017275482114', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-16 10:12:04', '2019-08-16 10:12:04');
INSERT INTO `sys_login_log` VALUES ('1162610371414425602', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-17 06:21:27', '2019-08-17 06:21:27');
INSERT INTO `sys_login_log` VALUES ('1162614233328189442', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-17 06:36:48', '2019-08-17 06:36:48');
INSERT INTO `sys_login_log` VALUES ('1162988139188809729', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-18 07:22:34', '2019-08-18 07:22:34');
INSERT INTO `sys_login_log` VALUES ('1163265533982822402', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-19 01:44:50', '2019-08-19 01:44:50');
INSERT INTO `sys_login_log` VALUES ('1163265909922484226', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-19 01:46:20', '2019-08-19 01:46:20');
INSERT INTO `sys_login_log` VALUES ('1163330165623771137', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-19 06:01:40', '2019-08-19 06:01:40');
INSERT INTO `sys_login_log` VALUES ('1163341118075637762', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-19 06:45:11', '2019-08-19 06:45:11');
INSERT INTO `sys_login_log` VALUES ('1163345905282228226', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-19 07:04:12', '2019-08-19 07:04:12');
INSERT INTO `sys_login_log` VALUES ('1163359698716463106', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-19 07:59:01', '2019-08-19 07:59:01');
INSERT INTO `sys_login_log` VALUES ('1163373813417713665', '登录日志', '1', '成功', null, '127.0.0.1', '2019-08-19 08:55:06', '2019-08-19 08:55:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统首页', '/dashboard', 'sys:dashboard:info', '1', 'el-icon-star-on', '0', '1', '1', '2018-12-06 14:54:07', '2019-07-24 03:18:12', '0');
INSERT INTO `sys_menu` VALUES ('15', '0', '系统管理', '/sys', null, '0', 'el-icon-setting', '1', '1', '1', '2018-12-10 17:52:34', '2019-07-24 03:18:23', '0');
INSERT INTO `sys_menu` VALUES ('16', '15', '用户管理', '/sysuser', 'sys:user:list', '1', null, '16', '1', '1', '2018-12-10 18:28:59', '2019-01-02 10:38:09', '0');
INSERT INTO `sys_menu` VALUES ('17', '15', '角色管理', '/sysrole', 'sys:role:list', '1', null, '17', '1', '1', '2018-12-10 18:35:34', '2019-01-03 01:33:09', '0');
INSERT INTO `sys_menu` VALUES ('18', '15', '菜单管理', '/sysmenu', 'sys:menu:list', '1', null, '18', '1', '1', '2018-12-10 18:36:16', '2019-01-03 01:39:01', '0');
INSERT INTO `sys_menu` VALUES ('19', '15', '部门管理', '/sysdept', 'sys:dept:list', '1', null, '19', '1', '1', '2018-12-10 18:37:20', '2019-01-03 01:41:49', '0');
INSERT INTO `sys_menu` VALUES ('21', '15', '定时任务', '/schedulejob', 'sys:schedule:list', '1', null, '21', '1', '1', '2018-12-10 18:39:14', '2019-01-03 01:42:33', '0');
INSERT INTO `sys_menu` VALUES ('1080412372541181953', '16', '新增', '/sysuser/add', 'sys:user:add', '2', null, '1', null, null, '2019-01-02 10:35:57', '2019-05-31 09:38:25', '0');
INSERT INTO `sys_menu` VALUES ('1080413095496585218', '16', '删除', '/sysuser/del', 'sys:user:del', '2', null, '2', null, null, '2019-01-02 10:38:50', '2019-04-15 07:21:36', '0');
INSERT INTO `sys_menu` VALUES ('1080636440926232577', '16', '重置密码', '/sysuser/reset/password', 'sys:user:resetPassword', '2', null, '3', null, null, '2019-01-03 01:26:19', '2019-04-15 07:21:46', '0');
INSERT INTO `sys_menu` VALUES ('1080636634896015362', '16', '修改密码', '/sysuser/change/password', 'sys:user:changePassword', '2', null, '4', null, null, '2019-01-03 01:27:06', '2019-04-15 07:21:52', '0');
INSERT INTO `sys_menu` VALUES ('1080637598663188481', '17', '新增', '/sysrole/add', 'sys:role:add', '2', null, '1', null, null, '2019-01-03 01:30:55', '2019-05-31 09:51:21', '0');
INSERT INTO `sys_menu` VALUES ('1080637823859564545', '17', '删除', '/sysrole/del', 'sys:role:del', '2', null, '2', null, null, '2019-01-03 01:31:49', '2019-04-15 07:22:21', '0');
INSERT INTO `sys_menu` VALUES ('1080638043456544769', '17', '权限配置', '/sysrole/configPerm', 'sys:role:configPerm', '2', null, '4', null, null, '2019-01-03 01:32:42', '2019-05-31 09:52:38', '0');
INSERT INTO `sys_menu` VALUES ('1080639293405274114', '18', '新增', '/sysmenu/add', 'sys:menu:add', '2', null, '1', null, null, '2019-01-03 01:37:40', '2019-05-31 09:55:33', '0');
INSERT INTO `sys_menu` VALUES ('1080639432148656130', '18', '删除', '/sysmenu/del', 'sys:menu:del', '2', null, '2', null, null, '2019-01-03 01:38:13', '2019-05-31 10:00:16', '0');
INSERT INTO `sys_menu` VALUES ('1080639863587348482', '19', '新增', '/sysdept/add', 'sys:dept:add', '2', null, '1', null, null, '2019-01-03 01:39:55', '2019-05-31 10:10:19', '0');
INSERT INTO `sys_menu` VALUES ('1080640119691550722', '19', '删除', '/sysdept/del', 'sys:dept:del', '2', null, '2', null, null, '2019-01-03 01:40:57', '2019-04-15 07:23:07', '0');
INSERT INTO `sys_menu` VALUES ('1080640228772814849', '19', '修改', '/sysdept/edit', 'sys:dept:edit', '2', null, '3', null, null, '2019-01-03 01:41:23', '2019-05-31 10:09:12', '0');
INSERT INTO `sys_menu` VALUES ('1080640763785650177', '21', '新增', '/schedule/add', 'sys:schedule:add', '2', null, '1', null, null, '2019-01-03 01:43:30', '2019-05-31 09:07:38', '0');
INSERT INTO `sys_menu` VALUES ('1080640900176027650', '21', '修改', '/schedule/edit', 'sys:schedule:edit', '2', null, '2', null, null, '2019-01-03 01:44:03', '2019-05-31 09:10:53', '0');
INSERT INTO `sys_menu` VALUES ('1080641066287243266', '21', '删除', '/schedule/del', 'sys:schedule:del', '2', null, '3', null, null, '2019-01-03 01:44:42', '2019-04-15 07:23:44', '0');
INSERT INTO `sys_menu` VALUES ('1116603445676101634', '15', '登陆日志', '/loginlog', 'sys:loginLog:list', '1', null, '22', null, null, '2019-04-12 07:26:22', '2019-04-15 07:14:49', '0');
INSERT INTO `sys_menu` VALUES ('1116613754159702018', '15', '业务日志', '/operationlog', 'sys:operationLog:list', '1', null, '23', null, null, '2019-04-12 08:07:19', '2019-04-15 07:18:14', '0');
INSERT INTO `sys_menu` VALUES ('1116961835054452737', '15', '字典管理', '/sysdict', 'sys:dict:list', '1', null, '24', null, null, '2019-04-13 07:10:28', '2019-04-15 07:18:41', '0');
INSERT INTO `sys_menu` VALUES ('1117688867416195074', '1116961835054452737', '新增', '/sysdict/add', 'sys:dict:add', '2', null, '1', null, null, '2019-04-15 07:19:26', '2019-05-31 10:15:40', '0');
INSERT INTO `sys_menu` VALUES ('1117689069371932674', '1116961835054452737', '删除', '/sysdict/delete', 'sys:dict:del', '2', null, '2', null, null, '2019-04-15 07:20:14', '2019-04-15 07:24:16', '0');
INSERT INTO `sys_menu` VALUES ('1117690423326818305', '1116603445676101634', '清空日志', '/sysloginLog/clear', 'sys:loginLog:clear', '2', null, '1', null, null, '2019-04-15 07:25:37', '2019-04-15 07:25:37', '0');
INSERT INTO `sys_menu` VALUES ('1117690805209808898', '1116613754159702018', '清空日志', '/sysoperationLog/clear', 'sys:operationLog:clear', '2', null, '2', null, null, '2019-04-15 07:27:08', '2019-04-15 07:27:08', '0');
INSERT INTO `sys_menu` VALUES ('1134386963948847105', '21', '运行一次', '/schedule/run', 'sys:schedule:run', '2', null, '4', null, null, '2019-05-31 09:11:43', '2019-05-31 09:11:43', '0');
INSERT INTO `sys_menu` VALUES ('1134387182992179202', '21', '停止', '/schedule/pause', 'sys:schedule:pause', '2', null, '5', null, null, '2019-05-31 09:12:35', '2019-05-31 09:12:35', '0');
INSERT INTO `sys_menu` VALUES ('1134387322570227714', '21', '恢复', '/schedule/resume', 'sys:schedule:resume', '2', null, '6', null, null, '2019-05-31 09:13:08', '2019-05-31 09:13:08', '0');
INSERT INTO `sys_menu` VALUES ('1134393918364925954', '16', '修改', '/sysuser/edit', 'sys:user:edit', '2', null, '3', null, null, '2019-05-31 09:39:21', '2019-05-31 09:39:21', '0');
INSERT INTO `sys_menu` VALUES ('1134397077300789249', '17', '编辑', '/sysrole/edit', 'sys:role:edit', '2', null, '3', null, null, '2019-05-31 09:51:54', '2019-05-31 09:51:54', '0');
INSERT INTO `sys_menu` VALUES ('1134398704145481730', '18', '修改', '/sysmenu/edit', 'sys:menu:edit', '2', null, '3', null, null, '2019-05-31 09:58:22', '2019-05-31 09:58:22', '0');
INSERT INTO `sys_menu` VALUES ('1134403202943369217', '1116961835054452737', '修改', '/sysdict/edit', 'sys:dict:edit', '2', null, '3', null, null, '2019-05-31 10:16:14', '2019-05-31 10:16:14', '0');
INSERT INTO `sys_menu` VALUES ('1134405857598062594', '16', '清除缓存', '/sysuser/clearCache', 'sys:user:clearCache', '2', null, '6', null, null, '2019-05-31 10:26:47', '2019-05-31 10:26:47', '0');
INSERT INTO `sys_menu` VALUES ('1135836344682065921', '0', '博客管理', '/blog', null, '0', 'el-icon-menu', '2', null, null, '2019-06-04 09:11:02', '2019-08-13 07:51:12', '0');
INSERT INTO `sys_menu` VALUES ('1135837162231607298', '1135836344682065921', '文章管理', '/article', null, '1', 'el-icon-notebook-1', '1', null, null, '2019-06-04 09:14:17', '2019-06-04 09:18:34', '0');
INSERT INTO `sys_menu` VALUES ('1161477550438887426', '1135836344682065921', '文章分类', '/article/category', null, '1', 'el-icon-s-flag', '2', null, null, '2019-08-14 03:20:02', '2019-08-14 03:21:24', '0');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(32) DEFAULT NULL COMMENT '日志类型',
  `log_name` varchar(64) DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `class_name` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `succeed` varchar(32) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1161167257796112388 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('1116618489721860097', '业务日志', '清空日志', '1', 'com.hsshy.beam.sys.controller.OperationLogController', 'clear', '成功', '', '2019-04-12 08:26:08', '2019-04-12 08:26:08');
INSERT INTO `sys_operation_log` VALUES ('1135837114504622081', '异常日志', '', '1', null, null, '失败', 'org.springframework.http.converter.HttpMessageNotReadableException: JSON parse error: parseInt error, field : orderNum; nested exception is com.alibaba.fastjson.JSONException: parseInt error, field : orderNum\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:205)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.read(FastJsonHttpMessageConverter.java:177)\r\n	at org.springframework.web.servlet.mvc.method.annotation.AbstractMessageConverterMethodArgumentResolver.readWithMessageConverters(AbstractMessageConverterMethodArgumentResolver.java:204)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.readWithMessageConverters(RequestResponseBodyMethodProcessor.java:157)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.resolveArgument(RequestResponseBodyMethodProcessor.java:130)\r\n	at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:126)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:167)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:134)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.modular.common.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: com.alibaba.fastjson.JSONException: parseInt error, field : orderNum\r\n	at com.alibaba.fastjson.serializer.IntegerCodec.deserialze(IntegerCodec.java:99)\r\n	at com.alibaba.fastjson.parser.deserializer.DefaultFieldDeserializer.parseField(DefaultFieldDeserializer.java:86)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.parseField(JavaBeanDeserializer.java:1078)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.deserialze(JavaBeanDeserializer.java:773)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.parseRest(JavaBeanDeserializer.java:1283)\r\n	at com.alibaba.fastjson.parser.deserializer.FastjsonASMDeserializer_2_Menu.deserialze(Unknown Source)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.deserialze(JavaBeanDeserializer.java:267)\r\n	at com.alibaba.fastjson.parser.DefaultJSONParser.parseObject(DefaultJSONParser.java:661)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:365)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:333)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:296)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:402)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:484)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:203)\r\n	... 73 more\r\nCaused by: java.lang.NumberFormatException: For input string: \"el-icon-notebook-1\"\r\n	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)\r\n	at java.lang.Integer.parseInt(Integer.java:580)\r\n	at java.lang.Integer.parseInt(Integer.java:615)\r\n	at com.alibaba.fastjson.util.TypeUtils.castToInt(TypeUtils.java:588)\r\n	at com.alibaba.fastjson.serializer.IntegerCodec.deserialze(IntegerCodec.java:95)\r\n	... 86 more\r\n', '2019-06-04 09:14:06', '2019-06-04 09:14:06');
INSERT INTO `sys_operation_log` VALUES ('1139352013402910722', '异常日志', '', '1', null, null, '失败', 'org.springframework.http.converter.HttpMessageNotReadableException: JSON parse error: parseInt error, field : orderNum; nested exception is com.alibaba.fastjson.JSONException: parseInt error, field : orderNum\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:205)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.read(FastJsonHttpMessageConverter.java:177)\r\n	at org.springframework.web.servlet.mvc.method.annotation.AbstractMessageConverterMethodArgumentResolver.readWithMessageConverters(AbstractMessageConverterMethodArgumentResolver.java:204)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.readWithMessageConverters(RequestResponseBodyMethodProcessor.java:157)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.resolveArgument(RequestResponseBodyMethodProcessor.java:130)\r\n	at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:126)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:167)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:134)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.common.xss.XssFilter.doFilter(XssFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: com.alibaba.fastjson.JSONException: parseInt error, field : orderNum\r\n	at com.alibaba.fastjson.serializer.IntegerCodec.deserialze(IntegerCodec.java:99)\r\n	at com.alibaba.fastjson.parser.deserializer.DefaultFieldDeserializer.parseField(DefaultFieldDeserializer.java:86)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.parseField(JavaBeanDeserializer.java:1078)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.deserialze(JavaBeanDeserializer.java:773)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.parseRest(JavaBeanDeserializer.java:1283)\r\n	at com.alibaba.fastjson.parser.deserializer.FastjsonASMDeserializer_2_Menu.deserialze(Unknown Source)\r\n	at com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer.deserialze(JavaBeanDeserializer.java:267)\r\n	at com.alibaba.fastjson.parser.DefaultJSONParser.parseObject(DefaultJSONParser.java:661)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:365)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:333)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:296)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:402)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:484)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:203)\r\n	... 73 more\r\nCaused by: java.lang.NumberFormatException: For input string: \"el-icon-key\"\r\n	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)\r\n	at java.lang.Integer.parseInt(Integer.java:580)\r\n	at java.lang.Integer.parseInt(Integer.java:615)\r\n	at com.alibaba.fastjson.util.TypeUtils.castToInt(TypeUtils.java:588)\r\n	at com.alibaba.fastjson.serializer.IntegerCodec.deserialze(IntegerCodec.java:95)\r\n	... 86 more\r\n', '2019-06-14 02:01:03', '2019-06-14 02:01:03');
INSERT INTO `sys_operation_log` VALUES ('1139354898106789890', '异常日志', '', '1', null, null, '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error.\r\n### The error may exist in com/hsshy/beam/modular/business/dao/AdMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error.\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy101.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:230)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperMethod.executeForMany2(PageMapperMethod.java:128)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperMethod.execute(PageMapperMethod.java:98)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperProxy.invoke(PageMapperProxy.java:64)\r\n	at com.sun.proxy.TProxy114.selectPage(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImpl.page(ServiceImpl.java:296)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImplTTFastClassBySpringCGLIBTT76535273.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.business.service.impl.AdServiceImplTTEnhancerBySpringCGLIBTT57fb90e5.page(<generated>)\r\n	at com.baomidou.mybatisplus.extension.service.impl.ServiceImplTTFastClassBySpringCGLIBTT76535273.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.business.service.impl.AdServiceImplTTEnhancerBySpringCGLIBTT502dd31f.page(<generated>)\r\n	at com.hsshy.beam.modular.business.controller.AdController.pageList(AdController.java:41)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.common.xss.XssFilter.doFilter(XssFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error.\r\n### The error may exist in com/hsshy/beam/modular/business/dao/AdMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### Cause: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error.\r\n	at org.apache.ibatis.exceptions.ExceptionFactory.wrapException(ExceptionFactory.java:30)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:150)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:141)\r\n	at sun.reflect.GeneratedMethodAccessor153.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 90 more\r\nCaused by: com.baomidou.mybatisplus.core.exceptions.MybatisPlusException: Error: Method queryTotal execution error.\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:223)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.intercept(PaginationInterceptor.java:177)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:61)\r\n	at com.sun.proxy.TProxy147.prepare(Unknown Source)\r\n	at org.apache.ibatis.executor.SimpleExecutor.prepareStatement(SimpleExecutor.java:85)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:62)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:326)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:136)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:148)\r\n	... 97 more\r\nCaused by: java.sql.SQLSyntaxErrorException: Table \'beam.c_ad\' doesn\'t exist\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeQuery(ClientPreparedStatement.java:1019)\r\n	at com.zaxxer.hikari.pool.ProxyPreparedStatement.executeQuery(ProxyPreparedStatement.java:52)\r\n	at com.zaxxer.hikari.pool.HikariProxyPreparedStatement.executeQuery(HikariProxyPreparedStatement.java)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:56)\r\n	at com.sun.proxy.TProxy148.executeQuery(Unknown Source)\r\n	at com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor.queryTotal(PaginationInterceptor.java:208)\r\n	... 106 more\r\n', '2019-06-14 02:12:31', '2019-06-14 02:12:31');
INSERT INTO `sys_operation_log` VALUES ('1148046543947280386', '业务日志', '保存角色', '1', 'com.hsshy.beam.modular.sys.controller.RoleController', 'save', '成功', '{\"id\":1148046543737565186,\"roleName\":\"test\",\"remark\":\"test\",\"createTime\":\"Jul 8, 2019 9:50:00 AM\",\"updateTime\":\"Jul 8, 2019 9:50:00 AM\",\"currentPage\":0,\"pageSize\":10}', '2019-07-08 01:50:00', '2019-07-08 01:50:00');
INSERT INTO `sys_operation_log` VALUES ('1148046748482514946', '异常日志', '', '1', null, null, '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userIds\' not found. Available parameters are [array]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy101.delete(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.delete(SqlSessionTemplate.java:310)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperMethod.execute(PageMapperMethod.java:78)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperProxy.invoke(PageMapperProxy.java:64)\r\n	at com.sun.proxy.TProxy104.delURInUserId(Unknown Source)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImpl.deleteUser(UserServiceImpl.java:122)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTFastClassBySpringCGLIBTTe3d15b57.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTEnhancerBySpringCGLIBTT55bde113.deleteUser(<generated>)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTFastClassBySpringCGLIBTTe3d15b57.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTEnhancerBySpringCGLIBTT22ac6bcb.deleteUser(<generated>)\r\n	at com.hsshy.beam.modular.sys.controller.UserController.delete(UserController.java:67)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTFastClassBySpringCGLIBTTdf16edb7.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptorT1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\r\n	at org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTEnhancerBySpringCGLIBTTdcb50f5f.delete(<generated>)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTFastClassBySpringCGLIBTTdf16edb7.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptorT1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\r\n	at org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTEnhancerBySpringCGLIBTTf2c9257.delete(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.common.xss.XssFilter.doFilter(XssFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'userIds\' not found. Available parameters are [array]\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSessionTStrictMap.get(DefaultSqlSession.java:343)\r\n	at org.apache.ibatis.scripting.xmltags.DynamicContextTContextAccessor.getProperty(DynamicContext.java:115)\r\n	at org.apache.ibatis.ognl.OgnlRuntime.getProperty(OgnlRuntime.java:2685)\r\n	at org.apache.ibatis.ognl.ASTProperty.getValueBody(ASTProperty.java:114)\r\n	at org.apache.ibatis.ognl.SimpleNode.evaluateGetValueBody(SimpleNode.java:212)\r\n	at org.apache.ibatis.ognl.SimpleNode.getValue(SimpleNode.java:258)\r\n	at org.apache.ibatis.ognl.Ognl.getValue(Ognl.java:470)\r\n	at org.apache.ibatis.ognl.Ognl.getValue(Ognl.java:434)\r\n	at org.apache.ibatis.scripting.xmltags.OgnlCache.getValue(OgnlCache.java:44)\r\n	at org.apache.ibatis.scripting.xmltags.ExpressionEvaluator.evaluateIterable(ExpressionEvaluator.java:43)\r\n	at org.apache.ibatis.scripting.xmltags.ForEachSqlNode.apply(ForEachSqlNode.java:55)\r\n	at org.apache.ibatis.scripting.xmltags.MixedSqlNode.apply(MixedSqlNode.java:33)\r\n	at org.apache.ibatis.scripting.xmltags.DynamicSqlSource.getBoundSql(DynamicSqlSource.java:41)\r\n	at org.apache.ibatis.mapping.MappedStatement.getBoundSql(MappedStatement.java:292)\r\n	at org.apache.ibatis.executor.statement.BaseStatementHandler.<init>(BaseStatementHandler.java:64)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.<init>(PreparedStatementHandler.java:40)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.<init>(RoutingStatementHandler.java:46)\r\n	at org.apache.ibatis.session.Configuration.newStatementHandler(Configuration.java:558)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:48)\r\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.delete(DefaultSqlSession.java:213)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 109 more\r\n', '2019-07-08 01:50:49', '2019-07-08 01:50:49');
INSERT INTO `sys_operation_log` VALUES ('1148047028892708866', '异常日志', '', '1', null, null, '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userIds\' not found. Available parameters are [array]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy101.delete(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.delete(SqlSessionTemplate.java:310)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperMethod.execute(PageMapperMethod.java:78)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperProxy.invoke(PageMapperProxy.java:64)\r\n	at com.sun.proxy.TProxy104.delURInUserId(Unknown Source)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImpl.deleteUser(UserServiceImpl.java:122)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTFastClassBySpringCGLIBTTe3d15b57.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTEnhancerBySpringCGLIBTT55bde113.deleteUser(<generated>)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTFastClassBySpringCGLIBTTe3d15b57.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTEnhancerBySpringCGLIBTT22ac6bcb.deleteUser(<generated>)\r\n	at com.hsshy.beam.modular.sys.controller.UserController.delete(UserController.java:67)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTFastClassBySpringCGLIBTTdf16edb7.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptorT1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\r\n	at org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTEnhancerBySpringCGLIBTTdcb50f5f.delete(<generated>)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTFastClassBySpringCGLIBTTdf16edb7.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptorT1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\r\n	at org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTEnhancerBySpringCGLIBTTf2c9257.delete(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.common.xss.XssFilter.doFilter(XssFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'userIds\' not found. Available parameters are [array]\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSessionTStrictMap.get(DefaultSqlSession.java:343)\r\n	at org.apache.ibatis.scripting.xmltags.DynamicContextTContextAccessor.getProperty(DynamicContext.java:115)\r\n	at org.apache.ibatis.ognl.OgnlRuntime.getProperty(OgnlRuntime.java:2685)\r\n	at org.apache.ibatis.ognl.ASTProperty.getValueBody(ASTProperty.java:114)\r\n	at org.apache.ibatis.ognl.SimpleNode.evaluateGetValueBody(SimpleNode.java:212)\r\n	at org.apache.ibatis.ognl.SimpleNode.getValue(SimpleNode.java:258)\r\n	at org.apache.ibatis.ognl.Ognl.getValue(Ognl.java:470)\r\n	at org.apache.ibatis.ognl.Ognl.getValue(Ognl.java:434)\r\n	at org.apache.ibatis.scripting.xmltags.OgnlCache.getValue(OgnlCache.java:44)\r\n	at org.apache.ibatis.scripting.xmltags.ExpressionEvaluator.evaluateIterable(ExpressionEvaluator.java:43)\r\n	at org.apache.ibatis.scripting.xmltags.ForEachSqlNode.apply(ForEachSqlNode.java:55)\r\n	at org.apache.ibatis.scripting.xmltags.MixedSqlNode.apply(MixedSqlNode.java:33)\r\n	at org.apache.ibatis.scripting.xmltags.DynamicSqlSource.getBoundSql(DynamicSqlSource.java:41)\r\n	at org.apache.ibatis.mapping.MappedStatement.getBoundSql(MappedStatement.java:292)\r\n	at org.apache.ibatis.executor.statement.BaseStatementHandler.<init>(BaseStatementHandler.java:64)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.<init>(PreparedStatementHandler.java:40)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.<init>(RoutingStatementHandler.java:46)\r\n	at org.apache.ibatis.session.Configuration.newStatementHandler(Configuration.java:558)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:48)\r\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.delete(DefaultSqlSession.java:213)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 109 more\r\n', '2019-07-08 01:51:56', '2019-07-08 01:51:56');
INSERT INTO `sys_operation_log` VALUES ('1148047152393990146', '异常日志', '', '1', null, null, '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'userIds\' not found. Available parameters are [array]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy101.delete(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.delete(SqlSessionTemplate.java:310)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperMethod.execute(PageMapperMethod.java:78)\r\n	at com.baomidou.mybatisplus.core.override.PageMapperProxy.invoke(PageMapperProxy.java:64)\r\n	at com.sun.proxy.TProxy104.delURInUserId(Unknown Source)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImpl.deleteUser(UserServiceImpl.java:122)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTFastClassBySpringCGLIBTTe3d15b57.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTEnhancerBySpringCGLIBTT55bde113.deleteUser(<generated>)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTFastClassBySpringCGLIBTTe3d15b57.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at com.hsshy.beam.modular.sys.service.impl.UserServiceImplTTEnhancerBySpringCGLIBTT22ac6bcb.deleteUser(<generated>)\r\n	at com.hsshy.beam.modular.sys.controller.UserController.delete(UserController.java:67)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTFastClassBySpringCGLIBTTdf16edb7.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptorT1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\r\n	at org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTEnhancerBySpringCGLIBTTdcb50f5f.delete(<generated>)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTFastClassBySpringCGLIBTTdf16edb7.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptorT1.proceed(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:82)\r\n	at org.apache.shiro.authz.aop.AuthorizingMethodInterceptor.invoke(AuthorizingMethodInterceptor.java:39)\r\n	at org.apache.shiro.spring.security.interceptor.AopAllianceAnnotationsAuthorizingMethodInterceptor.invoke(AopAllianceAnnotationsAuthorizingMethodInterceptor.java:115)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:688)\r\n	at com.hsshy.beam.modular.sys.controller.UserControllerTTEnhancerBySpringCGLIBTTf2c9257.delete(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.common.xss.XssFilter.doFilter(XssFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'userIds\' not found. Available parameters are [array]\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSessionTStrictMap.get(DefaultSqlSession.java:343)\r\n	at org.apache.ibatis.scripting.xmltags.DynamicContextTContextAccessor.getProperty(DynamicContext.java:115)\r\n	at org.apache.ibatis.ognl.OgnlRuntime.getProperty(OgnlRuntime.java:2685)\r\n	at org.apache.ibatis.ognl.ASTProperty.getValueBody(ASTProperty.java:114)\r\n	at org.apache.ibatis.ognl.SimpleNode.evaluateGetValueBody(SimpleNode.java:212)\r\n	at org.apache.ibatis.ognl.SimpleNode.getValue(SimpleNode.java:258)\r\n	at org.apache.ibatis.ognl.Ognl.getValue(Ognl.java:470)\r\n	at org.apache.ibatis.ognl.Ognl.getValue(Ognl.java:434)\r\n	at org.apache.ibatis.scripting.xmltags.OgnlCache.getValue(OgnlCache.java:44)\r\n	at org.apache.ibatis.scripting.xmltags.ExpressionEvaluator.evaluateIterable(ExpressionEvaluator.java:43)\r\n	at org.apache.ibatis.scripting.xmltags.ForEachSqlNode.apply(ForEachSqlNode.java:55)\r\n	at org.apache.ibatis.scripting.xmltags.MixedSqlNode.apply(MixedSqlNode.java:33)\r\n	at org.apache.ibatis.scripting.xmltags.DynamicSqlSource.getBoundSql(DynamicSqlSource.java:41)\r\n	at org.apache.ibatis.mapping.MappedStatement.getBoundSql(MappedStatement.java:292)\r\n	at org.apache.ibatis.executor.statement.BaseStatementHandler.<init>(BaseStatementHandler.java:64)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.<init>(PreparedStatementHandler.java:40)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.<init>(RoutingStatementHandler.java:46)\r\n	at org.apache.ibatis.session.Configuration.newStatementHandler(Configuration.java:558)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:48)\r\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:198)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.delete(DefaultSqlSession.java:213)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.__invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45009)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:45012)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 109 more\r\n', '2019-07-08 01:52:25', '2019-07-08 01:52:25');
INSERT INTO `sys_operation_log` VALUES ('1161167257796112386', '异常日志', '', '1', null, null, '失败', 'org.springframework.http.converter.HttpMessageNotReadableException: JSON parse error: not close json text, token : error; nested exception is com.alibaba.fastjson.JSONException: not close json text, token : error\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:205)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.read(FastJsonHttpMessageConverter.java:177)\r\n	at org.springframework.web.servlet.mvc.method.annotation.AbstractMessageConverterMethodArgumentResolver.readWithMessageConverters(AbstractMessageConverterMethodArgumentResolver.java:204)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.readWithMessageConverters(RequestResponseBodyMethodProcessor.java:157)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.resolveArgument(RequestResponseBodyMethodProcessor.java:130)\r\n	at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:126)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:167)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:134)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.common.xss.XssFilter.doFilter(XssFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: com.alibaba.fastjson.JSONException: not close json text, token : error\r\n	at com.alibaba.fastjson.parser.DefaultJSONParser.close(DefaultJSONParser.java:1482)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:369)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:333)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:296)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:402)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:484)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:203)\r\n	... 73 more\r\n', '2019-08-13 06:47:02', '2019-08-13 06:47:02');
INSERT INTO `sys_operation_log` VALUES ('1161167257796112387', '异常日志', '', '1', null, null, '失败', 'org.springframework.http.converter.HttpMessageNotReadableException: JSON parse error: not close json text, token : error; nested exception is com.alibaba.fastjson.JSONException: not close json text, token : error\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:205)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.read(FastJsonHttpMessageConverter.java:177)\r\n	at org.springframework.web.servlet.mvc.method.annotation.AbstractMessageConverterMethodArgumentResolver.readWithMessageConverters(AbstractMessageConverterMethodArgumentResolver.java:204)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.readWithMessageConverters(RequestResponseBodyMethodProcessor.java:157)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor.resolveArgument(RequestResponseBodyMethodProcessor.java:130)\r\n	at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:126)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:167)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:134)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.hsshy.beam.common.xss.XssFilter.doFilter(XssFilter.java:51)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:200)\r\n	at org.apache.catalina.core.StandardContextValve.__invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:41002)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:836)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1747)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: com.alibaba.fastjson.JSONException: not close json text, token : error\r\n	at com.alibaba.fastjson.parser.DefaultJSONParser.close(DefaultJSONParser.java:1482)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:369)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:333)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:296)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:402)\r\n	at com.alibaba.fastjson.JSON.parseObject(JSON.java:484)\r\n	at com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter.readType(FastJsonHttpMessageConverter.java:203)\r\n	... 73 more\r\n', '2019-08-13 06:47:02', '2019-08-13 06:47:02');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '超级管理员', '2018-10-10 22:39:38', '2018-12-23 11:45:49');
INSERT INTO `sys_role` VALUES ('1076685137679704065', '游客', '游客', '2018-12-23 03:45:15', '2019-04-12 07:12:41');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('175', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('176', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('177', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('178', '1', '1080412372541181953');
INSERT INTO `sys_role_menu` VALUES ('179', '1', '1080413095496585218');
INSERT INTO `sys_role_menu` VALUES ('180', '1', '1080636440926232577');
INSERT INTO `sys_role_menu` VALUES ('181', '1', '1080636634896015362');
INSERT INTO `sys_role_menu` VALUES ('182', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('183', '1', '1080637598663188481');
INSERT INTO `sys_role_menu` VALUES ('184', '1', '1080637823859564545');
INSERT INTO `sys_role_menu` VALUES ('185', '1', '1080638043456544769');
INSERT INTO `sys_role_menu` VALUES ('186', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('187', '1', '1080639293405274114');
INSERT INTO `sys_role_menu` VALUES ('188', '1', '1080639432148656130');
INSERT INTO `sys_role_menu` VALUES ('190', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('191', '1', '1080639863587348482');
INSERT INTO `sys_role_menu` VALUES ('192', '1', '1080640119691550722');
INSERT INTO `sys_role_menu` VALUES ('193', '1', '1080640228772814849');
INSERT INTO `sys_role_menu` VALUES ('194', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('195', '1', '1080640763785650177');
INSERT INTO `sys_role_menu` VALUES ('196', '1', '1080640900176027650');
INSERT INTO `sys_role_menu` VALUES ('197', '1', '1080641066287243266');
INSERT INTO `sys_role_menu` VALUES ('276', '1076685137679704065', '1');
INSERT INTO `sys_role_menu` VALUES ('277', '1076685137679704065', '15');
INSERT INTO `sys_role_menu` VALUES ('278', '1076685137679704065', '16');
INSERT INTO `sys_role_menu` VALUES ('279', '1076685137679704065', '1080412372541181953');
INSERT INTO `sys_role_menu` VALUES ('280', '1076685137679704065', '1080636440926232577');
INSERT INTO `sys_role_menu` VALUES ('281', '1076685137679704065', '1134393918364925954');
INSERT INTO `sys_role_menu` VALUES ('282', '1076685137679704065', '1134405857598062594');
INSERT INTO `sys_role_menu` VALUES ('283', '1076685137679704065', '17');
INSERT INTO `sys_role_menu` VALUES ('284', '1076685137679704065', '1080637598663188481');
INSERT INTO `sys_role_menu` VALUES ('285', '1076685137679704065', '1134397077300789249');
INSERT INTO `sys_role_menu` VALUES ('286', '1076685137679704065', '1080638043456544769');
INSERT INTO `sys_role_menu` VALUES ('287', '1076685137679704065', '18');
INSERT INTO `sys_role_menu` VALUES ('288', '1076685137679704065', '1080639293405274114');
INSERT INTO `sys_role_menu` VALUES ('289', '1076685137679704065', '1134398704145481730');
INSERT INTO `sys_role_menu` VALUES ('290', '1076685137679704065', '19');
INSERT INTO `sys_role_menu` VALUES ('291', '1076685137679704065', '1080639863587348482');
INSERT INTO `sys_role_menu` VALUES ('292', '1076685137679704065', '1080640119691550722');
INSERT INTO `sys_role_menu` VALUES ('293', '1076685137679704065', '1080640228772814849');
INSERT INTO `sys_role_menu` VALUES ('294', '1076685137679704065', '21');
INSERT INTO `sys_role_menu` VALUES ('295', '1076685137679704065', '1134386963948847105');
INSERT INTO `sys_role_menu` VALUES ('296', '1076685137679704065', '1134387182992179202');
INSERT INTO `sys_role_menu` VALUES ('297', '1076685137679704065', '1134387322570227714');
INSERT INTO `sys_role_menu` VALUES ('298', '1076685137679704065', '1116603445676101634');
INSERT INTO `sys_role_menu` VALUES ('299', '1076685137679704065', '1116961835054452737');
INSERT INTO `sys_role_menu` VALUES ('300', '1076685137679704065', '1117688867416195074');
INSERT INTO `sys_role_menu` VALUES ('301', '1148046543737565186', '15');
INSERT INTO `sys_role_menu` VALUES ('302', '1148046543737565186', '16');
INSERT INTO `sys_role_menu` VALUES ('303', '1148046543737565186', '1080412372541181953');
INSERT INTO `sys_role_menu` VALUES ('304', '1148046543737565186', '1080413095496585218');
INSERT INTO `sys_role_menu` VALUES ('305', '1148046543737565186', '1080636440926232577');
INSERT INTO `sys_role_menu` VALUES ('306', '1148046543737565186', '1134393918364925954');
INSERT INTO `sys_role_menu` VALUES ('307', '1148046543737565186', '1080636634896015362');
INSERT INTO `sys_role_menu` VALUES ('308', '1148046543737565186', '1134405857598062594');

-- ----------------------------
-- Table structure for sys_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_job`;
CREATE TABLE `sys_schedule_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1080345897063223298 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of sys_schedule_job
-- ----------------------------
INSERT INTO `sys_schedule_job` VALUES ('1080345897063223297', 'testTask', 'test2', null, '0 * * * * ?', '0', '测试', '2019-01-02 06:11:48', '2019-05-31 09:37:05');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `dept_id` bigint(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'https://wx.qlogo.cn/mmopen/vi_32/WgSOjJRaQq8FbBHGAr5gLHdaVia7SrnOwRZ9TL8lcDicXuMgqSR8rVgebFa9uIRiaLzYrPdtIia3jqjzkHVVOS38sw/132', 'admin', '8ebc72eb184c2e93173279eded9e229b6a886b6081a1c2d6bda7ea4cd391417c', '6OjF08wDOip46XZ8SYR4', 'admin', '4', '2018-10-08 16:05:42', '1', '457030599@qq.com', '1', '1', null, null, null, '2018-10-31 17:48:40', '2019-05-31 02:05:42', '0');
INSERT INTO `sys_user` VALUES ('1072429679148908546', 'https://wx.qlogo.cn/mmopen/vi_32/WgSOjJRaQq8FbBHGAr5gLHdaVia7SrnOwRZ9TL8lcDicXuMgqSR8rVgebFa9uIRiaLzYrPdtIia3jqjzkHVVOS38sw/132', 'test', '7848e5f0b4a6d48ad145984735bf98efe2ff2ab4f99a92b2c29201207ea3fe5f', 'ZCCRZ4gOfa8WzorCBFii', 'test', '3', null, null, null, null, '1', null, null, null, '2018-12-11 09:55:35', '2019-03-22 10:10:57', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('21', '1072429679148908546', '1076685137679704065');
INSERT INTO `sys_user_role` VALUES ('22', '1', '1');
INSERT INTO `sys_user_role` VALUES ('23', '1', '1076685137679704065');
