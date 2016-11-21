/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : db_morning

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-11-22 02:48:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `LOGIN_NAME` varchar(30) DEFAULT NULL COMMENT '昵称',
  `LOGIN_PASSWORD` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '注册时间',
  `USER_NAME` varchar(20) DEFAULT NULL COMMENT '姓名',
  `USER_IDENTITY` varchar(18) DEFAULT NULL COMMENT '身份证',
  `PIC_IMG` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `TELEPHONE` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `SEX` tinyint(1) DEFAULT '0' COMMENT '性别 0 保密 1男  2女',
  `AGE` tinyint(3) DEFAULT '0' COMMENT '年龄',
  `PAYMENT` int(11) DEFAULT '0' COMMENT '账户余额',
  `USER_POINT` int(11) DEFAULT '0' COMMENT '用户商城积分 ',
  `MSG_NUM` int(11) DEFAULT '0' COMMENT '站内信未读消息数',
  `STATUS` tinyint(1) DEFAULT '0' COMMENT '状态：0.冻结；1.正常；2.删除',
  `LAST_LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `LAST_LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account
-- ----------------------------
INSERT INTO `tb_account` VALUES ('1', '猫morning', 'a2f87176e717b96ed71e74dbd640f672', '2016-09-07 13:51:32', '陈星星', '332522199410131111', 'upload/icon/20161110/1478747550158.jpg', '5524551@qq.com', '18857107899', '0', null, '0', '0', '0', '1', '2016-11-10 03:11:06', '172.27.84.112');
INSERT INTO `tb_account` VALUES ('136', '猫宁morning.', 'a2f87176e717b96ed71e74dbd640f672', '2016-05-15 00:54:33', '猫123', '332522199410130030', null, '81017051@qq.com', '18857105127', '1', '21', null, '0', '0', '1', '2016-10-17 00:07:13', '127.0.0.1');
INSERT INTO `tb_account` VALUES ('137', '穿鞋子的猫', 'a2f87176e717b96ed71e74dbd640f672', '2016-10-12 00:37:11', '陈星星', '332522199410130030', 'upload/icon/20161109/1478698272739.jpg', '810170512@qq.com', '18857105137', '1', '0', '0', '0', '0', '1', '2016-11-21 17:52:29', '172.18.52.190');

