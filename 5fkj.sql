/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : 5fkj

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 16/08/2021 00:08:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 5fkj_admin
-- ----------------------------
DROP TABLE IF EXISTS `5fkj_admin`;
CREATE TABLE `5fkj_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `head_image` bigint(20) NULL DEFAULT NULL COMMENT '头像',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录密码',
  `login_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `login_times` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `group_id` tinyint(4) NULL DEFAULT NULL COMMENT '所属用户组',
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '所属公司',
  `sex` enum('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '3' COMMENT '性别：1-男，2-女，3-保密',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 0-禁用 1-启用 默认1',
  `login_time` int(11) NULL DEFAULT 0 COMMENT '最后登陆时间',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 5fkj_admin
-- ----------------------------
INSERT INTO `5fkj_admin` VALUES (6, '45754754', 'erre', 'eryre', 0, 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, 2, 1, '2', 1, 0, 1628500530, 1628500562, 0);

-- ----------------------------
-- Table structure for 5fkj_farmer
-- ----------------------------
DROP TABLE IF EXISTS `5fkj_farmer`;
CREATE TABLE `5fkj_farmer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '土地地址',
  `number` int(11) NULL DEFAULT 0 COMMENT '农机数量',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '农机类型id',
  `service_id` int(11) NOT NULL COMMENT '流转类型id',
  `year` int(11) NULL DEFAULT NULL COMMENT '租期',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `video` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '视频',
  `picture` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '图片',
  `view` int(11) NULL DEFAULT 0 COMMENT '游览量',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '介绍',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '所属机构',
  `user_name` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `type` enum('1','2','3','4') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '审核状态:1-待审核，2-驳回，3-未完善，4-正常',
  `status` enum('1','-1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '状态:1-显示，-1-隐藏',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE COMMENT '土地类型id',
  INDEX `lation_id`(`service_id`) USING BTREE COMMENT '流转类型id',
  INDEX `user_id`(`user_id`) USING BTREE COMMENT '用户id',
  INDEX `company_id`(`company_id`) USING BTREE COMMENT '所属机构id'
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '土地流转表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 5fkj_farmer
-- ----------------------------
INSERT INTO `5fkj_farmer` VALUES (8, '四川省巴中市', 45, 5, 5, 35, 45.00, '/storage/video/20210807\\df4b658b2c8e2d962b0d7fd20de68fae.mp4', '/storage/expert/20210807\\e840b8f60602c54969995a89d91b3367.jpg,/storage/expert/20210807\\ce9b33563ba8b4bb039dca4c1ef314b5.jpg,/storage/expert/20210807\\7db6db0873c53870d4a19031235c05b2.jpg', 0, '这是土地', NULL, NULL, NULL, NULL, '1', '1', 1628346229, 1628346229, 0);
INSERT INTO `5fkj_farmer` VALUES (12, '为', 56, 6, 5, 45, 56.00, '/storage/video/20210808\\6b41882b22b83e1a7eb3ef07b47b6248.mp4', '/storage/expert/20210808\\e4cd1f12771115ae2e7a4b53ee725906.jpg,/storage/expert/20210808\\107d06e5d21d5414c47733d4f550d579.jpg,/storage/expert/20210808\\e4f5b10258be9f545c74c22589fc093e.jpg', 0, '这是土地123', NULL, NULL, NULL, NULL, '1', '1', 1628349998, 1628429744, 0);

-- ----------------------------
-- Table structure for 5fkj_farmer_service
-- ----------------------------
DROP TABLE IF EXISTS `5fkj_farmer_service`;
CREATE TABLE `5fkj_farmer_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '农机服务类型名称',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改日期',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态(1显示,-1隐藏)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '农机服务类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 5fkj_farmer_service
-- ----------------------------
INSERT INTO `5fkj_farmer_service` VALUES (5, '农机出租', 1628434448, 1628434448, 1);
INSERT INTO `5fkj_farmer_service` VALUES (6, '农机维修', 1628434461, 1628434461, 1);
INSERT INTO `5fkj_farmer_service` VALUES (7, '农机作业', 1628434471, 1628434471, 1);

-- ----------------------------
-- Table structure for 5fkj_farmer_type
-- ----------------------------
DROP TABLE IF EXISTS `5fkj_farmer_type`;
CREATE TABLE `5fkj_farmer_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '农机类型名称',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改日期',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态(1显示,-1隐藏)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '农机类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 5fkj_farmer_type
-- ----------------------------
INSERT INTO `5fkj_farmer_type` VALUES (4, '植保机械', 1628433310, 1628433310, 1);
INSERT INTO `5fkj_farmer_type` VALUES (5, '收播机械', 1628433330, 1628433330, 1);
INSERT INTO `5fkj_farmer_type` VALUES (6, '农用动力机械', 1628433349, 1628433349, 1);
INSERT INTO `5fkj_farmer_type` VALUES (7, '耕作机械', 1628433361, 1628433361, 1);

-- ----------------------------
-- Table structure for 5fkj_land
-- ----------------------------
DROP TABLE IF EXISTS `5fkj_land`;
CREATE TABLE `5fkj_land`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '土地地址',
  `mu` float(255, 2) NULL DEFAULT NULL COMMENT '面积',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '土地类型id',
  `lation_id` int(11) NOT NULL COMMENT '流转类型id',
  `year` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '土地使用年限',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `video` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '视频',
  `picture` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '图片',
  `view` int(11) NULL DEFAULT 0 COMMENT '游览量',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '介绍',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '所属机构',
  `user_name` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `type` enum('1','2','3','4') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '土地审核状态:1-待审核，2-驳回，3-未完善，4-正常',
  `status` enum('1','-1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '土地状态:1-显示，-1-隐藏',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE COMMENT '土地类型id',
  INDEX `lation_id`(`lation_id`) USING BTREE COMMENT '流转类型id',
  INDEX `user_id`(`user_id`) USING BTREE COMMENT '用户id',
  INDEX `company_id`(`company_id`) USING BTREE COMMENT '所属机构id'
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '土地流转表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 5fkj_land
-- ----------------------------
INSERT INTO `5fkj_land` VALUES (8, '四川省巴中市', 45.00, 1, 1, '35', 45.00, '/storage/video/20210807\\df4b658b2c8e2d962b0d7fd20de68fae.mp4', '/storage/expert/20210807\\e840b8f60602c54969995a89d91b3367.jpg,/storage/expert/20210807\\ce9b33563ba8b4bb039dca4c1ef314b5.jpg,/storage/expert/20210807\\7db6db0873c53870d4a19031235c05b2.jpg', 0, '这是土地', NULL, NULL, NULL, NULL, '1', '1', 1628346229, 1628346229, 0);
INSERT INTO `5fkj_land` VALUES (9, '四川省成都市', 12.00, 1, 1, '12', 34.00, '/storage/video/20210807\\15316138592c9da05460fb7a64f34901.mp4', '/storage/expert/20210807\\c1e406a8f13e8c6f19b5b133c3106f36.jpg,/storage/expert/20210807\\652f1a4bb5312a8c392e4f8648e43709.jpg,/storage/expert/20210807\\6ad3f4ae58107d98cf555fd714aa90ec.jpg', 0, '这是土地', NULL, NULL, NULL, NULL, '1', '-1', 1628346450, 1628422624, 1628422624);
INSERT INTO `5fkj_land` VALUES (10, '四川省成都市锦江区', 23.00, 1, 1, '34', 23.00, '/storage/video/20210808\\94d5173a352873e0f76f23a719c6cd03.mp4', '/storage/expert/20210807\\f1742b3ea3ff52dc0300c929b7e430f1.jpg', 0, '', NULL, NULL, NULL, NULL, '1', '1', 1628347173, 1628429858, 1628429858);
INSERT INTO `5fkj_land` VALUES (11, '四川省南充市', 12.00, 1, 1, '12', 34.00, '', NULL, 0, '', NULL, NULL, NULL, NULL, '1', '1', 1628349651, 1628429858, 1628429858);
INSERT INTO `5fkj_land` VALUES (12, '为', 56.00, 1, 1, '45', 56.00, '/storage/video/20210808\\6b41882b22b83e1a7eb3ef07b47b6248.mp4', '/storage/expert/20210808\\e4cd1f12771115ae2e7a4b53ee725906.jpg,/storage/expert/20210808\\107d06e5d21d5414c47733d4f550d579.jpg,/storage/expert/20210808\\e4f5b10258be9f545c74c22589fc093e.jpg', 0, '这是土地123', NULL, NULL, NULL, NULL, '1', '1', 1628349998, 1628432947, 0);

-- ----------------------------
-- Table structure for 5fkj_land_lationtype
-- ----------------------------
DROP TABLE IF EXISTS `5fkj_land_lationtype`;
CREATE TABLE `5fkj_land_lationtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '流转类型名称',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改日期',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态(1显示,-1隐藏)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '土地流转类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 5fkj_land_lationtype
-- ----------------------------
INSERT INTO `5fkj_land_lationtype` VALUES (1, '出租', 1628067452, 1628067452, 1);
INSERT INTO `5fkj_land_lationtype` VALUES (2, '转让', 1628067452, 1628067452, 1);
INSERT INTO `5fkj_land_lationtype` VALUES (3, '转包', 1628067452, 1628067452, 1);

-- ----------------------------
-- Table structure for 5fkj_land_type
-- ----------------------------
DROP TABLE IF EXISTS `5fkj_land_type`;
CREATE TABLE `5fkj_land_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '土地类型名称',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改日期',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态(1显示,-1隐藏)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '土地类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 5fkj_land_type
-- ----------------------------
INSERT INTO `5fkj_land_type` VALUES (1, '耕地', 1628067452, 1628067452, 1);
INSERT INTO `5fkj_land_type` VALUES (2, '商业及住宅', 1628067452, 1628067452, -1);
INSERT INTO `5fkj_land_type` VALUES (3, '水域', 1628067452, 1628161307, -1);
INSERT INTO `5fkj_land_type` VALUES (6, '建设用地', 1628067452, 1628067452, 1);
INSERT INTO `5fkj_land_type` VALUES (7, '养殖用地', 1628067452, 1628067452, 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色名称',
  `auth_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限id',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (6, '超级管理员', '15,17,18,19,16,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1615529426, 1615529426);
