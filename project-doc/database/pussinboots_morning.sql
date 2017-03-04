/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : pussinboots_morning

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2017-03-05 02:24:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `menu_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级编号',
  `menu_type` tinyint(2) DEFAULT NULL COMMENT '权限类型：1.菜单；2.功能；3.子功能；0.操作',
  `menu_code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限代码',
  `menu_name` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `icon` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '图标名称',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态：1.显示；0.隐藏',
  `permission` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '权限标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', '0', null, '', '功能菜单', null, '', '', '1', '', '2016-10-23 16:50:34', '系统管理员', '2016-12-08 16:14:48', '猫宁', '主页');
INSERT INTO `cms_menu` VALUES ('2', '1', '1', 'administrator', '管理员管理', '100', '/administrator', 'user', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('3', '2', '2', 'list', '管理员列表', '20', '/administrator/list', 'users', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-10 06:22:36', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('4', '3', '0', 'list_view', '查看', '1', '/administrator/list/view', '', '1', 'administrator:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('5', '3', '0', 'list_edit', '编辑', '2', '/administrator/list/edit', '', '1', 'administrator:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('6', '3', '0', 'list_delete', '删除', '3', '/administrator/list/delete', null, '1', 'administrator:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('7', '3', '0', 'list_create', '添加', '4', '/administrator/list/create', null, '1', 'administrator:list:create', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('8', '2', '2', 'info', '个人信息', '10', '/administrator/info', 'user-times', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-10 06:22:23', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('9', '8', '0', 'info_view', '查看', '1', '/administrator/info/view', '', '1', 'administrator:info:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('10', '8', '0', 'info_edit', '编辑', '2', '/administrator/info/edit', '', '1', 'administrator:info:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('11', '2', '2', 'role', '角色管理', '30', '/administrator/role', 'user-secret', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-08 17:21:33', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('12', '11', '0', 'role_view', '查看', '1', '/administrator/role/view', '', '1', 'administrator:role:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('13', '11', '0', 'role_edit', '编辑', '2', '/administrator/role/edit', '', '1', 'administrator:role:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('14', '11', '0', 'role_delete', '删除', '3', '/administrator/role/delete', '', '1', 'administrator:role:delete', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('15', '11', '0', 'role_create', '添加', '4', '/administrator/role/create', '', '1', 'administrator:role:create', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('16', '1', '1', 'user', '会员管理', '300', '/system/user', 'users', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('17', '16', '2', 'list', '会员列表', '10', '/system/user/list', 'user-secret', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-10 06:15:37', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('18', '17', '0', 'list_view', '查看', '1', '/system/user/list/view', null, null, 'user:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('19', '17', '0', 'list_edit', '编辑', '2', '/system/user/list/edit', null, null, 'user:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('20', '17', '0', 'list_delete', '删除', '3', '/system/user/list/delete', null, null, 'user:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('21', '17', '0', 'list_add', '添加', '4', '/system/user/list/add', null, null, 'user:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('22', '16', '2', 'grade', '等级管理', '20', '/system/user/grade', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('23', '22', '0', 'grade_view', '查看', '1', '/system/user/grade/view', null, null, 'user:grade:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('24', '22', '0', 'grade_edit', '编辑', '2', '/system/user/grade/edit', null, null, 'user:grade:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('25', '16', '2', 'record', '会员记录管理', '30', '/system/user/record', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('26', '25', '0', 'record_view', '查看', '1', '/system/user/record/view', '', null, 'user:record:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('27', '1', '1', 'goods', '产品管理', '400', '/system/goods', 'product-hunt', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('28', '27', '2', 'list', '产品列表', '10', '/system/goods/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('29', '28', '0', 'list_view', '查看', '1', '/system/goods/list/view', null, null, 'goods:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('30', '28', '0', 'list_edit', '编辑', '2', '/system/goods/list/edit', null, null, 'goods:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('31', '28', '0', 'list_delete', '删除', '3', '/system/goods/list/delete', null, null, 'goods:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('32', '28', '0', 'list_add', '添加', '4', '/system/goods/list/add', null, null, 'goods:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('33', '27', '2', 'classify', '分类管理', '20', '/system/goods/classify', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('34', '33', '0', 'classify_view', '查看', '1', '/system/goods/classify/view', null, null, 'goods:classify:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('35', '33', '0', 'classify_edit', '编辑', '2', '/system/goods/classify/edit', null, null, 'goods:classify:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('36', '33', '0', 'classify_delete', '删除', '3', '/system/goods/classify/delete', null, null, 'goods:classify:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('37', '33', '0', 'classify_add', '添加', '4', '/system/goods/classify/add', null, null, 'goods:classify:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('38', '27', '2', 'query', '问答管理', '30', '/system/goods/query', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('39', '38', '0', 'query_view', '查看', '1', '/system/goods/query/view', null, null, 'goods:query:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('40', '38', '0', 'query_edit', '编辑', '2', '/system/goods/query/edit', null, null, 'goods:query:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('41', '38', '0', 'query_delete', '删除', '3', '/system/goods/query/delete', null, null, 'goods:query:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('42', '38', '0', 'query_add', '添加', '4', '/system/goods/query/add', null, null, 'goods:query:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('43', '1', '1', 'order', '交易管理', '500', '/system/order', 'money', '1', null, '2016-10-23 17:08:23', '系统管理员', '2016-10-23 17:08:27', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('44', '43', '2', 'list', '订单管理', '10', '/system/order/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('45', '44', '0', 'list_view', '查看', '1', '/system/order/list/view', null, null, 'order:list:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('46', '44', '0', 'list_edit', '编辑', '2', '/system/order/list/edit', null, null, 'order:list:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('47', '44', '0', 'list_delete', '删除', '3', '/system/order/list/delete', null, null, 'order:list:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('48', '44', '0', 'list_add', '添加', '4', '/system/order/list/add', null, null, 'order:list:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('49', '43', '2', 'info', '交易信息', '10', '/system/order/info', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('50', '49', '0', 'info_view', '查看', '1', '/system/order/info/view', null, null, 'goods:info:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('51', '43', '2', 'reviews', '评论管理', '10', '/system/order/reviews', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('52', '51', '0', 'reviews_view', '查看', '1', '/system/order/reviews/view', null, null, 'goods:reviews:view', '2016-10-23 17:46:12', '系统管理员', '2016-10-23 17:46:18', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('53', '51', '0', 'reviews_edit', '编辑', '2', '/system/order/reviews/edit', null, null, 'goods:reviews:edit', '2016-10-23 17:47:14', '系统管理员', '2016-10-23 17:47:23', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('54', '51', '0', 'reviews_delete', '删除', '3', '/system/order/reviews/delete', null, null, 'goods:reviews:delete', '2016-10-23 17:48:40', '系统管理员', '2016-10-23 17:48:47', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('55', '51', '0', 'reviews_add', '添加', '4', '/system/order/reviews/add', null, null, 'goods:reviews:add', '2016-10-23 17:50:45', '系统管理员', '2016-10-23 17:50:52', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('56', '1', '1', 'email', '邮件管理', '600', '/system/email', 'envelope-o', '1', null, '2016-10-23 20:22:55', '系统管理员', '2016-10-23 20:23:02', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('57', '56', '2', 'send', '发送邮件', '10', '/system/email/info', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('58', '56', '2', 'list', '邮件管理', '20', '/system/email/list', '', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-10-23 17:24:29', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('59', '1', '1', 'message', '系统消息', '600', '', 'desktop', '0', null, '2016-10-23 20:22:55', '系统管理员', '2016-12-06 17:46:26', '猫宁', null);
INSERT INTO `cms_menu` VALUES ('60', '59', '2', '', '意见反馈', '10', '', '', '0', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-06 15:46:14', '猫宁', null);
INSERT INTO `cms_menu` VALUES ('61', '59', '2', '', '系统消息列表', '20', '', '', '0', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-06 15:46:12', '猫宁', null);
INSERT INTO `cms_menu` VALUES ('62', '59', '2', '', '发送消息', '30', '', '', '0', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-06 15:46:10', '猫宁', null);
INSERT INTO `cms_menu` VALUES ('65', '1', '1', 'system', '系统管理', '700', '/system', 'universal-access', '1', null, '2016-10-23 20:22:55', '系统管理员', '2016-10-23 20:23:02', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('66', '65', '2', 'menu', '菜单管理', '10', '/system/menu', 'file-text', '1', '', '2016-10-23 17:24:24', '系统管理员', '2016-12-08 17:22:33', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('69', '3', '0', 'list_audit', '审查', '5', '/administrator/list/audit', '', '1', 'administrator:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('70', '17', '0', 'list_audit', '审查', '5', '/system/user/list/audit', null, null, 'user:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('71', '65', '2', '', '连接池监视', '40', '/druid', 'recycle', '1', null, '2016-11-07 01:16:13', '系统管理员', '2016-12-08 17:24:15', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('72', '28', '0', 'list_audit', '审查', '5', '/system/goods/list/audit', null, null, 'goods:list:audit', '2016-10-25 17:25:29', '系统管理员', '2016-10-25 17:25:35', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('74', '66', '0', 'menu_view', '查看', '1', '/system/menu/view', null, '1', 'system:menu:view', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('75', '66', '0', 'menu_edit', '编辑', '2', '/system/menu/edit', '', '1', 'system:menu:edit', '2016-12-05 16:08:59', '系统管理员', '2016-12-10 06:45:32', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('76', '66', '0', 'menu_delete', '删除', '3', '/system/menu/delete', null, '1', 'system:menu:delete', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('77', '66', '0', 'menu_create', '添加', '4', '/system/menu/create', '', '1', 'system:menu:create', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', '');
INSERT INTO `cms_menu` VALUES ('78', '66', '0', 'menu_audit', '审查', '5', '/system/menu/audit', null, '1', 'system:menu:audit', '2016-12-05 16:08:59', '系统管理员', '2016-12-05 16:09:05', '系统管理员', null);
INSERT INTO `cms_menu` VALUES ('83', '11', '0', 'role_audit', '审查', '5', '/administrator/role/audit', '', '1', 'administrator:role:audit', '2016-12-10 07:25:58', '猫宁', '2016-12-10 07:26:56', '猫宁', '');
INSERT INTO `cms_menu` VALUES ('84', '65', '2', 'version', '版本日志', '20', '/system/version', 'file-text-o', '1', null, null, '', null, null, '系统版本日志');
INSERT INTO `cms_menu` VALUES ('85', '84', '0', 'version_view', '查看', '1', '/system/version/view', '', '1', 'system:version:view', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('86', '2', '2', 'organization', '组织管理', '40', '/administrator/organization', 'coffee', '1', null, null, '', null, null, '组织管理');
INSERT INTO `cms_menu` VALUES ('87', '86', '0', 'organization_view', '查看', '1', '/administrator/organization/view', '', '1', 'administrator:organization:view', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('88', '86', '0', 'organization_edit', '编辑', '2', '/administrator/organization/edit', '', '1', 'administrator:organization:edit', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('89', '86', '0', 'organization_delete', '删除', '3', '/administrator/organization/delete', '', '1', 'administrator:organization:delete', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('90', '86', '0', 'organization_audit', '审查', '5', '/administrator/organization/audit', '', '1', 'administrator:organization:audit', null, '', null, null, '');
INSERT INTO `cms_menu` VALUES ('91', '86', '0', 'organization_create', '添加', '4', '/administrator/organization/create', '', '1', 'administrator:organization:create', null, '', null, null, '');

-- ----------------------------
-- Table structure for cms_organization
-- ----------------------------
DROP TABLE IF EXISTS `cms_organization`;
CREATE TABLE `cms_organization` (
  `organization_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `organization_name` varchar(64) DEFAULT NULL COMMENT '组织名称',
  `is_system` tinyint(2) DEFAULT '1' COMMENT '系统数据：1.是，只有超级管理员能修改；0.否，拥有角色修改人员的权限能都修改',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.正常；0.冻结',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_organization
-- ----------------------------
INSERT INTO `cms_organization` VALUES ('1', '产品研发部', '0', '1', '2017-02-17 00:59:20', '猫宁', '2017-02-17 02:27:09', '猫宁', '主要负责产品研发等业务');
INSERT INTO `cms_organization` VALUES ('3', '市场营销部', '1', '1', '2017-02-17 16:25:07', '猫宁', '2017-02-28 15:31:42', '猫宁', '主要负责市场营销等相关业务');

-- ----------------------------
-- Table structure for cms_role
-- ----------------------------
DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE `cms_role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(64) DEFAULT NULL COMMENT '角色标志',
  `is_system` tinyint(2) DEFAULT '1' COMMENT '系统数据：1.是，只有超级管理员能修改；0.否，拥有角色修改人员的权限能都修改',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态：1.正常；0.冻结',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_role
-- ----------------------------
INSERT INTO `cms_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '2016-10-23 14:26:47', '猫宁管理员', '2017-02-28 15:54:18', '猫宁', '超级管理员，拥有系统所有的权力！');
INSERT INTO `cms_role` VALUES ('3', '角色管理员', 'role', '1', '1', '2017-02-07 16:20:21', '猫宁', '2017-03-01 19:13:44', '猫宁', '角色管理员，只能修改、创建角色');
INSERT INTO `cms_role` VALUES ('4', '研发测试员', 'test', '0', '1', '2017-02-17 15:43:46', '猫宁', '2017-03-01 19:13:31', '猫宁', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2469 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_role_menu
-- ----------------------------
INSERT INTO `cms_role_menu` VALUES ('2375', '1', '1', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2376', '1', '2', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2377', '1', '8', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2378', '1', '9', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2379', '1', '10', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2380', '1', '3', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2381', '1', '4', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2382', '1', '5', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2383', '1', '6', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2384', '1', '7', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2385', '1', '69', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2386', '1', '11', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2387', '1', '12', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2388', '1', '13', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2389', '1', '14', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2390', '1', '15', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2391', '1', '83', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2392', '1', '86', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2393', '1', '87', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2394', '1', '88', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2395', '1', '89', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2396', '1', '91', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2397', '1', '90', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2398', '1', '16', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2399', '1', '17', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2400', '1', '22', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2401', '1', '25', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2402', '1', '27', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2403', '1', '28', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2404', '1', '33', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2405', '1', '38', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2406', '1', '43', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2407', '1', '44', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2408', '1', '49', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2409', '1', '51', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2410', '1', '56', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2411', '1', '57', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2412', '1', '58', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2413', '1', '65', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2414', '1', '66', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2415', '1', '74', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2416', '1', '75', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2417', '1', '76', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2418', '1', '77', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2419', '1', '78', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2420', '1', '84', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2421', '1', '85', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2422', '1', '71', '2017-02-28 15:54:18', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2423', '4', '1', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2424', '4', '2', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2425', '4', '8', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2426', '4', '9', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2427', '4', '10', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2428', '4', '3', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2429', '4', '4', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2430', '4', '5', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2431', '4', '6', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2432', '4', '7', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2433', '4', '69', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2434', '4', '11', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2435', '4', '12', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2436', '4', '13', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2437', '4', '14', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2438', '4', '15', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2439', '4', '83', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2440', '4', '86', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2441', '4', '87', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2442', '4', '88', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2443', '4', '89', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2444', '4', '91', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2445', '4', '90', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2446', '4', '65', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2447', '4', '84', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2448', '4', '85', '2017-03-01 19:13:31', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2449', '3', '1', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2450', '3', '2', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2451', '3', '8', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2452', '3', '9', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2453', '3', '10', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2454', '3', '3', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2455', '3', '4', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2456', '3', '5', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2457', '3', '6', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2458', '3', '7', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2459', '3', '69', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2460', '3', '11', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2461', '3', '12', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2462', '3', '13', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2463', '3', '14', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2464', '3', '15', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2465', '3', '83', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2466', '3', '65', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2467', '3', '84', '2017-03-01 19:13:44', '猫宁');
INSERT INTO `cms_role_menu` VALUES ('2468', '3', '85', '2017-03-01 19:13:44', '猫宁');

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
  `sex` int(1) DEFAULT '0' COMMENT '性别：0.保密；1.男； 2.女',
  `age` tinyint(4) DEFAULT '0' COMMENT '年龄',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` int(1) DEFAULT '1' COMMENT '状态：0.冻结；1.正常；2.删除',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `telephone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('1', '1', 'admin', 'd81c31b9348c3da513177a781703767e', 'Dts7jk', '猫宁', '陈星星', '0', '22', 'default/avatar/avatar_1.jpg', '1', '810170512@qq.com', '18857105127', '2017-03-01 20:49:14', '172.27.167.108', '2016-10-27 23:11:43', '穿鞋子的猫', '2017-02-28 15:00:36', '猫宁');
INSERT INTO `cms_user` VALUES ('2', '1', 'system', 'a640aa3da9f5d9975d7cee1141fa51a7', 'JGKbZs', '爬梯子的过路人', '陈星星', '1', null, 'default/avatar/avatar_3.jpg', '1', '810170512@qq.com', '18857105127', '2017-03-01 19:13:55', '172.27.167.108', '2017-02-07 16:21:10', '猫宁', '2017-02-17 16:25:23', '猫宁');
INSERT INTO `cms_user` VALUES ('9', '3', 'chen', '48fbc55cb5626809b4ad309f9562bab7', '86GRd6', '陈星星', '陈星星', '1', null, 'default/avatar/avatar_8.jpg', '1', '15632831549@qq.com', '18857105127', null, null, '2017-02-28 16:08:15', '猫宁', '2017-02-28 16:22:01', '猫宁');

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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

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
INSERT INTO `cms_user_login_log` VALUES ('21', '2017-02-07 16:23:00', '192.168.1.101', '2', 'WINDOWS_10', 'CHROME45');
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
INSERT INTO `cms_user_login_log` VALUES ('45', '2017-02-08 00:05:36', '192.168.1.101', '2', 'WINDOWS_10', 'CHROME45');
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
INSERT INTO `cms_user_login_log` VALUES ('57', '2017-02-09 19:45:13', '192.168.1.101', '2', 'WINDOWS_10', 'CHROME45');
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
INSERT INTO `cms_user_login_log` VALUES ('84', '2017-02-16 16:14:21', '172.27.55.200', '2', 'WINDOWS_10', 'CHROME45');
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
INSERT INTO `cms_user_login_log` VALUES ('124', '2017-02-20 22:48:13', '172.27.137.182', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('125', '2017-02-20 22:53:44', '172.27.137.182', '1', 'WINDOWS_10', 'CHROME');
INSERT INTO `cms_user_login_log` VALUES ('126', '2017-02-20 23:12:06', '172.18.52.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('127', '2017-02-20 23:12:35', '172.18.52.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('128', '2017-02-20 23:15:06', '172.18.52.1', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('129', '2017-02-20 23:27:10', '172.18.52.1', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('130', '2017-02-22 02:35:43', '172.18.63.217', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('131', '2017-02-28 14:48:00', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('132', '2017-02-28 15:53:36', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('133', '2017-02-28 15:54:07', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('134', '2017-02-28 15:54:43', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('135', '2017-02-28 15:57:52', '172.27.124.95', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('136', '2017-03-01 17:23:54', '172.27.155.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('137', '2017-03-01 17:24:12', '172.27.155.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('138', '2017-03-01 17:24:34', '172.27.155.29', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('139', '2017-03-01 17:25:09', '172.27.155.29', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('140', '2017-03-01 19:13:55', '172.27.167.108', '2', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('141', '2017-03-01 20:42:14', '172.27.167.108', '1', 'WINDOWS_10', 'CHROME45');
INSERT INTO `cms_user_login_log` VALUES ('142', '2017-03-01 20:49:14', '172.27.167.108', '1', 'WINDOWS_10', 'CHROME45');

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
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_user_role
-- ----------------------------
INSERT INTO `cms_user_role` VALUES ('229', '1', '1', '2017-02-17 16:25:17', '猫宁');
INSERT INTO `cms_user_role` VALUES ('230', '3', '2', '2017-02-17 16:25:23', '猫宁');
INSERT INTO `cms_user_role` VALUES ('239', '1', '9', '2017-02-28 16:22:01', '猫宁');

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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告位表';

-- ----------------------------
-- Records of os_advert
-- ----------------------------
INSERT INTO `os_advert` VALUES ('1', '首页-轮播广告', '1226', '460', '电子商城首页轮播广告位', 'indexCarousel', '				<ul class=\"ull\">\r\n				<c:forEach items=\"${indexCarouselImgs }\" var=\"indexCarouselImg\">\r\n				    <li><a href=\"${indexCarouselImg.href }\"><img src=\"${ctximg }/${indexCarouselImg.picImg}\" alt=\"${indexCarouselImg.title }\"></a></li>\r\n				</c:forEach>\r\n				</ul>\r\n				<ol class=\"oll\">\r\n				</ol>\r\n				<span class=\"left btnL glyphicon glyphicon-menu-right\"></span> <span class=\"right btnL glyphicon glyphicon-menu-left\"></span>', '6');
INSERT INTO `os_advert` VALUES ('2', '首页-热点广告', '315', '170', '电子商城首页热点广告位', 'indexHotAdvert', '				<ul class=\"list2\">\r\n					<li><img src=\"img/dianhuaka.jpg\" alt=\"\"></li>\r\n					<li><img src=\"img/notexianhuo.jpg\" alt=\"\"></li>\r\n					<li><img src=\"img/jinghuaqi.jpg\" alt=\"\"></li>\r\n				</ul>', '3');
INSERT INTO `os_advert` VALUES ('3', '首页-分栏广告', '234', '300', '电子商城首页分栏广告位', 'indexSubfield', null, '2');

-- ----------------------------
-- Table structure for os_advert_detail
-- ----------------------------
DROP TABLE IF EXISTS `os_advert_detail`;
CREATE TABLE `os_advert_detail` (
  `advert_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告详情ID',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `advert_id` bigint(20) DEFAULT NULL COMMENT '广告位ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态：1.启用；0.禁用',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`advert_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='广告位管理表';

-- ----------------------------
-- Records of os_advert_detail
-- ----------------------------
INSERT INTO `os_advert_detail` VALUES ('1', '日行一善，小心意，大爱心', '1', null, '1', '#', '1', 'images/advert/20170224/1471798388806.jpg', '2017-02-24 16:33:00', '猫宁', '2017-02-24 16:33:10', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('2', '微光计划', '1', null, '2', '#', '1', 'images/advert/20170224/1471798568000.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('3', '免费午餐', '1', null, '3', '#', '1', 'images/advert/20170224/1471798318820.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('4', '走，带着热情去基层', '1', null, '4', '#', '1', 'images/advert/20170224/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('5', '微笑江豚', '1', null, '5', '#', '1', 'images/advert/20170224/1471798587469.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('6', '伸出援助之手', '1', null, '6', '#', '1', 'images/advert/20170224/1471798364441.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('7', '爸妈食堂', '2', null, '1', '#', '1', 'images/advert/20170224/1487945656155.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('8', '我们一起回家', '2', null, '2', '#', '1', 'images/advert/20170224/1487945778175.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('9', '关上一盏灯，点亮一盏灯', '2', null, '3', '#', '1', 'images/advert/20170224/1487946033939.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('10', '深圳壹基金公益基金会', '2', null, '4', 'http://www.onefoundation.cn/', '1', 'images/advert/20170224/1487946180347.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('11', '腾讯公益', '2', null, '5', 'http://gongyi.qq.com/', '1', 'images/advert/20170224/1487946256048.png', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('12', '测试产品广告', '3', '2', '1', 'list/2', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('13', '手机专场，有你好看', '3', '2', '2', 'list/2', '1', 'images/advert/20170228/1471798587371.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('14', '测试产品广告2', '3', '2', '3', 'list/2', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('16', '测试产品广告3', '3', '4', '1', 'list/4', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);
INSERT INTO `os_advert_detail` VALUES ('17', '测试产品广告4', '3', '4', '1', 'list/4', '1', 'images/advert/20170228/1471798587971.jpg', '2017-02-24 16:34:02', '猫宁', '2017-02-24 16:34:07', '猫宁', null);

-- ----------------------------
-- Table structure for os_category
-- ----------------------------
DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `type` tinyint(2) DEFAULT NULL COMMENT '目录类型:0,总目录；1,一级目录；2,二级目录',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态：1.显示；0.隐藏',
  `show_in_nav` tinyint(2) DEFAULT '0' COMMENT '显示首页导航条上：1.显示；0.隐藏',
  `show_in_index` tinyint(2) DEFAULT '0' COMMENT '显示首页主产品区：0,不显示；1,不分类主产品区；2,分类主产品区',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(64) DEFAULT NULL COMMENT '页面描述',
  `page_keyword` varchar(64) DEFAULT NULL COMMENT '页面关键词',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of os_category
-- ----------------------------
INSERT INTO `os_category` VALUES ('1', '0', '全部商品', null, '0', '1', '0', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '全部商品', null, null, null);
INSERT INTO `os_category` VALUES ('2', '1', '手机', '100', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '手机', null, null, null);
INSERT INTO `os_category` VALUES ('3', '1', '智能硬件', '200', '1', '1', '1', '2', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能硬件', null, null, null);
INSERT INTO `os_category` VALUES ('4', '1', '笔记本  平板', '300', '1', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '笔记本/平板', null, null, null);
INSERT INTO `os_category` VALUES ('5', '1', '路由器  移动电源', '400', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器/移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('6', '1', '周边配件', '500', '1', '1', '1', '2', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '周边配件', null, null, null);
INSERT INTO `os_category` VALUES ('7', '1', '耳机  音响', '600', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '耳机/音响', null, null, null);
INSERT INTO `os_category` VALUES ('8', '1', '保护套  贴膜', '700', '1', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '保护套/贴膜', null, null, null);
INSERT INTO `os_category` VALUES ('9', '1', '生活周边', '800', '1', '1', '1', '2', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '生活周边', null, null, null);
INSERT INTO `os_category` VALUES ('10', '3', '手环及配件', '10', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '手环及配件', null, null, null);
INSERT INTO `os_category` VALUES ('11', '3', '智能灯', '20', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能健康', null, null, null);
INSERT INTO `os_category` VALUES ('12', '3', '智能家居', '30', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能家居', null, null, null);
INSERT INTO `os_category` VALUES ('13', '3', '智能健康', '40', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '智能出行', null, null, null);
INSERT INTO `os_category` VALUES ('15', '4', '笔记本电脑', '10', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '笔记本电脑', null, null, null);
INSERT INTO `os_category` VALUES ('16', '4', '平板电脑', '20', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '平板电脑', null, null, null);
INSERT INTO `os_category` VALUES ('17', '5', '路由器', '10', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器', null, null, null);
INSERT INTO `os_category` VALUES ('18', '5', '移动电源', '20', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '移动电源', null, null, null);
INSERT INTO `os_category` VALUES ('19', '5', '路由器配件', '30', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '路由器配件', null, null, null);
INSERT INTO `os_category` VALUES ('20', '6', '插线板', '10', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '插线板', null, null, null);
INSERT INTO `os_category` VALUES ('21', '6', '存储卡', '20', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '存储卡', null, null, null);
INSERT INTO `os_category` VALUES ('22', '6', '移动硬盘', '30', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '移动硬盘', null, null, null);
INSERT INTO `os_category` VALUES ('23', '7', '头戴式耳机', '10', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '头戴式耳机', null, null, null);
INSERT INTO `os_category` VALUES ('24', '7', '活塞耳机', '20', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '活塞耳机', null, null, null);
INSERT INTO `os_category` VALUES ('25', '7', '蓝牙耳机', '30', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '蓝牙耳机', null, null, null);
INSERT INTO `os_category` VALUES ('26', '7', '音响', '40', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '音响', null, null, null);
INSERT INTO `os_category` VALUES ('27', '8', '贴膜', '10', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '贴膜', null, null, null);
INSERT INTO `os_category` VALUES ('28', '8', '保护套  保护壳', '20', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '保护套/保护壳', null, null, null);
INSERT INTO `os_category` VALUES ('29', '8', '移动电源保护套', '30', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '移动电源保护套', null, null, null);
INSERT INTO `os_category` VALUES ('30', '9', '箱包', '10', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '箱包', null, null, null);
INSERT INTO `os_category` VALUES ('31', '9', '服装', '20', '2', '1', '1', '0', '2017-02-25 21:44:43', '猫宁', '2017-02-25 21:44:48', '猫宁', '服装', null, null, null);

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
  `bad_count` int(255) DEFAULT NULL COMMENT '差评数',
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
INSERT INTO `os_comment` VALUES ('1', '11', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('3', '9', '1', '测试评价人1', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '3', '3', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('4', '8', '1', '测试评价人2', 'default/avatar/avatar_5.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '4', '4', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('5', '7', '1', '测试评价人3', 'default/avatar/avatar_8.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '5', '5', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('6', '6', '1', '测试评价人4', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '6', '6', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('7', '5', '1', '测试评价人5', 'default/avatar/avatar_5.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '7', '7', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('8', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('9', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '0', '2017-03-04 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('10', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('11', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('12', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('13', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('14', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('15', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('16', '1', '1', '测试评价人3', 'default/avatar/avatar_8.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '5', '5', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('17', '1', '1', '测试评价人4', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '6', '6', '1', '1', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('18', '1', '1', '测试评价人5', 'default/avatar/avatar_5.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '7', '7', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('19', '1', '1', '穿鞋子的猫', 'default/avatar/avatar_8.jpg', '1', '5', '价格实惠，外观好看，还有盒子便于保管，不错。', '52', '45', '1', '0', '2017-02-28 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');
INSERT INTO `os_comment` VALUES ('20', '1', '1', '测试评价人4', 'default/avatar/avatar_4.jpg', '1', '5', '测试评价内容，测试评价内容，测试评价内容，测试评价内容。', '6', '6', '1', '0', '2017-03-05 02:01:48', '猫宁', '2017-02-28 02:01:55', '猫宁');

-- ----------------------------
-- Table structure for os_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `os_comment_reply`;
CREATE TABLE `os_comment_reply` (
  `comment_reply_id` bigint(20) NOT NULL COMMENT '评论回复ID',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论回复表';

-- ----------------------------
-- Records of os_comment_reply
-- ----------------------------
INSERT INTO `os_comment_reply` VALUES ('1', '8', '1', '猫宁', 'default/avatar/avatar_8.jpg', '很好用啊', '10', '1', '1', '2017-03-04 15:41:37', null, '2017-03-04 15:41:40', null);
INSERT INTO `os_comment_reply` VALUES ('2', '8', '1', '猫宁', 'default/avatar/avatar_4.jpg', '测试2', '0', '1', '0', '2017-03-04 15:42:00', null, null, null);
INSERT INTO `os_comment_reply` VALUES ('3', '8', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试3', '0', '1', '0', '2017-03-04 15:42:00', null, null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

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
-- Table structure for os_navigation_bar
-- ----------------------------
DROP TABLE IF EXISTS `os_navigation_bar`;
CREATE TABLE `os_navigation_bar` (
  `navigation_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航栏ID',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `target` varchar(64) DEFAULT '_blank' COMMENT '打开方式：_blank；_parent；_self；_top',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态：1.显示；0.隐藏',
  `type` tinyint(2) DEFAULT NULL COMMENT '导航类类型',
  `code` varchar(64) DEFAULT NULL COMMENT '代码简称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='导航栏表';

-- ----------------------------
-- Records of os_navigation_bar
-- ----------------------------
INSERT INTO `os_navigation_bar` VALUES ('1', '猫宁商城', '_self', '1', 'http://localhost:8080/morning/index', '1', '4', 'loginTop', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('2', '公益频道', '_self', '2', 'http://localhost:8080/gongyi.morning/index', '1', '4', 'loginTop', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('3', '猫粉社区', '_self', '3', 'http://localhost:8080/bbs.morning/index', '1', '4', 'loginTop', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('4', '猫宁后台管理平台', '_self', '4', 'http://localhost:8080/system.morning/index', '1', '4', 'loginTop', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('5', '猫宁商城', '_self', '1', 'http://localhost:8080/morning/index', '1', '1', 'indexTop', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('6', '公益频道', '_blank', '2', 'http://localhost:8080/gongyi.morning/index', '1', '1', 'indexTop', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('7', '猫粉社区', '_blank', '3', 'http://localhost:8080/bbs.morning/index', '1', '1', 'indexTop', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('8', '猫宁后台管理平台', '_blank', '4', 'http://localhost:8080/system.morning/index', '1', '1', 'indexTop', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('9', '意见反馈', '_blank', '5', 'http://localhost:8080/morning/feedback', '1', '1', 'indexTop', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('10', '关于我们', '_blank', '6', 'http://localhost:8080/morning/about', '1', '1', 'indexTop', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('11', '猫宁商城', '_self', '1', 'http://localhost:8080/morning/index', '1', '3', 'indexBottom', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('12', '公益频道', '_blank', '2', 'http://localhost:8080/gongyi.morning/index', '1', '3', 'indexBottom', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('13', '猫粉社区', '_blank', '3', 'http://localhost:8080/bbs.morning/index', '1', '3', 'indexBottom', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('14', '猫宁后台管理平台', '_blank', '4', 'http://localhost:8080/system.morning/index', '1', '3', 'indexBottom', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('15', '意见反馈', '_blank', '5', 'http://localhost:8080/morning/feedback', '1', '3', 'indexBottom', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('16', '关于我们', '_blank', '6', 'http://localhost:8080/morning/about', '1', '3', 'indexBottom', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('17', '深圳壹基金公益基金会', '_blank', '1', 'http://www.onefoundation.cn/', '1', '2', 'indexAdvertLeft', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('18', '腾讯公益', '_blank', '2', 'http://gongyi.qq.com/', '1', '2', 'indexAdvertLeft', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('19', '中国青年志愿者网', '_blank', '3', 'http://www.zgzyz.org.cn/', '1', '2', 'indexAdvertLeft', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('20', '向日葵公益', '_blank', '4', 'http://www.sunflowerangel.org/', '1', '2', 'indexAdvertLeft', '2017-02-23 23:57:23', '猫宁', '2017-02-23 23:57:27', '猫宁', '');
INSERT INTO `os_navigation_bar` VALUES ('21', '中华爱心基金会', '_blank', '5', 'http://www.ckf.org.cn/', '1', '2', 'indexAdvertLeft', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('22', '网易公益', '_blank', '6', 'http://gongyi.163.com/', '1', '2', 'indexAdvertLeft', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('23', '平板 · 笔记本', '_blank', '1', 'list/4', '1', '5', 'indexClassify', '2017-02-24 00:04:34', '猫宁', '2017-02-24 00:04:39', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('24', '耳机 · 音响', '_blank', '2', 'list/7', '1', '5', 'indexClassify', '2017-02-24 00:06:27', '猫宁', '2017-02-24 00:06:32', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('25', '智能硬件', '_blank', '3', 'list/3', '1', '5', 'indexClassify', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('27', '生活周边', '_blank', '4', 'list/9', '1', '5', 'indexClassify', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('28', '周边配件', '_blank', '5', 'list/6', '1', '5', 'indexClassify', '2017-02-23 23:56:25', '猫宁', '2017-02-23 23:56:29', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('29', '公益频道', '_blank', '6', 'http://localhost:8080/gongyi.morning/index', '1', '5', 'indexClassify', '2017-02-23 23:52:03', '猫宁', '2017-02-23 23:52:12', '猫宁', null);
INSERT INTO `os_navigation_bar` VALUES ('30', '猫宁后台管理平台', '_blank', '7', 'http://localhost:8080/system.morning/index', '0', '5', 'indexClassify', '2017-02-23 23:53:32', '猫宁', '2017-02-23 23:53:42', '猫宁', null);

-- ----------------------------
-- Table structure for os_product
-- ----------------------------
DROP TABLE IF EXISTS `os_product`;
CREATE TABLE `os_product` (
  `product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_number` bigint(20) unsigned DEFAULT NULL COMMENT '商品编号',
  `label_id` int(10) DEFAULT NULL COMMENT '标签ID',
  `name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `show_price` decimal(10,2) DEFAULT NULL COMMENT '显示价格',
  `introduce` varchar(64) DEFAULT NULL COMMENT '商品简介',
  `search_key` varchar(255) DEFAULT NULL COMMENT '搜索关键词',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `show_in_nav` tinyint(2) DEFAULT '0' COMMENT '显示首页导航条上：1.显示；0.隐藏',
  `star_product` tinyint(2) DEFAULT '0' COMMENT '是否是明星产品：0,否；1.是',
  `status` tinyint(2) DEFAULT '0' COMMENT '商品状态：0,新增；1,上架；2,下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `shelve_time` datetime DEFAULT NULL COMMENT '上架时间',
  `shelve_by` varchar(64) DEFAULT NULL COMMENT '上架人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(255) DEFAULT NULL COMMENT '页面描述',
  `page_keyword` varchar(64) DEFAULT NULL COMMENT '页面关键词',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of os_product
-- ----------------------------
INSERT INTO `os_product` VALUES ('1', '1472581220748', '1', '小米手机5', '2299.00', '支持手机分身，能刷公交卡、银行卡', '小米5,小米手机5,小米5手机,小米 5', 'images/goods/20170226/1471798318820.png', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '小米手机5', '小米手机5 十余项黑科技，很轻狠快。骁龙820处理器，最大可选4GB内存+128GB闪存，4轴防抖相机，3D陶瓷/玻璃机身。', '小米5,小米手机5,小米5手机,小米 5,猫宁商城', null);
INSERT INTO `os_product` VALUES ('2', '1472581245880', null, '小米MIX', '3499.00', '全面屏概念手机', '小米MIX,小米手机,超大屏', 'images/goods/20170226/1471798364441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '小米MIX', '小米MIX 全面屏概念手机，开创性的在6.4寸超大屏幕上，做到了惊人的91.3%。当你点亮屏幕的一瞬间，200多万颗像素的色彩，开满了整个屏幕。', '小米MIX,猫宁商城', null);
INSERT INTO `os_product` VALUES ('3', '1472581300305', '2', '魅蓝 Note5', '1099.00', '快的更漂亮，薄的更持久', '魅蓝 Note5,魅族', 'images/goods/20170226/1471798388806.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '魅蓝 Note5', '魅蓝 Note5，正品行货，另有魅蓝 Note5详细介绍、图片、价格、参数、售前咨询等，购买魅蓝 Note5上魅族商城，全场包邮，7天无理由退货，15天换货保障。', '魅蓝 Note5,魅族,猫宁商城', null);
INSERT INTO `os_product` VALUES ('4', '1472583774201', '3', '小米手环 2', '149.00', '看得见的时刻，和你的每一步', '小米手环2,小米手环2代,手环,智能手环', 'images/goods/20170226/1471798568000.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '小米手环2', '全新的小米手环 2，加入了 OLED 显示屏，通过轻触圆形按键，即可显示当前时间、步数、心率，甚至里程、热量等更多数据。当不方便触控操作时，抬起手腕，手环便可自动显示当前时间，轻松便捷。', '小米手环2,小米手环2代,猫宁商城', null);
INSERT INTO `os_product` VALUES ('5', '1472583831117', null, '魅族手环', '229.00', '腕间流动的心率专家', '魅族手环,魅族,手环,智能手环', 'images/goods/20170226/1471798587971.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '魅族手环', '魅族手环，腕间流动的心率专家，正品行货，另有魅族手环详细介绍、图片、价格、参数、售前咨询等，购买魅族手环上魅族商城，全场包邮，7天无理由退货，15天换货保障。', '魅族手环,魅族,手环,智能手环,猫宁商城', null);
INSERT INTO `os_product` VALUES ('6', '1472628630086', null, 'LED 智能台灯', '169.00', '照明之上，光的艺术品', '小米台灯,小米LED灯,LED小米灯,小米 LED灯', 'images/goods/20170226/1471798587451.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', 'LED 智能台灯', '米家LED智能台灯的色温与亮度可以无级调节，几乎可以满足用户对光线的所有需求。还针对最常见的四种使用场景单独做了光线优化，专注保护用户的双眼。', '小米台灯,小米LED灯,LED小米灯,小米 LED灯,猫宁商城', null);
INSERT INTO `os_product` VALUES ('7', '1472736931796', null, 'Yeelight床头灯', '249.00', '触摸式操作 给卧室1600万种颜色', 'Yeelight床头灯,床头灯,智能灯', 'images/goods/20170226/1471799887971.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', 'Yeelight床头灯', '小米手机官网正品智能灯推荐，小米手机Yeelight床头灯最新价格249元，有多种颜色可选，另有Yeelight床头灯详细介绍及图片，还有用户评价，售前咨询等。', 'Yeelight床头灯,床头灯,智能灯,猫宁商城', null);
INSERT INTO `os_product` VALUES ('8', '1473318741286', null, 'Yeelight LED智能灯泡', '99.00', '亮度自由调节 WIFI远程操作', 'Yeelight LED智能灯泡 白光版,智能灯泡', 'images/goods/20170226/1471798581451.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', 'Yeelight LED智能灯泡', 'Yeelight LED 智能灯泡,亮度自由调节 WIFI远程操作', 'Yeelight LED智能灯泡 白光版,智能灯泡,猫宁商城', null);
INSERT INTO `os_product` VALUES ('9', '1473685327798', null, '测试商品名称1', '166.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称1', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('10', '1474910562755', null, '测试商品名称2', '223.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称2', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('11', '1475353900453', '4', '测试商品名称3', '166.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称3', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('12', '1475353918562', null, '测试商品名称4', '124.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称4', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('13', '1475354006972', null, '测试商品名称5', '249.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称5', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('14', '1475407186147', null, '测试商品名称6', '219.00', '测试描述，测试商品描述，测试商品描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称6', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('15', '1475947762038', null, '测试商品名称7', '2366.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '1', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称7', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('16', '1475996329018', null, '测试商品名称8', '2499.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称8', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('17', '1477472951669', null, '测试商品名称9', '2188.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称9', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('18', '1478099883634', '1', '测试商品名称10', '249.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称10', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('19', '1478522533460', null, '测试商品名称11', '1300.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称11', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('20', '1478527872182', null, '测试商品名称12', '179.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称12', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('21', '1478680540669', null, '测试商品名称13', '6429.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称13', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('22', '1478682438293', null, '测试商品名称14', '2416.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称14', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('23', '1478682709405', null, '测试商品名称15', '219.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称15', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('24', '1478682831935', null, '测试商品名称16', '295.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称16', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('25', '1478682893916', null, '测试商品名称17', '2164.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称17', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('26', '1478683391099', null, '测试商品名称18', '146.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称18', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('27', '1478683407372', null, '测试商品名称19', '26.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称19', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('28', '1478683468241', null, '测试商品名称20', '4974.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称20', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('29', '1478683468246', null, '测试商品名称21', '265.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称21', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('30', '1478683468279', null, '测试商品名称22', '259.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称22', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('31', '1478689468277', null, '测试商品名称23', '789.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称23', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('32', '1478689468979', null, '测试商品名称24', '456.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称24', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('33', '1478689448279', null, '测试商品名称25', '7845.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称25', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');
INSERT INTO `os_product` VALUES ('34', '1478689468679', null, '测试商品名称26', '1548.00', '测试描述，测试商品描述', '测试搜索，测试商品搜索', 'images/goods/20170226/1471797894441.jpg', '1', '0', '1', '2017-02-25 21:44:43', '猫宁', null, null, '2017-02-25 21:44:48', '猫宁', '测试商品名称26', '测试商品页面描述,测试商品页面描述', '测试商品页面关键词', '');

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
INSERT INTO `os_product_attribute` VALUES ('1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `os_product_attribute` VALUES ('2', '2', '2', '2', '2', '2', '2', '1', '2', '2');
INSERT INTO `os_product_attribute` VALUES ('3', '3', '3', '3', '3', '3', '3', '1', '3', '3');
INSERT INTO `os_product_attribute` VALUES ('4', '4', '4', '4', '4', '4', '4', '1', '4', '4');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='商品表分类表关联表';

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
INSERT INTO `os_product_category` VALUES ('25', '25', '27', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('26', '26', '28', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('27', '27', '29', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('28', '28', '30', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('29', '29', '30', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('30', '30', '30', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('31', '31', '31', '2017-02-26 13:52:17', '猫宁');
INSERT INTO `os_product_category` VALUES ('36', '4', '12', '2017-02-27 01:51:38', '猫宁');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of os_product_detail
-- ----------------------------

-- ----------------------------
-- Table structure for os_product_image
-- ----------------------------
DROP TABLE IF EXISTS `os_product_image`;
CREATE TABLE `os_product_image` (
  `pic_img_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
-- Table structure for os_question
-- ----------------------------
DROP TABLE IF EXISTS `os_question`;
CREATE TABLE `os_question` (
  `question_id` bigint(20) NOT NULL COMMENT '提问ID',
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
  `answer_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间',
  `type` tinyint(2) DEFAULT '0' COMMENT '状态：1.已处理；0.未处理；2.不予处理',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提问表';

-- ----------------------------
-- Records of os_question
-- ----------------------------
INSERT INTO `os_question` VALUES ('1', '1', '1', '猫宁', 'default/avatar/avatar_8.jpg', '商城的所有产品必须超过150免邮配送么', '4', '1', '2017-03-05 01:09:03', '猫宁', '您好，购买手机是免邮的~购买配件等商品在150元以下，需按照10元/单标准支付邮费， “满150元免邮费”需以实际支付金额超过150元为准。小米电视、空气净化器、体重秤因商品特殊性不参与满150元包邮活动。如遇活动期，资费标准以活动公告为准哦，感谢您对小米的支持，祝您购物愉快~', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('2', '1', '1', '猫宁', 'default/avatar/avatar_4.jpg', '邮费多少', '56', '1', '2017-03-05 01:09:03', '猫宁', '您好，购买手机是免邮的~购买配件等商品在150元以下，需按照10元/单标准支付邮费， “满150元免邮费”需以实际支付金额超过150元为准。小米电视、空气净化器、体重秤因商品特殊性不参与满150元包邮活动。如遇活动期，资费标准以活动公告为准哦，感谢您对小米的支持，祝您购物愉快~', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('3', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:04', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('4', '1', '1', '猫宁', 'default/avatar/avatar_8.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('5', '1', '1', '猫宁', 'default/avatar/avatar_4.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('6', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:05', '1', '猫宁', '2017-03-05 01:09:38');
INSERT INTO `os_question` VALUES ('7', '1', '1', '猫宁', 'default/avatar/avatar_5.jpg', '测试提问', '56', '1', '2017-03-05 01:09:03', '猫宁', '测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问，测试提问。', '猫宁', '2017-03-05 01:11:08', '1', '猫宁', '2017-03-05 01:09:38');

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
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别：0.保密；1.男； 2.女',
  `age` tinyint(4) DEFAULT '0' COMMENT '年龄',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0.冻结；1.正常；2.删除',
  `email_is_active` tinyint(1) DEFAULT '0' COMMENT '邮箱激活：0.未激活；1.已激活；',
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of os_user
-- ----------------------------
INSERT INTO `os_user` VALUES ('1', '14875975007231277', '穿鞋子的猫', '289d1f89b1a93395267bac0af18bd916', 'IeA7iu', '陈星星', '0', '0', 'default/avatar/avatar_8.jpg', '1', '1', '810170512@qq.com', '18857105127', '2017-02-22 23:48:19', '172.18.50.54', '9', '2017-02-21 15:19:07', null, '2017-02-24 01:53:02', '穿鞋子的猫', null, null, '0');
INSERT INTO `os_user` VALUES ('8', '148777295260796', '陈星星', '0fb10cf407bc90a8f6c4c2299aeb0b2c', 'jmslV1', '陈星星', '0', '0', 'default/avatar/avatar_4.jpg', '1', '1', '55245511@qq.com', '18857105120', '2017-02-22 22:16:24', '172.27.201.108', '1', '2017-02-22 22:15:53', '陈星星', null, null, '0', null, '0');
INSERT INTO `os_user` VALUES ('12', '148777481346536', '陈星星', 'e00d4e98d017fcf9a3b41a341c2bcd30', 'uN2Gdw', '陈星星', '0', '0', 'default/avatar/avatar_5.jpg', '1', '1', '55245521@qq.com', '18857105137', null, null, '0', '2017-02-22 22:46:53', '陈星星', null, null, '0', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户登录表';

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
