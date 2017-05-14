/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : pussinboots_morning

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-05-14 22:37:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级编号',
  `menu_type` tinyint(2) DEFAULT NULL COMMENT '权限类型 1=菜单/2=功能/3=子功能/0=操作',
  `menu_code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限代码',
  `menu_name` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图标名称',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 0=隐藏/1=显示',
  `permission` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='目录表';

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', '0', null, '', '功能菜单', null, '', '', '1', '', '2016-10-23 16:50:34', '系统管理员', '2016-12-08 16:14:48', '猫宁', '主页');
INSERT INTO `cms_menu` VALUES ('2', '1', '1', 'administrator', '管理员管理', '100', '/administrator', 'user', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('3', '2', '2', 'list', '管理员列表', '20', '/administrator/list/view', 'users', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-10 06:22:36', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('4', '3', '0', 'list_view', '查看', '1', '/administrator/list/view', '', '1', 'administrator:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('5', '3', '0', 'list_edit', '编辑', '2', '/administrator/list/edit', '', '1', 'administrator:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('6', '3', '0', 'list_delete', '删除', '3', '/administrator/list/delete', null, '1', 'administrator:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('7', '3', '0', 'list_create', '添加', '4', '/administrator/list/create', null, '1', 'administrator:list:create', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('8', '2', '2', 'info', '个人信息', '10', '/administrator/info/view', 'user-times', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-10 06:22:23', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('9', '8', '0', 'info_view', '查看', '1', '/administrator/info/view', '', '1', 'administrator:info:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('10', '8', '0', 'info_edit', '编辑', '2', '/administrator/info/edit', '', '1', 'administrator:info:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('11', '2', '2', 'role', '角色管理', '30', '/administrator/role/view', 'user-secret', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-08 17:21:33', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('12', '11', '0', 'role_view', '查看', '1', '/administrator/role/view', '', '1', 'administrator:role:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('13', '11', '0', 'role_edit', '编辑', '2', '/administrator/role/edit', '', '1', 'administrator:role:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('14', '11', '0', 'role_delete', '删除', '3', '/administrator/role/delete', '', '1', 'administrator:role:delete', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('15', '11', '0', 'role_create', '添加', '4', '/administrator/role/create', '', '1', 'administrator:role:create', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('16', '1', '1', 'user', '会员管理', '300', '/system/user', 'users', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('17', '16', '2', 'list', '会员列表', '10', '/system/user/list/view', 'user', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-10 06:15:37', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('18', '17', '0', 'list_view', '查看', '1', '/system/user/list/view', null, '1', 'user:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('19', '17', '0', 'list_edit', '编辑', '2', '/system/user/list/edit', null, '1', 'user:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('20', '17', '0', 'list_delete', '删除', '3', '/system/user/list/delete', null, '1', 'user:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('21', '17', '0', 'list_add', '添加', '4', '/system/user/list/add', null, '1', 'user:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('22', '16', '2', 'grade', '等级管理', '20', '/system/user/grade/view', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('23', '22', '0', 'grade_view', '查看', '1', '/system/user/grade/view', null, '1', 'user:grade:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('24', '22', '0', 'grade_edit', '编辑', '2', '/system/user/grade/edit', null, '1', 'user:grade:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('25', '16', '2', 'record', '会员记录管理', '30', '/system/user/record/view', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('26', '25', '0', 'record_view', '查看', '1', '/system/user/record/view', '', '1', 'user:record:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('27', '1', '1', 'goods', '产品管理', '400', '/system/goods', 'product-hunt', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('28', '27', '2', 'list', '产品列表', '10', '/system/goods/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('29', '28', '0', 'list_view', '查看', '1', '/system/goods/list/view', null, '1', 'goods:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('30', '28', '0', 'list_edit', '编辑', '2', '/system/goods/list/edit', null, '1', 'goods:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('31', '28', '0', 'list_delete', '删除', '3', '/system/goods/list/delete', null, '1', 'goods:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('32', '28', '0', 'list_add', '添加', '4', '/system/goods/list/add', null, '1', 'goods:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('33', '27', '2', 'classify', '分类管理', '20', '/system/goods/classify', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('34', '33', '0', 'classify_view', '查看', '1', '/system/goods/classify/view', null, '1', 'goods:classify:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('35', '33', '0', 'classify_edit', '编辑', '2', '/system/goods/classify/edit', null, '1', 'goods:classify:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('36', '33', '0', 'classify_delete', '删除', '3', '/system/goods/classify/delete', null, '1', 'goods:classify:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('37', '33', '0', 'classify_add', '添加', '4', '/system/goods/classify/add', null, '1', 'goods:classify:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('38', '27', '2', 'query', '问答管理', '30', '/system/goods/query', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('39', '38', '0', 'query_view', '查看', '1', '/system/goods/query/view', null, '1', 'goods:query:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('40', '38', '0', 'query_edit', '编辑', '2', '/system/goods/query/edit', null, '1', 'goods:query:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('41', '38', '0', 'query_delete', '删除', '3', '/system/goods/query/delete', null, '1', 'goods:query:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('42', '38', '0', 'query_add', '添加', '4', '/system/goods/query/add', null, '1', 'goods:query:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('43', '1', '1', 'order', '交易管理', '500', '/system/order', 'money', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('44', '43', '2', 'list', '订单管理', '10', '/system/order/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('45', '44', '0', 'list_view', '查看', '1', '/system/order/list/view', null, '1', 'order:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('46', '44', '0', 'list_edit', '编辑', '2', '/system/order/list/edit', null, '1', 'order:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('47', '44', '0', 'list_delete', '删除', '3', '/system/order/list/delete', null, '1', 'order:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('48', '44', '0', 'list_add', '添加', '4', '/system/order/list/add', null, '1', 'order:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('49', '43', '2', 'info', '交易信息', '10', '/system/order/info', '', '0', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('50', '49', '0', 'info_view', '查看', '1', '/system/order/info/view', null, '0', 'goods:info:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('51', '43', '2', 'reviews', '评论管理', '10', '/system/order/reviews', '', '0', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('52', '51', '0', 'reviews_view', '查看', '1', '/system/order/reviews/view', null, '0', 'goods:reviews:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('53', '51', '0', 'reviews_edit', '编辑', '2', '/system/order/reviews/edit', null, '0', 'goods:reviews:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('54', '51', '0', 'reviews_delete', '删除', '3', '/system/order/reviews/delete', null, '0', 'goods:reviews:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('55', '51', '0', 'reviews_add', '添加', '4', '/system/order/reviews/add', null, '0', 'goods:reviews:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('65', '1', '1', 'system', '系统管理', '700', '/system', 'universal-access', '1', null, '2016-10-23 20:22:55', '系统管理员', '2016-10-23 20:23:02', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('66', '65', '2', 'menu', '菜单管理', '10', '/system/menu/view', 'file-text', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-08 17:22:33', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('69', '3', '0', 'list_audit', '审查', '5', '/administrator/list/audit', '', '1', 'administrator:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('70', '17', '0', 'list_audit', '审查', '5', '/system/user/list/audit', null, '1', 'user:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('72', '28', '0', 'list_audit', '审查', '5', '/system/goods/list/audit', null, '1', 'goods:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('74', '66', '0', 'menu_view', '查看', '1', '/system/menu/view', null, '1', 'system:menu:view', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('75', '66', '0', 'menu_edit', '编辑', '2', '/system/menu/edit', '', '1', 'system:menu:edit', '2016-12-05 16:08:59', '系统管理员', '2016-12-10 06:45:32', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('76', '66', '0', 'menu_delete', '删除', '3', '/system/menu/delete', null, '1', 'system:menu:delete', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('77', '66', '0', 'menu_create', '添加', '4', '/system/menu/create', '', '1', 'system:menu:create', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('78', '66', '0', 'menu_audit', '审查', '5', '/system/menu/audit', null, '1', 'system:menu:audit', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('83', '11', '0', 'role_audit', '审查', '5', '/administrator/role/audit', '', '1', 'administrator:role:audit', '2016-12-10 07:25:58', '猫宁', '2016-12-10 07:26:56', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('84', '65', '2', 'version', '版本日志', '20', '/system/version/view', 'file-text-o', '1', null, null, '', null, null, '系统版本日志');
INSERT INTO `cms_menu` VALUES ('85', '84', '0', 'version_view', '查看', '1', '/system/version/view', '', '1', 'system:version:view', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('86', '2', '2', 'organization', '组织管理', '40', '/administrator/organization/view', 'coffee', '1', null, null, '', null, null, '组织管理');
INSERT INTO `cms_menu` VALUES ('87', '86', '0', 'organization_view', '查看', '1', '/administrator/organization/view', '', '1', 'administrator:organization:view', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('88', '86', '0', 'organization_edit', '编辑', '2', '/administrator/organization/edit', '', '1', 'administrator:organization:edit', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('89', '86', '0', 'organization_delete', '删除', '3', '/administrator/organization/delete', '', '1', 'administrator:organization:delete', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('90', '86', '0', 'organization_audit', '审查', '5', '/administrator/organization/audit', '', '1', 'administrator:organization:audit', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('91', '86', '0', 'organization_create', '添加', '4', '/administrator/organization/create', '', '1', 'administrator:organization:create', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('93', '65', '2', 'swagger', 'Swagger', '30', '/swagger-ui.html', 'black-tie', '1', null, '2017-04-07 12:18:42', '猫宁', null, null, 'swagger API');
INSERT INTO `cms_menu` VALUES ('94', '1', '1', 'online', '内容管理', '600', 'online', 'bars', '1', null, '2017-04-08 17:12:36', '猫宁', null, null, '电子商城内容管理模块');
INSERT INTO `cms_menu` VALUES ('95', '94', '2', 'navigation', '导航管理', '10', '/online/navigation/view', 'line-chart', '1', null, '2017-04-08 17:14:48', '猫宁', null, null, '电子商城内容管理模块导航管理');
INSERT INTO `cms_menu` VALUES ('96', '95', '0', 'navigation_view', '查看', '1', '/online/navigation/view', '', '1', 'online:navigation:view', '2017-04-08 17:16:43', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('97', '95', '0', 'navigation_edit', '编辑', '2', '/online/navigation/edit', '', '1', 'online:navigation:edit', '2017-04-08 17:17:45', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('98', '95', '0', 'navigation_delete', '删除', '3', '/online/navigation/delete', '', '1', 'online:navigation:delete', '2017-04-08 17:19:16', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('99', '95', '0', 'navigation_add', '添加', '4', '/online/navigation/create', '', '1', 'online:navigation:create', '2017-04-08 17:21:14', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('100', '95', '0', 'navigation_audit', '审查', '5', '/online/navigation/audit', '', '1', 'online:navigation:audit', '2017-04-08 17:22:22', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('101', '94', '2', 'advert', '广告管理', '20', '/online/advert/view', 'black-tie', '1', null, '2017-05-11 07:26:00', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('102', '101', '0', 'advert_view', '查看', '1', '/online/advert/view', '', '1', 'online:advert:view', '2017-05-11 07:27:58', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('103', '101', '0', 'advert_edit', '编辑', '2', '/online/advert/edit', '', '1', 'online:advert:edit', '2017-05-11 07:30:52', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('104', '101', '0', 'advert_delete', '删除', '3', '/online/advert/delete', '', '1', 'online:advert:delete', '2017-05-11 07:32:12', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('105', '101', '0', 'advert_add', '添加', '4', '/online/advert/create', '', '1', 'online:advert:create', '2017-05-11 07:33:00', '猫宁', null, null, '');
INSERT INTO `cms_menu` VALUES ('106', '101', '0', 'advert_audit', '审查', '5', '/online/advert/audit', '', '1', 'online:advert:audit', '2017-05-11 07:33:47', '猫宁', null, null, '');

-- ----------------------------
-- Table structure for cms_organization
-- ----------------------------
DROP TABLE IF EXISTS `cms_organization`;
CREATE TABLE `cms_organization` (
  `organization_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `organization_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `is_system` tinyint(2) DEFAULT '1' COMMENT '系统数据 1=是,只有超级管理员能修改/0=否,拥有角色修改人员的权限能都修改',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 0=冻结/1=正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='组织表';

-- ----------------------------
-- Records of cms_organization
-- ----------------------------
INSERT INTO `cms_organization` VALUES ('1', '产品研发部', '0', '1', '2017-02-17 00:59:20', '猫宁', '2017-04-07 04:54:03', '猫宁', '产品研发部主要负责产品研发等业务');
INSERT INTO `cms_organization` VALUES ('4', '测试研发部', '0', '1', '2017-04-07 04:51:47', '猫宁', '2017-04-07 04:51:47', '猫宁', '测试研发部');

-- ----------------------------
-- Table structure for cms_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE `cms_role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(64) DEFAULT NULL COMMENT '角色标志',
  `is_system` tinyint(2) DEFAULT '1' COMMENT '系统数据 1=是,只有超级管理员能修改/0=否,拥有角色修改人员的权限能都修改',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 0=冻结/1=正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cms_role
-- ----------------------------
INSERT INTO `cms_role` VALUES ('1', '超级管理员', 'admin', '0', '1', '2016-10-23 14:26:47', '猫宁管理员', '2017-05-11 07:33:56', '猫宁', '超级管理员，拥有系统所有的权力！');
INSERT INTO `cms_role` VALUES ('3', '角色管理员', 'role', '1', '1', '2017-02-07 16:20:21', '猫宁', '2017-04-07 02:46:35', '猫宁', '角色管理员，只能修改、创建角色');
INSERT INTO `cms_role` VALUES ('4', '测试管理员', 'test', '0', '0', '2017-04-07 01:59:32', '猫宁', '2017-04-07 11:47:59', '猫宁', '测试管理员');