INSERT INTO `auth_group` VALUES (8, '管理员', '15,17,18,16,20,21,22,23,24,25,26,27,28,29', 1615529928, 1615529928);
INSERT INTO `auth_group` VALUES (10, '普通管理员', '15,17,18,19,16,20,21,22,23,24,25,26,27,28,29', 1629040062, 1629040062);

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '控制器方法',
  `pid` tinyint(4) NULL DEFAULT NULL COMMENT '父id',
  `icon` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `title` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1->菜单,2->按钮',
  `sort` mediumint(8) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES (15, '', 0, 'layui-icon-set-fill', '权限管理', 1, 0, 1615454225, 1615454225);
INSERT INTO `auth_rule` VALUES (16, '', 0, 'layui-icon-read', '内容管理', 1, 0, 1615454275, 1615454275);
INSERT INTO `auth_rule` VALUES (17, 'Group/index', 15, 'layui-icon-group', '角色组', 1, 0, 1615454346, 1615548341);
INSERT INTO `auth_rule` VALUES (18, 'Rule/index', 15, 'layui-icon-align-left', '菜单规则', 1, 0, 1615454398, 1615454398);
INSERT INTO `auth_rule` VALUES (19, 'User/index', 15, 'layui-icon-friends', '管理员管理', 1, 0, 1615454447, 1615454447);
INSERT INTO `auth_rule` VALUES (20, '', 16, 'layui-icon-star', '气象服务', 1, 0, 1615454486, 1615454486);
INSERT INTO `auth_rule` VALUES (21, 'Meteorological/index', 20, 'layui-icon-rate-solid', '气象栏目', 1, 0, 1615454546, 1615454546);
INSERT INTO `auth_rule` VALUES (22, 'Meteorological/articleIndex', 20, 'layui-icon-vercode', '气象文章列表', 1, 0, 1615454577, 1615454577);
INSERT INTO `auth_rule` VALUES (23, '', 16, 'layui-icon-password', '政策栏目', 1, 0, 1615454606, 1615454606);
INSERT INTO `auth_rule` VALUES (24, 'Policies/listCate', 23, 'layui-icon-snowflake', '政策法规', 1, 0, 1615454635, 1615454635);
INSERT INTO `auth_rule` VALUES (25, 'Policies/listIndex', 23, 'layui-icon-template-1', '政策法规文章', 1, 0, 1615454666, 1615454666);
INSERT INTO `auth_rule` VALUES (26, '', 16, '', '农业技术服务', 1, 0, 1615548914, 1615548914);
INSERT INTO `auth_rule` VALUES (27, 'Technology/category', 26, '', '品种分类', 1, 0, 1615548964, 1615549176);
INSERT INTO `auth_rule` VALUES (28, 'Service/index', 26, '', '农业技术服务栏目', 1, 0, 1615549409, 1615549409);
INSERT INTO `auth_rule` VALUES (29, 'PolicyArticles/index', 26, '', '农业技术服务文章', 1, 0, 1615549604, 1615549604);
INSERT INTO `auth_rule` VALUES (30, '', 0, 'layui-icon-group', '专家', 1, 0, 1615549631, 1615549789);
INSERT INTO `auth_rule` VALUES (31, 'ExpertCate/index', 30, '', '专家分类', 1, 0, 1615549650, 1615549650);
INSERT INTO `auth_rule` VALUES (32, 'Expert/index', 30, '', '专家列表', 1, 0, 1615549671, 1615549671);
INSERT INTO `auth_rule` VALUES (33, '', 0, 'layui-icon-chart', '价格统计', 1, 0, 1615549693, 1615549816);
INSERT INTO `auth_rule` VALUES (34, 'Statistics/index', 33, '', '统计人员', 1, 0, 1615549721, 1615549721);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (13, '2021_03_28_054859_create_5fkj_admin_table', 1);
INSERT INTO `migrations` VALUES (14, '2021_03_28_073425_create_5fkj_company_table', 1);
INSERT INTO `migrations` VALUES (15, '2021_03_28_122710_create_5fkj_group_table', 1);
INSERT INTO `migrations` VALUES (16, '2021_03_28_125512_create_5fkj_rule_table', 1);

SET FOREIGN_KEY_CHECKS = 1;