-- ----------------------------
-- Table structure for tb_account_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_account_address`;
CREATE TABLE `tb_account_address` (
  `ADDRESS_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `ACCOUNT_ID` int(9) DEFAULT NULL COMMENT '帐号ID',
  `ORDER_USER_NAME` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `ORDER_USER_TELPHONE` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `TAG_NAME` varchar(5) DEFAULT NULL COMMENT '地址标签',
  `PROVINCE_ID` int(9) DEFAULT NULL COMMENT '省份ID',
  `PROVINCE_NAME` varchar(50) DEFAULT NULL COMMENT '省份名称',
  `CITY_ID` int(9) DEFAULT NULL COMMENT '城市编号',
  `CITY_NAME` varchar(50) DEFAULT NULL COMMENT '城市名称',
  `DISTRICT_ID` int(9) DEFAULT NULL COMMENT '市县区ID',
  `DISTRICT_NAME` varchar(50) DEFAULT NULL COMMENT '市县区名称',
  `AREA` int(9) DEFAULT NULL COMMENT '邮政编码',
  `ORDER_USER_ADDRESS` varchar(255) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `ACCOUNT_ID` (`ACCOUNT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account_address
-- ----------------------------
INSERT INTO `tb_account_address` VALUES ('16', '0', '陈星星', '18857105127', '公司', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '123456', '海曙路58号');
INSERT INTO `tb_account_address` VALUES ('17', '0', '现在在', '18857105127', '家', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '123456', '海曙路58号');
INSERT INTO `tb_account_address` VALUES ('18', '132', '陈星星', '18857106123', '公司', '1', '北京市', '2', '北京市', '4', '西城区', '123456', '斯蒂芬粉斯蒂芬斯蒂芬');
INSERT INTO `tb_account_address` VALUES ('20', '132', '陈星星', '12345678909', '公司', '44', '上海市', '45', '上海市', '48', '徐汇区', '123456', '大森服饰发送发送粉');
INSERT INTO `tb_account_address` VALUES ('21', '132', '陈彦晓', '18857105127', '公司', '1', '北京市', '2', '北京市', '9', '石景山区', '123456', '古典风格豆腐干地方个');
INSERT INTO `tb_account_address` VALUES ('22', '135', '陈星星', '18857105127', '学校', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '321100', '海曙路58号（杭州师范大学）');
INSERT INTO `tb_account_address` VALUES ('23', '137', '沉香', '18857105127', '公司', '406', '山西省', '451', '阳泉市', '64', '崇明县', '332101', '竹阳街66号');
INSERT INTO `tb_account_address` VALUES ('24', '1', '陈星星', '18857105127', '家', '108', '河北省', '176', '承德市', '179', '鹰手营子矿区', '326510', '垦丰大街33-2');

-- ----------------------------
-- Table structure for tb_account_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_account_login_log`;
CREATE TABLE `tb_account_login_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `USER_IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `OPERATING_SYSTEM` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `BROWSER` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account_login_log
-- ----------------------------
INSERT INTO `tb_account_login_log` VALUES ('253', '2016-09-13 14:07:11', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('254', '2016-09-14 23:46:00', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('255', '2016-09-26 11:49:50', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('256', '2016-09-27 01:22:09', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('257', '2016-09-27 01:46:12', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('258', '2016-09-27 01:48:37', '127.0.0.1', '135', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_account_login_log` VALUES ('259', '2016-09-27 01:52:24', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('260', '2016-09-27 02:03:41', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('261', '2016-09-27 23:13:24', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('262', '2016-09-27 23:21:17', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('263', '2016-09-27 23:24:05', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('264', '2016-09-27 23:34:51', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('265', '2016-09-27 23:56:30', '127.0.0.1', '135', 'WINDOWS_10', 'EDGE12');
INSERT INTO `tb_account_login_log` VALUES ('266', '2016-10-02 04:31:30', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('267', '2016-10-02 19:19:28', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('268', '2016-10-02 20:15:41', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('269', '2016-10-09 01:19:01', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('270', '2016-10-09 14:58:32', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('271', '2016-10-12 03:08:47', '127.0.0.1', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('272', '2016-10-12 03:12:44', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('273', '2016-10-12 03:21:08', '127.0.0.1', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('274', '2016-10-12 23:30:07', '127.0.0.1', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('275', '2016-10-12 23:31:11', '127.0.0.1', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('276', '2016-10-16 03:09:59', '127.0.0.1', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('277', '2016-10-16 03:55:01', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('278', '2016-10-16 04:00:30', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('279', '2016-10-16 04:00:49', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('280', '2016-10-16 04:20:13', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('281', '2016-10-16 04:40:38', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('282', '2016-10-16 23:14:59', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('283', '2016-10-16 23:33:20', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('284', '2016-10-16 23:36:46', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('285', '2016-10-16 23:39:17', '127.0.0.1', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('286', '2016-10-17 00:06:43', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('287', '2016-10-17 00:07:13', '127.0.0.1', '136', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('288', '2016-10-17 00:10:21', '127.0.0.1', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('289', '2016-10-18 20:16:44', '172.27.92.118', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('290', '2016-10-19 17:23:00', '172.29.138.207', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('291', '2016-10-20 15:56:01', '172.27.156.197', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('292', '2016-10-20 16:07:03', '172.27.156.197', '135', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('293', '2016-10-24 22:56:44', '172.27.35.248', '135', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_account_login_log` VALUES ('294', '2016-10-26 17:07:33', '172.27.103.172', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('295', '2016-10-29 14:46:47', '172.27.189.53', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('296', '2016-11-02 15:17:24', '172.18.52.242', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('297', '2016-11-05 06:46:54', '172.27.164.208', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('298', '2016-11-05 07:28:32', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('299', '2016-11-05 08:37:37', '172.27.164.208', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('300', '2016-11-05 09:38:55', '172.27.164.208', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('301', '2016-11-05 11:06:58', '172.27.164.208', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('302', '2016-11-05 11:16:24', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('303', '2016-11-05 11:18:36', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('304', '2016-11-05 11:20:01', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('305', '2016-11-05 11:21:39', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('306', '2016-11-05 11:30:38', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('307', '2016-11-05 11:44:47', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('308', '2016-11-05 11:45:59', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('309', '2016-11-05 11:46:30', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('310', '2016-11-05 11:46:46', '172.27.164.208', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('311', '2016-11-06 15:20:31', '172.18.56.48', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('312', '2016-11-07 12:41:25', '172.27.242.130', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('313', '2016-11-07 14:04:32', '192.168.16.148', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('314', '2016-11-07 15:00:17', '192.168.16.148', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('315', '2016-11-07 16:44:26', '172.18.54.35', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('316', '2016-11-09 08:35:26', '172.27.58.216', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('317', '2016-11-09 09:06:19', '172.27.58.216', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('318', '2016-11-09 11:05:09', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('319', '2016-11-09 13:16:54', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('320', '2016-11-09 13:30:31', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('321', '2016-11-09 13:46:08', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('322', '2016-11-09 15:12:59', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('323', '2016-11-09 15:28:21', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('324', '2016-11-09 16:16:57', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('325', '2016-11-09 16:45:27', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('326', '2016-11-09 17:14:13', '172.18.48.243', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('327', '2016-11-10 03:09:23', '172.27.84.112', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('328', '2016-11-10 03:11:06', '172.27.84.112', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('329', '2016-11-10 03:25:21', '172.27.84.112', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('330', '2016-11-10 03:32:36', '172.27.86.153', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('331', '2016-11-10 04:09:02', '172.27.86.153', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('332', '2016-11-10 04:29:55', '172.27.86.153', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('333', '2016-11-10 05:22:11', '172.27.86.153', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('334', '2016-11-10 05:58:30', '172.27.86.153', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('335', '2016-11-10 06:29:07', '172.27.86.153', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('336', '2016-11-14 17:12:41', '172.18.59.142', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('337', '2016-11-21 06:01:53', '172.27.200.76', '137', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_account_login_log` VALUES ('338', '2016-11-21 17:52:29', '172.18.52.190', '137', 'WINDOWS_10', 'CHROME45');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `GOODS_ID` int(9) NOT NULL COMMENT '商品ID',
  `GOODS_NUMBER` varchar(20) DEFAULT NULL COMMENT '商品编号',
  `GOODS_NAME` varchar(300) DEFAULT NULL COMMENT '商品名称',
  `GOODS_PRICE` double(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `GOODS_DESCRIPT` varchar(255) DEFAULT '' COMMENT '商品描述',
  `GOODS_CONTEXT` longtext COMMENT '商品详情',
  `GOODS_IMAGENAME` varchar(255) DEFAULT '' COMMENT '图片路径',
  `GOODS_BUY_NUM` int(9) DEFAULT '0' COMMENT '销售数量',
  `GOODS_VIEW_NUM` int(9) DEFAULT '0' COMMENT '游览数量',
  `GOODS_SAVE_INFO` int(9) DEFAULT '0' COMMENT '库存信息',
  `GOODS_QUERY` int(9) DEFAULT '0' COMMENT '提问数量',
  `GOODS_REVIEWS` int(9) DEFAULT '0' COMMENT '评论数量',
  `GOODS_FAVORITES` int(9) DEFAULT '0' COMMENT '收藏数量',
  `CLASSIFY_ID` int(9) DEFAULT NULL COMMENT '商品类别',
  `STATUS` int(1) DEFAULT '0' COMMENT '状态：1.上架；0.下架',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('1', '1472581220748', '随身WIFI 8GB U盘版', '49.90', '随身上网神器，内置8GB U盘', null, '1', '704', '591', '251', '54', '67', '0', '4', '0', '2016-06-30 02:20:15', '穿鞋子的猫', '2016-11-21 17:51:26', '猫宁');
INSERT INTO `tb_goods` VALUES ('2', '1472581245880', '智能摄像机', '266.00', '能看能听能说，手机远程观看', null, '2', '786', '68', '456', '0', '786', '0', '6', '0', '2016-08-31 02:20:37', '穿鞋子的猫', '2016-11-21 17:51:29', '猫宁');
INSERT INTO `tb_goods` VALUES ('3', '1472581300305', '猫宁体重称', '166.00', '高精度压力传感器 ｜ 手机管理全家健康', null, '3', '78', '10', '53', '7', '15', '0', '6', '1', '2016-08-31 02:21:31', '猫宁管理员', '2016-11-21 14:59:22', '猫宁');
INSERT INTO `tb_goods` VALUES ('4', '1472583774201', '运动机', '499.00', '边玩边录边拍，手机随时分享', null, '4', '159', '39', '450', '78', '453', '0', '6', '1', '2016-08-31 03:02:47', '穿鞋子的猫', '2016-11-21 14:40:01', '猫宁');
INSERT INTO `tb_goods` VALUES ('5', '1472583831117', '猫宁路由器 mini', '188.00', '主流双频AC智能路由器，性价比之王', null, '5', '785', '30', '66', '45', '45', '0', '3', '1', '2016-08-31 03:03:48', '穿鞋子的猫', '2016-11-21 14:40:03', '猫宁');
INSERT INTO `tb_goods` VALUES ('6', '1472628630086', '智能插座', '66.00', '手机远程遥控开关，带USB接口', null, '6', '54', '7', '78', '7', '81', '0', '6', '1', '2016-08-31 15:30:22', '猫宁管理员', '2016-11-21 14:40:05', '猫宁');
INSERT INTO `tb_goods` VALUES ('7', '1472736931796', '水质TDS检测笔', '59.00', '准确检测家中水质纯度', null, '7', '874', '3', '451', '78', '63', '0', '6', '1', '2016-09-01 21:35:27', '穿鞋子的猫', '2016-11-21 14:39:53', '猫宁');
INSERT INTO `tb_goods` VALUES ('8', '1473318741286', '猫宁电视', '3999.00', '猫宁电视，40/48/49/55英寸 现货购买', null, '8', '881', '12', '1565', '45', '15', '0', '2', '1', '2016-09-08 15:12:14', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('9', '1473685327798', '平板电脑', '1999.00', '全球首款 NVIDIA Tegra K1 平板', null, '9', '457', '8', '345', '3', '34', '0', '1', '1', '2016-09-12 21:01:58', '猫宁管理员', '2016-11-21 14:39:58', '猫宁');
INSERT INTO `tb_goods` VALUES ('10', '1474910562755', '电视机顶盒', '599.00', '首款4K超高清网络机顶盒', null, '10', '79', '11', '14', '86', '86', '0', '3', '1', '2016-10-02 01:22:39', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('11', '1475353900453', '全新猫宁路由器', '378.00', '顶配路由器，企业级性能', null, '11', '458', '15', '875', '67', '31', '0', '3', '1', '2016-10-02 04:31:38', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('12', '1475353918562', '头戴式耳机', '577.00', '媲美主流千元级头戴耳机', null, '12', '1000', '19', '451', '78', '78', '0', '7', '1', '2016-10-02 04:31:54', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('13', '1475354006972', '插线板', '159.00', '3重安全保护，插线板中的艺术品', null, '13', '546', '0', '451', '478', '68', '0', '6', '1', '2016-10-02 04:33:21', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('14', '1475407186147', '移动电源10000mAh', '99.00', '手机充电宝，高密度进口电芯，仅名片大小', null, '14', '787', '25', '451', '67', '786', '0', '8', '1', '2016-10-08 19:19:39', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('15', '1475947762038', '蓝牙耳机', '355.00', '手机蓝牙耳机，2015德国IF大奖，高清通话音质', null, '15', '768', '2', '451', '67', '78', '0', '7', '1', '2016-10-11 01:29:12', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('16', '1475996329018', '活塞耳机', '3999.00', '2015红点奖，独家音质优化专利', null, '16', '948', '6', '48', '78', '68', '0', '7', '1', '2016-10-12 14:58:42', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('17', '1477472951669', '智能电视', '3999.00', '43\" / 48\" / 55\" / 60\" / 70\" 高端旗舰', null, '17', '78', '6', '45', '6', '7', '0', '2', '1', '2016-10-26 17:09:03', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('18', '1478099883634', '空气净化器', '699.00', '10 分钟，房间空气焕然一新', null, '18', '94', '12', '876', '67', '86', '0', '6', '1', '2016-11-02 23:17:54', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('19', '1478522533460', '手环 光感版', '129.00', '心率、运动、睡眠全掌控', null, '19', '89', '48', '441', '7', '89', '0', '4', '1', '2016-11-07 20:42:07', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('20', '1478527872182', '平板电脑', '1399.00', '快、轻薄、美，青春五色可选', null, '20', '45', '14', '45', '67', '73', '0', '1', '1', '2016-11-07 22:11:06', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('21', '1478680540669', '猫宁手机', '3999.00', '工艺和手感超乎想象，很轻很快', null, '20', '1002', '10', '449', '0', '0', '0', '1', '1', '2016-11-09 16:35:34', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('22', '1478682438293', '平衡车', '1999.00', '年轻人的酷玩具，骑行遥控两种玩法', null, '22', '167', '0', '156', '187', '18', '0', '6', '1', '2016-11-09 17:07:09', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('35', '1478682709405', '猫宁平板', '5999.00', '全球首款 NVIDIA Tegra K1 平板', null, '35', '1007', '44', '444', '456', '456', '0', '1', '1', '2016-11-09 17:11:42', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('36', '1478682831935', '猫宁手机', '2666.00', '快、轻薄、美，青春五色可选', null, '36', '456', '8', '78', '157', '86', '0', '0', '1', '2016-11-09 17:13:46', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('37', '1478682893916', '电视 65英寸 曲面', '8999.00', '家庭影院，享受家的温暖', null, '37', '171', '12', '46', '16', '17', '0', '2', '1', '2016-11-09 17:14:45', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('38', '1478683391099', '尊享版手机', '4999.00', '4 轴防抖相机，3D陶瓷 / 玻璃机身', null, '38', '165', '9', '748', '41', '62', '0', '0', '1', '2016-11-09 17:23:07', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('39', '1478683407372', '苹果6s', '4999.00', '一小部的一大步', null, '40', '41', '35', '73', '87', '86', '0', '0', '1', '2016-11-09 17:23:23', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('40', '1478683468241', '测试商品1', '99.00', '描述描述描述描述', null, '40', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 17:24:22', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('41', '1478683499119', '测试商品2', '99.00', '描述描述描述描述', null, '40', '0', '8', null, '0', '0', '0', '6', '1', '2016-11-09 17:24:56', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('42', '1478683525234', '测试商品3', '99.00', '描述描述描述描述', null, '1', '0', '1', null, '0', '0', '0', '6', '1', '2016-11-09 17:25:19', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('43', '1478683527344', '测试商品4', '99.00', '描述描述描述描述', null, '1', '0', '2', null, '0', '0', '0', '5', '1', '2016-11-09 17:25:23', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('44', '1478683543890', '测试商品5', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 17:25:39', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('45', '1478683650841', '测试商品6', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 17:27:25', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('46', '1478684224499', '测试商品7', '99.00', '描述描述描述描述', null, '1', '0', '2', null, '0', '0', '0', '6', '1', '2016-11-09 17:36:57', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('47', '1478689524540', '测试商品8', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 19:05:17', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('48', '1478690354384', '测试商品9', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 19:19:07', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('49', '1478690963682', '测试商品10', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 19:29:16', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('50', '1478697442869', '测试商品11', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 21:17:13', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('51', '1478699184025', '测试商品12', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 21:46:15', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('52', '1478700430279', '测试商品13', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 22:07:02', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('53', '1478700648563', '测试商品14', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 22:10:44', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('54', '1478700669943', '测试商品15', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 22:11:08', '猫宁管理员', null, null);
INSERT INTO `tb_goods` VALUES ('55', '1478700852832', '测试商品16', '99.00', '描述描述描述描述', null, '1', '0', '0', null, '0', '0', '0', '6', '1', '2016-11-09 22:14:10', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('56', '1478701196056', '测试商品17', '99.00', '描述描述描述描述', null, '1', '0', '2', null, '0', '0', '0', '6', '1', '2016-11-09 22:19:53', '穿鞋子的猫', null, null);
INSERT INTO `tb_goods` VALUES ('57', '1478701473277', '测试商品18', '99.00', '描述描述描述描述', null, '11', '0', '2', null, '0', '0', '0', '6', '1', '2016-11-09 22:24:28', '猫宁管理员', '2016-11-21 14:39:51', '猫宁');

-- ----------------------------
-- Table structure for tb_goods_classify
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_classify`;
CREATE TABLE `tb_goods_classify` (
  `CLASSIFY_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `CLASSIFY_NAME` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '类目名称',
  `CLASSIFY_SORT` int(3) DEFAULT NULL COMMENT '类目排序',
  `CLASSIFY_NAV_SORT` int(3) DEFAULT NULL COMMENT '导航栏类目排序',
  `CLASSIFY_STATUS` int(1) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `CLASSIFY_NAV_STATUS` int(1) DEFAULT '1' COMMENT '导航状态：1.显示；0.隐藏',
  PRIMARY KEY (`CLASSIFY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_goods_classify
-- ----------------------------
INSERT INTO `tb_goods_classify` VALUES ('1', '猫宁平板', '1', '1', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('2', '猫宁手机', '2', '2', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('3', '电视', '3', '3', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('4', '路由器', '4', '4', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('5', '配件', '5', '5', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('6', '笔记本', '6', '6', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('7', '智能家具', '7', '7', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('8', '耳机', '8', '8', '1', '1');
INSERT INTO `tb_goods_classify` VALUES ('9', '移动电源', '9', '9', '1', '1');

-- ----------------------------
-- Table structure for tb_goods_favorites
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_favorites`;
CREATE TABLE `tb_goods_favorites` (
  `COLLECT_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '收藏夹记录ID',
  `GOODS_ID` int(9) DEFAULT '0' COMMENT '商品编号',
  `ACCOUNT_ID` int(9) DEFAULT '0' COMMENT '用户ID',
  `ADD_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`COLLECT_ID`),
  KEY `GOODS_ID` (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for tb_goods_picture
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_picture`;
CREATE TABLE `tb_goods_picture` (
  `GOODSPIC_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '商品图片编号',
  `GOODS_ID` int(9) DEFAULT NULL,
  `GOODSPIC_TYPE` tinyint(1) DEFAULT NULL COMMENT '商品图片类别（0：详情图片  1：内容图片）',
  `GOODSPIC_IMAGE` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`GOODSPIC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods_picture
-- ----------------------------
INSERT INTO `tb_goods_picture` VALUES ('1', '1', '0', 'upload/goods/20160822/1471798318820.jpg');
INSERT INTO `tb_goods_picture` VALUES ('2', '1', '0', 'upload/goods/20160822/1471798364441.jpg');
INSERT INTO `tb_goods_picture` VALUES ('3', '1', '0', 'upload/goods/20160822/1471798388806.jpg');
INSERT INTO `tb_goods_picture` VALUES ('4', '1', '0', 'upload/goods/20160822/1471798568000.jpg');
INSERT INTO `tb_goods_picture` VALUES ('5', '1', '1', 'upload/goods/20160822/1471798587971.jpg');

-- ----------------------------
-- Table structure for tb_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_spec`;
CREATE TABLE `tb_goods_spec` (
  `SPEC_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '商品规则ID',
  `GOODS_ID` int(9) DEFAULT NULL COMMENT '商品ID',
  `SPEC_COLOR` varchar(20) DEFAULT NULL COMMENT '商品颜色',
  `SPEC_SIZE` varchar(20) DEFAULT NULL COMMENT '商品尺寸',
  `SPEC_PRICE` double(10,2) DEFAULT NULL,
  `SPEC_SAVE_INFO` int(9) DEFAULT NULL COMMENT '库存信息',
  `SPEC_STATUS` int(1) DEFAULT NULL COMMENT '状态：1.上架；0.下架',
  PRIMARY KEY (`SPEC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_goods_spec
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `ORDER_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `ORDER_NUMBER` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `ACCOUNT_ID` int(9) DEFAULT NULL COMMENT '用户ID',
  `ORDER_DATE` datetime DEFAULT NULL COMMENT '下单时间',
  `TOTAL_MONEY` double(9,2) DEFAULT NULL COMMENT '订单总金额',
  `ORDER_STATE` int(1) DEFAULT '1' COMMENT '订单状态',
  `ADDRESS_ID` int(9) DEFAULT NULL COMMENT '地址编号',
  `PAY_TYPE` int(1) DEFAULT '0' COMMENT '支付方式（1：在线支付）',
  `PAY_STATUS` int(1) DEFAULT '0' COMMENT '支付状态：1.支付，0.未支付',
  `PAYMENT` varchar(255) DEFAULT NULL COMMENT '支付平台',
  `SEND_TYPE` int(1) DEFAULT '0' COMMENT '配送方式（1：快递配送）',
  `SEND_TIME` int(1) DEFAULT '0' COMMENT '送货时间（1：不限送货时间 2：工作日发货 3： 双休日发货）',
  `INVOICEL_TYPE` int(1) DEFAULT '0' COMMENT '发票类型',
  `INVOICEL_TITLE` varchar(50) DEFAULT NULL COMMENT '发票内容',
  `USER_MESSAGE` varchar(255) DEFAULT NULL COMMENT '会员留言',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('41', '1472581220748', '136', '2016-06-30 02:20:15', '199.60', '1', '15', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('42', '1472581245880', '136', '2016-08-31 02:20:37', '6098.80', '2', '15', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('43', '1472581300305', '136', '2016-08-31 02:21:31', '894.50', '3', '15', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('44', '1472583774201', '136', '2016-08-31 03:02:47', '49.90', '4', '15', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('45', '1472583831117', '136', '2016-08-31 03:03:48', '499.00', '1', '18', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('46', '1472628630086', '132', '2016-08-31 15:30:22', '4999.00', '1', '15', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('47', '1472736931796', '132', '2016-09-01 21:35:27', '378.00', '1', '18', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('48', '1473318741286', '135', '2016-09-08 15:12:14', '188.00', '2', '22', '1', '0', null, '1', '2', '1', '', '');
INSERT INTO `tb_order` VALUES ('49', '1473685327798', '135', '2016-09-12 21:01:58', '4999.00', '1', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('50', '1474910562755', '135', '2016-10-02 01:22:39', '9998.00', '1', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('51', '1475353900453', '135', '2016-10-02 04:31:38', '49.90', '1', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('52', '1475353918562', '135', '2016-10-02 04:31:54', '49.90', '1', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('53', '1475354006972', '135', '2016-10-02 04:33:21', '129.00', '2', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('54', '1475407186147', '135', '2016-10-08 19:19:39', '3999.00', '2', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('55', '1475947762038', '135', '2016-10-11 01:29:12', '49.90', '2', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('56', '1475996329018', '135', '2016-10-12 14:58:42', '88.90', '2', '22', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('57', '1477472951669', '137', '2016-10-26 17:09:03', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '尽快送达！');
INSERT INTO `tb_order` VALUES ('58', '1478099883634', '137', '2016-11-02 23:17:54', '129.00', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('59', '1478522533460', '137', '2016-11-07 20:42:07', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('60', '1478527872182', '137', '2016-11-07 22:11:06', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('62', '1478680540669', '137', '2016-11-09 16:35:34', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('63', '1478682438293', '137', '2016-11-09 17:07:09', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('64', '1478682709405', '137', '2016-11-09 17:11:42', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('65', '1478682831935', '137', '2016-11-09 17:13:46', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('66', '1478682893916', '137', '2016-11-09 17:14:45', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('67', '1478683391099', '137', '2016-11-09 17:23:07', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('68', '1478683407372', '137', '2016-11-09 17:23:23', null, '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('69', '1478683468241', '137', '2016-11-09 17:24:22', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('70', '1478683499119', '137', '2016-11-09 17:24:56', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('71', '1478683525234', '137', '2016-11-09 17:25:19', null, '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('72', '1478683527344', '137', '2016-11-09 17:25:23', null, '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('73', '1478683543890', '137', '2016-11-09 17:25:39', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('74', '1478683650841', '137', '2016-11-09 17:27:25', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('75', '1478684224499', '137', '2016-11-09 17:36:57', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('76', '1478689524540', '137', '2016-11-09 19:05:17', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('77', '1478690354384', '137', '2016-11-09 19:19:07', '49.90', '1', '23', '1', '0', null, '1', '1', '1', '', '');
INSERT INTO `tb_order` VALUES ('78', '1478690963682', '137', '2016-11-09 19:29:16', '99.80', null, '23', '1', '1', 'CBC', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('79', '1478697442869', '137', '2016-11-09 21:17:13', '99.80', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('80', '1478699184025', '137', '2016-11-09 21:46:15', '99.80', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('81', '1478700430279', '137', '2016-11-09 22:07:02', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('82', '1478700648563', '137', '2016-11-09 22:10:44', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('83', '1478700669943', '137', '2016-11-09 22:11:08', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('84', '1478700852832', '137', '2016-11-09 22:14:10', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('85', '1478701196056', '137', '2016-11-09 22:19:53', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('86', '1478701473277', '137', '2016-11-09 22:24:28', '8999.00', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('87', '1478701681624', '137', '2016-11-09 22:28:00', '5048.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('88', '1478704395487', '137', '2016-11-09 23:13:05', '99.80', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('89', '1478704606175', '137', '2016-11-09 23:16:44', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('90', '1478705327483', '137', '2016-11-09 23:28:44', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('91', '1478705643826', '137', '2016-11-09 23:34:02', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('92', '1478705790066', '137', '2016-11-09 23:36:28', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('93', '1478706019021', '137', '2016-11-09 23:40:10', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('94', '1478706037375', '137', '2016-11-09 23:40:28', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('95', '1478706084516', '137', '2016-11-09 23:41:18', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('96', '1478706142369', '137', '2016-11-09 23:42:17', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('97', '1478706346207', '137', '2016-11-09 23:45:38', '49.90', '5', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('98', '1478706854203', '137', '2016-11-09 23:54:04', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('99', '1478706891004', '137', '2016-11-09 23:54:41', '599.00', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('100', '1478708228238', '137', '2016-11-10 00:17:04', '99.80', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('101', '1478708288510', '137', '2016-11-10 00:18:01', '49.90', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('102', '1478708369390', '137', '2016-11-10 00:19:22', '49.90', '5', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('103', '1478711662034', '137', '2016-11-10 01:14:20', '99.80', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('104', '1478711970879', '137', '2016-11-10 01:19:28', '99.80', '0', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('105', '1478712045156', '137', '2016-11-10 01:20:36', '49.90', '1', '23', '1', '0', null, '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('106', '1478747529742', '1', null, '49.90', '2', '24', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('107', '1478748331460', '137', null, '99.80', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('108', '1478748767464', '137', '2016-11-10 03:32:45', '49.90', '3', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('109', '1478749123261', '137', '2016-11-10 03:38:35', '49.90', '3', '23', '1', '1', 'alipay', '1', '1', '4', '', '');
INSERT INTO `tb_order` VALUES ('110', '1479750774332', '137', '2016-11-21 17:52:48', '14997.00', '2', '23', '1', '1', 'alipay', '1', '1', '4', '', '');

-- ----------------------------
-- Table structure for tb_order_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_log`;
CREATE TABLE `tb_order_log` (
  `LOG_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `ORDER_NUMBER` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `ORDER_ID` int(9) DEFAULT NULL COMMENT '订单ID',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建者',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '订单记录内容',
  `CREATE_TYPE` varchar(64) DEFAULT NULL COMMENT '操作人类型：w.会员；m.管理员',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_order_log
-- ----------------------------
INSERT INTO `tb_order_log` VALUES ('1', '1478680540669', '62', '137', '2016-11-09 08:35:35', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('2', '1478682438293', '63', '137', '2016-11-09 09:07:10', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('3', '1478682709405', '64', '137', '2016-11-09 09:11:43', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('4', '1478682831935', '65', '137', '2016-11-09 09:13:47', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('5', '1478682893916', '66', '137', '2016-11-09 09:14:45', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('6', '1478683391099', '67', '137', '2016-11-09 09:23:07', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('7', '1478683407372', '68', '137', '2016-11-09 09:23:24', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('8', '1478683468241', '69', '137', '2016-11-09 09:24:23', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('9', '1478683499119', '70', '137', '2016-11-09 09:24:57', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('10', '1478683525234', '71', '137', '2016-11-09 09:25:19', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('11', '1478683527344', '72', '137', '2016-11-09 09:25:23', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('12', '1478683543890', '73', '137', '2016-11-09 09:25:40', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('13', '1478683650841', '74', '137', '2016-11-09 09:27:26', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('14', '1478684224499', '75', '137', '2016-11-09 09:36:57', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('15', '1478689524540', '76', '137', '2016-11-09 11:05:17', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('16', '1478690354384', '77', '137', '2016-11-09 11:19:08', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('17', '1478690963682', '78', '137', '2016-11-09 11:29:17', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('19', null, '78', 'null', '2016-11-09 12:25:09', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('20', '1478697442869', '79', '137', '2016-11-09 13:17:13', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('21', '1478699184025', '80', '137', '2016-11-09 13:46:16', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('22', '1478699184025', null, '137', '2016-11-09 13:49:22', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('23', '1478699184025', null, '137', '2016-11-09 13:49:34', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('24', '1478699184025', null, '137', '2016-11-09 13:51:14', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('25', '1478699184025', null, '137', '2016-11-09 13:52:53', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('26', '1478699184025', null, '137', '2016-11-09 13:53:08', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('27', '1478699184025', null, '137', '2016-11-09 13:55:25', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('28', '1478699184025', null, '137', '2016-11-09 14:04:52', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('29', '1478700430279', '81', '137', '2016-11-09 14:07:03', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('30', '1478700430279', null, '137', '2016-11-09 14:07:20', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('31', '1478700648563', '82', '137', '2016-11-09 14:10:45', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('32', '1478700669943', '83', '137', '2016-11-09 14:11:08', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('33', '1478700852832', '84', '137', '2016-11-09 14:14:10', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('34', '1478701196056', '85', '137', '2016-11-09 14:19:54', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('35', '1478701473277', '86', '137', '2016-11-09 14:24:28', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('36', '1478701681624', '87', '137', '2016-11-09 14:28:00', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('37', '1478701681624', '87', '137', '2016-11-09 14:31:11', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('38', '1478701681624', '87', '137', '2016-11-09 14:32:53', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('39', '1478701681624', '87', '137', '2016-11-09 14:33:37', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('40', '1478701681624', '87', '137', '2016-11-09 15:12:25', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('41', '1478704395487', '88', '137', '2016-11-09 15:13:06', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('42', '1478704395487', '88', '137', '2016-11-09 15:13:09', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('43', '1478704395487', '88', '137', '2016-11-09 15:13:53', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('44', '1478704395487', '88', '137', '2016-11-09 15:15:09', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('45', '1478704606175', '89', '137', '2016-11-09 15:16:45', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('46', '1478704606175', '89', '137', '2016-11-09 15:16:49', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('47', '1478704606175', '89', '137', '2016-11-09 15:17:19', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('48', '1478705327483', '90', '137', '2016-11-09 15:28:44', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('49', '1478705327483', '90', '137', '2016-11-09 15:28:47', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('50', '1478705327483', '90', '137', '2016-11-09 15:29:16', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('51', '1478705643826', '91', '137', '2016-11-09 15:34:02', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('52', '1478705643826', '91', '137', '2016-11-09 15:34:06', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('53', '1478705643826', '91', '137', '2016-11-09 15:34:21', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('54', '1478705790066', '92', '137', '2016-11-09 15:36:28', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('55', '1478705790066', '92', '137', '2016-11-09 15:36:31', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('56', '1478706019021', '93', '137', '2016-11-09 15:40:10', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('57', '1478706019021', '93', '137', '2016-11-09 15:40:13', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('58', '1478706037375', '94', '137', '2016-11-09 15:40:28', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('59', '1478706037375', '94', '137', '2016-11-09 15:40:31', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('60', '1478706084516', '95', '137', '2016-11-09 15:41:18', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('61', '1478706084516', '95', '137', '2016-11-09 15:41:22', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('62', '1478706142369', '96', '137', '2016-11-09 15:42:17', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('63', '1478706142369', '96', '137', '2016-11-09 15:43:41', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('64', '1478706346207', '97', '137', '2016-11-09 15:45:39', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('65', '1478706346207', '97', '137', '2016-11-09 15:45:42', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('66', '1478706854203', '98', '137', '2016-11-09 15:54:05', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('67', '1478706854203', '98', '137', '2016-11-09 15:54:25', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('68', '1478706891004', '99', '137', '2016-11-09 15:54:42', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('69', '1478706891004', '99', '137', '2016-11-09 15:54:46', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('70', '1478684224499', '75', '137', '2016-11-09 16:00:24', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('71', '1478099883634', '58', '137', '2016-11-09 16:00:48', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('72', '1478708228238', '100', '137', '2016-11-09 16:17:04', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('73', '1478708228238', '100', '137', '2016-11-09 16:17:11', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('74', '1478708228238', '100', '137', '2016-11-09 16:17:24', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('75', '1478708288510', '101', '137', '2016-11-09 16:18:02', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('76', '1478708288510', '101', '137', '2016-11-09 16:18:06', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('77', '1478708369390', '102', '137', '2016-11-09 16:19:23', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('78', '1478711662034', '103', '137', '2016-11-09 17:14:20', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('79', '1478711970879', '104', '137', '2016-11-09 17:19:29', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('80', '1478711970879', '104', '137', '2016-11-09 17:19:59', '0', 'w');
INSERT INTO `tb_order_log` VALUES ('81', '1478712045156', '105', '137', '2016-11-09 17:20:36', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('82', '1478747529742', '106', '1', '2016-11-10 03:12:03', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('83', '1478747529742', '106', '1', '2016-11-10 03:12:09', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('84', '1478748331460', '107', '137', '2016-11-10 03:25:28', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('85', '1478748331460', '107', '137', '2016-11-10 03:25:32', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('86', '1478748767464', '108', '137', '2016-11-10 03:32:45', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('87', '1478748767464', '108', '137', '2016-11-10 03:32:50', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('88', '1478749123261', '109', '137', '2016-11-10 03:38:35', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('89', '1478749123261', '109', '137', '2016-11-10 03:38:38', '2', 'w');
INSERT INTO `tb_order_log` VALUES ('90', '1478708369390', '102', '137', '2016-11-10 06:00:22', '5', 'w');
INSERT INTO `tb_order_log` VALUES ('91', '1478706346207', '97', '137', '2016-11-10 06:50:45', '5', 'w');
INSERT INTO `tb_order_log` VALUES ('92', '1479750774332', '110', '137', '2016-11-21 17:52:48', '1', 'w');
INSERT INTO `tb_order_log` VALUES ('93', '1479750774332', '110', '137', '2016-11-21 17:52:52', '2', 'w');

-- ----------------------------
-- Table structure for tb_order_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_message`;
CREATE TABLE `tb_order_message` (
  `ORDER_MESSAGE_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '订单详情ID',
  `GOODS_ID` int(9) DEFAULT NULL COMMENT '商品编号',
  `ORDER_NUMBER` int(9) DEFAULT NULL COMMENT '购买数量',
  `ORDER_MONEY` double(9,2) DEFAULT NULL COMMENT '公益价格',
  `GOODS_COLOR` varchar(20) DEFAULT NULL COMMENT '商品颜色',
  `GOODS_STANDARD` varchar(20) DEFAULT NULL COMMENT '商品版本',
  `PUBLIC_TYPE` int(1) DEFAULT '0' COMMENT '公益套餐',
  `ORDER_ID` int(9) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`ORDER_MESSAGE_ID`),
  KEY `ORDER_ID` (`ORDER_ID`),
  KEY `GOODS_ID` (`GOODS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_message
-- ----------------------------
INSERT INTO `tb_order_message` VALUES ('117', '1', '4', '49.90', '1', '1', null, '41');
INSERT INTO `tb_order_message` VALUES ('118', '35', '1', '5999.00', '1', '1', null, '42');
INSERT INTO `tb_order_message` VALUES ('119', '1', '2', '49.90', '1', '1', null, '42');
INSERT INTO `tb_order_message` VALUES ('120', '1', '5', '49.90', '1', '1', null, '43');
INSERT INTO `tb_order_message` VALUES ('121', '19', '5', '129.00', '1', '1', null, '43');
INSERT INTO `tb_order_message` VALUES ('122', '1', '1', '49.90', '1', '1', null, '44');
INSERT INTO `tb_order_message` VALUES ('123', '4', '1', '499.00', '1', '1', null, '45');
INSERT INTO `tb_order_message` VALUES ('124', '39', '1', '4999.00', '1', '1', null, '46');
INSERT INTO `tb_order_message` VALUES ('125', '11', '1', '378.00', '1', '1', null, '47');
INSERT INTO `tb_order_message` VALUES ('126', '5', '1', '188.00', '1', '1', null, '48');
INSERT INTO `tb_order_message` VALUES ('127', '39', '1', '4999.00', '1', '1', null, '49');
INSERT INTO `tb_order_message` VALUES ('128', '35', '1', '5999.00', '1', '1', null, '50');
INSERT INTO `tb_order_message` VALUES ('129', '8', '1', '3999.00', '1', '1', null, '50');
INSERT INTO `tb_order_message` VALUES ('130', '1', '1', '49.90', '1', '1', null, '51');
INSERT INTO `tb_order_message` VALUES ('131', '1', '1', '49.90', '1', '1', null, '52');
INSERT INTO `tb_order_message` VALUES ('132', '19', '1', '129.00', '1', '1', null, '53');
INSERT INTO `tb_order_message` VALUES ('133', '8', '1', '3999.00', '1', '1', null, '54');
INSERT INTO `tb_order_message` VALUES ('134', '1', '1', '49.90', '1', '1', null, '55');
INSERT INTO `tb_order_message` VALUES ('135', '1', '1', '49.90', '1', '1', null, '56');
INSERT INTO `tb_order_message` VALUES ('136', '1', '1', '49.90', '1', '1', null, '57');
INSERT INTO `tb_order_message` VALUES ('137', '19', '1', '129.00', '1', '1', null, '58');
INSERT INTO `tb_order_message` VALUES ('138', '1', '1', '49.90', '1', '1', null, '59');
INSERT INTO `tb_order_message` VALUES ('139', '1', '1', '49.90', '1', '1', null, '60');
INSERT INTO `tb_order_message` VALUES ('140', '1', '1', '49.90', '1', '1', null, '61');
INSERT INTO `tb_order_message` VALUES ('141', '1', '1', '49.90', '1', '1', null, '62');
INSERT INTO `tb_order_message` VALUES ('142', '1', '1', '49.90', '1', '1', null, '63');
INSERT INTO `tb_order_message` VALUES ('143', '1', '1', '49.90', '1', '1', null, '64');
INSERT INTO `tb_order_message` VALUES ('144', '1', '1', '49.90', '1', '1', null, '65');
INSERT INTO `tb_order_message` VALUES ('145', '1', '1', '49.90', '1', '1', null, '66');
INSERT INTO `tb_order_message` VALUES ('146', '1', '1', '49.90', '1', '1', null, '67');
INSERT INTO `tb_order_message` VALUES ('147', '1', '1', '49.90', '1', '1', null, '69');
INSERT INTO `tb_order_message` VALUES ('148', '1', '1', '49.90', '1', '1', null, '70');
INSERT INTO `tb_order_message` VALUES ('149', '1', '1', '49.90', '1', '1', null, '73');
INSERT INTO `tb_order_message` VALUES ('150', '1', '1', '49.90', '1', '1', null, '74');
INSERT INTO `tb_order_message` VALUES ('151', '1', '1', '49.90', '1', '1', null, '75');
INSERT INTO `tb_order_message` VALUES ('152', '1', '1', '49.90', '1', '1', null, '76');
INSERT INTO `tb_order_message` VALUES ('153', '1', '1', '49.90', '1', '1', null, '77');
INSERT INTO `tb_order_message` VALUES ('154', '1', '2', '49.90', '1', '1', null, '78');
INSERT INTO `tb_order_message` VALUES ('155', '1', '2', '49.90', '1', '1', null, '79');
INSERT INTO `tb_order_message` VALUES ('156', '1', '2', '49.90', '1', '1', null, '80');
INSERT INTO `tb_order_message` VALUES ('157', '1', '1', '49.90', '1', '1', null, '81');
INSERT INTO `tb_order_message` VALUES ('158', '1', '1', '49.90', '1', '1', null, '82');
INSERT INTO `tb_order_message` VALUES ('159', '1', '1', '49.90', '1', '1', null, '83');
INSERT INTO `tb_order_message` VALUES ('160', '1', '1', '49.90', '1', '1', null, '84');
INSERT INTO `tb_order_message` VALUES ('161', '1', '1', '49.90', '1', '1', null, '85');
INSERT INTO `tb_order_message` VALUES ('162', '37', '1', '8999.00', '1', '1', null, '86');
INSERT INTO `tb_order_message` VALUES ('163', '39', '1', '4999.00', '1', '1', null, '87');
INSERT INTO `tb_order_message` VALUES ('164', '1', '2', '49.90', '1', '1', null, '88');
INSERT INTO `tb_order_message` VALUES ('165', '1', '1', '49.90', '1', '1', null, '89');
INSERT INTO `tb_order_message` VALUES ('166', '1', '1', '49.90', '1', '1', null, '90');
INSERT INTO `tb_order_message` VALUES ('167', '1', '1', '49.90', '1', '1', null, '91');
INSERT INTO `tb_order_message` VALUES ('168', '1', '1', '49.90', '1', '1', null, '92');
INSERT INTO `tb_order_message` VALUES ('169', '1', '1', '49.90', '1', '1', null, '93');
INSERT INTO `tb_order_message` VALUES ('170', '1', '1', '49.90', '1', '1', null, '94');
INSERT INTO `tb_order_message` VALUES ('171', '1', '1', '49.90', '1', '1', null, '95');
INSERT INTO `tb_order_message` VALUES ('172', '1', '1', '49.90', '1', '1', null, '96');
INSERT INTO `tb_order_message` VALUES ('173', '1', '1', '49.90', '1', '1', null, '97');
INSERT INTO `tb_order_message` VALUES ('174', '1', '1', '49.90', '1', '1', null, '98');
INSERT INTO `tb_order_message` VALUES ('175', '10', '1', '599.00', '1', '1', null, '99');
INSERT INTO `tb_order_message` VALUES ('176', '1', '2', '49.90', '1', '1', null, '100');
INSERT INTO `tb_order_message` VALUES ('177', '1', '1', '49.90', '1', '1', null, '101');
INSERT INTO `tb_order_message` VALUES ('178', '1', '1', '49.90', '1', '1', null, '102');
INSERT INTO `tb_order_message` VALUES ('179', '1', '2', '49.90', '1', '1', null, '103');
INSERT INTO `tb_order_message` VALUES ('180', '1', '2', '49.90', '1', '1', null, '104');
INSERT INTO `tb_order_message` VALUES ('181', '1', '1', '49.90', '1', '1', null, '105');
INSERT INTO `tb_order_message` VALUES ('182', '1', '1', '49.90', '1', '1', null, '106');
INSERT INTO `tb_order_message` VALUES ('183', '1', '2', '49.90', '1', '1', null, '107');
INSERT INTO `tb_order_message` VALUES ('184', '1', '1', '49.90', '1', '1', null, '108');
INSERT INTO `tb_order_message` VALUES ('185', '1', '1', '49.90', '1', '1', null, '109');
INSERT INTO `tb_order_message` VALUES ('186', '35', '1', '5999.00', '1', '1', null, '110');
INSERT INTO `tb_order_message` VALUES ('187', '39', '1', '4999.00', '1', '1', null, '110');
INSERT INTO `tb_order_message` VALUES ('188', '21', '1', '3999.00', '1', '1', null, '110');

-- ----------------------------
-- Table structure for tb_order_state
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_state`;
CREATE TABLE `tb_order_state` (
  `STATE_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '状态编号',
  `ORDER_STATE` int(9) DEFAULT NULL COMMENT '订单状态',
  `STATE_NAME` varchar(30) DEFAULT NULL COMMENT '状态名称',
  PRIMARY KEY (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_state
-- ----------------------------
INSERT INTO `tb_order_state` VALUES ('1', '1', '订单提交');
INSERT INTO `tb_order_state` VALUES ('2', '2', '支付完成');
INSERT INTO `tb_order_state` VALUES ('3', '3', '商品出库');
INSERT INTO `tb_order_state` VALUES ('4', '4', '等待收获');
INSERT INTO `tb_order_state` VALUES ('5', '5', '收货完成');

-- ----------------------------
-- Table structure for tb_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_menu`;
CREATE TABLE `tb_system_menu` (
  `MENU_ID` int(9) NOT NULL COMMENT '权限编号',
  `PARENT_ID` int(9) DEFAULT NULL COMMENT '父级编号',
  `MENU_TYPE` int(1) DEFAULT NULL COMMENT '权限类型：1.菜单；2.功能；3.子功能；0.操作',
  `MENU_CODE` varchar(64) DEFAULT NULL COMMENT '权限代码',
  `MENU_NAME` varchar(64) DEFAULT NULL COMMENT '权限名称',
  `SORT` int(9) DEFAULT NULL COMMENT '权限排序',
  `HREF` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `ICON` varchar(255) DEFAULT NULL COMMENT '图标名称',
  `STATUS` int(1) DEFAULT NULL COMMENT '状态：1.正常；0.冻结',
  `PERMISSION` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT '' COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新者',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_system_menu
-- ----------------------------
INSERT INTO `tb_system_menu` VALUES ('1', '0', '1', 'index', '主页', '100', '/system/main/index', 'fa-home', '1', 'system:view', '2016-10-23 16:50:34', '系统管理员', '2016-10-23 17:02:58', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('2', '0', '1', 'sysuser', '管理员管理', '200', '/system/sysuser', 'fa-user', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('3', '2', '2', 'list', '管理员列表', '10', '/system/sysuser/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('4', '3', '0', 'list_view', '查看', '1', '/system/sysuser/list/view', null, null, 'sysuser:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('5', '3', '0', 'list_edit', '编辑', '2', '/system/sysuser/list/edit', null, null, 'sysuser:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('6', '3', '0', 'list_delete', '删除', '3', '/system/sysuser/list/delete', null, null, 'sysuser:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('7', '3', '0', 'list_add', '添加', '4', '/system/sysuser/list/add', null, null, 'sysuser:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('8', '2', '2', 'info', '个人信息', '20', '/system/sysuser/info', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('9', '8', '0', 'info_view', '查看', '1', '/system/sysuser/info/view', null, null, 'sysuser:info:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('10', '8', '0', 'info_edit', '编辑', '2', '/system/sysuser/info/edit', null, null, 'sysuser:info:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('11', '2', '2', 'role', '角色管理', '30', '/system/sysuser/role', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('12', '11', '0', 'role_view', '查看', '1', '/system/sysuser/role/view', '', null, 'sysuser:role:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('13', '11', '0', 'role_edit', '编辑', '2', '/system/sysuser/role/edit', null, null, 'sysuser:role:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('14', '11', '0', 'role_delete', '删除', '3', '/system/sysuser/role/delete', '', null, 'sysuser:role:delete', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('15', '11', '0', 'role_add', '添加', '4', '/system/sysuser/role/add', null, null, 'sysuser:role:add', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('16', '0', '1', 'user', '会员管理', '300', '/system/user', 'fa-users', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('17', '16', '2', 'list', '会员列表', '10', '/system/user/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('18', '18', '0', 'list_view', '查看', '1', '/system/user/list/view', null, null, 'user:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('19', '18', '0', 'list_edit', '编辑', '2', '/system/user/list/edit', null, null, 'user:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('20', '18', '0', 'list_delete', '删除', '3', '/system/user/list/delete', null, null, 'user:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('21', '18', '0', 'list_add', '添加', '4', '/system/user/list/add', null, null, 'user:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('22', '16', '2', 'grade', '等级管理', '20', '/system/user/grade', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('23', '22', '0', 'grade_view', '查看', '1', '/system/user/grade/view', null, null, 'user:grade:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('24', '22', '0', 'grade_edit', '编辑', '2', '/system/user/grade/edit', null, null, 'user:grade:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('25', '16', '2', 'record', '会员记录管理', '30', '/system/user/record', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('26', '25', '0', 'record_view', '查看', '1', '/system/user/record/view', '', null, 'user:record:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('27', '0', '1', 'goods', '产品管理', '400', '/system/goods', 'fa-product-hunt', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('28', '27', '2', 'list', '产品列表', '10', '/system/goods/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('29', '28', '0', 'list_view', '查看', '1', '/system/goods/list/view', null, null, 'goods:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('30', '28', '0', 'list_edit', '编辑', '2', '/system/goods/list/edit', null, null, 'goods:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('31', '28', '0', 'list_delete', '删除', '3', '/system/goods/list/delete', null, null, 'goods:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('32', '28', '0', 'list_add', '添加', '4', '/system/goods/list/add', null, null, 'goods:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('33', '27', '2', 'classify', '分类管理', '20', '/system/goods/classify', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('34', '33', '0', 'classify_view', '查看', '1', '/system/goods/classify/view', null, null, 'goods:classify:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('35', '33', '0', 'classify_edit', '编辑', '2', '/system/goods/classify/edit', null, null, 'goods:classify:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('36', '33', '0', 'classify_delete', '删除', '3', '/system/goods/classify/delete', null, null, 'goods:classify:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('37', '33', '0', 'classify_add', '添加', '4', '/system/goods/classify/add', null, null, 'goods:classify:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('38', '27', '2', 'query', '问答管理', '30', '/system/goods/query', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('39', '38', '0', 'query_view', '查看', '1', '/system/goods/query/view', null, null, 'goods:query:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('40', '38', '0', 'query_edit', '编辑', '2', '/system/goods/query/edit', null, null, 'goods:query:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('41', '38', '0', 'query_delete', '删除', '3', '/system/goods/query/delete', null, null, 'goods:query:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('42', '38', '0', 'query_add', '添加', '4', '/system/goods/query/add', null, null, 'goods:query:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('43', '0', '1', 'order', '交易管理', '500', '/system/order', 'fa-money', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('44', '43', '2', 'list', '订单管理', '10', '/system/order/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('45', '44', '0', 'list_view', '查看', '1', '/system/order/list/view', null, null, 'order:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('46', '44', '0', 'list_edit', '编辑', '2', '/system/order/list/edit', null, null, 'order:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('47', '44', '0', 'list_delete', '删除', '3', '/system/order/list/delete', null, null, 'order:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('48', '44', '0', 'list_add', '添加', '4', '/system/order/list/add', null, null, 'order:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('49', '43', '2', 'info', '交易信息', '10', '/system/order/info', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('50', '49', '0', 'info_view', '查看', '1', '/system/order/info/view', null, null, 'goods:info:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('51', '43', '2', 'reviews', '评论管理', '10', '/system/order/reviews', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('52', '51', '0', 'reviews_view', '查看', '1', '/system/order/reviews/view', null, null, 'goods:reviews:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('53', '51', '0', 'reviews_edit', '编辑', '2', '/system/order/reviews/edit', null, null, 'goods:reviews:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('54', '51', '0', 'reviews_delete', '删除', '3', '/system/order/reviews/delete', null, null, 'goods:reviews:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('55', '51', '0', 'reviews_add', '添加', '4', '/system/order/reviews/add', null, null, 'goods:reviews:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('56', '0', '1', 'email', '邮件管理', '600', '/system/email', 'fa-envelope-o', '1', null, '2016-10-23 20:22:55', '系统管理员', '2016-10-23 20:23:02', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('57', '56', '2', 'send', '发送邮件', '10', '/system/email/info', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('58', '56', '2', 'list', '邮件管理', '20', '/system/email/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('59', '0', '1', 'message', '系统消息', '600', '', 'fa-desktop', '1', null, '2016-10-23 20:22:55', '系统管理员', '2016-10-23 20:23:02', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('60', '59', '2', '', '意见反馈', '10', '', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('61', '59', '2', '', '系统消息列表', '20', '', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('62', '59', '2', '', '发送消息', '30', '', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('65', '0', '1', 'manage', '系统管理', '700', '', 'fa-universal-access', '1', null, '2016-10-23 20:22:55', '系统管理员', '2016-10-23 20:23:02', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('66', '65', '2', '', '导航管理', '10', '', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('67', '65', '2', null, '基本配置', '20', null, null, '1', null, null, '', null, null, null);
INSERT INTO `tb_system_menu` VALUES ('68', '65', '2', null, '项目管理', '30', null, null, '1', null, null, '', null, null, null);
INSERT INTO `tb_system_menu` VALUES ('69', '3', '0', 'list_audit', '审查', '5', '/system/sysuser/list/audit', null, null, 'sysuser:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('70', '18', '0', 'list_audit', '审查', '5', '/system/user/list/audit', null, null, 'user:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('71', '65', '2', null, '连接池监视', '40', '/druid', null, '1', null, '2016-11-07 01:16:13', '系统管理员', '2016-11-07 01:16:20', '系统管理员', null);
INSERT INTO `tb_system_menu` VALUES ('72', '28', '0', 'list_audit', '审查', '5', '/system/goods/list/audit', null, null, 'goods:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', null);

-- ----------------------------
-- Table structure for tb_system_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_role`;
CREATE TABLE `tb_system_role` (
  `ROLE_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `ROLE_NAME` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色名称',
  `ROLE_OFFICE` varchar(64) DEFAULT NULL COMMENT '所属部门',
  `IS_SYSTEM` int(1) DEFAULT '1' COMMENT '系统数据：1.是，只有超级管理员能修改；0.否，拥有角色修改人员的权限能都修改',
  `STATUS` int(1) DEFAULT '1' COMMENT '状态：1.正常；0.冻结',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新者',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_system_role
-- ----------------------------
INSERT INTO `tb_system_role` VALUES ('1', '超级管理员', '安全部', '1', '1', '2016-10-23 14:26:47', '猫宁管理员', '2016-10-23 14:27:02', '猫宁管理员', '系统管理员，拥有最高管理权限');
INSERT INTO `tb_system_role` VALUES ('2', '订单管理员', '销售部', '1', '1', '2016-10-25 03:26:49', '猫宁管理员', '2016-10-25 03:26:55', '猫宁管理员', '订单管理员，负责处理订单');
INSERT INTO `tb_system_role` VALUES ('3', '评论管理员', '客服部', '1', '1', '2016-10-27 21:36:42', '猫宁管理员', '2016-10-27 21:36:47', '猫宁管理员', '评论管理员，负责处理评论');

-- ----------------------------
-- Table structure for tb_system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_role_menu`;
CREATE TABLE `tb_system_role_menu` (
  `ROLE_MENU_ID` int(9) NOT NULL COMMENT '角色权限编号',
  `ROLE_ID` int(9) DEFAULT NULL COMMENT '角色编号',
  `MENU_ID` int(9) DEFAULT NULL COMMENT '权限编号',
  PRIMARY KEY (`ROLE_MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_system_role_menu
-- ----------------------------
INSERT INTO `tb_system_role_menu` VALUES ('1', '1', '4');
INSERT INTO `tb_system_role_menu` VALUES ('2', '1', '5');
INSERT INTO `tb_system_role_menu` VALUES ('3', '1', '6');
INSERT INTO `tb_system_role_menu` VALUES ('4', '1', '7');
INSERT INTO `tb_system_role_menu` VALUES ('5', '1', '9');
INSERT INTO `tb_system_role_menu` VALUES ('6', '1', '10');
INSERT INTO `tb_system_role_menu` VALUES ('7', '1', '12');
INSERT INTO `tb_system_role_menu` VALUES ('8', '1', '13');
INSERT INTO `tb_system_role_menu` VALUES ('9', '1', '14');
INSERT INTO `tb_system_role_menu` VALUES ('10', '1', '15');
INSERT INTO `tb_system_role_menu` VALUES ('11', '1', '18');
INSERT INTO `tb_system_role_menu` VALUES ('12', '1', '19');
INSERT INTO `tb_system_role_menu` VALUES ('13', '1', '20');
INSERT INTO `tb_system_role_menu` VALUES ('14', '1', '21');
INSERT INTO `tb_system_role_menu` VALUES ('15', '1', '23');
INSERT INTO `tb_system_role_menu` VALUES ('16', '1', '24');
INSERT INTO `tb_system_role_menu` VALUES ('17', '1', '26');
INSERT INTO `tb_system_role_menu` VALUES ('18', '1', '1');
INSERT INTO `tb_system_role_menu` VALUES ('19', '1', '69');
INSERT INTO `tb_system_role_menu` VALUES ('20', '1', '70');
INSERT INTO `tb_system_role_menu` VALUES ('21', '2', '5');
INSERT INTO `tb_system_role_menu` VALUES ('22', '1', '29');
INSERT INTO `tb_system_role_menu` VALUES ('23', '1', '30');
INSERT INTO `tb_system_role_menu` VALUES ('24', '1', '31');
INSERT INTO `tb_system_role_menu` VALUES ('25', '1', '32');
INSERT INTO `tb_system_role_menu` VALUES ('26', '1', '72');

-- ----------------------------
-- Table structure for tb_system_statistics_day
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_statistics_day`;
CREATE TABLE `tb_system_statistics_day` (
  `STATISTICS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计编号',
  `STATISTICS_TIME` datetime DEFAULT NULL COMMENT '统计日期',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '生成时间',
  `DAILY_LOGIN_NUMBER` int(11) DEFAULT '0' COMMENT '登录人数（活跃人数 ）',
  `DAILY_USER_NUMBER` int(11) DEFAULT '0' COMMENT '每日用访客数',
  `DAILY_VISIT_NUMBER` int(11) DEFAULT '0' COMMENT '每日游览数',
  `DAILY_ORDER_NUMBER` int(11) DEFAULT '0' COMMENT '每日订单数',
  `DAILY_PAY_ORDER_NUMBER` int(11) DEFAULT '0' COMMENT '每日支付订单数',
  `DAILY_UNPAY_ORDER_NUMBER` int(11) DEFAULT '0' COMMENT '每日未支付订单数',
  `DAILY_PAY_NUMBER` double(11,2) DEFAULT '0.00' COMMENT '每日支付金额数',
  PRIMARY KEY (`STATISTICS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_system_statistics_day
-- ----------------------------
INSERT INTO `tb_system_statistics_day` VALUES ('1', '2016-09-29 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('2', '2016-09-30 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '14', '38', '73', '487.00');
INSERT INTO `tb_system_statistics_day` VALUES ('3', '2016-09-15 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '55', '15', '99', '786.00');
INSERT INTO `tb_system_statistics_day` VALUES ('4', '2016-10-02 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '45', '17', '5', '3487.00');
INSERT INTO `tb_system_statistics_day` VALUES ('5', '2016-10-03 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '5', '50', '35', '67867.00');
INSERT INTO `tb_system_statistics_day` VALUES ('6', '2016-09-04 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '78', '78', '56', '7864.00');
INSERT INTO `tb_system_statistics_day` VALUES ('7', '2016-10-05 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '78', '44', '22', '2158.00');
INSERT INTO `tb_system_statistics_day` VALUES ('8', '2016-10-08 00:00:00', '2016-10-09 00:55:30', '0', '0', '0', '45', '87', '78', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('9', '2016-09-28 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('10', '2016-09-27 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('11', '2016-09-26 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('12', '2016-09-25 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('13', '2016-09-21 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('14', '2016-09-16 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('15', '2016-09-09 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('16', '2016-09-24 00:00:00', '2016-10-03 03:41:00', '1', '1', '1', '4', '27', '4', '4258.00');
INSERT INTO `tb_system_statistics_day` VALUES ('17', '2016-09-23 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '45', '17', '5', '3487.00');
INSERT INTO `tb_system_statistics_day` VALUES ('18', '2016-10-22 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '5', '50', '35', '67867.00');
INSERT INTO `tb_system_statistics_day` VALUES ('19', '2016-09-19 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '5', '50', '35', '67867.00');
INSERT INTO `tb_system_statistics_day` VALUES ('20', '2016-09-18 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '14', '38', '73', '487.00');
INSERT INTO `tb_system_statistics_day` VALUES ('21', '2016-09-20 00:00:00', '2016-10-09 00:55:30', '0', '0', '0', '45', '87', '78', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('22', '2016-10-07 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '78', '44', '22', '2158.00');
INSERT INTO `tb_system_statistics_day` VALUES ('23', '2016-09-14 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '55', '15', '99', '786.00');
INSERT INTO `tb_system_statistics_day` VALUES ('24', '2016-09-17 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '14', '38', '73', '487.00');
INSERT INTO `tb_system_statistics_day` VALUES ('25', '2016-09-06 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '78', '78', '56', '7864.00');
INSERT INTO `tb_system_statistics_day` VALUES ('26', '2016-09-07 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '78', '78', '56', '7864.00');
INSERT INTO `tb_system_statistics_day` VALUES ('27', '2016-09-08 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '78', '78', '56', '7864.00');
INSERT INTO `tb_system_statistics_day` VALUES ('28', '2016-10-04 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '78', '78', '56', '7864.00');
INSERT INTO `tb_system_statistics_day` VALUES ('29', '2016-10-10 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '55', '15', '99', '786.00');
INSERT INTO `tb_system_statistics_day` VALUES ('30', '2016-09-11 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '55', '15', '99', '786.00');
INSERT INTO `tb_system_statistics_day` VALUES ('31', '2016-09-01 00:00:00', '2016-10-03 03:57:30', '1', '1', '1', '55', '15', '99', '786.00');
INSERT INTO `tb_system_statistics_day` VALUES ('32', '2016-10-11 00:00:00', '2016-10-12 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('33', '2016-10-12 00:00:00', '2016-10-13 00:55:30', '2', '2', '2', '1', '0', '1', '88.90');
INSERT INTO `tb_system_statistics_day` VALUES ('34', '2016-10-13 00:00:00', '2016-10-14 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('35', '2016-10-15 00:00:00', '2016-10-16 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('36', '2016-10-16 00:00:00', '2016-10-17 00:55:30', '2', '2', '2', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('37', '2016-10-18 00:00:00', '2016-10-19 00:55:30', '1', '1', '1', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('38', '2016-10-24 00:00:00', '2016-10-25 00:55:30', '1', '1', '1', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('39', '2016-10-25 00:00:00', '2016-10-26 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('40', '2016-10-27 00:00:00', '2016-10-28 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('41', '2016-10-28 00:00:00', '2016-10-29 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('42', '2016-10-31 00:00:00', '2016-11-02 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('43', '2016-11-01 00:00:00', '2016-11-03 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('44', '2016-11-05 00:00:00', '2016-11-07 00:55:30', '2', '2', '2', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('45', '2016-11-06 00:00:00', '2016-11-08 00:55:30', '1', '1', '1', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('46', '2016-11-08 00:00:00', '2016-11-10 00:55:30', '0', '0', '0', '0', '0', '0', '0.00');
INSERT INTO `tb_system_statistics_day` VALUES ('47', '2016-11-10 00:00:00', '2016-11-12 01:09:43', '2', '2', '2', '8', '3', '5', '299.40');
INSERT INTO `tb_system_statistics_day` VALUES ('48', '2016-11-14 00:00:00', '2016-11-16 00:55:30', '1', '1', '1', '0', '0', '0', '0.00');

-- ----------------------------
-- Table structure for tb_system_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_user`;
CREATE TABLE `tb_system_user` (
  `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `LOGIN_NAME` varchar(20) DEFAULT '' COMMENT '登录名',
  `LOGIN_PASSWORD` varchar(32) DEFAULT '' COMMENT '用户密码',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '昵称',
  `REAL_NAME` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `SEX` int(1) DEFAULT '0' COMMENT '性别：0.保密；1.男； 2.女',
  `AGE` int(3) DEFAULT '0' COMMENT '年龄',
  `PIC_IMG` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `STATUS` int(1) DEFAULT '1' COMMENT '状态：0.冻结；1.正常；2.删除',
  `LAST_LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `LAST_LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `TELEPHONE` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `CREATE_TIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_BY` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_system_user
-- ----------------------------
INSERT INTO `tb_system_user` VALUES ('1', 'admin', 'a2f87176e717b96ed71e74dbd640f672', '猫宁', '陈晓星', '0', '40', null, '1', '2016-11-21 14:26:45', '172.27.222.211', '810170512@qq.com', '18857105178', '2016-10-27 23:11:43', '穿鞋子的猫', '2016-11-21 14:26:53', '猫宁管理员');
INSERT INTO `tb_system_user` VALUES ('2', 'system', 'a2f87176e717b96ed71e74dbd640f672', '穿鞋子的猫', '陈晓旭', '0', '0', null, '1', '2016-11-14 17:25:36', '172.18.59.142', '810170512@qq.com', '18857105178', '2016-10-27 23:11:43', '穿鞋子的猫', '2016-10-28 23:43:40', '猫宁管理员');
INSERT INTO `tb_system_user` VALUES ('3', '穿鞋子的猫', 'a2f87176e717b96ed71e74dbd640f672', '猫宁管理员', '陈星星', '0', null, null, '1', null, null, '810170512@qq.com', '18857105127', '2016-11-21 09:07:31', '猫宁管理员', '2016-11-21 12:30:43', '猫宁管理员');

-- ----------------------------
-- Table structure for tb_system_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_user_login_log`;
CREATE TABLE `tb_system_user_login_log` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `LOGIN_TIME` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `USER_IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `USER_ID` int(11) DEFAULT NULL COMMENT '用户ID',
  `OPERATING_SYSTEM` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `BROWSER` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_system_user_login_log
-- ----------------------------
INSERT INTO `tb_system_user_login_log` VALUES ('2', '2016-09-14 18:14:18', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('3', '2016-09-14 18:14:31', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('4', '2016-09-14 18:15:38', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('5', '2016-09-14 18:18:46', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('6', '2016-09-26 16:16:01', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('7', '2016-09-27 00:58:58', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('8', '2016-09-27 16:54:21', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('9', '2016-09-27 19:34:35', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('10', '2016-09-28 00:26:44', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('11', '2016-09-28 01:50:28', '127.0.0.1', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('12', '2016-09-28 01:57:39', '127.0.0.1', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('13', '2016-09-28 12:08:49', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('14', '2016-09-28 12:09:49', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('15', '2016-09-28 12:17:42', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('16', '2016-09-28 12:18:04', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('17', '2016-09-28 12:18:59', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('18', '2016-09-28 14:08:32', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('19', '2016-09-29 15:19:43', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('20', '2016-09-29 15:37:56', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('21', '2016-09-29 16:18:00', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('22', '2016-09-29 16:42:50', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('23', '2016-09-29 16:48:13', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('24', '2016-09-29 20:25:50', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('25', '2016-09-30 02:24:40', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('26', '2016-09-30 11:17:49', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('27', '2016-09-30 16:08:15', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('28', '2016-09-30 18:29:13', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('29', '2016-10-01 15:08:24', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('30', '2016-10-02 02:00:16', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('31', '2016-10-02 04:16:49', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('32', '2016-10-02 04:29:05', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('33', '2016-10-02 04:32:35', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('34', '2016-10-02 05:03:24', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('35', '2016-10-02 05:22:22', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('36', '2016-10-02 05:25:05', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('37', '2016-10-02 06:02:13', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('38', '2016-10-02 18:48:24', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('39', '2016-10-02 19:09:28', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('40', '2016-10-02 19:23:04', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('41', '2016-10-02 19:36:04', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('42', '2016-10-02 19:44:21', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('43', '2016-10-05 22:47:24', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('44', '2016-10-05 23:15:27', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('45', '2016-10-08 23:06:15', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('46', '2016-10-09 00:24:58', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('47', '2016-10-09 01:01:24', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('48', '2016-10-09 01:12:09', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('49', '2016-10-09 01:20:21', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('50', '2016-10-09 01:29:58', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('51', '2016-10-09 01:30:54', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('52', '2016-10-09 14:56:36', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('53', '2016-10-09 15:34:04', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('54', '2016-10-09 16:41:26', '127.0.0.1', '1', 'WINDOWS_10', 'EDGE12');
INSERT INTO `tb_system_user_login_log` VALUES ('55', '2016-10-10 15:03:47', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('56', '2016-10-11 22:41:25', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('57', '2016-10-11 23:48:05', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('58', '2016-10-11 23:54:10', '127.0.0.1', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('59', '2016-10-12 00:33:56', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('60', '2016-10-12 01:07:11', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('61', '2016-10-12 01:23:56', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('62', '2016-10-12 01:30:01', '127.0.0.1', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('63', '2016-10-12 01:31:06', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('64', '2016-10-12 01:33:15', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('65', '2016-10-12 01:37:36', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('66', '2016-10-12 01:39:28', '127.0.0.1', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('67', '2016-10-12 01:42:10', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('68', '2016-10-12 01:46:18', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('69', '2016-10-12 01:47:54', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('70', '2016-10-12 02:01:45', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('71', '2016-10-12 02:21:02', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('72', '2016-10-12 02:52:32', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('73', '2016-10-12 03:23:42', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('74', '2016-10-12 23:27:31', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('75', '2016-10-12 23:31:04', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('76', '2016-10-12 23:31:31', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('77', '2016-10-12 23:56:03', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('78', '2016-10-13 00:04:00', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('79', '2016-10-13 00:51:20', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('80', '2016-10-13 02:22:53', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('81', '2016-10-13 15:38:57', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('82', '2016-10-13 15:40:53', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('83', '2016-10-13 19:53:45', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('84', '2016-10-13 23:02:06', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('85', '2016-10-13 23:50:55', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('86', '2016-10-14 00:14:34', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('87', '2016-10-14 00:53:46', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('88', '2016-10-14 01:40:42', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('89', '2016-10-16 04:28:36', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('90', '2016-10-16 04:30:01', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('91', '2016-10-17 00:14:47', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('92', '2016-10-17 00:29:07', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('93', '2016-10-17 16:35:06', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('94', '2016-10-17 17:28:32', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('95', '2016-10-17 19:07:33', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('96', '2016-10-17 19:54:20', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('97', '2016-10-17 20:35:59', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('98', '2016-10-17 20:59:25', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('99', '2016-10-18 17:36:46', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('100', '2016-10-18 19:16:06', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('101', '2016-10-18 19:57:46', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('102', '2016-10-18 20:01:59', '127.0.0.1', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('103', '2016-10-18 20:02:44', '127.0.0.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('104', '2016-10-18 23:55:17', '172.18.56.155', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('105', '2016-10-19 00:26:39', '172.18.56.155', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('106', '2016-10-20 16:08:08', '172.27.156.197', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('107', '2016-10-20 16:14:12', '172.27.156.197', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('108', '2016-10-20 16:21:23', '172.27.156.197', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('109', '2016-10-20 16:43:20', '172.27.156.197', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('110', '2016-10-23 16:42:42', '172.27.5.33', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('111', '2016-10-23 17:17:26', '172.27.5.33', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('112', '2016-10-23 22:25:41', '172.27.5.33', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('113', '2016-10-24 00:59:37', '172.18.48.151', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('114', '2016-10-24 01:07:28', '172.18.48.151', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('115', '2016-10-24 19:58:42', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('116', '2016-10-24 20:37:35', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('117', '2016-10-24 20:38:00', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('118', '2016-10-24 20:39:22', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('119', '2016-10-24 20:41:12', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('120', '2016-10-24 21:45:09', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('121', '2016-10-24 21:57:01', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('122', '2016-10-24 22:21:11', '172.27.35.248', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('123', '2016-10-24 22:27:54', '172.27.35.248', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('124', '2016-10-24 22:32:45', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('125', '2016-10-24 22:38:58', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('126', '2016-10-24 22:42:13', '172.27.35.248', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('127', '2016-10-24 22:49:25', '172.27.35.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('128', '2016-10-24 23:09:30', '172.18.53.105', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('129', '2016-10-24 23:11:50', '172.18.53.105', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('130', '2016-10-24 23:14:23', '172.18.53.105', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('131', '2016-10-24 23:44:13', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('132', '2016-10-25 00:07:29', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('133', '2016-10-25 00:15:28', '172.18.53.105', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('134', '2016-10-25 00:46:07', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('135', '2016-10-25 00:51:16', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('136', '2016-10-25 01:26:59', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('137', '2016-10-25 01:29:07', '172.18.53.105', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('138', '2016-10-25 01:30:59', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('139', '2016-10-25 01:32:19', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('140', '2016-10-25 01:37:18', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('141', '2016-10-25 01:38:44', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('142', '2016-10-25 01:40:03', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('143', '2016-10-25 01:41:38', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('144', '2016-10-25 01:42:40', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('145', '2016-10-25 01:47:53', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('146', '2016-10-25 02:05:25', '172.18.53.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('147', '2016-10-25 16:26:04', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('148', '2016-10-25 16:27:18', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('149', '2016-10-25 16:27:34', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('150', '2016-10-25 16:29:25', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('151', '2016-10-25 16:30:58', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('152', '2016-10-25 16:32:08', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('153', '2016-10-25 16:36:52', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('154', '2016-10-25 16:38:16', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('155', '2016-10-25 16:42:37', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('156', '2016-10-25 16:43:44', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('157', '2016-10-25 16:53:43', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('158', '2016-10-25 17:03:01', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('159', '2016-10-25 17:06:11', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('160', '2016-10-25 17:08:13', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('161', '2016-10-25 17:13:21', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('162', '2016-10-25 17:13:58', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('163', '2016-10-25 17:14:15', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('164', '2016-10-25 17:17:11', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('165', '2016-10-25 17:42:39', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('166', '2016-10-25 17:56:43', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('167', '2016-10-25 17:57:27', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('168', '2016-10-25 18:00:45', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('169', '2016-10-25 19:48:25', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('170', '2016-10-25 19:55:34', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('171', '2016-10-25 19:57:26', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('172', '2016-10-25 19:57:41', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('173', '2016-10-25 20:00:17', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('174', '2016-10-25 20:02:35', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('175', '2016-10-25 20:05:29', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('176', '2016-10-25 20:07:50', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('177', '2016-10-25 20:10:29', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('178', '2016-10-25 20:13:45', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('179', '2016-10-25 20:17:01', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('180', '2016-10-25 20:19:08', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('181', '2016-10-25 20:23:40', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('182', '2016-10-25 20:46:40', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('183', '2016-10-25 20:48:58', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('184', '2016-10-25 20:51:32', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('185', '2016-10-25 20:56:20', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('186', '2016-10-25 20:59:22', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('187', '2016-10-25 21:01:27', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('188', '2016-10-25 21:05:14', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('189', '2016-10-25 21:07:19', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('190', '2016-10-25 21:10:38', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('191', '2016-10-25 21:14:37', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('192', '2016-10-25 21:16:46', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('193', '2016-10-25 21:18:57', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('194', '2016-10-25 21:53:43', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('195', '2016-10-25 21:56:28', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('196', '2016-10-25 21:59:34', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('197', '2016-10-25 22:02:18', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('198', '2016-10-25 22:09:57', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('199', '2016-10-25 22:12:35', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('200', '2016-10-25 22:17:04', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('201', '2016-10-25 22:25:52', '172.27.67.78', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('202', '2016-10-25 23:18:48', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('203', '2016-10-25 23:24:59', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('204', '2016-10-25 23:27:16', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('205', '2016-10-25 23:30:46', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('206', '2016-10-25 23:32:23', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('207', '2016-10-25 23:38:09', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('208', '2016-10-25 23:40:53', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('209', '2016-10-25 23:43:52', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('210', '2016-10-25 23:45:44', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('211', '2016-10-25 23:47:06', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('212', '2016-10-25 23:48:00', '172.18.52.41', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('213', '2016-10-25 23:49:12', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('214', '2016-10-25 23:51:35', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('215', '2016-10-25 23:53:45', '172.18.52.41', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('216', '2016-10-25 23:54:36', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('217', '2016-10-25 23:56:50', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('218', '2016-10-25 23:57:57', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('219', '2016-10-26 00:00:09', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('220', '2016-10-26 00:00:09', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('221', '2016-10-26 00:02:21', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('222', '2016-10-26 00:04:29', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('223', '2016-10-26 00:41:33', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('224', '2016-10-26 00:46:02', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('225', '2016-10-26 00:48:07', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('226', '2016-10-26 00:50:48', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('227', '2016-10-26 00:53:03', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('228', '2016-10-26 00:55:46', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('229', '2016-10-26 01:08:53', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('230', '2016-10-26 01:10:57', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('231', '2016-10-26 01:12:46', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('232', '2016-10-26 01:19:23', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('233', '2016-10-26 01:22:01', '172.18.52.41', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('234', '2016-10-26 17:10:03', '172.27.103.172', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('235', '2016-10-27 01:24:44', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('236', '2016-10-27 01:40:40', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('237', '2016-10-27 01:50:43', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('238', '2016-10-27 02:04:47', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('239', '2016-10-27 02:08:23', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('240', '2016-10-27 02:10:40', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('241', '2016-10-27 02:12:26', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('242', '2016-10-27 02:14:34', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('243', '2016-10-27 02:17:00', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('244', '2016-10-27 02:19:13', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('245', '2016-10-27 02:23:04', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('246', '2016-10-27 02:25:09', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('247', '2016-10-27 02:36:33', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('248', '2016-10-27 02:38:38', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('249', '2016-10-27 02:51:43', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('250', '2016-10-27 02:54:21', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('251', '2016-10-27 02:56:51', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('252', '2016-10-27 02:59:01', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('253', '2016-10-27 03:01:03', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('254', '2016-10-27 03:07:35', '172.18.56.72', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('255', '2016-10-27 14:17:23', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('256', '2016-10-27 14:22:29', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('257', '2016-10-27 14:24:50', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('258', '2016-10-27 15:10:01', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('259', '2016-10-27 15:14:04', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('260', '2016-10-27 15:18:05', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('261', '2016-10-27 15:29:40', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('262', '2016-10-27 15:30:39', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('263', '2016-10-27 15:33:08', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('264', '2016-10-27 15:34:28', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('265', '2016-10-27 15:35:32', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('266', '2016-10-27 15:37:19', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('267', '2016-10-27 15:40:01', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('268', '2016-10-27 15:43:25', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('269', '2016-10-27 16:13:10', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('270', '2016-10-27 16:15:16', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('271', '2016-10-27 17:48:46', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('272', '2016-10-27 17:49:25', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('273', '2016-10-27 17:52:28', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('274', '2016-10-27 17:57:19', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('275', '2016-10-27 18:09:47', '172.27.129.105', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('276', '2016-10-27 21:20:51', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('277', '2016-10-27 21:22:57', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('278', '2016-10-27 21:25:47', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('279', '2016-10-27 21:29:21', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('280', '2016-10-27 21:32:14', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('281', '2016-10-27 21:34:59', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('282', '2016-10-27 21:37:10', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('283', '2016-10-27 21:39:12', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('284', '2016-10-27 21:41:56', '172.27.146.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('285', '2016-10-27 21:47:07', '172.29.138.207', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('286', '2016-10-27 21:50:56', '172.29.138.207', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('287', '2016-10-27 21:53:41', '172.29.138.207', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('288', '2016-10-27 21:56:04', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('289', '2016-10-27 21:58:05', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('290', '2016-10-27 22:00:14', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('291', '2016-10-27 22:03:52', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('292', '2016-10-27 22:05:23', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('293', '2016-10-27 22:08:24', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('294', '2016-10-27 22:15:07', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('295', '2016-10-27 22:17:45', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('296', '2016-10-27 22:19:51', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('297', '2016-10-27 22:22:31', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('298', '2016-10-27 22:26:42', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('299', '2016-10-27 22:28:51', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('300', '2016-10-27 22:30:56', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('301', '2016-10-27 22:32:20', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('302', '2016-10-27 22:33:05', '172.27.147.248', '1', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('303', '2016-10-27 22:34:22', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('304', '2016-10-27 22:41:52', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('305', '2016-10-27 22:44:56', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('306', '2016-10-27 22:47:13', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('307', '2016-10-27 22:50:02', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('308', '2016-10-27 22:53:55', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('309', '2016-10-27 22:55:32', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('310', '2016-10-27 22:56:15', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('311', '2016-10-27 23:00:21', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('312', '2016-10-27 23:06:00', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('313', '2016-10-27 23:08:20', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('314', '2016-10-27 23:10:21', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('315', '2016-10-27 23:12:52', '172.27.147.248', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('316', '2016-10-27 23:15:57', '172.29.138.207', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('317', '2016-10-27 23:23:03', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('318', '2016-10-27 23:26:19', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('319', '2016-10-27 23:29:02', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('320', '2016-10-27 23:31:36', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('321', '2016-10-27 23:33:31', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('322', '2016-10-27 23:35:41', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('323', '2016-10-27 23:50:03', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('324', '2016-10-27 23:52:07', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('325', '2016-10-27 23:54:27', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('326', '2016-10-27 23:57:03', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('327', '2016-10-27 23:59:52', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('328', '2016-10-28 00:02:12', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('329', '2016-10-28 00:07:36', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('330', '2016-10-28 00:09:50', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('331', '2016-10-28 00:13:19', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('332', '2016-10-28 00:15:22', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('333', '2016-10-28 00:18:59', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('334', '2016-10-28 00:21:19', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('335', '2016-10-28 00:24:18', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('336', '2016-10-28 00:32:23', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('337', '2016-10-28 00:34:37', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('338', '2016-10-28 00:36:52', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('339', '2016-10-28 00:42:29', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('340', '2016-10-28 00:50:36', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('341', '2016-10-28 00:52:52', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('342', '2016-10-28 00:54:55', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('343', '2016-10-28 00:58:15', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('344', '2016-10-28 01:00:18', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('345', '2016-10-28 01:02:30', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('346', '2016-10-28 01:04:59', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('347', '2016-10-28 01:07:07', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('348', '2016-10-28 01:09:21', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('349', '2016-10-28 01:10:10', '172.18.49.136', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('350', '2016-10-28 01:16:01', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('351', '2016-10-28 01:19:01', '172.18.49.136', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('352', '2016-10-28 14:25:09', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('353', '2016-10-28 14:31:18', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('354', '2016-10-28 14:33:24', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('355', '2016-10-28 14:35:56', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('356', '2016-10-28 14:38:51', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('357', '2016-10-28 14:43:15', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('358', '2016-10-28 14:45:37', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('359', '2016-10-28 14:48:07', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('360', '2016-10-28 14:59:41', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('361', '2016-10-28 15:02:00', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('362', '2016-10-28 15:08:19', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('363', '2016-10-28 15:10:46', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('364', '2016-10-28 15:20:09', '172.27.158.228', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('365', '2016-10-28 21:17:59', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('366', '2016-10-28 21:20:04', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('367', '2016-10-28 21:22:24', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('368', '2016-10-28 21:34:38', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('369', '2016-10-28 21:35:55', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('370', '2016-10-28 21:38:43', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('371', '2016-10-28 21:41:37', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('372', '2016-10-28 21:57:50', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('373', '2016-10-28 22:00:57', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('374', '2016-10-28 22:15:57', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('375', '2016-10-28 22:19:43', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('376', '2016-10-28 22:27:08', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('377', '2016-10-28 22:28:03', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('378', '2016-10-28 22:33:16', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('379', '2016-10-28 22:57:33', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('380', '2016-10-28 23:00:01', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('381', '2016-10-28 23:02:42', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('382', '2016-10-28 23:05:23', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('383', '2016-10-28 23:07:31', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('384', '2016-10-28 23:08:15', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('385', '2016-10-28 23:10:43', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('386', '2016-10-28 23:12:53', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('387', '2016-10-28 23:16:02', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('388', '2016-10-28 23:18:36', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('389', '2016-10-28 23:21:51', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('390', '2016-10-28 23:24:23', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('391', '2016-10-28 23:25:10', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('392', '2016-10-28 23:27:39', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('393', '2016-10-28 23:29:47', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('394', '2016-10-28 23:30:39', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('395', '2016-10-28 23:32:16', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('396', '2016-10-28 23:34:54', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('397', '2016-10-28 23:35:34', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('398', '2016-10-28 23:37:37', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('399', '2016-10-28 23:39:42', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('400', '2016-10-28 23:40:52', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('401', '2016-10-28 23:43:06', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('402', '2016-10-28 23:45:38', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('403', '2016-10-28 23:45:58', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('404', '2016-10-28 23:48:37', '172.27.172.223', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('405', '2016-10-28 23:48:48', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('406', '2016-10-28 23:51:53', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('407', '2016-10-28 23:57:02', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('408', '2016-10-29 00:00:21', '172.27.172.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('419', '2016-10-29 14:35:08', '172.27.189.53', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('420', '2016-10-29 14:37:23', '172.27.189.53', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('421', '2016-10-29 16:52:25', '172.27.189.53', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('422', '2016-10-29 17:27:24', '172.27.189.53', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('423', '2016-10-29 17:44:07', '172.27.189.53', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('424', '2016-10-29 17:46:41', '172.27.189.53', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('425', '2016-10-29 18:19:38', '172.27.189.53', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('426', '2016-10-29 20:38:18', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('427', '2016-10-29 20:40:29', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('428', '2016-10-29 20:42:37', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('429', '2016-10-29 20:45:19', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('430', '2016-10-29 20:49:11', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('431', '2016-10-29 20:50:53', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('432', '2016-10-29 20:54:19', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('433', '2016-10-29 21:13:18', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('434', '2016-10-29 21:15:59', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('435', '2016-10-29 21:19:01', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('436', '2016-10-29 21:26:57', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('437', '2016-10-29 21:35:07', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('438', '2016-10-29 21:37:27', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('439', '2016-10-29 21:38:07', '172.27.200.200', '1', 'WINDOWS_10', 'EDGE14');
INSERT INTO `tb_system_user_login_log` VALUES ('440', '2016-10-29 21:39:49', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('441', '2016-10-29 21:42:50', '172.27.200.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('442', '2016-11-02 00:10:12', '172.18.58.151', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('443', '2016-11-02 14:01:28', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('444', '2016-11-02 14:07:05', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('445', '2016-11-02 14:12:22', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('446', '2016-11-02 14:12:46', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('447', '2016-11-02 14:13:56', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('448', '2016-11-02 14:15:56', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('449', '2016-11-02 14:17:12', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('450', '2016-11-02 14:17:33', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('451', '2016-11-02 14:34:33', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('452', '2016-11-02 14:41:44', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('453', '2016-11-02 14:43:34', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('454', '2016-11-02 14:50:17', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('455', '2016-11-02 14:50:56', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('456', '2016-11-02 14:51:12', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('457', '2016-11-02 14:51:25', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('458', '2016-11-02 15:04:12', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('459', '2016-11-02 15:14:09', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('460', '2016-11-02 15:18:45', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('461', '2016-11-02 15:36:42', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('462', '2016-11-02 15:42:01', '172.18.52.242', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('463', '2016-11-02 15:42:42', '172.18.52.242', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('464', '2016-11-02 15:43:00', '172.18.52.242', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('465', '2016-11-02 15:45:07', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('466', '2016-11-02 15:45:41', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('467', '2016-11-02 15:49:33', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('468', '2016-11-02 15:54:21', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('469', '2016-11-02 15:54:44', '172.18.52.242', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('470', '2016-11-02 15:57:12', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('471', '2016-11-02 16:38:04', '172.18.52.242', null, 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('472', '2016-11-02 16:45:58', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('473', '2016-11-02 16:46:30', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('474', '2016-11-02 16:49:20', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('475', '2016-11-02 16:49:51', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('476', '2016-11-02 16:53:35', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('477', '2016-11-02 16:54:54', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('478', '2016-11-02 17:03:32', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('479', '2016-11-02 17:06:46', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('480', '2016-11-02 17:08:43', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('481', '2016-11-02 17:09:10', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('482', '2016-11-02 17:09:57', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('483', '2016-11-02 17:12:19', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('484', '2016-11-02 17:13:03', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('485', '2016-11-02 17:15:37', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('486', '2016-11-02 17:24:14', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('487', '2016-11-02 17:25:27', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('488', '2016-11-02 17:26:51', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('489', '2016-11-02 17:32:25', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('490', '2016-11-02 17:32:59', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('491', '2016-11-02 17:37:27', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('492', '2016-11-02 17:39:06', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('493', '2016-11-02 17:39:56', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('494', '2016-11-02 17:43:41', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('495', '2016-11-02 17:43:59', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('496', '2016-11-02 17:47:57', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('497', '2016-11-02 17:48:43', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('498', '2016-11-02 17:52:49', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('499', '2016-11-02 17:53:29', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('500', '2016-11-02 17:54:10', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('501', '2016-11-02 17:54:49', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('502', '2016-11-02 17:57:54', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('503', '2016-11-02 17:58:13', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('504', '2016-11-02 17:59:18', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('505', '2016-11-02 18:02:03', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('506', '2016-11-02 18:02:24', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('507', '2016-11-02 18:02:41', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('508', '2016-11-02 18:03:29', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('509', '2016-11-02 18:03:52', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('510', '2016-11-02 18:05:19', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('511', '2016-11-02 18:05:33', '172.18.52.242', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('512', '2016-11-03 12:33:59', '172.27.111.163', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('513', '2016-11-05 07:36:05', '172.27.164.208', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('514', '2016-11-05 07:36:13', '172.27.164.208', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('515', '2016-11-06 15:17:30', '172.18.56.48', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('516', '2016-11-06 16:28:44', '172.18.56.48', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('517', '2016-11-06 17:18:02', '172.18.56.48', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('518', '2016-11-06 17:20:06', '172.18.56.48', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('519', '2016-11-09 08:59:28', '172.27.58.216', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('520', '2016-11-10 03:10:21', '172.27.84.112', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('521', '2016-11-10 16:59:45', '172.18.48.243', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('522', '2016-11-10 16:59:45', '172.18.48.243', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('523', '2016-11-10 17:00:32', '172.18.48.243', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('524', '2016-11-10 17:02:24', '172.18.48.243', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('525', '2016-11-10 17:02:32', '172.18.48.243', '2', 'WINDOWS_10', 'IE11');
INSERT INTO `tb_system_user_login_log` VALUES ('526', '2016-11-13 16:28:39', null, '1', 'windows', '360安全');
INSERT INTO `tb_system_user_login_log` VALUES ('527', '2016-11-13 16:32:34', '136.445.157.1', '1', 'windows', '360安全');
INSERT INTO `tb_system_user_login_log` VALUES ('528', '2016-11-13 16:53:12', '136.445.157.1', '1', 'windows', '360安全');
INSERT INTO `tb_system_user_login_log` VALUES ('529', '2016-11-13 16:54:23', '136.445.157.1', '1', 'windows', '360安全');
INSERT INTO `tb_system_user_login_log` VALUES ('530', '2016-11-13 16:54:44', '136.445.157.1', '1', 'windows', '360安全');
INSERT INTO `tb_system_user_login_log` VALUES ('531', '2016-11-14 13:38:22', '136.445.157.1', '1', 'windows', '360安全');
INSERT INTO `tb_system_user_login_log` VALUES ('532', '2016-11-14 17:19:12', '172.18.59.142', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('533', '2016-11-14 17:25:36', '172.18.59.142', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('534', '2016-11-14 17:33:33', '172.18.59.142', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('535', '2016-11-15 05:54:51', '192.168.16.148', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('536', '2016-11-15 06:31:50', '192.168.16.148', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('537', '2016-11-15 16:58:28', '172.18.62.102', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('538', '2016-11-21 06:19:38', '172.27.200.76', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('539', '2016-11-21 14:08:40', '172.27.222.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `tb_system_user_login_log` VALUES ('540', '2016-11-21 14:26:45', '172.27.222.211', '1', 'WINDOWS_10', 'CHROME45');

-- ----------------------------
-- Table structure for tb_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_user_role`;
CREATE TABLE `tb_system_user_role` (
  `USER_ROLE_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '用户角色编号',
  `ROLE_ID` int(9) DEFAULT NULL COMMENT '角色编号',
  `ACCOUNT_ID` int(9) DEFAULT NULL COMMENT '用户编号',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `ACCOUNT_ID` (`ACCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_system_user_role
-- ----------------------------
INSERT INTO `tb_system_user_role` VALUES ('90', '1', '2', '2016-10-29 21:43:03', '猫宁管理员');
INSERT INTO `tb_system_user_role` VALUES ('180', '1', '1', '2016-11-21 09:04:51', '猫宁管理员');
INSERT INTO `tb_system_user_role` VALUES ('181', '2', '1', '2016-11-21 09:04:51', '猫宁管理员');
INSERT INTO `tb_system_user_role` VALUES ('182', '3', '1', '2016-11-21 09:04:51', '猫宁管理员');
INSERT INTO `tb_system_user_role` VALUES ('186', '1', '3', '2016-11-21 12:30:43', '猫宁管理员');
INSERT INTO `tb_system_user_role` VALUES ('187', '2', '3', '2016-11-21 12:30:43', '猫宁管理员');
INSERT INTO `tb_system_user_role` VALUES ('188', '3', '3', '2016-11-21 12:30:43', '猫宁管理员');