-- ----------------------------
-- Table structure for cms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `cms_role_menu`;
CREATE TABLE `cms_role_menu` (
  `role_menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色权限编号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '权限编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3449 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of cms_role_menu
-- ----------------------------
INSERT INTO `cms_role_menu` VALUES ('2810', '3', '1', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2811', '3', '2', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2812', '3', '8', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2813', '3', '9', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2814', '3', '10', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2815', '3', '3', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2816', '3', '4', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2817', '3', '5', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2818', '3', '6', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2819', '3', '7', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2820', '3', '69', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2821', '3', '11', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2822', '3', '12', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2823', '3', '13', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2824', '3', '14', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2825', '3', '15', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2826', '3', '83', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2827', '3', '86', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2828', '3', '87', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2829', '3', '88', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2830', '3', '89', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2831', '3', '91', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2832', '3', '90', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2833', '3', '65', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2834', '3', '66', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2835', '3', '74', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2836', '3', '75', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2837', '3', '76', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2838', '3', '77', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2839', '3', '78', '2017-04-07 02:46:35', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3004', '4', '1', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3005', '4', '2', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3006', '4', '8', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3007', '4', '9', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3008', '4', '10', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3009', '4', '3', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3010', '4', '4', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3011', '4', '5', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3012', '4', '6', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3013', '4', '7', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3014', '4', '69', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3015', '4', '11', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3016', '4', '12', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3017', '4', '13', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3018', '4', '14', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3019', '4', '15', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3020', '4', '83', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3021', '4', '86', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3022', '4', '87', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3023', '4', '88', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3024', '4', '89', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3025', '4', '91', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3026', '4', '90', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3027', '4', '16', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3028', '4', '17', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3029', '4', '18', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3030', '4', '19', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3031', '4', '20', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3032', '4', '21', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3033', '4', '70', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3034', '4', '22', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3035', '4', '23', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3036', '4', '24', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3037', '4', '25', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3038', '4', '26', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3039', '4', '27', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3040', '4', '28', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3041', '4', '29', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3042', '4', '30', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3043', '4', '31', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3044', '4', '32', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3045', '4', '72', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3046', '4', '33', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3047', '4', '34', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3048', '4', '35', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3049', '4', '36', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3050', '4', '37', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3051', '4', '38', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3052', '4', '39', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3053', '4', '40', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3054', '4', '41', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3055', '4', '42', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3056', '4', '43', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3057', '4', '44', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3058', '4', '45', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3059', '4', '46', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3060', '4', '47', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3061', '4', '48', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3062', '4', '65', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3063', '4', '66', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3064', '4', '74', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3065', '4', '75', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3066', '4', '76', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3067', '4', '77', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3068', '4', '78', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3069', '4', '84', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3070', '4', '85', '2017-04-07 11:47:59', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3368', '1', '1', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3369', '1', '2', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3370', '1', '8', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3371', '1', '9', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3372', '1', '10', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3373', '1', '3', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3374', '1', '4', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3375', '1', '5', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3376', '1', '6', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3377', '1', '7', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3378', '1', '69', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3379', '1', '11', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3380', '1', '12', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3381', '1', '13', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3382', '1', '14', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3383', '1', '15', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3384', '1', '83', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3385', '1', '86', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3386', '1', '87', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3387', '1', '88', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3388', '1', '89', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3389', '1', '91', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3390', '1', '90', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3391', '1', '16', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3392', '1', '17', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3393', '1', '18', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3394', '1', '19', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3395', '1', '20', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3396', '1', '21', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3397', '1', '70', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3398', '1', '22', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3399', '1', '23', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3400', '1', '24', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3401', '1', '25', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3402', '1', '26', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3403', '1', '27', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3404', '1', '28', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3405', '1', '29', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3406', '1', '30', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3407', '1', '31', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3408', '1', '32', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3409', '1', '72', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3410', '1', '33', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3411', '1', '34', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3412', '1', '35', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3413', '1', '36', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3414', '1', '37', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3415', '1', '38', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3416', '1', '39', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3417', '1', '40', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3418', '1', '41', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3419', '1', '42', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3420', '1', '43', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3421', '1', '44', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3422', '1', '45', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3423', '1', '46', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3424', '1', '47', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3425', '1', '48', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3426', '1', '94', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3427', '1', '95', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3428', '1', '96', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3429', '1', '97', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3430', '1', '98', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3431', '1', '99', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3432', '1', '100', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3433', '1', '101', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3434', '1', '102', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3435', '1', '103', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3436', '1', '104', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3437', '1', '105', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3438', '1', '106', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3439', '1', '65', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3440', '1', '66', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3441', '1', '74', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3442', '1', '75', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3443', '1', '76', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3444', '1', '77', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3445', '1', '78', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3446', '1', '84', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3447', '1', '85', '2017-05-11 07:33:56', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('3448', '1', '93', '2017-05-11 07:33:56', '猫宁');

-- ----------------------------
-- Table structure for cms_user
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `organization_id` bigint(20) unsigned DEFAULT NULL COMMENT '组织ID',
  `login_name` varchar(20) DEFAULT '' COMMENT '管理员账号',
  `login_password` varchar(32) DEFAULT '' COMMENT '管理员密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '加密密码的盐',
  `user_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `sex` int(1) DEFAULT '0' COMMENT '性别 0=保密/1=男/2=女',
  `age` tinyint(4) DEFAULT '0' COMMENT '年龄',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` int(1) DEFAULT '1' COMMENT '状态 0=冻结/1=正常',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `telephone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('1', '1', 'admin', 'd81c31b9348c3da513177a781703767e', 'Dts7jk', '猫宁', '陈星星', '2', '22', 'default/avatar/avatar_2.jpg', '1', '810170512@qq.com', '18857105127', '2017-05-11 07:34:11', '172.27.150.88', '2016-10-27 23:11:43', '穿鞋子的猫', '2017-04-07 11:45:55', '猫宁');
INSERT INTO `cms_user` VALUES ('14', '4', 'test', 'aa7b19dfac77ec06a669c6a3d44f3c82', 'oFkuwy', '大撒旦', '阿萨德', '1', '0', 'default/avatar/avatar_6.jpg', '1', '15632831549@qq.com', '18857105127', null, null, '2017-04-06 12:55:44', '猫宁', '2017-04-07 05:04:52', '猫宁');

-- ----------------------------
-- Table structure for cms_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_login_log`;
CREATE TABLE `cms_user_login_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `user_ip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `user_id` bigint(20) DEFAULT NULL COMMENT '管理员ID',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COMMENT='管理员登陆表';

-- ----------------------------
-- Records of cms_user_login_log
-- ----------------------------
INSERT INTO `cms_user_login_log` VALUES ('2', '2017-02-05 19:05:04', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('3', '2017-02-05 19:05:16', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('4', '2017-02-05 19:06:20', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('5', '2017-02-05 21:24:57', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('6', '2017-02-05 21:35:42', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('7', '2017-02-05 23:06:00', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('8', '2017-02-05 23:17:33', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('9', '2017-02-06 00:42:26', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('10', '2017-02-06 00:54:23', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('11', '2017-02-06 01:20:06', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('12', '2017-02-06 01:33:17', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('13', '2017-02-06 03:03:25', '172.20.10.4', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('14', '2017-02-06 12:49:37', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('15', '2017-02-06 14:08:56', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('16', '2017-02-06 15:54:45', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('19', '2017-02-06 16:44:53', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('20', '2017-02-07 12:46:43', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('22', '2017-02-07 16:24:23', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('23', '2017-02-07 20:13:06', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('24', '2017-02-07 20:14:43', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('25', '2017-02-07 20:15:21', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('26', '2017-02-07 20:17:36', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('27', '2017-02-07 20:20:31', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('28', '2017-02-07 20:22:12', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('29', '2017-02-07 21:02:38', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('30', '2017-02-07 21:13:05', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('31', '2017-02-07 21:26:06', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('32', '2017-02-07 21:26:36', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('33', '2017-02-07 21:27:04', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('34', '2017-02-07 21:56:51', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('35', '2017-02-07 22:11:20', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('36', '2017-02-07 22:14:50', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('37', '2017-02-07 22:15:03', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('38', '2017-02-07 22:31:53', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('39', '2017-02-07 22:32:37', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('40', '2017-02-07 22:33:50', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('41', '2017-02-07 23:37:22', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('42', '2017-02-07 23:38:00', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('43', '2017-02-07 23:38:43', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('44', '2017-02-07 23:50:40', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('46', '2017-02-08 00:06:06', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('47', '2017-02-08 01:04:12', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('48', '2017-02-08 17:38:47', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('49', '2017-02-08 17:47:05', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('50', '2017-02-08 17:51:26', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('51', '2017-02-08 17:51:33', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('52', '2017-02-08 17:52:10', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('53', '2017-02-08 17:52:37', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('54', '2017-02-08 17:54:04', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('55', '2017-02-08 23:21:57', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('56', '2017-02-09 19:42:26', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('58', '2017-02-09 19:55:38', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('59', '2017-02-09 20:38:07', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('60', '2017-02-09 21:59:52', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('61', '2017-02-09 22:03:36', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('62', '2017-02-09 22:05:14', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('63', '2017-02-09 22:07:26', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('64', '2017-02-09 22:08:58', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('65', '2017-02-09 22:10:48', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('66', '2017-02-09 22:17:43', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('67', '2017-02-09 22:21:35', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('68', '2017-02-09 22:29:04', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('69', '2017-02-09 22:31:56', '192.168.1.101', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('70', '2017-02-15 15:18:00', '172.27.49.146', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('71', '2017-02-15 15:21:04', '172.27.49.146', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('72', '2017-02-15 15:23:40', '172.27.49.146', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('73', '2017-02-15 15:24:25', '172.27.49.146', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('74', '2017-02-15 15:37:34', '172.27.49.146', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('75', '2017-02-15 15:54:24', '172.27.49.146', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('76', '2017-02-15 16:07:17', '172.27.49.146', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('77', '2017-02-16 14:14:26', '172.27.54.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('78', '2017-02-16 14:41:16', '172.27.54.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('79', '2017-02-16 14:47:35', '172.27.54.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('80', '2017-02-16 15:01:03', '172.27.54.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('81', '2017-02-16 15:05:14', '172.27.54.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('82', '2017-02-16 15:16:44', '172.27.54.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('83', '2017-02-16 15:55:04', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('85', '2017-02-16 16:14:36', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('86', '2017-02-16 16:19:57', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('87', '2017-02-16 16:44:01', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('88', '2017-02-16 16:45:01', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('89', '2017-02-16 16:45:39', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('90', '2017-02-16 16:46:20', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('91', '2017-02-16 16:48:03', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('92', '2017-02-16 17:54:52', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('93', '2017-02-16 18:29:00', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('94', '2017-02-16 18:40:54', '172.27.55.200', '1', 'WINDOWS_8', 'IE11');
INSERT INTO `cms_user_login_log` VALUES ('95', '2017-02-16 19:28:13', '172.27.55.200', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('96', '2017-02-17 00:19:44', '172.27.60.17', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('97', '2017-02-17 01:11:54', '172.27.60.17', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('98', '2017-02-17 02:24:16', '172.27.60.17', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('99', '2017-02-17 10:24:28', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('100', '2017-02-17 13:50:45', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('101', '2017-02-17 15:18:31', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('102', '2017-02-17 15:20:43', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('103', '2017-02-17 16:57:57', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('104', '2017-02-17 17:21:55', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('105', '2017-02-17 17:22:33', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('106', '2017-02-17 17:23:16', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('107', '2017-02-17 23:41:55', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('108', '2017-02-18 01:06:37', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('109', '2017-02-18 01:25:00', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('110', '2017-02-18 01:37:24', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('111', '2017-02-18 01:40:44', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('112', '2017-02-18 02:46:21', '172.27.63.114', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('113', '2017-02-18 16:13:59', '172.27.86.198', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('114', '2017-02-18 18:37:00', '172.27.86.198', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('115', '2017-02-19 12:43:30', '172.27.111.162', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('116', '2017-02-19 18:13:39', '172.27.111.162', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('117', '2017-02-20 14:11:37', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('118', '2017-02-20 14:51:19', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('119', '2017-02-20 16:10:47', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('120', '2017-02-20 22:46:36', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('121', '2017-02-20 22:46:45', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('122', '2017-02-20 22:47:05', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('123', '2017-02-20 22:47:51', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('125', '2017-02-20 22:53:44', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('126', '2017-02-20 23:12:06', '172.18.52.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('127', '2017-02-20 23:12:35', '172.18.52.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('128', '2017-02-20 23:15:06', '172.18.52.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('130', '2017-02-22 02:35:43', '172.18.63.217', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('131', '2017-02-28 14:48:00', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('132', '2017-02-28 15:53:36', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('133', '2017-02-28 15:54:07', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('134', '2017-02-28 15:54:43', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('135', '2017-02-28 15:57:52', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('136', '2017-03-01 17:23:54', '172.27.155.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('137', '2017-03-01 17:24:12', '172.27.155.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('139', '2017-03-01 17:25:09', '172.27.155.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('141', '2017-03-01 20:42:14', '172.27.167.108', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('142', '2017-03-01 20:49:14', '172.27.167.108', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('143', '2017-03-06 20:55:30', '172.27.41.216', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('144', '2017-03-06 23:28:33', '172.18.62.201', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('145', '2017-03-08 22:14:32', '172.27.110.255', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('146', '2017-03-08 22:17:44', '172.27.110.255', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('147', '2017-03-08 22:20:26', '172.27.110.255', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('149', '2017-03-09 12:10:37', '172.27.122.119', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('152', '2017-03-09 12:26:35', '172.27.122.119', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('153', '2017-03-16 18:30:56', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('154', '2017-03-16 18:37:40', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('155', '2017-03-23 17:49:15', '172.27.13.115', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('156', '2017-03-23 18:01:54', '172.27.13.115', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('157', '2017-03-29 23:36:32', '172.18.51.148', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('161', '2017-04-01 16:29:28', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('162', '2017-04-01 16:37:47', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('163', '2017-04-01 16:47:32', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('164', '2017-04-01 17:02:55', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('165', '2017-04-01 17:03:48', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('166', '2017-04-01 17:06:17', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('167', '2017-04-01 17:13:13', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('168', '2017-04-01 17:16:24', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('169', '2017-04-01 17:22:22', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('170', '2017-04-01 18:22:55', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('171', '2017-04-01 18:53:51', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('172', '2017-04-02 05:44:51', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('173', '2017-04-02 06:54:21', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('174', '2017-04-02 06:59:00', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('175', '2017-04-02 07:30:31', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('176', '2017-04-02 07:37:50', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('177', '2017-04-02 07:51:04', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('178', '2017-04-02 08:02:51', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('179', '2017-04-02 08:05:39', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('180', '2017-04-02 08:07:23', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('181', '2017-04-02 08:31:06', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('182', '2017-04-02 09:05:37', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('183', '2017-04-02 11:19:59', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('184', '2017-04-02 12:27:41', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('185', '2017-04-02 13:43:34', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('186', '2017-04-02 13:45:42', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('187', '2017-04-02 13:47:52', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('188', '2017-04-02 13:50:29', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('189', '2017-04-02 14:11:35', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('190', '2017-04-02 14:38:59', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('191', '2017-04-02 15:07:14', '172.27.24.66', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('192', '2017-04-06 04:37:16', '172.27.127.210', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('193', '2017-04-06 04:37:16', '172.27.127.210', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('194', '2017-04-06 04:49:24', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('195', '2017-04-06 05:15:17', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('196', '2017-04-06 05:51:55', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('197', '2017-04-06 06:27:28', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('198', '2017-04-06 07:26:18', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('199', '2017-04-06 07:57:03', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('200', '2017-04-06 09:15:00', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('201', '2017-04-06 09:38:35', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('202', '2017-04-06 11:39:19', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('203', '2017-04-06 11:44:02', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('204', '2017-04-06 11:46:32', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('205', '2017-04-06 11:58:09', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('206', '2017-04-06 12:32:35', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('207', '2017-04-06 13:16:11', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('208', '2017-04-06 13:43:53', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('209', '2017-04-06 14:19:07', '172.27.128.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('210', '2017-04-06 15:54:45', '172.18.61.217', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('211', '2017-04-06 16:35:59', '172.18.61.217', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('212', '2017-04-06 16:52:17', '172.18.61.217', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('213', '2017-04-06 17:44:20', '172.18.61.217', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('214', '2017-04-06 18:04:22', '172.18.61.217', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('215', '2017-04-07 01:58:55', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('216', '2017-04-07 02:19:00', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('217', '2017-04-07 02:24:57', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('218', '2017-04-07 02:28:05', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('219', '2017-04-07 02:45:37', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('220', '2017-04-07 03:07:38', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('221', '2017-04-07 03:08:42', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('222', '2017-04-07 03:09:00', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('223', '2017-04-07 03:34:49', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('224', '2017-04-07 04:25:55', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('225', '2017-04-07 04:51:23', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('226', '2017-04-07 04:52:39', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('227', '2017-04-07 05:18:57', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('228', '2017-04-07 06:32:35', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('229', '2017-04-07 06:41:14', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('230', '2017-04-07 07:06:35', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('231', '2017-04-07 07:29:14', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('232', '2017-04-07 07:59:59', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('233', '2017-04-07 08:36:41', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('234', '2017-04-07 09:42:41', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('235', '2017-04-07 10:04:04', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('236', '2017-04-07 10:29:39', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('237', '2017-04-07 12:19:15', '172.27.149.205', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('238', '2017-04-08 17:07:53', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('239', '2017-04-08 17:27:59', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('240', '2017-04-08 17:37:47', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('241', '2017-04-08 17:54:45', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('242', '2017-04-08 18:18:09', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('243', '2017-04-08 18:40:36', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('244', '2017-04-08 18:57:39', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('245', '2017-04-08 19:00:24', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('246', '2017-04-08 19:34:39', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('247', '2017-04-08 19:56:35', '172.27.199.153', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('248', '2017-04-09 07:50:43', '172.27.209.180', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('249', '2017-04-09 08:21:00', '172.27.209.180', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('250', '2017-04-09 08:42:38', '172.27.209.180', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('251', '2017-05-11 03:02:04', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('252', '2017-05-11 07:18:25', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('253', '2017-05-11 07:28:34', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('254', '2017-05-11 07:34:11', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');

-- ----------------------------
-- Table structure for cms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_user_role`;
CREATE TABLE `cms_user_role` (
  `user_role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '管理员ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 COMMENT='管理员角色关联表';

-- ----------------------------
-- Records of cms_user_role
-- ----------------------------
INSERT INTO `cms_user_role` VALUES ('257', '1', '14', '2017-04-07 05:04:52', '猫宁');
INSERT INTO `cms_user_role` VALUES ('258', '3', '14', '2017-04-07 05:04:52', '猫宁');
INSERT INTO `cms_user_role` VALUES ('260', '1', '1', '2017-04-07 11:45:55', '猫宁');

-- ----------------------------
-- Table structure for cms_version_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_version_log`;
CREATE TABLE `cms_version_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '版本日志ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `log_title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `log_content` text COMMENT '日志内容',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of cms_version_log
-- ----------------------------
INSERT INTO `cms_version_log` VALUES ('1', '2016-04-28 15:48:50', '陈星星', 'Java Web 接触', '1.Spring+mybatis+SpringMVC三大框架接触与学习');
INSERT INTO `cms_version_log` VALUES ('2', '2016-05-02 20:04:08', '陈星星', '项目框架初步搭建', '<div>1.猫宁网上商城项目框架初步搭建</div><div>2.搭建用户登录页面</div>');
INSERT INTO `cms_version_log` VALUES ('3', '2016-05-08 23:46:54', '陈星星', '搭建登录模块', '<div>1.登陆界面的初步实现</div><div>2.搭建用户注册界面</div>');
INSERT INTO `cms_version_log` VALUES ('4', '2016-05-10 16:35:57', '陈星星', '搭建注册模块', '1.用户注册功能的初步实现');
INSERT INTO `cms_version_log` VALUES ('5', '2016-05-15 23:51:53', '陈星星', '主页初步搭建', '1.商城主页的初步搭建');
INSERT INTO `cms_version_log` VALUES ('6', '2016-05-17 18:12:23', '陈星星', '搭建数据库', '1.商城数据库初步设计与搭建');
INSERT INTO `cms_version_log` VALUES ('7', '2016-05-18 14:13:40', '陈星星', '数据库与J2EE集成', '<div>1.数据库与J2EE连接测试</div><div>2.数据库查询并输入查询集合</div><div>3.mybatis一对多查询功能实现</div><div>4.商品类目与商品一对多功能的实现</div>');
INSERT INTO `cms_version_log` VALUES ('8', '2016-05-19 17:18:40', '陈星星', '测试主页连接数据库', '1.商城主页与数据库初步连接');
INSERT INTO `cms_version_log` VALUES ('9', '2016-05-20 14:20:18', '陈星星', '商品详情页搭建', '1.商品详情页的初步搭建');
INSERT INTO `cms_version_log` VALUES ('10', '2016-05-21 23:19:46', '陈星星', '商品详情页图片显示功能', '1.商品详情页商品显示图片（主、侧、侧、细）功能实现');
INSERT INTO `cms_version_log` VALUES ('11', '2016-05-23 19:36:51', '陈星星', '详情页与数据库连接', '1.商品详情页与数据库初步连接');
INSERT INTO `cms_version_log` VALUES ('12', '2016-05-24 18:46:17', '陈星星', '修复数据库连接BUG', '1.修复页面与数据库连接若干BUG');
INSERT INTO `cms_version_log` VALUES ('13', '2016-05-27 23:22:59', '陈星星', '初步实现购物车功能', '<div>1.购物车页面的初步搭建</div><div>2.实现购物车修改、删除商品等功能</div>');
INSERT INTO `cms_version_log` VALUES ('14', '2016-05-29 20:46:55', '陈星星', '修复购物车BUG', '<div>1.添加购物车成功页面的初步搭建</div><div>2.修复购物车页面若干BUG</div>');
INSERT INTO `cms_version_log` VALUES ('15', '2017-06-01 16:24:52', '陈星星', '订单页面初步搭建', '<div>1.订单页面的初步搭建</div><div>2.用户收货地址添加、删除功能实现</div>');
INSERT INTO `cms_version_log` VALUES ('16', '2016-06-02 13:26:31', '陈星星', '订单页面与数据库连接', '<div>1.订单页面与数据库初步连接</div><div>2.用户购买商品，订单信息与订单详情插入数据库的实现</div>');
INSERT INTO `cms_version_log` VALUES ('17', '2016-06-03 19:33:19', '陈星星', '分类页面', '1.添加分类页面');
INSERT INTO `cms_version_log` VALUES ('18', '2016-06-04 16:33:48', '陈星星', '数据库事务处理', '<div>1.分页功能的初步实现</div><div>2.完善分类页面</div><div>3.添加事务处理器</div>');
INSERT INTO `cms_version_log` VALUES ('19', '2016-06-05 14:35:16', '陈星星', '商品分页及排序', '<div>1.整体风格替换为蓝色</div><div>2.完善首页商品展示分类功能</div><div>3.完善分页及商品分类排序</div><div>4.修复购物车显示数量为0的BUG</div>');
INSERT INTO `cms_version_log` VALUES ('20', '2016-06-06 22:36:24', '陈星星', '修复BUG，推荐商品', '<div>1.修复全部商品分类导航字体聚焦颜色问题</div><div>2.事务管理器验证完毕</div><div>3.登录/退出功能实现</div><div>4.实现为你推荐，推荐10件随机商品</div>');
INSERT INTO `cms_version_log` VALUES ('21', '2016-06-07 23:10:09', '陈星星', '修复购物车BUG', '1.修复购物车删除商品提示功能\r\n2.修复购物车删除商品，商品未被删除BUG\r\n3.实现搜索按钮及搜索内容排序问题');
INSERT INTO `cms_version_log` VALUES ('22', '2016-07-15 16:38:20', '陈星星', '调整项目结构', '<div>1.项目结构调整</div><div>2.404错误页面搭建</div><div>3.网站图标测试</div>');
INSERT INTO `cms_version_log` VALUES ('23', '2016-07-16 23:38:40', '陈星星', '调整项目结构，搭建错误页面', '<div>1.项目结构优化</div><div>2.完善错误页面搭建（400、403、405、500、error）</div><div>3.新项目结构下，注册、登录页面实现及优化</div>');
INSERT INTO `cms_version_log` VALUES ('24', '2016-07-23 14:40:00', '陈星星', '基础页面搭建，优化项目结构', '<div>1.项目结构优化</div><div>2.base、header、footer基础页面搭建</div>');
INSERT INTO `cms_version_log` VALUES ('25', '2016-08-01 20:40:18', '陈星星', '项目路径改为绝对路径', '<div>1.简单当前在线人数统计</div><div>2.项目相对路径修改为绝对路径</div>');
INSERT INTO `cms_version_log` VALUES ('26', '2016-08-02 14:41:27', '陈星星', 'lombok插件的使用', '<div>1.项目结构优化</div><div>2.lombok插件的使用</div>');
INSERT INTO `cms_version_log` VALUES ('27', '2016-08-03 21:42:13', '陈星星', '在线客服', '1.右侧在线客服代码');
INSERT INTO `cms_version_log` VALUES ('28', '2016-08-07 14:42:56', '陈星星', '发送邮件基本实现', '1.基于spring mail 邮件发送基本实现');
INSERT INTO `cms_version_log` VALUES ('29', '2016-08-08 14:44:17', '陈星星', '基于velocity发送邮件模版', '<div>1.基于spring velocity发送邮件模版</div><div>2.异步发送邮件实现</div>');
INSERT INTO `cms_version_log` VALUES ('30', '2016-08-09 19:44:41', '陈星星', '初步搭建个人中心', '<div>1.初步搭建个人中心</div><div>2.个人中心页面左侧搭建完毕</div>');
INSERT INTO `cms_version_log` VALUES ('31', '2016-08-11 19:45:35', '陈星星', '账户管理页面实现', '1.账户管理页面初步搭建');
INSERT INTO `cms_version_log` VALUES ('32', '2016-08-12 16:46:48', '陈星星', '重构用户模块代码', '<div>1.用户登录实体层、业务层、视图层结构优化，修复若干BUG，实现用户登录日志</div><div>2.整理用户实体类思维导向图</div>');
INSERT INTO `cms_version_log` VALUES ('33', '2016-08-13 14:47:32', '陈星星', '个人信息修改基本实现', '1.账户管理基本功能基本实现（修改个人信息，修改密码）');
INSERT INTO `cms_version_log` VALUES ('34', '2016-08-14 19:48:28', '陈星星', '修改个人信息提示窗口', '<div>1.修复超链接BUG，onclick无法拖动问题。</div><div>2.修复无法在新窗口中打开链接BUG</div><div>3.添加用户修改信息提示窗口</div>');
INSERT INTO `cms_version_log` VALUES ('35', '2016-08-15 23:49:53', '陈星星', '完善个人信息功能，修复BUG', '<div>1.完善修改密码、个人信息等功能</div><div>2.修复首页商品详细信息长度问题</div><div>3.修复商品列表页面 图片大小问题</div>');
INSERT INTO `cms_version_log` VALUES ('36', '2016-08-17 16:51:03', '陈星星', '初步实现头像上传功能', '1.初步实现头像上传功能');
INSERT INTO `cms_version_log` VALUES ('37', '2017-08-18 19:52:18', '陈星星', '完善上传文件功能', '1.完善文件上传功能，代码实现');
INSERT INTO `cms_version_log` VALUES ('38', '2016-08-19 16:53:05', '陈星星', '完善头像上传功能', '<div>1.头像上传功能基本实现与完善</div><div>2.初始化头像与头像页面完善</div>');
INSERT INTO `cms_version_log` VALUES ('39', '2016-08-20 19:54:24', '陈星星', '修复若干BUG', '<div>1.项目结构优化</div><div>2.修复搜索栏BUG</div><div>3.修复头像上传BUG</div>');
INSERT INTO `cms_version_log` VALUES ('40', '2016-08-21 18:55:17', '陈星星', '我的订单初步实现', '<div>1.订单中心-我的订单页面搭建</div><div>2.异步实现我的订单中心</div><div>3.修复头像上传BUG，相对路径与绝对路径冲突</div>');
INSERT INTO `cms_version_log` VALUES ('41', '2016-08-22 14:56:07', '陈星星', '重构商品模块代码', '<div>1.商品实体层、业务层、持久层代码优化，修复若干BUG</div><div>2.整理商品实体类思维导向图</div>');
INSERT INTO `cms_version_log` VALUES ('42', '2016-08-23 16:56:54', '陈星星', '优化商品模块代码', '<div>1.优化商品业务层代码</div><div>2.优化商品持久层与数据库连接代码</div><div>3.修复首页商品分类导航BUG</div>');
INSERT INTO `cms_version_log` VALUES ('43', '2016-08-24 17:57:24', '陈星星', '优化商品分类代码', '1.优化商品分类功能，修复若干BUG');
INSERT INTO `cms_version_log` VALUES ('44', '2016-08-25 19:58:17', '陈星星', '修复若干BUG', '<div>1.商品分类、排序、搜索、分页功能整合，修复若干BUG</div><div>2.修复商品类别导航栏BUG，链接点击商品</div>');
INSERT INTO `cms_version_log` VALUES ('45', '2016-08-26 20:59:18', '陈星星', '记录商品点击数', '<div>1.实现商品点击数，连接数据库</div><div>2.修复商品详情页导航栏显示异常BUG</div><div>3.实现商品图片实体类，完成商品图片显示功能</div>');
INSERT INTO `cms_version_log` VALUES ('46', '2016-08-27 15:00:12', '陈星星', '搭建商品订单页面', '1.搭建商品订单页面');
INSERT INTO `cms_version_log` VALUES ('47', '2016-08-29 22:00:36', '陈星星', '重构订单模块代码', '<div>1.了解ajax，页面加载顺序（html，css→js），即js更改html，源代码不变</div><div>2.订单，订单详情，订单状态实体层、业务层、持久层代码优化</div><div>3.购物车代码优化</div><div>4.修复购物车相同商品不能叠加的问题</div>');
INSERT INTO `cms_version_log` VALUES ('48', '2016-08-30 23:15:36', '陈星星', '修复购物车、库存BUG', '<div>1.修复购物车不能显示总数量和总价钱BUG</div><div>2.基本实现我的订单功能</div><div>3.修复批量更新库存销量BUG</div>');
INSERT INTO `cms_version_log` VALUES ('49', '2016-08-31 15:03:34', '陈星星', '完善我的订单功能', '<div>1.优化数据传送，删除无关属性，进一步了解一对多、多对一 关联查询</div><div>2.完善我的订单功能，优化界面，实现搜索订单的功能</div>');
INSERT INTO `cms_version_log` VALUES ('50', '2016-09-01 16:04:27', '陈星星', '修复搜索栏BUG', '<div>1.基本实现我的订单分页功能</div><div>2.修复搜索栏回车BUG</div><div>3.修复订单时间显示异常BUG</div>');
INSERT INTO `cms_version_log` VALUES ('51', '2016-09-02 19:05:23', '陈星星', '搭建我的收获地址页面', '<div>1.搭建我的收货地址页面</div><div>2.实现我的收货地址增加、删除、修改功能</div><div>3.${fn:length()}查询记录数</div>');
INSERT INTO `cms_version_log` VALUES ('52', '2016-09-03 21:05:44', '陈星星', '优化前端页面代码', '1.重新制作注册、登录页面，优化注册、登录后端代码');
INSERT INTO `cms_version_log` VALUES ('53', '2016-09-04 21:06:55', '陈星星', '优化注册功能代码', '<div>1.完善注册功能，实现邮箱验证注册功能</div><div>2.优化注册功能相关代码</div>');
INSERT INTO `cms_version_log` VALUES ('54', '2016-09-05 20:15:53', '陈星星', '重构登录页面', '1.登录页面重新制作与优化，优化登录后端代码');
INSERT INTO `cms_version_log` VALUES ('55', '2016-09-26 20:43:42', '陈星星', '初步搭建后台管理系统框架', '<div>1.初步搭建后台框架页面</div><div>2.项目路径优化</div>');
INSERT INTO `cms_version_log` VALUES ('56', '2016-09-27 18:11:01', '陈星星', '实现后台管理界面', '<div>1.优化js加载顺序</div><div>2.修复验证码绝对地址问题</div><div>3.实现后台管理界面</div>');
INSERT INTO `cms_version_log` VALUES ('57', '2016-09-28 19:16:27', '陈星星', '后台管理主页面初步搭建', '<div>1.后台管理员拦截器初步搭建</div><div>2.后台管理主页面初步搭建</div>');
INSERT INTO `cms_version_log` VALUES ('58', '2016-09-29 23:16:27', '陈星星', '了解百度ECharts数据可视化图表', '<div>1.了解百度ECharts数据可视化图表</div><div>2.重新设计项目，文件(Files)注释标签</div>');
INSERT INTO `cms_version_log` VALUES ('59', '2016-09-30 16:18:06', '陈星星', '百度Echarts的运用', '1.后台管理主页面完善，及百度Echarts的运用');
INSERT INTO `cms_version_log` VALUES ('60', '2016-10-01 19:18:49', '陈星星', '了解及配置spring-quartz定时器', '<div>1.了解及配置spring-quartz定时器&nbsp;</div><div>2.深入了解spring注解运行机制</div><div>3.设计计算时间相差功能，实现距今xx时间功能</div>');
INSERT INTO `cms_version_log` VALUES ('61', '2016-10-02 16:19:25', '陈星星', '网站统计功能实现', '<div>1.网站统计实体层、服务层、持久层的搭建</div><div>2.spring配置文件的优化</div><div>3.后台主页订单、支付金额显示功能的实现</div>');
INSERT INTO `cms_version_log` VALUES ('62', '2016-10-03 12:20:17', '陈星星', '1.网站定时功能的实现', '1.网站定时功能的实现');
INSERT INTO `cms_version_log` VALUES ('63', '2016-10-08 23:21:07', '陈星星', '主页订单图表显示功能实现', '<div>1.后台主页订单图表显示功能实现</div><div>2.网站统计实现类完善，将订单拆分已支付、未支付订单</div>');
INSERT INTO `cms_version_log` VALUES ('64', '2016-10-09 17:21:55', '陈星星', '了解bootstrap-table表格插件的使用', '<div>1.转化率之间空隙以&amp;nbsp;代表空格代替</div><div>2.将长数字分位显示，例如9,999.0</div><div>3.了解bootstrap-table表格插件的使用</div>');
INSERT INTO `cms_version_log` VALUES ('65', '2016-10-10 18:23:07', '陈星星', '用户列表初步搭建', '<div>1.用户信息查看页面初步搭建</div><div>2.用户列表页面初步搭建</div>');
INSERT INTO `cms_version_log` VALUES ('66', '2016-10-11 19:24:20', '陈星星', '优化前端代码，修复若干BUG', '<div>1.简化&lt;link&gt;&lt;script&gt;等相关标签</div><div>2.初步实现用户列表页面</div><div>3.修复后台用户头像显示出错BUG</div><div>4.修复后台主页订单、支付金额显出异常BUG</div>');
INSERT INTO `cms_version_log` VALUES ('67', '2016-10-12 19:25:01', '陈星星', '实现后台用户列表相关功能', '<div>1.完善用户实体类，添加最后登录时间、登录、状态等相关字段，及完善相应的功能</div><div>2.实现后台用户列表相关功能</div><div>3.实现用户列表更改用户状态/删除用户等相关功能</div><div>4.修复iframe滚动条不显示的问题（style=\"overflow:hidden\"）</div>');
INSERT INTO `cms_version_log` VALUES ('68', '2016-10-13 19:26:12', '陈星星', '初步搭建后台添加/修改用户界面', '<div>1.实现查看用户信息的功能</div><div>2.初步搭建后台添加/修改用户界面</div><div>3.实现添加、修改用户信息功能</div>');
INSERT INTO `cms_version_log` VALUES ('69', '2016-10-15 19:26:47', '陈星星', '了解java加密解密技术，实现RSA、MD5加密', '<div>1.java加密解密技术</div><div>2.实现JS客户端RSA加密，Java服务端解密功能，保证数据传递的安全性</div><div>3.实现数据库消息摘要算法MD5加密，保证用户/管理密码的安全性</div>');
INSERT INTO `cms_version_log` VALUES ('70', '2016-10-16 15:28:16', '陈星星', '优化项目代码，修复若干BUG', '<div>1.优化mapping文件位置</div><div>2.加入版本管理工具SVN</div><div>3.用户头像更换后删除以前的头像文件</div><div>4.修复头像上传组件头像无法移动BUG，js插件版本问题</div><div>5.修复前台用户不能通过账号查询订单BUG</div><div>6.修复用户查询订单加载动画，动画因路径问题不能加载</div>');
INSERT INTO `cms_version_log` VALUES ('71', '2016-10-17 19:29:33', '陈星星', '实现查询用户功能', '<div>1.实现用户登录记录查询系统</div><div>2.实现用户查询条件查询用户功能</div>');
INSERT INTO `cms_version_log` VALUES ('72', '2016-10-18 19:30:04', '陈星星', '搭建管理员个人信息页面', '<div>1.搭建管理员个人信息页面，并实现相关功能</div><div>2.修复用户登录获取本地IP地址BUG（127.0.0.1）</div>');
INSERT INTO `cms_version_log` VALUES ('73', '2016-10-21 23:30:39', '陈星星', '学习Shiro安全框架', '1.学习SpringMVC整合Shiro安全框架');
INSERT INTO `cms_version_log` VALUES ('74', '2016-10-22 19:34:15', '陈星星', '初步实现Shiro安全框架', '1.初步实现SpringMVC整合Shiro安全框架');
INSERT INTO `cms_version_log` VALUES ('75', '2016-10-23 16:35:10', '陈星星', '系统角色、权限代码实现', '<div>1.系统角色及系统权限实体层、服务层、持久层搭建</div><div>2.完善系統目录，实现系统目录与数据库连接</div>');
INSERT INTO `cms_version_log` VALUES ('76', '2016-10-24 15:35:55', '陈星星', 'spring MVC和shiro框架的整合完成', '1.spring MVC和shiro框架的整合完成，对shiro框架有了一定了解。');
INSERT INTO `cms_version_log` VALUES ('77', '2016-10-25 23:36:14', '陈星星', '实现shiro安全框架-登录及授权功能', '<div>1.实现shiro安全框架-登录及授权功能</div><div>2.实现管理员信息修改功能</div><div>3.优化后台授权和url地址</div>');
INSERT INTO `cms_version_log` VALUES ('78', '2016-10-26 23:37:05', '陈星星', '搭建管理员分类列表，并实现相关功能', '搭建管理员分类列表，并实现相关功能');
INSERT INTO `cms_version_log` VALUES ('79', '2016-10-27 22:37:05', '陈星星', '完善管理员列表', '1.优化json返回方式，对后台json 返回进行整理\r\n<div>1.优化json返回方式，对后台json 返回进行整理</div><div>2.完善管理员列表，增加相应功能</div>');
INSERT INTO `cms_version_log` VALUES ('80', '2016-10-28 21:38:26', '陈星星', '增加添加用户密码功能', '<div>1.增加添加用户密码功能</div><div>2.调整用户状态显示错误的BUG，正常/冻结</div>');
INSERT INTO `cms_version_log` VALUES ('81', '2016-10-29 23:39:18', '陈星星', '配置数据库连接池Alibaba Druid，了解规范Resful接口设计', '<div>1.用户列表功能实现完毕</div><div>2.配置数据库连接池：Alibaba Druid</div><div>3.使用Druid的内置监控功能</div><div>4.了解前端交互设计，规范Resful接口设计</div>');
INSERT INTO `cms_version_log` VALUES ('82', '2016-10-31 15:40:17', '陈星星', '配置ContextLoaderListener监听器', '1.配置ContextLoaderListener监听器');
INSERT INTO `cms_version_log` VALUES ('83', '2016-11-01 20:41:01', '陈星星', '对pom.xml配置文件进行整理与优化', '<div>1.对pom.xml配置文件进行整理与优化</div><div>2.修复发送邮件用加载配置文件的方式获取Bean的问题</div>');
INSERT INTO `cms_version_log` VALUES ('84', '2016-11-02 23:42:08', '陈星星', '采用注解的方式启动监听器，整合spring+shiro+Ehcache框架', '<div>1.采用注解的方式启动监听器</div><div>2.spring整合ehcache 注解实现查询缓存,并实现实时缓存更新。</div><div>3.整合spring+shiro+Ehcache框架，实现授权缓存管理</div>');
INSERT INTO `cms_version_log` VALUES ('85', '2016-11-05 22:43:07', '陈星星', '修复购物车若干BUG', '<div>1.修复购物车若干BUG</div><div>2.修复填写订单信息按钮颜色显示异常BUG</div><div>3.优化前台JSP文件名</div>');
INSERT INTO `cms_version_log` VALUES ('86', '2016-11-06 21:43:19', '陈星星', '项目上传至码云代码托管平台', '<div>1.对三层架构进行重新命名，了解分层开发的优点</div><div>2.项目上传至码云代码托管平台</div><div>3.编写项目说明文档README.md</div><div>4.实现druid页面查看</div>');
INSERT INTO `cms_version_log` VALUES ('87', '2016-11-08 16:45:08', '陈星星', '初步搭建订单支付页面', '<div>1.初步搭建订单支付页面</div><div>2.添加spring集成测试基类</div>');
INSERT INTO `cms_version_log` VALUES ('88', '2016-11-09 15:45:57', '陈星星', 'MyBatis Generator代码生成器与项目整合', '<div>1.test测试类的BaseTest基类</div><div>2.MyBatis Generator代码生成器与项目整合</div><div>3.订单记录表生成与相关功能的整合</div><div>4.订单支付页面与个人订单中心功能的完善</div><div>5.取消订单功能初步实现</div>');
INSERT INTO `cms_version_log` VALUES ('89', '2016-11-10 19:46:55', '陈星星', '确认收货功能的实现', '<div>1.确认收货功能的实现</div><div>2.封装json结果到AjaxResult实体类</div><div>3.优化邮箱验证</div>');
INSERT INTO `cms_version_log` VALUES ('90', '2016-11-14 19:48:28', '陈星星', '采用mybatis-plus简化xml配置文件', '<div>1.采用mybatis-plus简化xml配置文件与数据访问层接口</div><div>2.深入理解表示层/业务逻辑层/数据访问层分层式结构与各层相应的功能，优化后台用户分层结构</div><div>3.后台管理员模块代码优化完毕</div>');
INSERT INTO `cms_version_log` VALUES ('91', '2016-11-23 23:50:29', '陈星星', '优化项目中错误的代码', '<div>1.优化项目中错误的代码（从774个BUG改进到144）</div><div>2.删除lombok插件的应用</div>');
INSERT INTO `cms_version_log` VALUES ('92', '2016-11-26 19:50:51', '陈星星', '产品列表页面搭建', '1.产品列表页面搭建完毕，产品列表查看、状态、删除功能实现');
INSERT INTO `cms_version_log` VALUES ('93', '2016-12-04 23:51:26', '陈星星', '角色管理页面搭建', '<div>1.角色管理页面搭建完毕，角色管理基本功能实现</div><div>2.角色添加页面搭建完毕，添加/修改角色功能基本实现</div>');
INSERT INTO `cms_version_log` VALUES ('94', '2016-12-06 20:52:10', '陈星星', '系统菜单页面搭建', '<div>1.系统菜单页面搭建完毕</div><div>2.系统菜单页面菜单状态/删除功能基本实现</div>');
INSERT INTO `cms_version_log` VALUES ('95', '2016-12-07 20:53:07', '陈星星', '优化验证码', '<div>1.系统菜单添加菜单页面搭建完毕</div><div>2.优化验证码，使其更容易被他人理解</div><div>3.回车实现登录功能</div>');
INSERT INTO `cms_version_log` VALUES ('96', '2016-12-08 21:53:47', '陈星星', '菜单管理页面功能实现', '<div>1.添加菜单页面选择图标功能</div><div>2.菜单管理页面功能基本完成</div>');
INSERT INTO `cms_version_log` VALUES ('97', '2016-12-10 20:54:36', '陈星星', '增加订单配送表', '1.增加订单配送表，修复因用户收获地址修改导致订单收获地址修改BUG');
INSERT INTO `cms_version_log` VALUES ('98', '2016-12-12 20:55:12', '陈星星', '产品规格信息页面搭建完毕', '1.产品规格信息页面搭建完毕');
INSERT INTO `cms_version_log` VALUES ('99', '2016-12-15 19:55:34', '陈星星', 'Shiro通过Redis管理会话实现集群', '1.Shiro通过Redis管理会话实现集群');
INSERT INTO `cms_version_log` VALUES ('100', '2017-01-11 23:55:53', '陈星星', '初步了解war包', '<div>1.添加shiro标签，页面进行shiro按钮拦截</div><div>2.使用tomcat7-maven-plugin插件启动项目</div><div>3.初步了解war包</div>');
INSERT INTO `cms_version_log` VALUES ('101', '2017-02-02 19:56:42', '陈星星', '分布式框架基本搭建完毕', '<div>1.分布式框架基本搭建完毕</div><div>2.后台管理系统系统初步迁移</div>');
INSERT INTO `cms_version_log` VALUES ('102', '2017-02-03 15:57:24', '陈星星', '优化BaseController控制器', '1.BaseController加入防止XSS攻击和自动转换日期类型字段格式的InitBinder方法');
INSERT INTO `cms_version_log` VALUES ('103', '2017-02-04 20:58:24', '陈星星', '数据库管理员密码使用MD5+证书凭证的方式进行加密', '<div>1.数据库管理员密码使用MD5+证书凭证的方式进行加密，证书凭证=盐值随机6位数+登录账号组成</div><div>2.实现根据管理员角色生成网站目录功能</div><div>3.管理员个人信息迁移完毕</div>');
INSERT INTO `cms_version_log` VALUES ('104', '2017-02-05 23:58:51', '陈星星', '管理员列表代码迁移完毕', '<div>1.修改信息页面和创建信息页面分离</div><div>2.管理员列表代码迁移完毕</div>');
INSERT INTO `cms_version_log` VALUES ('105', '2017-02-06 15:59:14', '陈星星', '菜单管理代码迁移完毕', '1.菜单管理代码迁移完毕');
INSERT INTO `cms_version_log` VALUES ('106', '2017-02-07 20:59:46', '陈星星', '角色管理代码迁移完毕', '<div>1.角色管理代码迁移完毕</div><div>2.增加shiro系统管理员验证</div><div>3.实现shrio与redis分离，可自行选择是否使用redis</div>');
INSERT INTO `cms_version_log` VALUES ('107', '2017-02-08 23:00:21', '陈星星', '实现系统版本日志展示功能', '<div>1.实现shiro与redis分离，可自行选择是否使用redis</div><div>2.实现系统版本日志展示功能</div>');
INSERT INTO `cms_version_log` VALUES ('108', '2017-02-14 17:12:48', '陈星星', 'shiro登录次数限制', '1.shiro实现登录次数限制');
INSERT INTO `cms_version_log` VALUES ('109', '2017-02-16 19:13:26', '陈星星', '修复相关BUG', '<div>1.修复Service与Controller数据传递的问题，建立DTO包用于传递二者之间数据</div><div>2.修复dubbo因方法参数实体类序列化问题而不能加载的问题</div>');
INSERT INTO `cms_version_log` VALUES ('110', '2017-02-17 23:30:59', '陈星星', '新增组织管理', '<div>1.新增组织管理</div><div>2.组织与管理员对接</div><div>3.使用spring3.5注解</div><div>4.使用脚本删除多余文件删除多余文件</div><div>5.验证吗更换</div>');
INSERT INTO `cms_version_log` VALUES ('111', '2017-02-18 02:10:43', '陈星星', '新增组织详情', '<div>1.验证码验证成功后，删除session中的验证码信息</div><div>2.整理项目中相关依赖</div><div>3.组织管理中组织详情及管理员查看搭建完毕</div>');
INSERT INTO `cms_version_log` VALUES ('112', '2017-02-20 02:13:12', '陈星星', '电子商城用户登录', '<div>1.修复mysql5.7出现的bug问题</div><div>2.修复登录页css、js被拦截</div><div>3.电子商城用户登录迁移完毕</div><div>4.修复用户状态被禁止还能登录BUG</div><div>5.更新数据库</div>');
INSERT INTO `cms_version_log` VALUES ('113', '2017-02-21 02:14:30', '陈星星', '邮件发送模块', '<div>1.初步搭建邮件模块</div><div>2.测试邮件发送</div><div>3.将发送邮件的记录记录到数据库</div><div>4.解決xml文化冲突的问题</div><div>5.修复后台管理系统无法创建管理员BUG</div>');
INSERT INTO `cms_version_log` VALUES ('114', '2017-02-22 02:15:47', '陈星星', '电子商城用户登录、忘记密码功能实现', '<div>1.电子商城用户忘记密码整合完毕</div><div>2.修复验证信息不能为空 null bug</div><div>3.电子商城用户注册整合完毕</div><div>4.电子商城回车提交表单</div><div>5.更新数据库</div>');
INSERT INTO `cms_version_log` VALUES ('115', '2017-02-23 02:17:09', '陈星星', '电子商城首页实现', '<div>1.电子商城首页连接</div><div>2.SpringMVC拦截器拦截网站配置</div><div>3.网站导航栏管理实现</div><div>4.解决jsp报错的BUG</div><div>5.建立商品模块数据库表及基类service、entity、dao层</div><div>6.将邮件发送类独立出来</div>');
INSERT INTO `cms_version_log` VALUES ('116', '2017-02-24 02:17:52', '陈星星', '首页广告位实现', '1.电子商城首页广告位实现');
INSERT INTO `cms_version_log` VALUES ('117', '2017-02-26 02:19:03', '陈星星', '首页导航分类、明星产品实现', '<div>1.电子商城首页导航栏产品分类实现</div><div>2.首页明星产品实现</div>');
INSERT INTO `cms_version_log` VALUES ('118', '2017-02-28 02:20:27', '陈星星', '修复相关BUG', '<div>1.修复dubbo服务提供者启动报错的BUG</div><div>2.修复web项目启动报错的BUG</div><div>3.使用EL表达式减少jstl标签的使用</div><div>4.后台用户图片显示BUG</div><div>5.电子商城首页产品分类基本实现</div>');
INSERT INTO `cms_version_log` VALUES ('119', '2017-03-01 02:21:19', '陈星星', '对接产品分类页面', '<div>1.修复数据库DISTINCT去重报错BUG</div><div>2.对后台管理系统的模块进行更精确的分离，方便后期对模块的分布式</div><div>3.对接产品分类页面</div>');
INSERT INTO `cms_version_log` VALUES ('120', '2017-03-02 02:22:19', '陈星星', '对接产品详情页面', '<div>1.基本实现产品详情页面</div><div>2.更新数据库结构</div>');
INSERT INTO `cms_version_log` VALUES ('121', '2017-03-04 02:22:45', '陈星星', '完善产品详情页面', '<div>1.完善产品详情页面</div><div>2.对接商品评价、商品提问等功能</div>');
INSERT INTO `cms_version_log` VALUES ('122', '2017-03-05 00:27:06', '陈星星', '基本实现商品规格', '<div>1.商品规格选择基本完成</div><div>2.添加商品规格表</div><div>3.更新数据库结构</div>');
INSERT INTO `cms_version_log` VALUES ('123', '2017-03-06 00:28:11', '陈星星', '完善商品详情页', '<div>1.完善商品详情页面</div><div>2.后台管理用户头像修改</div>');
INSERT INTO `cms_version_log` VALUES ('124', '2017-03-13 00:29:31', '陈星星', '电子商品评论页面', '<div>1.电子商城用户登录显示功能</div><div>2.电子商城评论列表</div>');
INSERT INTO `cms_version_log` VALUES ('125', '2017-03-14 00:30:08', '陈星星', '商品搜索功能实现', '<div>1.商品提问列表</div><div>2.商品搜索功能实现</div>');
INSERT INTO `cms_version_log` VALUES ('126', '2017-03-15 00:30:27', '陈星星', '收藏夹展示实现', '<div>1.个人中心框架搭建完毕</div><div>2.收藏夹展示列表实现</div><div>3.删除喜欢的商品功能实现</div><div>4.更新数据库结构</div>');
INSERT INTO `cms_version_log` VALUES ('127', '2017-03-16 00:32:03', '陈星星', '我的收货地址展示实现', '<div>1.我的收获地址显示功能实现</div><div>2.删除我的收货地址实现</div><div>3.添加我的收获地址实现</div><div>4.更新数据库结构</div>');
INSERT INTO `cms_version_log` VALUES ('128', '2017-03-20 00:17:36', '陈星星', '成功加入购物车', '1.成功加入购物车显示页面');
INSERT INTO `cms_version_log` VALUES ('129', '2017-03-21 20:18:05', '陈星星', '我的购物车功能实现', '<div>1.将商品添加到购物车</div><div>2.购物车商品删除</div><div>3.我的购物车搭建完毕</div><div>4.我的购物车商品删除实现</div>');
INSERT INTO `cms_version_log` VALUES ('130', '2017-03-22 21:19:02', '陈星星', '我的收货地址相关功能实现', '<div>1.我的购物车修改商品数量</div><div>2.我的购物车选择购买商品</div><div>3.修改我的收货地址</div><div>4.确认订单页面</div>');
INSERT INTO `cms_version_log` VALUES ('131', '2017-03-28 00:19:53', '陈星星', '数据库订单结构', '<div>1.数据库订单结构</div><div>2.支付订单功能初步实现</div>');
INSERT INTO `cms_version_log` VALUES ('132', '2017-03-29 23:20:30', '陈星星', '我的订单展示页面', '<div>1.我的订单展示页面</div><div>2.收藏我喜欢的商品</div><div>3.用户提问商品</div>');
INSERT INTO `cms_version_log` VALUES ('133', '2017-03-31 19:21:10', '陈星星', '整合swagger2', '<div>1.初步拆分项目</div><div>2.整合swagger2</div>');
INSERT INTO `cms_version_log` VALUES ('134', '2017-04-06 00:21:44', '陈星星', '迁移项目', '<div>1.管理员列表迁移完毕</div><div>2.管理员信息迁移完毕</div>');
INSERT INTO `cms_version_log` VALUES ('135', '2017-04-07 22:22:15', '陈星星', '迁移项目', '<div>1.角色管理迁移完毕</div><div>2.组织管理迁移完毕</div><div>3.系统管理模块迁移完毕</div>');
INSERT INTO `cms_version_log` VALUES ('136', '2017-04-08 15:23:07', '陈星星', '电子商城web项目搭建', '<div>1.电子商城web项目搭建</div><div>2.电子商城用户登录迁移完毕</div>');
INSERT INTO `cms_version_log` VALUES ('137', '2017-04-09 22:23:19', '陈星星', '广告位整合完毕', '<div>1.导航栏功能完全实现</div><div>2.电子商城广告位整合完毕</div>');
INSERT INTO `cms_version_log` VALUES ('138', '2017-04-10 12:25:02', '陈星星', '后台管理系统广告管理', '1.后台管理系统广告管理');
INSERT INTO `cms_version_log` VALUES ('139', '2017-04-11 18:25:25', '陈星星', '为你推荐功能实现', '<div>1.明星单品功能实现</div><div>2.为你推荐功能实现</div>');
INSERT INTO `cms_version_log` VALUES ('140', '2017-04-12 16:25:54', '陈星星', '首页分类导航实现', '<div>1.热评产品功能实现</div><div>2.首页分类导航实现</div>');
INSERT INTO `cms_version_log` VALUES ('141', '2017-04-13 23:26:38', '陈星星', '1.商品分类页面迁移完毕', '1.商品分类页面迁移完毕');
INSERT INTO `cms_version_log` VALUES ('142', '2017-05-09 22:27:10', '陈星星', '整合分页插件以及分页接口', '<div>1.商品评论页面迁移完毕</div><div>2.个人中心页面迁移完毕</div><div>3.收藏的商品页面迁移完毕</div><div>4.整合分页插件以及分页接口</div><div>5.收货地址列表迁移完毕</div>');
INSERT INTO `cms_version_log` VALUES ('143', '2017-05-10 00:27:24', '陈星星', '订单详情页面搭建完毕', '<div>1.收货地址全部迁移完毕</div><div>2.我的订单迁移完毕</div><div>3.订单详情页面搭建完毕</div><div>4.购物车页面迁移完毕</div><div>5.订单确认页面迁移完毕</div>');
INSERT INTO `cms_version_log` VALUES ('144', '2017-05-11 23:28:11', '陈星星', '商品提问点赞功能实现', '<div>1.修改送货时间</div><div>2.导航栏购物车迁移完毕</div><div>3.商品提问功能实现</div><div>4.商品提问点赞功能实现</div><div>5.评论点赞功能实现</div>');

-- ----------------------------
-- Table structure for os_address
-- ----------------------------
DROP TABLE IF EXISTS `os_address`;
CREATE TABLE `os_address` (
  `address_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收获地址ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `user_tag` varchar(64) DEFAULT NULL COMMENT '地址标签',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '省份ID',
  `province_name` varchar(64) DEFAULT NULL COMMENT '省份名字',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '城市ID',
  `city_name` varchar(64) DEFAULT NULL COMMENT '城市名字',
  `district_id` int(10) unsigned DEFAULT NULL COMMENT '区域ID',
  `district_name` varchar(64) DEFAULT NULL COMMENT '区域名字',
  `user_adress` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user_zipcode` int(6) DEFAULT NULL COMMENT '邮政编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='收获地址表';

-- ----------------------------
-- Records of os_address
-- ----------------------------
INSERT INTO `os_address` VALUES ('3', '1', '陈星星', '家', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:14', '2017-03-16 18:48:18');
INSERT INTO `os_address` VALUES ('24', '1', '陈星星', '大苏打', '18857105127', '1', '北京市', '2', '北京市', '3', '东城区', '大撒旦3d大苏打', '321231', '2017-05-10 02:15:40', null);
INSERT INTO `os_address` VALUES ('25', '1', '陈星星', '学校', '18857105127', '804', '辽宁省', '822', '朝阳市', '825', '北票市', '杭州师范大学仓前校区', '123456', '2017-05-10 02:16:48', '2017-05-10 15:39:11');

-- ----------------------------
-- Table structure for os_advert
-- ----------------------------
DROP TABLE IF EXISTS `os_advert`;
CREATE TABLE `os_advert` (
  `advert_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `width` int(11) DEFAULT NULL COMMENT '宽度',
  `height` int(11) DEFAULT NULL COMMENT '高度',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `code` varchar(64) DEFAULT NULL COMMENT '代码简称',
  `template` text COMMENT '模版内容',
  `defult_number` int(11) DEFAULT '0' COMMENT '默认显示个数',
  `number` int(11) DEFAULT '0' COMMENT '广告数量',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 1=显示/0=隐藏',
  `type` tinyint(4) DEFAULT NULL COMMENT '广告位类型 1=图片/0=文本',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告位表';

-- ----------------------------
-- Records of os_advert
-- ----------------------------
INSERT INTO `os_advert` VALUES ('1', '首页-轮播广告', '1226', '460', '电子商城首页轮播广告位', 'indexCarousel', '				<ul class=\"ull\">\r\n				<c:forEach items=\"${indexCarouselImgs }\" var=\"indexCarouselImg\">\r\n				    <li><a href=\"${indexCarouselImg.href }\"><img src=\"${ctximg }/${indexCarouselImg.picImg}\" alt=\"${indexCarouselImg.title }\"></a></li>\r\n				</c:forEach>\r\n				</ul>\r\n				<ol class=\"oll\">\r\n				</ol>\r\n				<span class=\"left btnL glyphicon glyphicon-menu-right\"></span> <span class=\"right btnL glyphicon glyphicon-menu-left\"></span>', '6', '6', '1', '1', null, '', null, null);
INSERT INTO `os_advert` VALUES ('2', '首页-热点广告', '315', '170', '电子商城首页热点广告位', 'indexHotAdvert', '				<ul class=\"list2\">\r\n					<li><img src=\"img/dianhuaka.jpg\" alt=\"\"></li>\r\n					<li><img src=\"img/notexianhuo.jpg\" alt=\"\"></li>\r\n					<li><img src=\"img/jinghuaqi.jpg\" alt=\"\"></li>\r\n				</ul>', '3', '6', '1', '1', null, '', null, null);
INSERT INTO `os_advert` VALUES ('3', '首页-分栏广告', '234', '300', '电子商城首页分栏广告位', 'indexSubfield', null, '2', '6', '1', '1', null, '', null, null);

-- ----------------------------
-- Table structure for os_advert_detail
-- ----------------------------
DROP TABLE IF EXISTS `os_advert_detail`;
CREATE TABLE `os_advert_detail` (
  `advert_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告详情ID',
  `advert_id` bigint(20) DEFAULT NULL COMMENT '广告位ID',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 1=显示/0=隐藏',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  `begin_time` datetime DEFAULT NULL COMMENT '广告起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '广告结束时间',
  `content` varchar(255) DEFAULT NULL COMMENT '广告内容',
  PRIMARY KEY (`advert_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='广告位管理表';

-- ----------------------------
-- Records of os_advert_detail
-- ----------------------------
INSERT INTO `os_advert_detail` VALUES ('1', '1', '日行一善，小心意，大爱心', '1', '#', '1', 'images/advert/20170224/1471798388806.jpg', '2017-02-24 16:33:00', '猫宁', '2017-02-24 16:33:10', '猫宁', null, '2017-02-24 16:33:00', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('2', '1', '微光计划', '2', '#', '1', 'images/advert/20170224/1471798568000.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('3', '1', '免费午餐', '3', '#', '1', 'images/advert/20170224/1471798318820.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('4', '1', '走，带着热情去基层', '4', '#', '1', 'images/advert/20170224/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('5', '1', '微笑江豚', '5', '#', '1', 'images/advert/20170224/1471798587469.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('6', '1', '伸出援助之手', '6', '#', '1', 'images/advert/20170224/1471798364441.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('7', '2', '爸妈食堂', '1', '#', '1', 'images/advert/20170224/1487945656155.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('8', '2', '我们一起回家', '2', '#', '1', 'images/advert/20170224/1487945778175.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('9', '2', '关上一盏灯，点亮一盏灯', '3', '#', '1', 'images/advert/20170224/1487946033939.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('10', '2', '深圳壹基金公益基金会', '4', 'http://www.onefoundation.cn/', '1', 'images/advert/20170224/1487946180347.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('11', '2', '腾讯公益', '5', 'http://gongyi.qq.com/', '1', 'images/advert/20170224/1487946256048.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('12', '3', '测试产品广告', '1', 'list/2', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('13', '3', '手机专场，有你好看', '2', 'list/2', '1', 'images/advert/20170228/1471798587371.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('14', '3', '测试产品广告2', '3', 'list/2', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('16', '3', '测试产品广告3', '1', 'list/4', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('17', '3', '测试产品广告4', '1', 'list/4', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('18', '3', '测试产品广告5', '1', 'list/4', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);
INSERT INTO `os_advert_detail` VALUES ('19', '3', '测试产品广告5', '1', 'list/4', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null, '2017-02-24 16:34:02', '2017-06-30 14:39:50', null);

-- ----------------------------
-- Table structure for os_category
-- ----------------------------
DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `type` tinyint(2) DEFAULT NULL COMMENT '目录类型 2=二级目录/1=一级目录/0=总目录',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 1=显示/0=隐藏',
  `show_in_nav` tinyint(2) DEFAULT '0' COMMENT '是否导航栏 1=显示/0=隐藏',
  `show_in_top` tinyint(2) DEFAULT '0' COMMENT '是否置顶 1=置顶/0=默认',
  `show_in_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门 1=热门/0=默认',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(64) DEFAULT NULL COMMENT '页面描述',
  `page_keyword` varchar(64) DEFAULT NULL COMMENT '页面关键词',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of os_category
-- ----------------------------
INSERT INTO `os_category` VALUES ('1', '0', '全部商品', null, '0', '1', '0', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '全部商品', null, null, null);
INSERT INTO `os_category` VALUES ('2', '1', '手机', '100', '1', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '手机', null, null, null);
INSERT INTO `os_category` VALUES ('3', '1', '智能硬件', '200', '1', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能硬件', null, null, null);
INSERT INTO `os_category` VALUES ('4', '1', '笔记本  平板', '300', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '笔记本/平板', null, null, null);
INSERT INTO `os_category` VALUES ('5', '1', '路由器  移动电源', '400', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器/移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('6', '1', '周边配件', '500', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '周边配件', null, null, null);
INSERT INTO `os_category` VALUES ('7', '1', '耳机  音响', '600', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '耳机/音响', null, null, null);
INSERT INTO `os_category` VALUES ('8', '1', '保护套  贴膜', '700', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '保护套/贴膜', null, null, null);
INSERT INTO `os_category` VALUES ('9', '1', '生活周边', '800', '1', '1', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '生活周边', null, null, null);
INSERT INTO `os_category` VALUES ('10', '3', '手环及配件', '10', '2', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '手环及配件', null, null, null);
INSERT INTO `os_category` VALUES ('11', '3', '智能灯', '20', '2', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能健康', null, null, null);
INSERT INTO `os_category` VALUES ('12', '3', '智能家居', '30', '2', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能家居', null, null, null);
INSERT INTO `os_category` VALUES ('13', '3', '智能健康', '40', '2', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能出行', null, null, null);
INSERT INTO `os_category` VALUES ('15', '4', '笔记本电脑', '10', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '笔记本电脑', null, null, null);
INSERT INTO `os_category` VALUES ('16', '4', '平板电脑', '20', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '平板电脑', null, null, null);
INSERT INTO `os_category` VALUES ('17', '5', '路由器', '10', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器', null, null, null);
INSERT INTO `os_category` VALUES ('18', '5', '移动电源', '20', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('19', '5', '路由器配件', '30', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器配件', null, null, null);
INSERT INTO `os_category` VALUES ('20', '6', '插线板', '10', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '插线板', null, null, null);
INSERT INTO `os_category` VALUES ('21', '6', '存储卡', '20', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '存储卡', null, null, null);
INSERT INTO `os_category` VALUES ('22', '6', '移动硬盘', '30', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '移动硬盘', null, null, null);
INSERT INTO `os_category` VALUES ('23', '7', '头戴式耳机', '10', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '头戴式耳机', null, null, null);
INSERT INTO `os_category` VALUES ('24', '7', '活塞耳机', '20', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '活塞耳机', null, null, null);
INSERT INTO `os_category` VALUES ('25', '7', '蓝牙耳机', '30', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '蓝牙耳机', null, null, null);
INSERT INTO `os_category` VALUES ('26', '7', '音响', '40', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '音响', null, null, null);
INSERT INTO `os_category` VALUES ('27', '8', '贴膜', '10', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '贴膜', null, null, null);
INSERT INTO `os_category` VALUES ('28', '8', '保护套  保护壳', '20', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '保护套/保护壳', null, null, null);
INSERT INTO `os_category` VALUES ('29', '8', '移动电源保护套', '30', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '移动电源保护套', null, null, null);
INSERT INTO `os_category` VALUES ('30', '9', '箱包', '10', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '箱包', null, null, null);
INSERT INTO `os_category` VALUES ('31', '9', '服装', '20', '2', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '服装', null, null, null);

-- ----------------------------
-- Table structure for os_category_advert
-- ----------------------------
DROP TABLE IF EXISTS `os_category_advert`;
CREATE TABLE `os_category_advert` (
  `category_advert_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目广告ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类目ID',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 1=显示/0=隐藏',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `begin_time` datetime DEFAULT NULL COMMENT '广告起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '广告结束时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`category_advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='类目广告表';

-- ----------------------------
-- Records of os_category_advert
-- ----------------------------
INSERT INTO `os_category_advert` VALUES ('1', '2', '测试产品广告4', '3', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');
INSERT INTO `os_category_advert` VALUES ('2', '2', '测试产品广告2', '2', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');
INSERT INTO `os_category_advert` VALUES ('3', '2', '测试产品广告1', '1', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');
INSERT INTO `os_category_advert` VALUES ('4', '3', '测试产品广告5', '1', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');

-- ----------------------------
-- Table structure for os_comment
-- ----------------------------
DROP TABLE IF EXISTS `os_comment`;
CREATE TABLE `os_comment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `star` tinyint(4) DEFAULT NULL COMMENT '评论星级：1,2,3,4,5',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `good_count` int(11) DEFAULT '0' COMMENT '好评数',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `type` tinyint(2) DEFAULT '0' COMMENT '评论类型：1,优质；0,普通',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='评价表';

-- ----------------------------
-- Records of os_comment
-- ----------------------------
INSERT INTO `os_comment` VALUES ('1', '21', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '53', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('3', '22', '1', '测试评价人1', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '3', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('4', '23', '1', '测试评价人2', 'default/avatar/avatar_5.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '4', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('5', '24', '1', '测试评价人3', 'default/avatar/avatar_8.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '5', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('6', '6', '1', '测试评价人4', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '6', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('7', '5', '1', '测试评价人5', 'default/avatar/avatar_5.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '7', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('8', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '53', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('9', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '53', '1', '0', '2017-03-04 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('10', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '95', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('11', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('12', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '57', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('13', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '5', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('14', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('15', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('16', '1', '1', '测试评价人3', 'default/avatar/avatar_8.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '5', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('17', '1', '1', '测试评价人4', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '6', '1', '1', '2017-02-22 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('18', '1', '1', '测试评价人5', 'default/avatar/avatar_5.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '7', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('19', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('20', '1', '1', '测试评价人4', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '7', '1', '0', '2017-03-05 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');

-- ----------------------------
-- Table structure for os_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `os_comment_reply`;
CREATE TABLE `os_comment_reply` (
  `comment_reply_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论回复ID',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `good_count` int(11) DEFAULT '0' COMMENT '好评数',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `type` tinyint(2) DEFAULT '0' COMMENT '评论类型：1,官方回复；0,用户回复',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`comment_reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='评论回复表';

-- ----------------------------
-- Records of os_comment_reply
-- ----------------------------
INSERT INTO `os_comment_reply` VALUES ('1', '8', '1', '猫宁', 'default/avatar/avatar_8.jpg', '很好用啊', '17', '1', '1', '2017-03-04 15:41:37', null, '2017-03-04 15:41:40', null);
INSERT INTO `os_comment_reply` VALUES ('2', '8', '1', '猫宁', 'default/avatar/avatar_4.jpg', '测试2', '0', '1', '0', '2017-03-04 15:42:00', null, null, null);
INSERT INTO `os_comment_reply` VALUES ('3', '8', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试3', '0', '0', '0', '2017-03-04 15:42:00', null, null, null);
INSERT INTO `os_comment_reply` VALUES ('4', '8', '1', '猫宁', 'default/avatar/avatar_8.jpg', '测试3', '0', '1', '0', '2017-03-04 15:42:00', null, null, null);

-- ----------------------------
-- Table structure for os_email
-- ----------------------------
DROP TABLE IF EXISTS `os_email`;
CREATE TABLE `os_email` (
  `email_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '邮箱ID',
  `email_sign` bigint(20) unsigned DEFAULT NULL COMMENT '邮箱标识号',
  `user_email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `email_type` tinyint(4) DEFAULT NULL COMMENT '邮箱类型：0.找回密码；1.注册；2.改变邮箱；3.通知',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime DEFAULT NULL COMMENT '有效开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '有效结束时间',
  `new_email` varchar(50) DEFAULT NULL COMMENT '新电子邮箱',
  `status` tinyint(1) DEFAULT '1' COMMENT '链接是否已失效：0.失效；1.未失效；',
  `send_status` tinyint(1) DEFAULT NULL COMMENT '发送状态：0.发送失败；1.发送成功；',
  `captcha` varchar(10) DEFAULT NULL COMMENT '验证码',
  `email_subject` varchar(255) DEFAULT NULL COMMENT '邮箱主题',
  `email_content` text COMMENT '邮箱正文',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='邮箱记录表';

-- ----------------------------
-- Records of os_email
-- ----------------------------
INSERT INTO `os_email` VALUES ('1', '1487701725134975', '810170512@qq.com', '0', '2017-02-22 02:28:44', '2017-02-22 02:28:44', '2017-02-22 02:31:44', null, null, '1', 'czTZtJ', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487701724488,\"captcha\":\"czTZtJ\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('2', '1487745251478729', '810170512@qq.com', '0', '2017-02-22 14:34:10', '2017-02-22 14:34:10', '2017-02-22 14:37:10', null, null, '1', 'XrrCjK', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745250328,\"captcha\":\"XrrCjK\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('3', '1487745291967494', '810170512@qq.com', '0', '2017-02-22 14:34:50', '2017-02-22 14:34:50', '2017-02-22 14:37:50', null, null, '1', 'Yi58cm', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745290356,\"captcha\":\"Yi58cm\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('4', '1487745367690376', '810170512@qq.com', '0', '2017-02-22 14:36:07', '2017-02-22 14:36:07', '2017-02-22 14:39:07', null, null, '1', 'ZnM7LT', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745367013,\"captcha\":\"ZnM7LT\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('5', '1487745465859777', '810170512@qq.com', '0', '2017-02-22 14:37:45', '2017-02-22 14:37:45', '2017-02-22 14:40:45', null, null, '1', 'rPTYKh', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745465071,\"captcha\":\"rPTYKh\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('6', '1487745514897267', '810170512@qq.com', '0', '2017-02-22 14:38:34', '2017-02-22 14:38:34', '2017-02-22 14:41:34', null, null, '1', 'pkNcix', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745514377,\"captcha\":\"pkNcix\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('7', '1487745585180268', '810170512@qq.com', '0', '2017-02-22 14:39:45', '2017-02-22 14:39:45', '2017-02-22 14:42:45', null, null, '1', 'wqymfP', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487745584699,\"captcha\":\"wqymfP\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('8', '1487747001532713', '810170512@qq.com', '0', '2017-02-22 15:03:21', '2017-02-22 15:03:21', '2017-02-22 15:06:21', null, null, '1', '2BRBgt', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747000793,\"captcha\":\"2BRBgt\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('9', '1487747066956961', '810170512@qq.com', '0', '2017-02-22 15:04:26', '2017-02-22 15:04:26', '2017-02-22 15:07:26', null, null, '1', 'H6Uj5q', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747066378,\"captcha\":\"H6Uj5q\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('10', '1487747245006097', '810170512@qq.com', '0', '2017-02-22 15:07:23', '2017-02-22 15:07:23', '2017-02-22 15:10:23', null, null, '1', 'KuNGJ5', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747243254,\"captcha\":\"KuNGJ5\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('11', '1487747326676692', '810170512@qq.com', '0', '2017-02-22 15:08:46', '2017-02-22 15:08:46', '2017-02-22 15:11:46', null, null, '1', 'dmTK0O', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747325962,\"captcha\":\"dmTK0O\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('12', '1487747420406932', '810170512@qq.com', '0', '2017-02-22 15:10:20', '2017-02-22 15:10:20', '2017-02-22 15:13:20', null, null, '1', '4l49sL', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747419544,\"captcha\":\"4l49sL\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('13', '1487747679673929', '810170512@qq.com', '0', '2017-02-22 15:14:39', '2017-02-22 15:14:39', '2017-02-22 15:17:39', null, null, '1', 'tpmrp9', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747678855,\"captcha\":\"tpmrp9\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('14', '1487747718595384', '810170512@qq.com', '0', '2017-02-22 15:15:18', '2017-02-22 15:15:18', '2017-02-22 15:18:18', null, null, '1', 'KJT5rb', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747717836,\"captcha\":\"KJT5rb\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('15', '1487747750712149', '810170512@qq.com', '0', '2017-02-22 15:15:50', '2017-02-22 15:15:50', '2017-02-22 15:18:50', null, null, '1', 'GA4WY0', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747750226,\"captcha\":\"GA4WY0\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('16', '1487747787753452', '810170512@qq.com', '0', '2017-02-22 15:16:27', '2017-02-22 15:16:27', '2017-02-22 15:19:27', null, null, '1', 't2Ioou', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487747787269,\"captcha\":\"t2Ioou\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('17', '1487749320998554', '810170512@qq.com', '0', '2017-02-22 15:41:59', '2017-02-22 15:41:59', '2017-02-22 15:44:59', null, null, '1', 'e44wxl', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487749319458,\"captcha\":\"e44wxl\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('18', '1487749446841660', '810170512@qq.com', '0', '2017-02-22 15:44:05', '2017-02-22 15:44:05', '2017-02-22 15:47:05', null, null, '1', 'lRPJel', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487749444869,\"captcha\":\"lRPJel\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('19', '1487751876226966', '810170512@qq.com', '0', '2017-02-22 16:24:34', '2017-02-22 16:24:34', '2017-02-22 16:27:34', null, '0', '1', '8errLm', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487751873978,\"captcha\":\"8errLm\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('20', '1487752312477679', '810170512@qq.com', '0', '2017-02-22 16:31:52', '2017-02-22 16:31:52', '2017-02-22 16:34:52', null, '0', '1', 'LVlQWq', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487752311660,\"captcha\":\"LVlQWq\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('21', '1487752705280100', '810170512@qq.com', '0', '2017-02-22 16:38:24', '2017-02-22 16:38:24', '2017-02-22 16:41:24', null, '0', '1', 'GIx3hA', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487752703525,\"captcha\":\"GIx3hA\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('22', '1487752992885442', '810170512@qq.com', '0', '2017-02-22 16:43:12', '2017-02-22 16:43:12', '2017-02-22 16:46:12', null, '0', '1', 'vMEH28', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487752992241,\"captcha\":\"vMEH28\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('23', '1487753204821656', '810170512@qq.com', '0', '2017-02-22 16:46:44', '2017-02-22 16:46:44', '2017-02-22 16:49:44', null, '0', '1', 'Z5VGUo', '『但行好事·莫问前程』猫宁帐号安全验证', '{\"createTime\":1487753204102,\"captcha\":\"Z5VGUo\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('24', '1487766672370815', '5524551@qq.com', '1', '2017-02-22 20:31:11', '2017-02-22 20:31:11', '2017-02-22 20:34:11', null, '1', '1', 'aPMA2T', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487766671298,\"captcha\":\"aPMA2T\",\"userNumber\":148776666975620,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('25', '1487766781695935', '5524551@qq.com', '1', '2017-02-22 20:33:01', '2017-02-22 20:33:01', '2017-02-22 20:36:01', null, '1', '1', 'PacTrm', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487766781056,\"captcha\":\"PacTrm\",\"userNumber\":148776666975620,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('26', '1487772029160876', '5524551@qq.com', '1', '2017-02-22 22:00:28', '2017-02-22 22:00:28', '2017-02-22 22:03:28', null, '0', '1', 'QMzNU8', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772028390,\"captcha\":\"QMzNU8\",\"userNumber\":148777202714541,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('27', '1487772322320673', '5524551@qq.com', '1', '2017-02-22 22:05:22', '2017-02-22 22:05:22', '2017-02-22 22:08:22', null, '0', '1', 'z4iSN2', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772321714,\"captcha\":\"z4iSN2\",\"userNumber\":148777232058127,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('28', '1487772599839706', '5524551@qq.com', '1', '2017-02-22 22:09:59', '2017-02-22 22:09:59', '2017-02-22 22:12:59', null, '0', '1', 'EYYR47', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772599321,\"captcha\":\"EYYR47\",\"userNumber\":148777259696399,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('29', '1487772954429560', '5524551@qq.com', '1', '2017-02-22 22:15:54', '2017-02-22 22:15:54', '2017-02-22 22:18:54', null, '0', '1', 'I6qEet', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487772953745,\"captcha\":\"I6qEet\",\"userNumber\":148777295260796,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('30', '1487773065968082', '5524551@qq.com', '1', '2017-02-22 22:17:46', '2017-02-22 22:17:46', '2017-02-22 22:20:46', null, '0', '1', 'XAJK83', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487773065500,\"captcha\":\"XAJK83\",\"userNumber\":148777306444101,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('31', '1487774822132418', '5524551@qq.com', '1', '2017-02-22 22:47:01', '2017-02-22 22:47:01', '2017-02-22 22:50:01', null, '0', '1', 'aRh8Jg', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487774821115,\"captcha\":\"aRh8Jg\",\"userNumber\":148777481346536,\"email\":\"5524551@qq.com\"}');
INSERT INTO `os_email` VALUES ('32', '1487776595249887', '810170512@qq.com', '1', '2017-02-22 23:16:35', '2017-02-22 23:16:35', '2017-02-22 23:19:35', null, '1', '0', '87jyVc', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487776594743,\"captcha\":\"87jyVc\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('33', '1487776598551251', '810170512@qq.com', '1', '2017-02-22 23:16:38', '2017-02-22 23:16:38', '2017-02-22 23:19:38', null, '1', '0', 'HkWpwV', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487776598070,\"captcha\":\"HkWpwV\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('34', '1487777000826262', '810170512@qq.com', '1', '2017-02-22 23:23:20', '2017-02-22 23:23:20', '2017-02-22 23:26:20', null, '1', '1', 'EKkA6w', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777000076,\"captcha\":\"EKkA6w\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('35', '1487777112813288', '810170512@qq.com', '1', '2017-02-22 23:25:12', '2017-02-22 23:25:12', '2017-02-22 23:28:12', null, '1', '0', 'Ny5dvw', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777111837,\"captcha\":\"Ny5dvw\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('36', '1487777144646057', '810170512@qq.com', '1', '2017-02-22 23:25:28', '2017-02-22 23:25:28', '2017-02-22 23:28:28', null, '1', '0', '70zoYS', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777128336,\"captcha\":\"70zoYS\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('37', '1487777263454157', '810170512@qq.com', '1', '2017-02-22 23:27:43', '2017-02-22 23:27:43', '2017-02-22 23:30:43', null, '1', '0', '4LaZH4', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777262744,\"captcha\":\"4LaZH4\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('38', '1487777471768088', '810170512@qq.com', '1', '2017-02-22 23:31:11', '2017-02-22 23:31:11', '2017-02-22 23:34:11', null, '1', '0', 'NOdGcK', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777470819,\"captcha\":\"NOdGcK\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('39', '1487777545288280', '810170512@qq.com', '1', '2017-02-22 23:32:24', '2017-02-22 23:32:24', '2017-02-22 23:35:24', null, '1', '1', 'LHArBs', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487777543711,\"captcha\":\"LHArBs\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('40', '1487778625942492', '810170512@qq.com', '1', '2017-02-22 23:50:25', '2017-02-22 23:50:25', '2017-02-22 23:53:25', null, '1', '1', 'SYt86d', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487778625015,\"captcha\":\"SYt86d\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('41', '1487871021985261', '810170512@qq.com', '1', '2017-02-24 01:30:21', '2017-02-24 01:30:21', '2017-02-24 01:33:21', null, '1', '0', 'nSfx28', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487871021429,\"captcha\":\"nSfx28\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('42', '1487871651886848', '810170512@qq.com', '1', '2017-02-24 01:40:51', '2017-02-24 01:40:51', '2017-02-24 01:43:51', null, '1', '0', 'xAgV07', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487871651448,\"captcha\":\"xAgV07\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('43', '1487872361649136', '810170512@qq.com', '1', '2017-02-24 01:52:40', '2017-02-24 01:52:40', '2017-02-24 01:55:40', null, '0', '1', 'oGK86A', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487872359991,\"captcha\":\"oGK86A\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('44', '1487872717291930', '810170512@qq.com', '1', '2017-02-24 01:58:36', '2017-02-24 01:58:36', '2017-02-24 02:01:36', null, '1', '1', 'd5NfKw', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1487872715960,\"captcha\":\"d5NfKw\",\"userNumber\":14875975007231277,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('45', '1491647990273599', '810170512@qq.com', '1', '2017-04-08 10:39:48', '2017-04-08 10:39:48', '2017-04-08 10:42:48', null, '1', '0', 'wDv3PE', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491647988476,\"captcha\":\"wDv3PE\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('46', '1491648978701782', '810170512@qq.com', '1', '2017-04-08 18:56:18', '2017-04-08 18:56:18', '2017-04-08 18:59:18', null, '1', '0', 'aSoCTQ', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491648978124,\"captcha\":\"aSoCTQ\",\"userNumber\":149164897706941,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('47', '1491650284203754', '810170512@qq.com', '1', '2017-04-08 19:18:03', '2017-04-08 19:18:03', '2017-04-08 19:21:03', null, '1', '1', 'Ur1dQu', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650282983,\"captcha\":\"Ur1dQu\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('48', '1491650337955742', '810170512@qq.com', '1', '2017-04-08 19:18:57', '2017-04-08 19:18:57', '2017-04-08 19:21:57', null, '1', '1', 'g8vsWi', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650337155,\"captcha\":\"g8vsWi\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('49', '1491650453642741', '810170512@qq.com', '1', '2017-04-08 19:20:53', '2017-04-08 19:20:53', '2017-04-08 19:23:53', null, '1', '1', '8MBurs', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650452974,\"captcha\":\"8MBurs\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('50', '1491650676395336', '810170512@qq.com', '1', '2017-04-08 19:24:35', '2017-04-08 19:24:35', '2017-04-08 19:27:35', null, '1', '1', 'jwggOx', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650675469,\"captcha\":\"jwggOx\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('51', '1491650942874317', '810170512@qq.com', '1', '2017-04-08 19:29:02', '2017-04-08 19:29:02', '2017-04-08 19:32:02', null, '1', '1', '4JnujD', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491650942232,\"captcha\":\"4JnujD\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('52', '1491651220510927', '810170512@qq.com', '1', '2017-04-08 19:33:39', '2017-04-08 19:33:39', '2017-04-08 19:36:39', null, '1', '0', 'xp7Fjc', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491651219234,\"captcha\":\"xp7Fjc\",\"userNumber\":149165121788087,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('53', '1491651440462718', '810170512@qq.com', '1', '2017-04-08 19:37:19', '2017-04-08 19:37:19', '2017-04-08 19:40:19', null, '1', '1', 'cMRBnf', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491651439395,\"captcha\":\"cMRBnf\",\"userNumber\":149165143828831,\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('54', '1491651593536722', '810170512@qq.com', '1', '2017-04-08 11:39:52', '2017-04-08 11:39:52', '2017-04-08 11:42:52', null, '1', '1', 'B6Uh34', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491651592428,\"captcha\":\"B6Uh34\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('55', '1491654257199640', '810170512@qq.com', '1', '2017-04-08 12:24:15', '2017-04-08 12:24:15', '2017-04-08 12:27:15', null, '0', '1', 'G0bF8l', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491654255022,\"captcha\":\"G0bF8l\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('56', '1491654607426876', '810170512@qq.com', '1', '2017-04-08 12:30:04', '2017-04-08 12:30:04', '2017-04-08 12:33:04', null, '0', '1', 'uWx8di', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1491654604262,\"captcha\":\"uWx8di\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');
INSERT INTO `os_email` VALUES ('57', '1492502674486770', '810170512@qq.com', '1', '2017-04-18 08:04:33', '2017-04-18 08:04:33', '2017-04-18 08:07:33', null, '0', '1', 'sJyo8K', '『但行好事·莫问前程』很高兴遇见您!', '{\"createTime\":1492502672892,\"captcha\":\"sJyo8K\",\"userNumber\":\"陈星星\",\"email\":\"810170512@qq.com\"}');

-- ----------------------------
-- Table structure for os_favorite
-- ----------------------------
DROP TABLE IF EXISTS `os_favorite`;
CREATE TABLE `os_favorite` (
  `favorite_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏表ID',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `product_id` bigint(20) unsigned DEFAULT NULL COMMENT '商品ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `show_price` decimal(10,2) DEFAULT NULL COMMENT '显示价格',
  `status` tinyint(2) DEFAULT '1' COMMENT '商品状态：1,上架；2,下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

-- ----------------------------
-- Records of os_favorite
-- ----------------------------
INSERT INTO `os_favorite` VALUES ('10', '1', '4', '1472581245880', '魅蓝 Note5', 'images/goods/20170226/1471798388806.jpg', '1099.00', '1', '2017-03-29 18:19:16', '1');

-- ----------------------------
-- Table structure for os_kind
-- ----------------------------
DROP TABLE IF EXISTS `os_kind`;
CREATE TABLE `os_kind` (
  `kind_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `specification_id` bigint(20) DEFAULT NULL COMMENT '规格ID',
  `name` varchar(64) DEFAULT NULL COMMENT '类型名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 0=隐藏/1=显示',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`kind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品类型表';

-- ----------------------------
-- Records of os_kind
-- ----------------------------
INSERT INTO `os_kind` VALUES ('1', '1', '1', '颜色', '1', '2', '2017-03-05 17:04:45', '猫宁', '2017-03-05 17:04:50', '猫宁');
INSERT INTO `os_kind` VALUES ('2', '1', '2', '内存容量', '1', '1', '2017-03-05 17:07:17', '猫宁', '2017-03-05 17:07:22', '猫宁');

-- ----------------------------
-- Table structure for os_kind_attribute
-- ----------------------------
DROP TABLE IF EXISTS `os_kind_attribute`;
CREATE TABLE `os_kind_attribute` (
  `kind_attr_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格属性ID',
  `kind_id` bigint(20) unsigned DEFAULT NULL COMMENT '规格ID',
  `spec_attr_id` bigint(20) unsigned DEFAULT NULL COMMENT '规格属性ID',
  `name` varchar(64) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 0=隐藏/1=显示',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`kind_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='类型属性表';

-- ----------------------------
-- Records of os_kind_attribute
-- ----------------------------
INSERT INTO `os_kind_attribute` VALUES ('1', '1', '1', '白色', '1', '1', '猫宁', '2017-03-05 17:29:13');
INSERT INTO `os_kind_attribute` VALUES ('2', '1', '2', '金色', '1', '2', '猫宁', '2017-03-05 17:29:15');
INSERT INTO `os_kind_attribute` VALUES ('3', '2', '3', '16G', '1', '1', '猫宁', '2017-03-05 17:29:17');
INSERT INTO `os_kind_attribute` VALUES ('4', '2', '4', '32G', '1', '2', '猫宁', '2017-03-05 17:29:21');
INSERT INTO `os_kind_attribute` VALUES ('5', '2', '5', '64G', '1', '3', '猫宁', '2017-02-25 21:44:43');

-- ----------------------------
-- Table structure for os_label
-- ----------------------------
DROP TABLE IF EXISTS `os_label`;
CREATE TABLE `os_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `label_name` varchar(20) DEFAULT NULL COMMENT '标签名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `sort` int(9) DEFAULT NULL COMMENT '权限排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品标签表';

-- ----------------------------
-- Records of os_label
-- ----------------------------
INSERT INTO `os_label` VALUES ('1', '热销', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);
INSERT INTO `os_label` VALUES ('2', '新品', '1', '2', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);
INSERT INTO `os_label` VALUES ('3', '现货', '1', '3', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);
INSERT INTO `os_label` VALUES ('4', '有赠品', '1', '4', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', null);

-- ----------------------------
-- Table structure for os_navigation
-- ----------------------------
DROP TABLE IF EXISTS `os_navigation`;
CREATE TABLE `os_navigation` (
  `navigation_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `code` varchar(64) DEFAULT NULL COMMENT '代码简称',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1=显示/0=隐藏',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `show_number` int(11) DEFAULT NULL COMMENT '显示数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of os_navigation
-- ----------------------------
INSERT INTO `os_navigation` VALUES ('1', 'indexTop', '首页-顶部', '1', '10', '10', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '首页-顶部');
INSERT INTO `os_navigation` VALUES ('2', 'indexAdvertLeft', '首页-广告栏-左部', '1', '6', '6', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', '首页-广告栏-左部');
INSERT INTO `os_navigation` VALUES ('3', 'indexBottom', '首页-底部', '1', '10', '10', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', '首页-底部');
INSERT INTO `os_navigation` VALUES ('4', 'loginTop', '登录-顶部', '1', '4', '4', '2017-02-23 23:57:23', '猫宁', '2017-04-09 08:46:36', '猫宁', '登录-顶部');
INSERT INTO `os_navigation` VALUES ('5', 'indexClassify', '首页-分类', '1', '8', '8', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '首页-分类');
INSERT INTO `os_navigation` VALUES ('7', 'loginBottom', '登录-底部', '1', '2', '2', '2017-04-08 18:44:59', '猫宁', '2017-04-09 08:39:21', '猫宁', '登录-底部');

-- ----------------------------
-- Table structure for os_navigation_bar
-- ----------------------------
DROP TABLE IF EXISTS `os_navigation_bar`;
CREATE TABLE `os_navigation_bar` (
  `navigation_bar_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航栏ID',
  `navigation_id` bigint(20) unsigned DEFAULT NULL COMMENT '导航ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `target` varchar(64) DEFAULT '_blank' COMMENT '打开方式：_blank；_parent；_self；_top',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1=显示/0=隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`navigation_bar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='导航栏表';

-- ----------------------------
-- Records of os_navigation_bar
-- ----------------------------
INSERT INTO `os_navigation_bar` VALUES ('1', '4', '猫宁商城', '_self', '1', 'http://localhost:8080/morning/index', '0', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('2', '4', '公益频道', '_self', '2', 'http://localhost:8080/gongyi.morning/index', '1', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('3', '4', '猫粉社区', '_self', '3', 'http://localhost:8080/bbs.morning/index', '1', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('4', '4', '猫宁后台管理平台', '_self', '4', 'http://localhost:8080/system.morning/index', '1', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('5', '1', '猫宁商城', '_self', '1', 'http://localhost:8080/morning/index', '1', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('6', '1', '公益频道', '_blank', '2', 'http://localhost:8080/gongyi.morning/index', '1', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('7', '1', '猫粉社区', '_blank', '3', 'http://localhost:8080/bbs.morning/index', '1', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('8', '1', '猫宁后台管理平台', '_blank', '4', 'http://localhost:8080/system.morning/index', '1', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('9', '1', '意见反馈', '_blank', '5', 'http://localhost:8080/morning/feedback', '1', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('10', '1', '关于我们', '_blank', '6', 'http://localhost:8080/morning/about', '1', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('11', '3', '猫宁商城', '_self', '1', 'http://localhost:8080/morning/index', '1', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('12', '3', '公益频道', '_blank', '2', 'http://localhost:8080/gongyi.morning/index', '1', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('13', '3', '猫粉社区', '_blank', '3', 'http://localhost:8080/bbs.morning/index', '1', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('14', '3', '猫宁后台管理平台', '_blank', '4', 'http://localhost:8080/system.morning/index', '1', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('15', '3', '意见反馈', '_blank', '5', 'http://localhost:8080/morning/feedback', '1', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('16', '3', '关于我们', '_blank', '6', 'http://localhost:8080/morning/about', '1', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('17', '2', '深圳壹基金公益基金会', '_blank', '1', 'http://www.onefoundation.cn/', '1', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('18', '2', '腾讯公益', '_blank', '2', 'http://gongyi.qq.com/', '1', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('19', '2', '中国青年志愿者网', '_blank', '3', 'http://www.zgzyz.org.cn/', '1', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('20', '2', '向日葵公益', '_blank', '4', 'http://www.sunflowerangel.org/', '1', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('21', '2', '中华爱心基金会', '_blank', '5', 'http://www.ckf.org.cn/', '1', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('22', '2', '网易公益', '_blank', '6', 'http://gongyi.163.com/', '1', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('23', '5', '平板 · 笔记本', '_blank', '1', 'http://localhost:8080/morning/list?categoryId=4', '1', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('24', '5', '耳机 · 音响', '_blank', '2', 'http://localhost:8080/morning/list?categoryId=7', '1', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('25', '5', '智能硬件', '_blank', '3', 'http://localhost:8080/morning/list?categoryId=3', '1', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('27', '5', '生活周边', '_blank', '4', 'http://localhost:8080/morning/list?categoryId=9', '1', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('28', '5', '周边配件', '_blank', '5', 'http://localhost:8080/morning/list?categoryId=6', '1', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('29', '5', '公益频道', '_blank', '6', 'http://localhost:8080/gongyi.morning/index', '1', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('30', '5', '猫宁后台管理平台', '_blank', '7', 'http://localhost:8080/system.morning/index', '0', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('31', '7', '周边配件', '_blank', '5', 'http://localhost:8080/morning/list?categoryId=6', '1', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('33', '1', '一点点慈善', '_blank', '7', 'www.baidu', '1', '2017-04-09 08:08:40', '猫宁', null, null, '一点点慈善');
INSERT INTO `os_navigation_bar` VALUES ('34', '7', '一点点', '_blank', '3', 'www.baidu.com', '0', '2017-04-09 08:10:00', '猫宁', '2017-04-09 08:23:43', '猫宁', '百度一点点此项政策');

-- ----------------------------
-- Table structure for os_order
-- ----------------------------
DROP TABLE IF EXISTS `os_order`;
CREATE TABLE `os_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` bigint(20) DEFAULT NULL COMMENT '订单编号,系统生成',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `pay_type` tinyint(2) DEFAULT '1' COMMENT '支付方式 0=线下支付，1=在线支付',
  `shipment_time` tinyint(2) DEFAULT NULL COMMENT '配送时间 1=不限送货时间，2=工作日送货，3=双休日、假日送货',
  `shipment_type` tinyint(2) DEFAULT '0' COMMENT '配送方式 0=快递配送（免运费），1=快递配送（运费）',
  `shipment_amount` decimal(10,0) DEFAULT '0' COMMENT '快递费',
  `invoice_type` tinyint(2) DEFAULT NULL COMMENT '支付方式 1=不开发票，2=电子发票，3=普通发票',
  `invoice_title` varchar(64) DEFAULT NULL COMMENT '发票抬头',
  `order_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_amount` decimal(10,0) DEFAULT '0' COMMENT '订单金额',
  `order_score` int(11) DEFAULT '0' COMMENT '订单积分',
  `pay_amount` decimal(10,0) DEFAULT NULL COMMENT '支付金额 = 订单金额 + 快递费',
  `buy_number` int(11) DEFAULT NULL COMMENT '商品总数量',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of os_order
-- ----------------------------
INSERT INTO `os_order` VALUES ('1', '14907102171468493', '1', '1', '1', '1', '0', '1', null, '1', '2017-03-28 22:10:17', '2017-03-28 22:10:17', '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('2', '14907103498114457', '1', '1', '1', '1', '0', '1', null, '3', '2017-03-28 22:12:30', '2017-03-28 22:12:30', '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('3', '14907105253442098', '1', '1', '1', '1', '0', '1', null, '6', '2017-03-28 22:15:25', '2017-03-28 22:15:25', '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('4', '14907114706600918', '1', '1', '1', '1', '0', '1', null, '12', '2017-03-28 22:31:11', '2017-03-28 22:31:11', '24985', '25000', '24985', '15');
INSERT INTO `os_order` VALUES ('5', '14944359894082287', '1', '1', '1', '1', '0', '1', null, '1', '2017-05-10 17:06:29', '2017-05-10 17:06:29', '14591', '14600', '14591', '9');
INSERT INTO `os_order` VALUES ('6', '14944360987092400', '1', '1', '1', '1', '0', '1', null, '1', '2017-05-10 17:08:19', '2017-05-10 17:08:19', '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('7', '14944361196869580', '1', '1', '1', '1', '0', '1', null, '12', '2017-05-10 17:08:40', '2017-05-10 18:46:41', '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('8', '14944369120266217', '1', '1', '1', '1', '0', '1', null, '12', '2017-05-10 17:21:52', '2017-05-10 18:44:56', '3198', '3200', '3198', '2');
INSERT INTO `os_order` VALUES ('9', '14944376560186831', '1', '1', '1', '1', '0', '1', null, '12', '2017-05-10 17:34:16', '2017-05-10 18:44:06', '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('10', '14944390772967434', '1', '1', '1', '1', '0', '1', null, '1', '2017-05-10 17:57:57', '2017-05-10 17:57:57', '9843', '9848', '9843', '7');
INSERT INTO `os_order` VALUES ('11', '14944392556221620', '1', '1', '1', '1', '0', '1', null, '12', '2017-05-10 18:00:56', '2017-05-10 18:42:11', '1599', '1600', '1599', '1');
INSERT INTO `os_order` VALUES ('12', '14944739317304562', '1', '1', '3', '1', '0', '2', '陈星星', '1', '2017-05-11 03:38:52', '2017-05-11 05:53:17', '1828', '1829', '1828', '2');
INSERT INTO `os_order` VALUES ('13', '14944841433444157', '1', '1', '1', '1', '0', '1', null, '12', '2017-05-11 06:29:03', '2017-05-11 07:13:51', '5270', '5273', '5270', '5');

-- ----------------------------
-- Table structure for os_order_product
-- ----------------------------
DROP TABLE IF EXISTS `os_order_product`;
CREATE TABLE `os_order_product` (
  `order_product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单商品ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `product_spec_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品规格编号',
  `product_spec_name` varchar(64) DEFAULT NULL COMMENT '商品规格名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `buy_number` int(11) DEFAULT NULL COMMENT '商品总数量',
  `product_score` int(11) DEFAULT NULL COMMENT '商品总积分',
  `product_amount` decimal(10,0) DEFAULT NULL COMMENT '商品总金额',
  `comment_status` tinyint(2) DEFAULT '0' COMMENT '评论状态 0=未评论，1=已评论',
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of os_order_product
-- ----------------------------
INSERT INTO `os_order_product` VALUES ('1', '1', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0');
INSERT INTO `os_order_product` VALUES ('2', '1', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0');
INSERT INTO `os_order_product` VALUES ('3', '1', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207484', '金色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('4', '2', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0');
INSERT INTO `os_order_product` VALUES ('5', '2', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0');
INSERT INTO `os_order_product` VALUES ('6', '2', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207484', '金色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('7', '3', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0');
INSERT INTO `os_order_product` VALUES ('8', '3', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0');
INSERT INTO `os_order_product` VALUES ('9', '3', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207484', '金色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('10', '4', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '9', '14400', '14391', '0');
INSERT INTO `os_order_product` VALUES ('11', '4', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '5', '9000', '8995', '0');
INSERT INTO `os_order_product` VALUES ('12', '5', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '8', '12800', '12792', '0');
INSERT INTO `os_order_product` VALUES ('13', '5', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207483', '白色 64G ', '1799.00', '1800', '1', '1800', '1799', '0');
INSERT INTO `os_order_product` VALUES ('14', '6', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('15', '7', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('16', '8', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '2', '3200', '3198', '0');
INSERT INTO `os_order_product` VALUES ('17', '9', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('18', '10', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '2', '3200', '3198', '0');
INSERT INTO `os_order_product` VALUES ('19', '10', '1472581245880', '小米MIX', 'images/goods/20170226/1471798364441.jpg', '14725812458801', ' ', '1799.00', '1800', '3', '5400', '5397', '0');
INSERT INTO `os_order_product` VALUES ('20', '10', '1472581300305', '魅蓝 Note5', 'images/goods/20170226/1471798388806.jpg', '1472581300305', ' ', '1099.00', '1099', '1', '1099', '1099', '0');
INSERT INTO `os_order_product` VALUES ('21', '10', '1472583774201', '小米手环 2', 'images/goods/20170226/1471798568000.jpg', '1472583774201', ' ', '149.00', '149', '1', '149', '149', '0');
INSERT INTO `os_order_product` VALUES ('22', '11', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('23', '12', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '1', '1600', '1599', '0');
INSERT INTO `os_order_product` VALUES ('24', '12', '1472583831117', '魅族手环', 'images/goods/20170226/1471798587971.jpg', '1472583831117', ' ', '229.00', '229', '1', '229', '229', '0');
INSERT INTO `os_order_product` VALUES ('25', '13', '1472581220748', '小米手机5', 'images/goods/20170226/1471798318820.png', '14725812207481', '白色 16G ', '1599.00', '1600', '2', '3200', '3198', '0');
INSERT INTO `os_order_product` VALUES ('26', '13', '1472581245880', '小米MIX', 'images/goods/20170226/1471798364441.jpg', '14725812458801', ' ', '1799.00', '1800', '1', '1800', '1799', '0');
INSERT INTO `os_order_product` VALUES ('27', '13', '1472583774201', '小米手环 2', 'images/goods/20170226/1471798568000.jpg', '1472583774201', ' ', '149.00', '149', '1', '149', '149', '0');
INSERT INTO `os_order_product` VALUES ('28', '13', '1475353918562', '测试商品名称4', 'images/goods/20170226/1471797894441.jpg', '1475353918562', ' ', '124.00', '124', '1', '124', '124', '0');

-- ----------------------------
-- Table structure for os_order_shipment
-- ----------------------------
DROP TABLE IF EXISTS `os_order_shipment`;
CREATE TABLE `os_order_shipment` (
  `order_shipment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '配送ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `user_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `user_phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `province_id` int(10) unsigned DEFAULT NULL COMMENT '省份ID',
  `province_name` varchar(64) DEFAULT NULL COMMENT '省份名字',
  `city_id` int(10) unsigned DEFAULT NULL COMMENT '城市ID',
  `city_name` varchar(64) DEFAULT NULL COMMENT '城市名字',
  `district_id` int(10) unsigned DEFAULT NULL COMMENT '区域ID',
  `district_name` varchar(64) DEFAULT NULL COMMENT '区域名字',
  `user_adress` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user_zipcode` int(6) DEFAULT NULL COMMENT '邮政编码',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_shipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='订单配送表';

-- ----------------------------
-- Records of os_order_shipment
-- ----------------------------
INSERT INTO `os_order_shipment` VALUES ('1', '1', '陈星星', '18857105127', '1036', '黑龙江省', '1095', '黑河市', '1098', '五大连池市', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('2', '2', '陈星星', '18857105127', '1036', '黑龙江省', '1095', '黑河市', '1098', '五大连池市', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('3', '3', '陈星星', '18857105127', '1036', '黑龙江省', '1095', '黑河市', '1098', '五大连池市', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('4', '4', '陈星星', '18857105127', '1036', '黑龙江省', '1095', '黑河市', '1098', '五大连池市', '发烧发到斯蒂芬斯蒂芬', '123456', null);
INSERT INTO `os_order_shipment` VALUES ('5', '5', '陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');
INSERT INTO `os_order_shipment` VALUES ('6', '6', '陈星星', '18857105127', '1', '北京市', '2', '北京市', '3', '东城区', '大撒旦3d大苏打', '321231', null);
INSERT INTO `os_order_shipment` VALUES ('7', '7', '陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');
INSERT INTO `os_order_shipment` VALUES ('8', '8', '陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');
INSERT INTO `os_order_shipment` VALUES ('9', '9', '陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');
INSERT INTO `os_order_shipment` VALUES ('10', '10', '陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');
INSERT INTO `os_order_shipment` VALUES ('11', '11', '陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');
INSERT INTO `os_order_shipment` VALUES ('12', '12', '陈星星陈星星', '18857105127', '1371', '浙江省', '1372', '杭州市', '1379', '余杭区', '海曙路58号', '123456', '2017-03-16 18:48:18');
INSERT INTO `os_order_shipment` VALUES ('13', '13', '陈星星', '18857105127', '1', '北京市', '2', '北京市', '3', '东城区', '大撒旦3d大苏打', '321231', null);

-- ----------------------------
-- Table structure for os_order_status
-- ----------------------------
DROP TABLE IF EXISTS `os_order_status`;
CREATE TABLE `os_order_status` (
  `order_status_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单状态ID',
  `order_id` bigint(20) unsigned DEFAULT NULL COMMENT '订单ID',
  `order_status` tinyint(2) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_status` tinyint(2) DEFAULT NULL COMMENT '操作类型 0=会员，1=后台管理人员，2=异常通知',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='订单状态表';

-- ----------------------------
-- Records of os_order_status
-- ----------------------------
INSERT INTO `os_order_status` VALUES ('1', '1', '1', '2017-03-28 22:10:17', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('2', '2', '1', '2017-03-28 22:12:30', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('3', '3', '1', '2017-03-28 22:15:25', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('4', '4', '1', '2017-03-28 22:31:11', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('5', '4', '2', '2017-04-06 14:06:16', '1', '0', '付款');
INSERT INTO `os_order_status` VALUES ('6', '4', '3', '2017-04-13 14:06:48', '1', '0', null);
INSERT INTO `os_order_status` VALUES ('7', '4', '4', '2017-04-15 14:06:54', '1', '0', null);
INSERT INTO `os_order_status` VALUES ('8', '4', '5', '2017-05-03 14:07:04', '1', '0', null);
INSERT INTO `os_order_status` VALUES ('9', '4', '6', '2017-05-10 14:07:09', '1', '0', null);
INSERT INTO `os_order_status` VALUES ('15', '5', '1', '2017-05-10 17:06:29', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('16', '6', '1', '2017-05-10 17:08:19', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('17', '7', '1', '2017-05-10 17:08:40', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('18', '8', '1', '2017-05-10 17:21:52', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('19', '9', '1', '2017-05-10 17:34:16', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('20', '10', '1', '2017-05-10 17:57:57', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('21', '11', '1', '2017-05-10 18:00:56', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('22', '11', '12', '2017-05-10 18:42:11', '1', '0', '手动取消订单');
INSERT INTO `os_order_status` VALUES ('23', '9', '12', '2017-05-10 18:44:06', '1', '0', '手动取消订单');
INSERT INTO `os_order_status` VALUES ('24', '8', '12', '2017-05-10 18:44:56', '1', '0', '手动取消订单');
INSERT INTO `os_order_status` VALUES ('25', '7', '12', '2017-05-10 18:46:41', '1', '0', '手动取消订单');
INSERT INTO `os_order_status` VALUES ('26', '12', '1', '2017-05-11 03:38:52', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('27', '13', '1', '2017-05-11 06:29:03', '1', '0', '订单提交');
INSERT INTO `os_order_status` VALUES ('28', '13', '12', '2017-05-11 07:13:51', '1', '0', '手动取消订单');

-- ----------------------------
-- Table structure for os_product
-- ----------------------------
DROP TABLE IF EXISTS `os_product`;
CREATE TABLE `os_product` (
  `product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `label_id` int(10) DEFAULT NULL COMMENT '标签ID',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `show_score` int(11) DEFAULT NULL COMMENT '显示积分',
  `show_price` decimal(10,2) DEFAULT NULL COMMENT '显示价格',
  `introduce` varchar(64) DEFAULT NULL COMMENT '商品简介',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `show_in_top` tinyint(2) DEFAULT '0' COMMENT '是否置顶 1=置顶/0=默认',
  `show_in_nav` tinyint(2) DEFAULT '0' COMMENT '是否导航栏 1=显示/0=隐藏',
  `show_in_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门 1=热门/0=默认',
  `show_in_shelve` tinyint(2) DEFAULT '0' COMMENT '是否上架：1=上架/0=下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `shelve_time` datetime DEFAULT NULL COMMENT '上架时间',
  `shelve_by` varchar(64) DEFAULT NULL COMMENT '上架人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `search_key` varchar(255) DEFAULT NULL COMMENT '搜索关键词',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(255) DEFAULT NULL COMMENT '页面描述',
  `page_keyword` varchar(64) DEFAULT NULL COMMENT '页面关键词',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of os_product
-- ----------------------------
INSERT INTO `os_product` VALUES ('1', '1472581220748', '1', '小米手机5', '2299', '2299.00', '支持手机分身，能刷公交卡、银行卡', 'images/goods/20170226/1471798318820.png', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '小米5,小米手机5,小米5手机,小米 5', '小米手机5', '小米手机5 十余项黑科技，很轻狠快。骁龙820处理器，最大可选4GB内存+128GB闪存，4轴防抖相机，3D陶瓷/玻璃机身。', '小米5,小米手机5,小米5手机,小米 5,猫宁商城', null);
INSERT INTO `os_product` VALUES ('2', '1472581245880', '2', '小米MIX', '3499', '3499.00', '全面屏概念手机', 'images/goods/20170226/1471798364441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '小米MIX,小米手机,超大屏', '小米MIX', '小米MIX 全面屏概念手机，开创性的在6.4寸超大屏幕上，做到了惊人的91.3%。当你点亮屏幕的一瞬间，200多万颗像素的色彩，开满了整个屏幕。', '小米MIX,猫宁商城', null);
INSERT INTO `os_product` VALUES ('3', '1472581300305', '2', '魅蓝 Note5', '1099', '1099.00', '快的更漂亮，薄的更持久', 'images/goods/20170226/1471798388806.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '魅蓝 Note5,魅族', '魅蓝 Note5', '魅蓝 Note5，正品行货，另有魅蓝 Note5详细介绍、图片、价格、参数、售前咨询等，购买魅蓝 Note5上魅族商城，全场包邮，7天无理由退货，15天换货保障。', '魅蓝 Note5,魅族,猫宁商城', null);
INSERT INTO `os_product` VALUES ('4', '1472583774201', '3', '小米手环 2', '149', '149.00', '看得见的时刻，和你的每一步', 'images/goods/20170226/1471798568000.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '小米手环2,小米手环2代,手环,智能手环', '小米手环2', '全新的小米手环 2，加入了 OLED 显示屏，通过轻触圆形按键，即可显示当前时间、步数、心率，甚至里程、热量等更多数据。当不方便触控操作时，抬起手腕，手环便可自动显示当前时间，轻松便捷。', '小米手环2,小米手环2代,猫宁商城', null);
INSERT INTO `os_product` VALUES ('5', '1472583831117', null, '魅族手环', '229', '229.00', '腕间流动的心率专家', 'images/goods/20170226/1471798587971.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '魅族手环,魅族,手环,智能手环', '魅族手环', '魅族手环，腕间流动的心率专家，正品行货，另有魅族手环详细介绍、图片、价格、参数、售前咨询等，购买魅族手环上魅族商城，全场包邮，7天无理由退货，15天换货保障。', '魅族手环,魅族,手环,智能手环,猫宁商城', null);
INSERT INTO `os_product` VALUES ('6', '1472628630086', null, 'LED 智能台灯', '169', '169.00', '照明之上，光的艺术品', 'images/goods/20170226/1471798587451.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '小米台灯,小米LED灯,LED小米灯,小米 LED灯', 'LED 智能台灯', '米家LED智能台灯的色温与亮度可以无级调节，几乎可以满足用户对光线的所有需求。还针对最常见的四种使用场景单独做了光线优化，专注保护用户的双眼。', '小米台灯,小米LED灯,LED小米灯,小米 LED灯,猫宁商城', null);
INSERT INTO `os_product` VALUES ('7', '1472736931796', null, 'Yeelight床头灯', '249', '249.00', '触摸式操作 给卧室1600万种颜色', 'images/goods/20170226/1471799887971.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', 'Yeelight床头灯,床头灯,智能灯', 'Yeelight床头灯', '官网正品智能灯推荐，Yeelight床头灯最新价格249元，有多种颜色可选，另有Yeelight床头灯详细介绍及图片，还有用户评价，售前咨询等。', 'Yeelight床头灯,床头灯,智能灯,猫宁商城', null);
INSERT INTO `os_product` VALUES ('8', '1473318741286', null, 'Yeelight LED智能灯泡', '99', '99.00', '亮度自由调节 WIFI远程操作', 'images/goods/20170226/1471798581451.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', 'Yeelight LED智能灯泡 白光版,智能灯泡', 'Yeelight LED智能灯泡', 'Yeelight LED 智能灯泡,亮度自由调节 WIFI远程操作', 'Yeelight LED智能灯泡 白光版,智能灯泡,猫宁商城', null);
INSERT INTO `os_product` VALUES ('9', '1473685327798', null, '测试商品名称1', '166', '166.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称1', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('10', '1474910562755', null, '测试商品名称2', '223', '223.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称2', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('11', '1475353900453', '4', '测试商品名称3', '166', '166.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称3', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('12', '1475353918562', null, '测试商品名称4', '124', '124.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称4', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('13', '1475354006972', null, '测试商品名称5', '249', '249.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称5', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('14', '1475407186147', null, '测试商品名称6', '219', '219.00', '测试描述，测试商品描述，测试商品描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称6', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('15', '1475947762038', '1', '测试商品名称7', '2366', '2366.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称7', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('16', '1475996329018', null, '测试商品名称8', '2499', '2499.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称8', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('17', '1477472951669', null, '测试商品名称9', '2188', '2188.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称9', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('18', '1478099883634', '1', '测试商品名称10', '249', '249.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称10', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('19', '1478522533460', null, '测试商品名称11', '1300', '1300.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称11', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('20', '1478527872182', null, '测试商品名称12', '179', '179.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称12', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('21', '1478680540669', null, '测试商品名称13', '6429', '6429.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称13', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('22', '1478682438293', null, '测试商品名称14', '2416', '2416.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称14', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('23', '1478682709405', null, '测试商品名称15', '219', '219.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称15', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('24', '1478682831935', null, '测试商品名称16', '295', '295.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称16', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('25', '1478682893916', null, '测试商品名称17', '2164', '2164.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称17', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('26', '1478683391099', null, '测试商品名称18', '146', '146.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称18', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('27', '1478683407372', null, '测试商品名称19', '26', '26.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称19', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('28', '1478683468241', null, '测试商品名称20', '4974', '4974.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称20', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('29', '1478683468246', null, '测试商品名称21', '265', '265.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称21', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('30', '1478683468279', null, '测试商品名称22', '259', '259.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称22', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('31', '1478689468277', null, '测试商品名称23', '789', '789.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称23', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('32', '1478689468979', null, '测试商品名称24', '456', '456.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称24', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('33', '1478689448279', null, '测试商品名称25', '7845', '7845.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称25', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('34', '1478689468679', null, '测试商品名称26', '1548', '1548.00', '测试描述，测试商品描述', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试搜索，测试商品搜索', '测试商品名称26', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');

-- ----------------------------
-- Table structure for os_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `os_product_attribute`;
CREATE TABLE `os_product_attribute` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `stock` int(11) DEFAULT '0' COMMENT '总库存',
  `sales_volume` int(11) DEFAULT '0' COMMENT '销售量',
  `page_views` int(11) DEFAULT '0' COMMENT '游览量',
  `comment_number` int(11) DEFAULT '0' COMMENT '评论数量',
  `comment_total` int(11) DEFAULT '0' COMMENT '累计评价',
  `comment_average` decimal(10,0) DEFAULT '0' COMMENT '平均评价',
  `favorite_number` int(11) DEFAULT '0' COMMENT '收藏数',
  `question_number` int(11) DEFAULT NULL COMMENT '提问数',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of os_product_attribute
-- ----------------------------
INSERT INTO `os_product_attribute` VALUES ('1', '1', '1', '1', '1', '17', '1', '1', '1', '17');
INSERT INTO `os_product_attribute` VALUES ('2', '2', '2', '2', '2', '2', '2', '1', '2', '2');
INSERT INTO `os_product_attribute` VALUES ('3', '3', '3', '3', '3', '3', '3', '1', '3', '2');
INSERT INTO `os_product_attribute` VALUES ('4', '4', '4', '4', '4', '0', '0', '0', '0', '0');
INSERT INTO `os_product_attribute` VALUES ('5', '5', '5', '5', '5', '5', '5', '1', '5', '5');
INSERT INTO `os_product_attribute` VALUES ('6', '6', '6', '6', '6', '6', '6', '1', '6', '6');
INSERT INTO `os_product_attribute` VALUES ('7', '7', '7', '7', '7', '7', '7', '1', '7', '7');
INSERT INTO `os_product_attribute` VALUES ('8', '8', '8', '8', '8', '8', '8', '1', '8', '8');
INSERT INTO `os_product_attribute` VALUES ('9', '9', '9', '9', '9', '9', '9', '1', '9', '9');
INSERT INTO `os_product_attribute` VALUES ('10', '10', '10', '10', '10', '10', '10', '1', '10', '10');
INSERT INTO `os_product_attribute` VALUES ('11', '11', '11', '11', '11', '11', '11', '1', '11', '11');
INSERT INTO `os_product_attribute` VALUES ('12', '12', '12', '12', '12', '12', '12', '1', '12', '12');
INSERT INTO `os_product_attribute` VALUES ('13', '13', '13', '13', '13', '13', '13', '1', '13', '13');
INSERT INTO `os_product_attribute` VALUES ('14', '14', '14', '14', '14', '14', '14', '1', '14', '14');
INSERT INTO `os_product_attribute` VALUES ('15', '15', '15', '15', '15', '15', '15', '1', '15', '15');
INSERT INTO `os_product_attribute` VALUES ('16', '16', '16', '16', '16', '16', '16', '1', '16', '16');
INSERT INTO `os_product_attribute` VALUES ('17', '17', '17', '17', '17', '17', '17', '1', '17', '17');
INSERT INTO `os_product_attribute` VALUES ('18', '18', '18', '18', '18', '18', '18', '1', '18', '18');
INSERT INTO `os_product_attribute` VALUES ('19', '19', '19', '19', '19', '19', '19', '1', '19', '19');
INSERT INTO `os_product_attribute` VALUES ('20', '20', '20', '20', '20', '20', '20', '1', '20', '20');
INSERT INTO `os_product_attribute` VALUES ('21', '21', '21', '21', '21', '21', '21', '1', '21', '21');
INSERT INTO `os_product_attribute` VALUES ('22', '22', '22', '22', '22', '22', '22', '1', '22', '22');
INSERT INTO `os_product_attribute` VALUES ('23', '23', '23', '23', '23', '23', '23', '1', '23', '23');
INSERT INTO `os_product_attribute` VALUES ('24', '24', '24', '24', '24', '24', '24', '1', '24', '24');
INSERT INTO `os_product_attribute` VALUES ('25', '25', '25', '25', '25', '25', '25', '1', '25', '25');
INSERT INTO `os_product_attribute` VALUES ('26', '26', '26', '26', '26', '26', '26', '1', '26', '26');
INSERT INTO `os_product_attribute` VALUES ('27', '27', '27', '27', '27', '27', '27', '1', '27', '27');
INSERT INTO `os_product_attribute` VALUES ('28', '28', '28', '28', '28', '28', '28', '1', '28', '28');
INSERT INTO `os_product_attribute` VALUES ('29', '29', '29', '29', '29', '29', '29', '1', '29', '29');
INSERT INTO `os_product_attribute` VALUES ('30', '30', '30', '30', '30', '30', '30', '1', '30', '30');
INSERT INTO `os_product_attribute` VALUES ('31', '31', '31', '31', '31', '31', '31', '1', '31', '31');
INSERT INTO `os_product_attribute` VALUES ('32', '32', '32', '32', '32', '32', '32', '32', '32', '32');
INSERT INTO `os_product_attribute` VALUES ('33', '33', '33', '33', '33', '33', '33', '33', '33', '33');
INSERT INTO `os_product_attribute` VALUES ('34', '34', '34', '34', '34', '34', '34', '34', '34', '34');

-- ----------------------------
-- Table structure for os_product_category
-- ----------------------------
DROP TABLE IF EXISTS `os_product_category`;
CREATE TABLE `os_product_category` (
  `product_category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='商品分类关联表';

-- ----------------------------
-- Records of os_product_category
-- ----------------------------
INSERT INTO `os_product_category` VALUES ('1', '1', '2', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('2', '2', '2', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('3', '3', '12', '2017-02-27 01:51:36', '猫宁');
INSERT INTO `os_product_category` VALUES ('4', '4', '10', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('5', '5', '10', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('6', '6', '11', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('7', '7', '11', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('8', '8', '11', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('9', '9', '12', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('10', '10', '13', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('11', '11', '13', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('12', '12', '15', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('13', '13', '15', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('14', '14', '16', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('15', '15', '13', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('16', '16', '18', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('17', '17', '19', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('18', '18', '20', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('19', '19', '21', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('20', '20', '22', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('21', '21', '23', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('22', '22', '24', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('23', '23', '25', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('24', '24', '26', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('25', '25', '26', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('26', '26', '28', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('27', '27', '29', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('28', '28', '30', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('29', '29', '30', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('30', '30', '30', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('31', '31', '31', '2017-02-26 13:52:17', '猫宁');

-- ----------------------------
-- Table structure for os_product_detail
-- ----------------------------
DROP TABLE IF EXISTS `os_product_detail`;
CREATE TABLE `os_product_detail` (
  `product_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品描述ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `description` text COMMENT '商品描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`product_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of os_product_detail
-- ----------------------------
INSERT INTO `os_product_detail` VALUES ('1', '1', '<p><img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_01.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_01.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_03.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_03.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_05.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_05.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_07.jpg\" src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_07.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_09.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_11.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_13.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_15.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_17.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_19.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_21.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_23.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_25.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_27.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_29.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_31.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_33.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_35.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_37.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_39.jpg\"> <img alt=\"\" data-src=\"//c1.mifile.cn/f/i/g/2015/cn-index/U1xingzhen_41.jpg\"></p>', '2017-04-14 02:16:57', '猫腻个', '2017-04-14 02:17:05', '猫宁');

-- ----------------------------
-- Table structure for os_product_image
-- ----------------------------
DROP TABLE IF EXISTS `os_product_image`;
CREATE TABLE `os_product_image` (
  `pic_img_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sort` tinyint(2) DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`pic_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of os_product_image
-- ----------------------------
INSERT INTO `os_product_image` VALUES ('1', '1', 'images/goods/20170304/1471797894441.jpg', '1', '1', '2017-03-04 18:30:12', '猫宁');
INSERT INTO `os_product_image` VALUES ('2', '1', 'images/goods/20170304/1471798318820.jpg', '2', '1', '2017-03-04 18:30:12', '猫宁');
INSERT INTO `os_product_image` VALUES ('3', '1', 'images/goods/20170304/1471798364441.jpg', '3', '1', '2017-03-04 18:30:12', '猫宁');
INSERT INTO `os_product_image` VALUES ('4', '1', 'images/goods/20170304/1471798581451.png', '4', '1', '2017-03-04 18:30:12', '猫宁');
INSERT INTO `os_product_image` VALUES ('5', '1', 'images/goods/20170304/14717983642141.jpg', '5', '1', '2017-03-04 18:30:12', '猫宁');
INSERT INTO `os_product_image` VALUES ('6', '1', 'images/goods/20170304/14717983642141.jpg', '6', '1', '2017-03-04 18:30:12', '猫宁');

-- ----------------------------
-- Table structure for os_product_parameter
-- ----------------------------
DROP TABLE IF EXISTS `os_product_parameter`;
CREATE TABLE `os_product_parameter` (
  `product_parameter_id` bigint(20) NOT NULL COMMENT '参数ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `name` varchar(64) DEFAULT NULL COMMENT '参数名',
  `value` varchar(64) DEFAULT NULL COMMENT '参数值',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态：1.显示；0.隐藏',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`product_parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品参数表';

-- ----------------------------
-- Records of os_product_parameter
-- ----------------------------
INSERT INTO `os_product_parameter` VALUES ('1', '1', '处理器', '骁龙820', '1', '1', '2017-03-04 18:55:19', '猫宁', '2017-03-04 18:55:29', '猫宁');
INSERT INTO `os_product_parameter` VALUES ('2', '1', '电池容量', '3000mAh', '1', '2', '2017-03-04 18:55:19', '猫宁', '2017-03-04 18:55:29', '猫宁');
INSERT INTO `os_product_parameter` VALUES ('3', '1', '主屏尺寸', '5.15英寸', '1', '3', '2017-03-04 18:55:19', '猫宁', '2017-03-04 18:55:29', '猫宁');
INSERT INTO `os_product_parameter` VALUES ('4', '1', '主屏分辨率', '1920x1080像素', '1', '4', '2017-03-04 18:55:19', '猫宁', '2017-03-04 18:55:29', '猫宁');
INSERT INTO `os_product_parameter` VALUES ('5', '1', '后置摄像头', '1600万像素', '1', '5', '2017-03-04 18:55:19', '猫宁', '2017-03-04 18:55:29', '猫宁');
INSERT INTO `os_product_parameter` VALUES ('6', '1', '前置摄像头', '400万像素', '1', '6', '2017-03-04 18:55:19', '猫宁', '2017-03-04 18:55:29', '猫宁');
INSERT INTO `os_product_parameter` VALUES ('7', '1', '内存', '3GB', '1', '7', '2017-03-04 18:55:19', '猫宁', '2017-03-04 18:55:29', '猫宁');

-- ----------------------------
-- Table structure for os_product_recommend
-- ----------------------------
DROP TABLE IF EXISTS `os_product_recommend`;
CREATE TABLE `os_product_recommend` (
  `recommend_product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品推荐ID',
  `recommend_id` bigint(20) unsigned DEFAULT NULL COMMENT '推荐位ID',
  `product_id` bigint(20) unsigned DEFAULT NULL COMMENT '商品ID',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 1=显示/0=隐藏',
  `begin_time` datetime DEFAULT NULL COMMENT '推荐起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '推荐结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`recommend_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='商品推荐表';

-- ----------------------------
-- Records of os_product_recommend
-- ----------------------------
INSERT INTO `os_product_recommend` VALUES ('1', '1', '1', '1', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('2', '1', '2', '2', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('3', '1', '3', '3', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('4', '1', '4', '4', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('5', '1', '5', '5', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('6', '1', '6', '6', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('7', '1', '7', '7', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('8', '1', '8', '8', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('9', '1', '9', '9', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('10', '1', '10', '10', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('11', '2', '11', '1', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('12', '2', '12', '2', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('13', '2', '13', '3', '1', '2017-04-04 15:23:50', '2017-04-30 15:23:53', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('14', '2', '14', '4', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('15', '2', '15', '5', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('16', '2', '16', '6', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('17', '2', '17', '7', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('18', '2', '18', '8', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('19', '2', '19', '9', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('20', '2', '20', '10', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('21', '3', '21', '1', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('22', '3', '22', '2', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('23', '3', '23', '3', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('24', '3', '24', '4', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('25', '4', '7', '1', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('26', '4', '8', '2', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('27', '4', '9', '3', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('28', '4', '10', '4', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('29', '4', '11', '5', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('30', '4', '12', '6', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('31', '4', '13', '7', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('32', '4', '14', '8', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('33', '4', '15', '9', '1', '2017-04-04 15:23:50', '2017-06-30 14:39:50', '2017-04-11 15:24:52', '猫宁', '2017-04-11 15:25:02', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('34', '4', '16', '10', '1', '2017-04-04 15:23:50', '2017-04-30 15:23:53', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');
INSERT INTO `os_product_recommend` VALUES ('35', '4', '17', '10', '1', '2017-04-04 15:23:50', '2017-04-30 15:23:53', '2017-04-11 15:23:56', '猫宁', '2017-04-11 15:24:03', '猫宁');

-- ----------------------------
-- Table structure for os_product_specification
-- ----------------------------
DROP TABLE IF EXISTS `os_product_specification`;
CREATE TABLE `os_product_specification` (
  `product_spec_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品规格ID',
  `product_spec_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品规格编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `spec` varchar(64) DEFAULT NULL COMMENT '规格：规格ID，以“,”相隔',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `sales_volume` int(11) DEFAULT '0' COMMENT '销售量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `default_status` tinyint(2) DEFAULT '0' COMMENT '是否默认状态：0,不默认；1,默认',
  `status` tinyint(2) DEFAULT '0' COMMENT '商品状态：0,新增；1,上架；2,下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`product_spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of os_product_specification
-- ----------------------------
INSERT INTO `os_product_specification` VALUES ('1', '14725812207481', '1', '1,3', '30', '10', '1599.00', '1600', '1', '1', '2017-03-05 21:51:01', '猫宁', '2017-03-05 21:51:25', '猫宁');
INSERT INTO `os_product_specification` VALUES ('2', '14725812207482', '1', '1,4', '80', '20', '1699.00', '1700', '0', '1', '2017-03-05 21:51:01', '猫宁', '2017-03-05 21:51:25', '猫宁');
INSERT INTO `os_product_specification` VALUES ('3', '14725812207483', '1', '1,5', '100', '30', '1799.00', '1800', '0', '1', '2017-03-05 21:51:01', '猫宁', '2017-03-05 21:51:25', '猫宁');
INSERT INTO `os_product_specification` VALUES ('4', '14725812207484', '1', '2,3', '45', '45', '1599.00', '1600', '0', '1', '2017-03-05 21:51:01', '猫宁', '2017-03-05 21:51:25', '猫宁');
INSERT INTO `os_product_specification` VALUES ('5', '14725812207485', '1', '2,4', '12', '45', '1699.00', '1700', '0', '1', '2017-03-05 21:51:01', '猫宁', '2017-03-05 21:51:25', '猫宁');
INSERT INTO `os_product_specification` VALUES ('6', '14725812207486', '1', '2,5', '72', '75', '1799.00', '1800', '0', '0', '2017-03-05 21:51:01', '猫宁', '2017-03-05 21:51:25', '猫宁');
INSERT INTO `os_product_specification` VALUES ('7', '14725812458801', '2', '', '72', '75', '1799.00', '1800', '1', '1', '2017-03-05 21:51:01', '猫宁', '2017-03-05 21:51:25', '猫宁');
INSERT INTO `os_product_specification` VALUES ('8', '1472581300305', '3', null, '3', '3', '1099.00', '1099', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('9', '1472583774201', '4', null, '4', '4', '149.00', '149', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('10', '1472583831117', '5', null, '5', '5', '229.00', '229', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('11', '1472628630086', '6', null, '6', '6', '169.00', '169', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('12', '1472736931796', '7', null, '7', '7', '249.00', '249', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('13', '1473318741286', '8', null, '8', '8', '99.00', '99', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('14', '1473685327798', '9', null, '9', '9', '166.00', '166', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('15', '1474910562755', '10', null, '10', '10', '223.00', '223', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('16', '1475353900453', '11', null, '11', '11', '166.00', '166', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('17', '1475353918562', '12', null, '12', '12', '124.00', '124', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('18', '1475354006972', '13', null, '13', '13', '249.00', '249', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('19', '1475407186147', '14', null, '14', '14', '219.00', '219', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('20', '1475947762038', '15', null, '15', '15', '2366.00', '2366', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('21', '1475996329018', '16', null, '16', '16', '2499.00', '2499', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('22', '1477472951669', '17', null, '17', '17', '2188.00', '2188', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('23', '1478099883634', '18', null, '18', '18', '249.00', '249', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('24', '1478522533460', '19', null, '19', '19', '1300.00', '1300', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('25', '1478527872182', '20', null, '20', '20', '179.00', '179', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('26', '1478680540669', '21', null, '21', '21', '6429.00', '6429', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('27', '1478682438293', '22', null, '22', '22', '2416.00', '2416', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('28', '1478682709405', '23', null, '23', '23', '219.00', '219', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('29', '1478682831935', '24', null, '24', '24', '295.00', '295', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('30', '1478682893916', '25', null, '25', '25', '2164.00', '2164', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('31', '1478683391099', '26', null, '26', '26', '146.00', '146', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('32', '1478683407372', '27', null, '27', '27', '26.00', '26', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('33', '1478683468241', '28', null, '28', '28', '4974.00', '4974', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('34', '1478683468246', '29', null, '29', '29', '265.00', '265', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('35', '1478683468279', '30', null, '30', '30', '259.00', '259', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('36', '1478689468277', '31', null, '31', '31', '789.00', '789', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('37', '1478689468979', '32', null, '32', '32', '456.00', '456', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('38', '1478689448279', '33', null, '33', '33', '7845.00', '7845', '1', '1', null, null, null, null);
INSERT INTO `os_product_specification` VALUES ('39', '1478689468679', '34', null, '34', '34', '1548.00', '1548', '1', '1', null, null, null, null);

-- ----------------------------
-- Table structure for os_question
-- ----------------------------
DROP TABLE IF EXISTS `os_question`;
CREATE TABLE `os_question` (
  `question_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '提问ID',
  `product_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `content` varchar(255) DEFAULT NULL COMMENT '提问内容',
  `good_count` int(11) DEFAULT '0' COMMENT '好评数',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态：1.显示；0.隐藏',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `answer_content` varchar(255) DEFAULT NULL COMMENT '回答内容',
  `answer_by` varchar(255) DEFAULT NULL COMMENT '回复人',
  `answer_time` datetime DEFAULT NULL COMMENT '回复时间',
  `type` tinyint(2) DEFAULT '0' COMMENT '状态：1.已处理；0.未处理；2.不予处理',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='提问表';

-- ----------------------------
-- Records of os_question
-- ----------------------------
INSERT INTO `os_question` VALUES ('1', '1', '1', '猫宁', 'default/avatar/avatar_8.jpg', '商城的所有产品必须超过150免邮配送么', '4', '1', '2017-03-05 01:09:03', '猫宁', '您好，购买手机是免邮的~购买配件等商品在150元以下，需按照10元/单标准支付邮费， “满150元免邮费”需以实际支付金额超过150元为准。小米电视、空气净化器、体重秤因商品特殊性不参与满150元包邮活动。如遇活动期，资费标准以活动公告为准哦，感谢您对小米的支持，祝您购物愉快~', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('2', '1', '1', '猫宁', 'default/avatar/avatar_4.jpg', '邮费多少', '57', '1', '2017-03-05 01:09:03', '猫宁', '您好，购买手机是免邮的~购买配件等商品在150元以下，需按照10元/单标准支付邮费， “满150元免邮费”需以实际支付金额超过150元为准。小米电视、空气净化器、体重秤因商品特殊性不参与满150元包邮活动。如遇活动期，资费标准以活动公告为准哦，感谢您对小米的支持，祝您购物愉快~', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('3', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '57', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('4', '1', '1', '猫宁', 'default/avatar/avatar_8.jpg', '测试提问', '57', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('5', '1', '1', '猫宁', 'default/avatar/avatar_4.jpg', '测试提问', '57', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('6', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('7', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('8', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('9', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('10', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('11', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('12', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('13', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '你hi奥？', '111', '1', '2017-03-29 20:43:35', '1', '回复，回复', '猫宁', '2017-03-29 20:43:56', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('14', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '我可以进行提问吗？', '118', '1', '2017-03-29 20:48:33', '1', '当然可以啊', '猫宁', '2017-03-29 20:48:54', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('15', '3', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '我可以进行题吗？', '99', '1', '2017-03-29 20:43:35', '1', '回复，回复', '猫宁', '2017-03-29 20:43:56', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('16', '3', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '我看ifsdaf斯蒂芬', '100', '1', '2017-03-29 20:48:33', '1', '当然可以啊', '猫宁', '2017-03-29 20:48:54', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('17', '3', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '电视发射点发斯蒂芬', '0', '0', '2017-05-11 14:27:58', '穿鞋子的猫', null, null, null, '0', null, null);
INSERT INTO `os_question` VALUES ('18', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '撒大帝', '0', '0', '2017-05-11 15:47:52', '穿鞋子的猫', null, null, null, '0', null, null);

-- ----------------------------
-- Table structure for os_recommend
-- ----------------------------
DROP TABLE IF EXISTS `os_recommend`;
CREATE TABLE `os_recommend` (
  `recommend_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐位ID',
  `name` varchar(64) DEFAULT NULL COMMENT '推荐位名称',
  `code` varchar(64) DEFAULT NULL COMMENT '代码简称',
  `number` int(11) DEFAULT '0' COMMENT '产品数量',
  `show_number` int(11) DEFAULT NULL COMMENT '显示数量',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 1=显示/0=隐藏',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`recommend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='推荐位表';

-- ----------------------------
-- Records of os_recommend
-- ----------------------------
INSERT INTO `os_recommend` VALUES ('1', '猫宁明星产品', 'star', '10', '10', '1', '猫宁明星产品', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('2', '为你推荐', 'popular', '10', '10', '1', '为你推荐', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('3', '热评产品', 'comment', '4', '4', '1', '热评产品', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');
INSERT INTO `os_recommend` VALUES ('4', '新品推荐', 'new', '10', '10', '1', '新品推荐', '2017-04-11 15:20:49', '猫宁', '2017-04-11 15:20:56', '猫宁');

-- ----------------------------
-- Table structure for os_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `os_shopping_cart`;
CREATE TABLE `os_shopping_cart` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `product_spec_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品规格编号',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `buy_number` int(11) DEFAULT '1' COMMENT '购买数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `check_status` tinyint(2) DEFAULT '1' COMMENT '购物车状态：0,未选中；1,选中',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of os_shopping_cart
-- ----------------------------
INSERT INTO `os_shopping_cart` VALUES ('28', '14725812207481', '1', '1', '2017-05-12 05:03:24', null, '1');

-- ----------------------------
-- Table structure for os_specification
-- ----------------------------
DROP TABLE IF EXISTS `os_specification`;
CREATE TABLE `os_specification` (
  `specification_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '规格名称',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.显示；0.隐藏',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='规格表\r\n';

-- ----------------------------
-- Records of os_specification
-- ----------------------------
INSERT INTO `os_specification` VALUES ('1', '2', '颜色', '1', '1', '2017-03-05 17:04:45', '猫宁', '2017-03-05 17:04:50', '猫宁');
INSERT INTO `os_specification` VALUES ('2', '2', '内存容量', '1', '2', '2017-03-05 17:07:17', '猫宁', '2017-03-05 17:07:22', '猫宁');

-- ----------------------------
-- Table structure for os_specification_attribute
-- ----------------------------
DROP TABLE IF EXISTS `os_specification_attribute`;
CREATE TABLE `os_specification_attribute` (
  `spec_attr_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格属性ID',
  `specification_id` bigint(20) DEFAULT NULL COMMENT '规格ID',
  `name` varchar(64) DEFAULT NULL COMMENT '规格属性名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`spec_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='规格属性表';

-- ----------------------------
-- Records of os_specification_attribute
-- ----------------------------
INSERT INTO `os_specification_attribute` VALUES ('1', '1', '白色', '2017-03-05 17:07:56', '猫宁');
INSERT INTO `os_specification_attribute` VALUES ('2', '1', '金色', '2017-03-05 17:08:09', '猫宁');
INSERT INTO `os_specification_attribute` VALUES ('3', '2', '16G', '2017-03-05 17:07:56', '猫宁');
INSERT INTO `os_specification_attribute` VALUES ('4', '2', '32G', '2017-03-05 17:08:09', '猫宁');
INSERT INTO `os_specification_attribute` VALUES ('5', '2', '64G', '2017-03-05 17:09:50', '猫宁');

-- ----------------------------
-- Table structure for os_user
-- ----------------------------
DROP TABLE IF EXISTS `os_user`;
CREATE TABLE `os_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_number` bigint(20) unsigned DEFAULT NULL COMMENT '用户编号',
  `user_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `login_password` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '加密密码的盐',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 0=保密/1=男/2=女',
  `age` tinyint(4) DEFAULT '0' COMMENT '年龄',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0=冻结/1=正常',
  `email_is_active` tinyint(1) DEFAULT '0' COMMENT '邮箱激活 0=未激活/1=已激活',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `telephone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `login_number` bigint(20) DEFAULT '0' COMMENT '登录次数',
  `regeist_time` datetime DEFAULT NULL COMMENT '注册时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `amount` decimal(10,0) DEFAULT '0' COMMENT '消费额',
  `rank_id` bigint(20) DEFAULT NULL COMMENT '会员等级ID',
  `score` int(11) DEFAULT '0' COMMENT '会员积分',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of os_user
-- ----------------------------
INSERT INTO `os_user` VALUES ('1', '14875975007231277', '穿鞋子的猫', '289d1f89b1a93395267bac0af18bd916', 'IeA7iu', '陈星星', '0', '0', 'default/avatar/avatar_8.jpg', '1', '1', '810170512@qq.com', '18857105127', '2017-05-14 14:10:34', '172.27.15.122', '90', '2017-02-21 15:19:07', null, '2017-02-24 01:53:02', '穿鞋子的猫', null, null, '0');
INSERT INTO `os_user` VALUES ('8', '148777295260796', '陈星星', '0fb10cf407bc90a8f6c4c2299aeb0b2c', 'jmslV1', '陈星星', '0', '0', 'default/avatar/avatar_4.jpg', '1', '1', '55245511@qq.com', '18857105120', '2017-02-22 22:16:24', '172.27.201.108', '1', '2017-02-22 22:15:53', '陈星星', null, null, '0', null, '0');
INSERT INTO `os_user` VALUES ('12', '148777481346536', '陈星星', 'e00d4e98d017fcf9a3b41a341c2bcd30', 'uN2Gdw', '陈星星', '0', '0', 'default/avatar/avatar_5.jpg', '1', '1', '55245521@qq.com', '18857105137', null, null, '0', '2017-02-22 22:46:53', '陈星星', null, null, '0', null, '0');
INSERT INTO `os_user` VALUES ('28', '149165425386333', '陈星星', '369ff948ec73fefd97f03768f0520e89', '9B9H9P', '陈星星', '0', '0', 'default/avatar/avatar_7.jpg', '1', '1', '810170513@qq.com', '18857105165', '2017-05-09 13:10:28', '172.27.85.77', '0', '2017-04-08 12:24:14', '陈星星', '2017-04-18 08:05:39', '陈星星', '0', null, '0');

-- ----------------------------
-- Table structure for os_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `os_user_login_log`;
CREATE TABLE `os_user_login_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '登录日志ID',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `user_ip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- ----------------------------
-- Records of os_user_login_log
-- ----------------------------
INSERT INTO `os_user_login_log` VALUES ('1', '2017-02-21 15:18:06', '172.27.167.184', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('2', '2017-02-21 15:19:01', '172.27.167.184', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('3', '2017-02-21 15:50:43', '172.27.167.184', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('4', '2017-02-22 16:35:53', '172.27.201.108', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('5', '2017-02-22 16:47:19', '172.27.201.108', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('6', '2017-02-22 22:16:23', '172.27.201.108', '8', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('7', '2017-02-22 22:18:08', '172.27.201.108', '9', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('8', '2017-02-22 22:19:24', '172.27.201.108', '10', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('9', '2017-02-22 23:14:21', '172.27.201.108', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('10', '2017-02-22 23:14:35', '172.27.201.108', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('11', '2017-02-22 23:47:42', '172.18.50.54', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('12', '2017-02-22 23:48:19', '172.18.50.54', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('13', '2017-03-13 16:35:40', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('14', '2017-03-13 16:36:48', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('15', '2017-03-13 16:52:21', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('16', '2017-03-13 16:52:22', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('17', '2017-03-13 17:21:53', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('18', '2017-03-13 17:22:34', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('19', '2017-03-13 17:23:33', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('20', '2017-03-13 17:24:14', '172.27.232.211', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('21', '2017-03-14 21:13:02', '172.27.8.82', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('22', '2017-03-16 00:02:07', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('23', '2017-03-16 00:02:08', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('24', '2017-03-16 00:31:45', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('25', '2017-03-16 00:59:11', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('26', '2017-03-16 01:01:39', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('27', '2017-03-16 17:56:34', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('28', '2017-03-16 19:19:56', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('29', '2017-03-16 19:56:41', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('30', '2017-03-16 20:00:50', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('31', '2017-03-16 20:10:16', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('32', '2017-03-16 20:37:58', '172.27.72.80', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('33', '2017-03-16 22:56:44', '172.29.138.207', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('34', '2017-03-17 00:00:27', '172.18.62.6', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('35', '2017-03-17 00:20:20', '172.18.62.6', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('36', '2017-03-19 22:16:19', '172.27.165.109', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('37', '2017-03-19 22:16:21', '172.27.165.109', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('38', '2017-03-20 01:03:58', '172.18.56.31', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('39', '2017-03-20 22:09:14', '172.27.191.127', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('40', '2017-03-20 22:41:54', '172.27.191.127', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('41', '2017-03-21 14:58:45', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('42', '2017-03-21 15:40:42', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('43', '2017-03-21 16:07:02', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('44', '2017-03-21 16:07:03', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('45', '2017-03-21 17:00:55', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('46', '2017-03-21 17:04:07', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('47', '2017-03-21 17:49:46', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('48', '2017-03-21 17:54:10', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('49', '2017-03-21 17:58:02', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('50', '2017-03-21 18:00:03', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('51', '2017-03-21 18:02:32', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('52', '2017-03-21 18:04:40', '172.27.208.212', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('53', '2017-03-22 01:13:58', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('54', '2017-03-22 01:18:08', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('55', '2017-03-22 02:39:32', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('56', '2017-03-22 14:37:50', '172.27.239.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('57', '2017-03-22 14:59:37', '172.27.239.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('58', '2017-03-22 15:17:34', '172.27.239.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('59', '2017-03-22 15:45:22', '172.27.239.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('60', '2017-03-22 16:22:27', '172.27.239.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('61', '2017-03-22 16:34:55', '172.27.239.223', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('62', '2017-03-22 19:58:00', '172.27.250.97', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('63', '2017-03-22 20:51:25', '172.27.250.97', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('64', '2017-03-22 21:14:35', '172.27.250.97', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('65', '2017-03-22 22:10:29', '172.27.250.97', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('66', '2017-03-22 22:58:14', '172.27.250.97', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('67', '2017-03-22 23:53:43', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('68', '2017-03-28 15:47:14', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('69', '2017-03-28 17:57:44', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('70', '2017-03-28 18:25:00', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('71', '2017-03-28 18:39:15', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('72', '2017-03-28 18:58:27', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('73', '2017-03-28 20:58:30', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('74', '2017-03-28 21:42:51', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('75', '2017-03-28 21:42:52', '172.27.158.191', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('76', '2017-03-28 22:08:50', '172.27.174.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('77', '2017-03-28 22:57:21', '172.27.174.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('78', '2017-03-29 00:52:20', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('79', '2017-03-29 00:52:20', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('80', '2017-03-29 00:58:35', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('81', '2017-03-29 01:01:48', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('82', '2017-03-29 01:09:55', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('83', '2017-03-29 01:12:21', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('84', '2017-03-29 01:16:00', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('85', '2017-03-29 03:07:22', '172.18.50.224', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('86', '2017-03-29 14:33:41', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('87', '2017-03-29 15:40:53', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('88', '2017-03-29 15:42:31', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('89', '2017-03-29 15:46:53', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('90', '2017-03-29 17:11:52', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('91', '2017-03-29 18:09:46', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `os_user_login_log` VALUES ('92', '2017-03-29 18:13:09', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('93', '2017-03-29 20:40:48', '172.27.184.126', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('94', '2017-04-08 06:52:14', '172.27.182.201', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('95', '2017-04-08 06:53:51', '172.27.182.201', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('96', '2017-04-08 06:54:05', '172.27.182.201', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('97', '2017-04-08 12:25:25', '172.18.59.176', '28', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('98', '2017-05-09 08:41:02', '172.27.85.77', '28', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('99', '2017-05-09 08:51:17', '172.27.85.77', '28', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('100', '2017-05-09 09:26:26', '172.27.85.77', '28', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('101', '2017-05-09 10:28:24', '172.27.85.77', '28', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('102', '2017-05-09 12:07:14', '172.27.85.77', '28', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('103', '2017-05-09 13:10:28', '172.27.85.77', '28', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('104', '2017-05-09 14:05:15', '172.27.85.77', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('105', '2017-05-09 14:52:26', '172.27.85.77', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('106', '2017-05-09 15:47:41', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('107', '2017-05-10 01:51:23', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('108', '2017-05-10 03:02:40', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('109', '2017-05-10 03:59:38', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('110', '2017-05-10 05:08:10', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('111', '2017-05-10 06:36:51', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('112', '2017-05-10 08:16:37', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('113', '2017-05-10 08:45:46', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('114', '2017-05-10 09:26:01', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('115', '2017-05-10 10:38:57', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('116', '2017-05-10 14:46:04', '172.27.116.239', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('117', '2017-05-10 15:05:36', '172.18.53.246', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('118', '2017-05-10 15:24:19', '172.18.53.246', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('119', '2017-05-10 15:30:43', '172.18.53.246', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('120', '2017-05-10 17:06:19', '172.18.53.246', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('121', '2017-05-10 17:34:05', '172.18.53.246', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('122', '2017-05-10 17:44:09', '172.18.53.246', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('123', '2017-05-10 18:27:45', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('124', '2017-05-10 18:39:42', '192.168.191.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('125', '2017-05-11 03:35:53', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('126', '2017-05-11 04:37:24', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('127', '2017-05-11 05:51:41', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('128', '2017-05-11 06:50:19', '172.27.150.88', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('129', '2017-05-11 14:23:30', '172.27.172.24', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('130', '2017-05-11 15:02:48', '172.27.172.24', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('131', '2017-05-11 15:45:55', '172.18.56.119', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('132', '2017-05-12 05:03:17', '172.27.183.3', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('133', '2017-05-12 05:12:22', '172.27.183.3', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('134', '2017-05-12 06:37:32', '172.27.183.3', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `os_user_login_log` VALUES ('135', '2017-05-14 14:10:34', '172.27.15.122', '1', 'WINDOWS_10', 'CHROME45');
