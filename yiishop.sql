/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : yiishop

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-11-19 23:53:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ym_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ym_admin`;
CREATE TABLE `ym_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) NOT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) NOT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `vip_lv` int(11) NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理表';

-- ----------------------------
-- Records of ym_admin
-- ----------------------------
INSERT INTO `ym_admin` VALUES ('2', 'admin', 'NuLWk2cZvKmXypp9r0xC6OhIyg94-IB9', '$2y$13$A4IQqPJN5ld84BLMJY3FuOd1lEO05SpOvG/ePn8lFtKuTCDDUuxrG', '', '', 'test@163.com', '10', '10', '', '0', '1490617774', '1490617774');
INSERT INTO `ym_admin` VALUES ('3', 'test', 'YobQuKH_QuDSqPXTg1UA1TBB9vSB94u4', '$2y$13$xDHLqWVBP8omW5GVn/Nep.BERWGfBUs3AEnqokp40/io6haNKnACi', '', '', 'test@qq.com', '10', '10', '', '0', '1491065783', '1491065783');

-- ----------------------------
-- Table structure for `ym_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `ym_auth_assignment`;
CREATE TABLE `ym_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `ym_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `ym_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_auth_assignment
-- ----------------------------
INSERT INTO `ym_auth_assignment` VALUES ('管理员', '2', '1491062854');

-- ----------------------------
-- Table structure for `ym_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `ym_auth_item`;
CREATE TABLE `ym_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `ym_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `ym_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_auth_item
-- ----------------------------
INSERT INTO `ym_auth_item` VALUES ('/*', '2', null, null, null, '1491062646', '1491062646');
INSERT INTO `ym_auth_item` VALUES ('/admin/*', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1491062642', '1491062642');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1491062643', '1491062643');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/brand/*', '2', null, null, null, '1491067234', '1491067234');
INSERT INTO `ym_auth_item` VALUES ('/brand/create', '2', null, null, null, '1491067234', '1491067234');
INSERT INTO `ym_auth_item` VALUES ('/brand/delete', '2', null, null, null, '1491067234', '1491067234');
INSERT INTO `ym_auth_item` VALUES ('/brand/index', '2', null, null, null, '1491067234', '1491067234');
INSERT INTO `ym_auth_item` VALUES ('/brand/update', '2', null, null, null, '1491067234', '1491067234');
INSERT INTO `ym_auth_item` VALUES ('/brand/view', '2', null, null, null, '1491067234', '1491067234');
INSERT INTO `ym_auth_item` VALUES ('/category-group/*', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/category-group/create', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/category-group/delete', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/category-group/index', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/category-group/update', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/category-group/view', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/debug/*', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1491062644', '1491062644');
INSERT INTO `ym_auth_item` VALUES ('/gii/*', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/goods-category/*', '2', null, null, null, '1491280346', '1491280346');
INSERT INTO `ym_auth_item` VALUES ('/goods-category/create', '2', null, null, null, '1491280346', '1491280346');
INSERT INTO `ym_auth_item` VALUES ('/goods-category/delete', '2', null, null, null, '1491280346', '1491280346');
INSERT INTO `ym_auth_item` VALUES ('/goods-category/index', '2', null, null, null, '1491280345', '1491280345');
INSERT INTO `ym_auth_item` VALUES ('/goods-category/update', '2', null, null, null, '1491280346', '1491280346');
INSERT INTO `ym_auth_item` VALUES ('/goods-category/upload', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/goods-category/view', '2', null, null, null, '1491280345', '1491280345');
INSERT INTO `ym_auth_item` VALUES ('/site/*', '2', null, null, null, '1491062646', '1491062646');
INSERT INTO `ym_auth_item` VALUES ('/site/error', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/site/get-categorys', '2', null, null, null, '1511098591', '1511098591');
INSERT INTO `ym_auth_item` VALUES ('/site/index', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/site/login', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('/site/logout', '2', null, null, null, '1491062645', '1491062645');
INSERT INTO `ym_auth_item` VALUES ('商品修改权限', '2', '商品修改权限', null, null, '1491062738', '1491062738');
INSERT INTO `ym_auth_item` VALUES ('管理员', '1', '系统管理员，拥有一切权限', null, null, '1491062820', '1491062820');

-- ----------------------------
-- Table structure for `ym_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `ym_auth_item_child`;
CREATE TABLE `ym_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `ym_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `ym_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ym_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `ym_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_auth_item_child
-- ----------------------------
INSERT INTO `ym_auth_item_child` VALUES ('商品修改权限', '/*');
INSERT INTO `ym_auth_item_child` VALUES ('管理员', '商品修改权限');

-- ----------------------------
-- Table structure for `ym_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `ym_auth_rule`;
CREATE TABLE `ym_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `ym_brand`
-- ----------------------------
DROP TABLE IF EXISTS `ym_brand`;
CREATE TABLE `ym_brand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(80) NOT NULL DEFAULT '' COMMENT '品牌logo',
  `desc` text NOT NULL COMMENT '品牌描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌地址',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `cat_name` varchar(128) DEFAULT '' COMMENT '品牌分类',
  `parent_cat_id` int(11) DEFAULT '0' COMMENT '分类id',
  `cat_id` int(10) DEFAULT '0' COMMENT '分类id',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_brand
-- ----------------------------
INSERT INTO `ym_brand` VALUES ('1', '华为/HUAWEI', '/Public/upload/brand/2016/04-01/1584936.jpg', '1111111111', '', '50', '手机、数码、配件', '1', '12', '0');
INSERT INTO `ym_brand` VALUES ('2', '摩托罗拉/MOTOROLA', '/Public/upload/brand/2016/04-01/2309646.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('3', '小辣椒', '/Public/upload/brand/2016/04-01/3213983.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('4', '索尼/SONY', '/Public/upload/brand/2016/04-01/4178854.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('5', '诺基亚/NOKIA', '/Public/upload/brand/2016/04-01/5498254.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('6', 'TCL', '/Public/upload/brand/2016/04-01/6592544.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('7', '飞利浦/PHILIPS', '/Public/upload/brand/2016/04-01/7956109.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('8', 'OPPO', '/Public/upload/brand/2016/04-01/8351889.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('9', '苹果/Apple', '/Public/upload/brand/2016/04-01/9515283.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('10', 'HTC', '/Public/upload/brand/2016/04-01/10479934.jpg', '', '', '50', '手机、数码、配件', '1', '1', '0');
INSERT INTO `ym_brand` VALUES ('11', '首信/capital', '/Public/upload/brand/2016/04-01/11887884.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('12', '东信/EASTCOM', '/Public/upload/brand/2016/04-01/12396603.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('13', '纽曼/Newsmy', '/Public/upload/brand/2016/04-01/13945397.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('14', '海尔/Haier', '/Public/upload/brand/2016/04-01/14393692.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('15', '三星/SAMSUNG', '/Public/upload/brand/2016/04-01/15993682.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('16', '万利达/malata', '/Public/upload/brand/2016/04-01/16509872.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('17', '现代/HYUNDAI', '/Public/upload/brand/2016/04-01/17747973.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('18', 'E人E本', '/Public/upload/brand/2016/04-01/18305691.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('19', '海信/Hisense', '/Public/upload/brand/2016/04-01/19907879.jpg', '', '', '50', '手机、数码、配件', '2', '0', '0');
INSERT INTO `ym_brand` VALUES ('20', '喜之郎/STRONG', '/Public/upload/brand/2016/04-01/20438571.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('21', '阿尔卑斯/Alpenliebe', '/Public/upload/brand/2016/04-01/21232385.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('22', '春光/chun guang', '/Public/upload/brand/2016/04-01/22637808.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('23', '潘高寿', '/Public/upload/brand/2016/04-01/23714849.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('24', '皇冠/Danisa', '/Public/upload/brand/2016/04-01/24379574.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('25', '波力/PO-LI', '/Public/upload/brand/2016/04-01/25158007.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('26', '张二嘎', '/Public/upload/brand/2016/04-01/26461917.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('27', '怡达/yida', '/Public/upload/brand/2016/04-01/27948968.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('28', '母亲', '/Public/upload/brand/2016/04-01/28979757.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('29', '品客/Pringles', '/Public/upload/brand/2016/04-01/29834216.jpg', '', '', '50', '零食特产、粮油', '3', '0', '0');
INSERT INTO `ym_brand` VALUES ('30', '乐事/Lay s', '/Public/upload/brand/2016/04-01/30199893.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('31', '多力多滋/Doritos', '/Public/upload/brand/2016/04-01/31794610.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('32', '康师傅/Master Kong', '/Public/upload/brand/2016/04-01/32635995.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('33', '百味林', '/Public/upload/brand/2016/04-01/33320385.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('34', '绿帝/green king', '/Public/upload/brand/2016/04-01/34723611.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('35', '上好佳/Oishi', '/Public/upload/brand/2016/04-01/35786151.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('36', '立丰/lifefun', '/Public/upload/brand/2016/04-01/36895162.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('37', '华味亨', '/Public/upload/brand/2016/04-01/37725891.jpg', '', '', '50', '零食特产、粮油', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('38', '桂格/QUAKER', '/Public/upload/brand/2016/04-01/38654946.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('39', '卡夫/KRAFT', '/Public/upload/brand/2016/04-01/39107965.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('40', '维维', '/Public/upload/brand/2016/04-01/40154135.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('41', '阿华田/Ovaltine', '/Public/upload/brand/2016/04-01/41110107.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('42', '晨光/MG', '/Public/upload/brand/2016/04-01/42865774.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('43', '伊利', '/Public/upload/brand/2016/04-01/43194427.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('44', '顶好/Soyfresh', '/Public/upload/brand/2016/04-01/44859786.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('45', '银鹭', '/Public/upload/brand/2016/04-01/45582409.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('46', '李子园', '/Public/upload/brand/2016/04-01/46877969.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('47', '田园/COUNTRY GOODNESS', '/Public/upload/brand/2016/04-01/47229913.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('48', '生机谷/LIVING PLANET', '/Public/upload/brand/2016/04-01/48508993.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('49', '帕斯卡/PASCUAL', '/Public/upload/brand/2016/04-01/49202172.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('50', '喜乐', '/Public/upload/brand/2016/04-01/50663406.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('51', '欧德堡/OLDENBURGER', '/Public/upload/brand/2016/04-01/51748797.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('52', '德运/Devondale', '/Public/upload/brand/2016/04-01/52648629.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('53', '天香', '/Public/upload/brand/2016/04-01/53178771.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('54', '风行', '/Public/upload/brand/2016/04-01/54643960.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('55', '雀巢/Nestle', '/Public/upload/brand/2016/04-01/55935455.jpg', '', '', '50', '茶冲乳品、酒水、饮料', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('56', '顶好/Soyfresh', '/Public/upload/brand/2016/04-01/56575570.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('57', '三得利/SUNTORY', '/Public/upload/brand/2016/04-01/57371582.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('58', '田园/COUNTRY GOODNESS', '/Public/upload/brand/2016/04-01/58791506.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('59', '生机谷/LIVING PLANET', '/Public/upload/brand/2016/04-01/59424261.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('60', '帕斯卡/PASCUAL', '/Public/upload/brand/2016/04-01/60936691.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('61', '葛兰纳诺/GRANAROLO', '/Public/upload/brand/2016/04-01/61189978.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('62', '南阳', '/Public/upload/brand/2016/04-01/62627920.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('63', '纽瑞滋/Nouriz', '/Public/upload/brand/2016/04-01/63199591.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('64', '安佳/Anchor', '/Public/upload/brand/2016/04-01/64128866.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('65', '欧德堡/OLDENBURGER', '/Public/upload/brand/2016/04-01/65393334.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('66', '德运/Devondale', '/Public/upload/brand/2016/04-01/66125076.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('67', '康维多/Primavita', '/Public/upload/brand/2016/04-01/67795819.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('68', '多美鲜/Suki', '/Public/upload/brand/2016/04-01/68598971.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('69', '深蓝健康/DEEP BLUE HEALTH', '/Public/upload/brand/2016/04-01/69391027.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('70', '贝尔/BEIER', '/Public/upload/brand/2016/04-01/70604849.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('71', '兰诺斯/Lemnos', '/Public/upload/brand/2016/04-01/71497320.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('72', '瑞慕/swiss mooh', '/Public/upload/brand/2016/04-01/72743881.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('73', '艾美/Emmi', '/Public/upload/brand/2016/04-01/73942431.jpg', '', '', '50', '进口食品、进口牛奶', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('74', '卡姿兰/CARSLAN', '/Public/upload/brand/2016/04-01/74239114.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('75', '老中医', '/Public/upload/brand/2016/04-01/75738470.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('76', '大宝/Dabao', '/Public/upload/brand/2016/04-01/76310470.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('77', '相宜本草/INOHERB', '/Public/upload/brand/2016/04-01/77556921.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('78', '兰蔻/LANCOME', '/Public/upload/brand/2016/04-01/78349746.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('79', '碧欧泉/BIOTHERM', '/Public/upload/brand/2016/04-01/79703643.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('80', '倩碧/CLINIQUE', '/Public/upload/brand/2016/04-01/80395614.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('81', '芳珂/Fancl', '/Public/upload/brand/2016/04-01/81893872.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('82', '兰芝/LANEIGE', '/Public/upload/brand/2016/04-01/82908621.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('83', '泊美/PUREMILD', '/Public/upload/brand/2016/04-01/83927215.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('84', '近江蔓莎', '/Public/upload/brand/2016/04-01/84746188.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('85', '丹姿/DANZ', '/Public/upload/brand/2016/04-01/85462658.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('86', '郁美净', '/Public/upload/brand/2016/04-01/86537612.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('87', '昭贵', '/Public/upload/brand/2016/04-01/87593560.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('88', '欧莱雅/L OREAL', '/Public/upload/brand/2016/04-01/88659066.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('89', '京润珍珠', '/Public/upload/brand/2016/04-01/89922656.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('90', '隆力奇/LONGLIQI', '/Public/upload/brand/2016/04-01/90108596.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('91', '娇兰/Guerlain', '/Public/upload/brand/2016/04-01/91237054.jpg', '', '', '50', '美容护理、洗发、沐浴', '0', '6', '0');
INSERT INTO `ym_brand` VALUES ('92', '多美滋/Dumex', '/Public/upload/brand/2016/04-01/92781124.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('93', '惠氏/Wyeth', '/Public/upload/brand/2016/04-01/93783239.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('94', '伊利', '/Public/upload/brand/2016/04-01/94943447.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('95', '雅士利/YASHILY', '/Public/upload/brand/2016/04-01/95842071.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('96', '贝因美/BEINGMATE', '/Public/upload/brand/2016/04-01/96409237.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('97', '益力健', '/Public/upload/brand/2016/04-01/97803784.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('98', '林贝儿/IMPERIAL.XO', '/Public/upload/brand/2016/04-01/98314041.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('99', '三元', '/Public/upload/brand/2016/04-01/99242987.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('100', '纽瑞滋/Nouriz', '/Public/upload/brand/2016/04-01/100190280.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('101', '高培/GlodMax', '/Public/upload/brand/2016/04-01/101393664.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('102', '德运/Devondale', '/Public/upload/brand/2016/04-01/102442251.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('103', '康维多/Primavita', '/Public/upload/brand/2016/04-01/103324176.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('104', '可瑞康/Karicare', '/Public/upload/brand/2016/04-01/104321127.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('105', '特福芬/Topfer', '/Public/upload/brand/2016/04-01/105312255.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('106', '明一/wissun', '/Public/upload/brand/2016/04-01/106399954.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('107', '牛奶客/Neolac', '/Public/upload/brand/2016/04-01/107720013.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('108', '卡瑞特兹/Karivita', '/Public/upload/brand/2016/04-01/108548654.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('109', '绝对宝贝/JUST BABY', '/Public/upload/brand/2016/04-01/109868933.jpg', '', '', '50', '母婴用品、玩具', '0', '10', '0');
INSERT INTO `ym_brand` VALUES ('110', '娇妍/JOLLY', '/Public/upload/brand/2016/04-01/110609024.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('111', '威露士/Walch', '/Public/upload/brand/2016/04-01/111614874.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('112', '滴露/Dettol', '/Public/upload/brand/2016/04-01/112169735.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('113', '妙管家/MAGIC AMAH', '/Public/upload/brand/2016/04-01/113123071.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('114', '威洁士/Walex', '/Public/upload/brand/2016/04-01/114141336.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('115', '雕牌', '/Public/upload/brand/2016/04-01/115543133.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('116', '开米/Kami', '/Public/upload/brand/2016/04-01/116731246.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('117', '正章', '/Public/upload/brand/2016/04-01/117184045.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('118', '榄菊', '/Public/upload/brand/2016/04-01/118318765.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('119', '立白/Liby', '/Public/upload/brand/2016/04-01/119589166.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('120', '狮王/LION', '/Public/upload/brand/2016/04-01/120630062.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('121', '超能', '/Public/upload/brand/2016/04-01/121911230.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('122', '扇牌', '/Public/upload/brand/2016/04-01/122213186.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('123', '蓝月亮', '/Public/upload/brand/2016/04-01/123387347.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('124', '绿伞/EVER GREEN', '/Public/upload/brand/2016/04-01/124513058.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('125', '裕华', '/Public/upload/brand/2016/04-01/125814001.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('126', '洁霸/Attack', '/Public/upload/brand/2016/04-01/126246475.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('127', '小林', '/Public/upload/brand/2016/04-01/127922052.jpg', '', '', '50', '厨卫清洁、纸、清洁剂', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('128', '新雅/sunya', '/Public/upload/brand/2016/04-01/128577108.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('129', '光明', '/Public/upload/brand/2016/04-01/129651733.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('130', '双汇/shineway', '/Public/upload/brand/2016/04-01/130390505.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('131', '鸿福堂/HUNG FOOK TONG', '/Public/upload/brand/2016/04-01/131927655.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('132', '味千拉面/AJISEN RAMEN', '/Public/upload/brand/2016/04-01/132569088.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('133', '雨润/Yurun', '/Public/upload/brand/2016/04-01/133733801.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('134', '思念/SYNEAR', '/Public/upload/brand/2016/04-01/134167153.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('135', '安佳/Anchor', '/Public/upload/brand/2016/04-01/135488531.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('136', '欧德堡/OLDENBURGER', '/Public/upload/brand/2016/04-01/136685873.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('137', '德运/Devondale', '/Public/upload/brand/2016/04-01/137919580.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('138', '坎诺拉/Canola', '/Public/upload/brand/2016/04-01/138448294.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('139', 'NPG', '/Public/upload/brand/2016/04-01/139139056.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('140', '乐芝牛/The Laughing Cow', '/Public/upload/brand/2016/04-01/140674337.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('141', '科尔沁/KERCHIN', '/Public/upload/brand/2016/04-01/141618444.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('142', '多美鲜/Suki', '/Public/upload/brand/2016/04-01/142755801.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('143', '海天下', '/Public/upload/brand/2016/04-01/143863604.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('144', '湾仔码头', '/Public/upload/brand/2016/04-01/144731356.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('145', '兰皇', '/Public/upload/brand/2016/04-01/145589770.jpg', '', '', '50', '生鲜食品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('146', '华乐/huale', '/Public/upload/brand/2016/04-01/146161550.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('147', '好伴侣/hao ban lv', '/Public/upload/brand/2016/04-01/147496551.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('148', '养鹅人', '/Public/upload/brand/2016/04-01/148603805.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('149', '诺伊曼/noyoke', '/Public/upload/brand/2016/04-01/149242932.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('150', '康尔馨/Canasin', '/Public/upload/brand/2016/04-01/150887417.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('151', '普拉达/PULADA', '/Public/upload/brand/2016/04-01/151922271.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('152', '梦特娇/MONTAGUT', '/Public/upload/brand/2016/04-01/152488558.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('153', '零听', '/Public/upload/brand/2016/04-01/153337304.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('154', '莱薇/Lavie', '/Public/upload/brand/2016/04-01/154205276.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('155', '澳西奴', '/Public/upload/brand/2016/04-01/155875140.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('156', '吾家元素', '/Public/upload/brand/2016/04-01/156132492.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('157', '来赉', '/Public/upload/brand/2016/04-01/157282263.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('158', '路途乐', '/Public/upload/brand/2016/04-01/158337002.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('159', '龙之涵', '/Public/upload/brand/2016/04-01/159439532.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('160', '日光生活', '/Public/upload/brand/2016/04-01/160632479.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('161', '图强/TU QIANF TOWEL', '/Public/upload/brand/2016/04-01/161837182.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('162', '格致诚品', '/Public/upload/brand/2016/04-01/162354470.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('163', '六朝家居/luc life', '/Public/upload/brand/2016/04-01/163149822.jpg', '', '', '50', '家居家纺、锅具餐具', '0', '4', '0');
INSERT INTO `ym_brand` VALUES ('164', '沙宣/VS', '/Public/upload/brand/2016/04-01/164835397.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('165', '光明', '/Public/upload/brand/2016/04-01/165511437.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('166', '日立/HITACHI', '/Public/upload/brand/2016/04-01/166679556.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('167', '倍轻松/bero', '/Public/upload/brand/2016/04-01/167990386.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('168', '优冠', '/Public/upload/brand/2016/04-01/168938119.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('169', 'SKG', '/Public/upload/brand/2016/04-01/169964404.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('170', '易简/Yijan', '/Public/upload/brand/2016/04-01/170384133.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('171', '北欧欧慕/nathome', '/Public/upload/brand/2016/04-01/171795599.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('172', '双鸟/twinbird', '/Public/upload/brand/2016/04-01/172687521.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('173', '春笑', '/Public/upload/brand/2016/04-01/173705456.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('174', '凯仕乐/KASRROW', '/Public/upload/brand/2016/04-01/174790078.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('175', '飞利浦/PHILIPS', '/Public/upload/brand/2016/04-01/175549835.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('176', '德国博朗/BRAUN', '/Public/upload/brand/2016/04-01/176280477.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('177', '贝尔斯顿/BESTDAY', '/Public/upload/brand/2016/04-01/177493969.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('178', '美克斯/MKS', '/Public/upload/brand/2016/04-01/178969265.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('179', '康夫/kangfu', '/Public/upload/brand/2016/04-01/179787469.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('180', '酷力', '/Public/upload/brand/2016/04-01/180363864.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('181', '雷瓦/RIWA', '/Public/upload/brand/2016/04-01/181639318.jpg', '', '', '50', '大小家电、厨电、汽车', '0', '2', '0');
INSERT INTO `ym_brand` VALUES ('182', '惠普/hp', '/Public/upload/brand/2016/04-01/182443569.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('183', '戴尔/DELL', '/Public/upload/brand/2016/04-01/183692877.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('184', '苹果/Apple', '/Public/upload/brand/2016/04-01/184234555.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('185', '微软/Microsoft', '/Public/upload/brand/2016/04-01/185100878.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('186', '华硕/ASUS', '/Public/upload/brand/2016/04-01/186984866.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('187', 'ThinkPad', '/Public/upload/brand/2016/04-01/187800433.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('188', '清华同方', '/Public/upload/brand/2016/04-01/188539425.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('189', '金士顿/Kingston', '/Public/upload/brand/2016/04-01/189988024.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('190', '微星/MSI', '/Public/upload/brand/2016/04-01/190315029.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('191', '开馨宝/KAI XIN BAO', '/Public/upload/brand/2016/04-01/191294512.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('192', '优派/ViewSonic', '/Public/upload/brand/2016/04-01/192575350.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('193', '联想/Lenovo', '/Public/upload/brand/2016/04-01/193460131.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('194', '宏碁/acer', '/Public/upload/brand/2016/04-01/194205935.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('195', '西部数据/WD', '/Public/upload/brand/2016/04-01/195609490.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('196', '三星/SAMSUNG', '/Public/upload/brand/2016/04-01/196989205.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('197', '索尼/SONY', '/Public/upload/brand/2016/04-01/197626574.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('198', '诺基亚/NOKIA', '/Public/upload/brand/2016/04-01/198179458.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('199', '明基/BenQ', '/Public/upload/brand/2016/04-01/199929742.jpg', '', '', '50', '电脑、平板、办公设备', '0', '3', '0');
INSERT INTO `ym_brand` VALUES ('200', '花花公子/PLAYBOY', '/Public/upload/brand/2016/04-01/200177865.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('201', '阿迪达斯/adidas', '/Public/upload/brand/2016/04-01/201446728.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('202', '波司登/Bosideng', '/Public/upload/brand/2016/04-01/202207473.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('203', '唐狮/Tonlion', '/Public/upload/brand/2016/04-01/203889642.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('204', '雅鹿', '/Public/upload/brand/2016/04-01/204588204.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('205', '真维斯/Jeanswest', '/Public/upload/brand/2016/04-01/205229968.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('206', '秋水伊人', '/Public/upload/brand/2016/04-01/206711856.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('207', '安踏/ANTA', '/Public/upload/brand/2016/04-01/207573565.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('208', '宝娜斯', '/Public/upload/brand/2016/04-01/208617098.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('209', 'ONEBUYE', '/Public/upload/brand/2016/04-01/209735668.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('210', '初语/TOYOUTH', '/Public/upload/brand/2016/04-01/210764480.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('211', '雅可希/YAKEXI', '/Public/upload/brand/2016/04-01/211515887.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('212', '幽迷/Youmi', '/Public/upload/brand/2016/04-01/212911422.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('213', '梦娜/MengNa', '/Public/upload/brand/2016/04-01/213473205.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('214', 'A21', '/Public/upload/brand/2016/04-01/214787222.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('215', 'OopsCiah', '/Public/upload/brand/2016/04-01/215800982.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('216', '若美/nomi', '/Public/upload/brand/2016/04-01/216768051.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('217', '森马/Semir', '/Public/upload/brand/2016/04-01/217201953.jpg', '', '', '50', '服饰内衣、鞋靴童装', '0', '5', '0');
INSERT INTO `ym_brand` VALUES ('218', '川崎/kawasaki', '/Public/upload/brand/2016/04-01/218751956.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('219', '锐步/Reebok', '/Public/upload/brand/2016/04-01/219163226.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('220', '耐克/NIKE', '/Public/upload/brand/2016/04-01/220833859.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('221', '阿迪达斯/adidas', '/Public/upload/brand/2016/04-01/221231286.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('222', '迪士尼/Disney', '/Public/upload/brand/2016/04-01/222180557.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('223', '特步/Xtep', '/Public/upload/brand/2016/04-01/223486993.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('224', '361°', '/Public/upload/brand/2016/04-01/224405722.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('225', '回力/Warrior', '/Public/upload/brand/2016/04-01/225420581.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('226', '匡威/Converse', '/Public/upload/brand/2016/04-01/226844900.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('227', '骆驼/CAMEL', '/Public/upload/brand/2016/04-01/227506658.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('228', '探路者/Toread', '/Public/upload/brand/2016/04-01/228130514.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('229', '凯速', '/Public/upload/brand/2016/04-01/229179211.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('230', 'NIKKO', '/Public/upload/brand/2016/04-01/230466860.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('231', '安踏/ANTA', '/Public/upload/brand/2016/04-01/231306597.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('232', '哥伦比亚/Columbia', '/Public/upload/brand/2016/04-01/232205111.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('233', '彪马/Puma', '/Public/upload/brand/2016/04-01/233266552.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('234', '骆驼牌', '/Public/upload/brand/2016/04-01/234818313.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('235', '自由兵/FREE SOLDIER', '/Public/upload/brand/2016/04-01/235421185.jpg', '', '', '50', '运动户外', '0', '8', '0');
INSERT INTO `ym_brand` VALUES ('236', '潘高寿', '/Public/upload/brand/2016/04-01/236376388.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('237', '昂立/Onlly', '/Public/upload/brand/2016/04-01/237991979.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('238', '恒寿堂/HENG SHOU TANG', '/Public/upload/brand/2016/04-01/238521133.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('239', '养生堂', '/Public/upload/brand/2016/04-01/239934796.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('240', '三叶', '/Public/upload/brand/2016/04-01/240841220.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('241', '御生堂', '/Public/upload/brand/2016/04-01/241414868.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('242', '泰尔', '/Public/upload/brand/2016/04-01/242447195.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('243', '碧生源/Besunyen', '/Public/upload/brand/2016/04-01/243581805.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('244', '益力健', '/Public/upload/brand/2016/04-01/244446481.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('245', '云南白药/YunnanBaiyao', '/Public/upload/brand/2016/04-01/245644592.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('246', '初元', '/Public/upload/brand/2016/04-01/246118374.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('247', '红桃K', '/Public/upload/brand/2016/04-01/247346588.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('248', '好医生', '/Public/upload/brand/2016/04-01/248289047.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('249', '三金', '/Public/upload/brand/2016/04-01/249640527.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('250', '纽曼思/Nemans', '/Public/upload/brand/2016/04-01/250406546.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('251', '凯镛', '/Public/upload/brand/2016/04-01/251763519.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('252', '广元堂', '/Public/upload/brand/2016/04-01/252115792.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('253', 'UTU', '/Public/upload/brand/2016/04-01/253712048.jpg', '', '', '50', '保健滋补、器械计生', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('254', 'ELLE', '/Public/upload/brand/2016/04-01/254833584.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('255', '瑞士军刀/SWISSGEAR', '/Public/upload/brand/2016/04-01/255116973.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('256', '古驰/Gucci', '/Public/upload/brand/2016/04-01/256123593.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('257', '宝缇嘉/Bottega Veneta', '/Public/upload/brand/2016/04-01/257718530.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('258', '缪缪/MIU MIU', '/Public/upload/brand/2016/04-01/258471365.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('259', '梦特娇/MONTAGUT', '/Public/upload/brand/2016/04-01/259741326.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('260', '苹果/Apple', '/Public/upload/brand/2016/04-01/260959323.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('261', '香奈儿/CHANEL', '/Public/upload/brand/2016/04-01/261969348.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('262', '赛琳/CELINE', '/Public/upload/brand/2016/04-01/262641763.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('263', '爱华仕/Oiwas', '/Public/upload/brand/2016/04-01/263920953.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('264', '阿玛尼/EMPORIO ARMANI', '/Public/upload/brand/2016/04-01/264119857.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('265', '贝尔/BEIER', '/Public/upload/brand/2016/04-01/265423876.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('266', 'Amii', '/Public/upload/brand/2016/04-01/266416653.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('267', '波斯丹顿/Bostanten', '/Public/upload/brand/2016/04-01/267290228.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('268', '阿札/A-ZA', '/Public/upload/brand/2016/04-01/268952072.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('269', '克路驰/CLUCI', '/Public/upload/brand/2016/04-01/269291491.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('270', 'DOODOO', '/Public/upload/brand/2016/04-01/270217910.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('271', '拉菲斯汀/Lafestin', '/Public/upload/brand/2016/04-01/271733526.jpg', '', '', '50', '箱包皮具', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('272', 'ELLE', '/Public/upload/brand/2016/04-01/272952841.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('273', '浪琴/Longines', '/Public/upload/brand/2016/04-01/273431567.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('274', '巴宝莉/Burberry', '/Public/upload/brand/2016/04-01/274917410.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('275', '变形金刚/Transformers', '/Public/upload/brand/2016/04-01/275985223.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('276', '哆啦A梦/Doraemon', '/Public/upload/brand/2016/04-01/276769039.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('277', '施华洛世奇/Swarovski', '/Public/upload/brand/2016/04-01/277253479.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('278', 'GUESS', '/Public/upload/brand/2016/04-01/278237026.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('279', '万宝龙/Montblanc', '/Public/upload/brand/2016/04-01/279229693.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('280', '蔻驰/COACH', '/Public/upload/brand/2016/04-01/280597543.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('281', '海鸥表/Sea-Gull', '/Public/upload/brand/2016/04-01/281516601.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('282', '迪士尼/Disney', '/Public/upload/brand/2016/04-01/282848635.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('283', '天梭/Tissot', '/Public/upload/brand/2016/04-01/283801312.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('284', '天王表/TIAN WANG', '/Public/upload/brand/2016/04-01/284185226.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('285', '李维斯/Levi s', '/Public/upload/brand/2016/04-01/285630310.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('286', '阿玛尼/EMPORIO ARMANI', '/Public/upload/brand/2016/04-01/286474111.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('287', '梅花/Titoni', '/Public/upload/brand/2016/04-01/287984454.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('288', '杜嘉班纳/DG', '/Public/upload/brand/2016/04-01/288628964.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('289', 'BUREI', '/Public/upload/brand/2016/04-01/289453979.jpg', '', '', '50', '珠宝/饰品/手表/眼镜', '0', '7', '0');
INSERT INTO `ym_brand` VALUES ('290', '友邦', '/Public/upload/brand/2016/04-01/290885330.jpg', '', '', '50', '图书杂志', '0', '11', '0');
INSERT INTO `ym_brand` VALUES ('291', '一生一信/Infeel.Me', '/Public/upload/brand/2016/04-01/291413494.jpg', '', '', '50', '图书杂志', '0', '11', '0');
INSERT INTO `ym_brand` VALUES ('292', '贴贴', '/Public/upload/brand/2016/04-01/292775631.jpg', '', '', '50', '图书杂志', '0', '11', '0');
INSERT INTO `ym_brand` VALUES ('293', '伊莱克斯/Electrolux', '/Public/upload/brand/2016/04-01/293296984.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('294', '乐比比/LEBIBI', '/Public/upload/brand/2016/04-01/294704165.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('295', '大富翁/Uncle Wang', '/Public/upload/brand/2016/04-01/295972808.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('296', '秉信', '/Public/upload/brand/2016/04-01/296822103.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('297', '福库/Cuckoo', '/Public/upload/brand/2016/04-01/297918701.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('298', '灿坤/EUPA', '/Public/upload/brand/2016/04-01/298802493.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('299', '利仁/LIVEN', '/Public/upload/brand/2016/04-01/299496771.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('300', '开馨宝/KAI XIN BAO', '/Public/upload/brand/2016/04-01/300515255.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('301', '宝视达', '/Public/upload/brand/2016/04-01/301828503.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('302', '香百年/Carori', '/Public/upload/brand/2016/04-01/302702188.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('303', '内野/UCHINO', '/Public/upload/brand/2016/04-01/303869757.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('304', '悠嘻猴', '/Public/upload/brand/2016/04-01/304951962.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('305', '卓朗/ZoomLand', '/Public/upload/brand/2016/04-01/305785766.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('306', '小熊/Bear', '/Public/upload/brand/2016/04-01/306375125.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('307', '九阳/Joyoung', '/Public/upload/brand/2016/04-01/307826141.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('308', '奥迪双钻/AULDEY', '/Public/upload/brand/2016/04-01/308979098.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('309', '澳贝/auby', '/Public/upload/brand/2016/04-01/309199865.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('310', '斐利比/Philippi', '/Public/upload/brand/2016/04-01/310243179.jpg', '', '', '50', '创意礼品、礼品卡', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('311', '邦迪/BAND-AID', '/Public/upload/brand/2016/04-01/311450299.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('312', '云南白药/YunnanBaiyao', '/Public/upload/brand/2016/04-01/312793539.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('313', '信乐/SINO', '/Public/upload/brand/2016/04-01/313730175.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('314', '海氏海诺/HAINUO', '/Public/upload/brand/2016/04-01/314278225.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('315', '兵兵', '/Public/upload/brand/2016/04-01/315276605.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('316', '西门子/SIEMENS', '/Public/upload/brand/2016/04-01/316142160.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('317', '强生/Johnson', '/Public/upload/brand/2016/04-01/317886071.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('318', '零听', '/Public/upload/brand/2016/04-01/318902139.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('319', '康扉/KANGFEI', '/Public/upload/brand/2016/04-01/319389434.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('320', '仙鹤牌', '/Public/upload/brand/2016/04-01/320121835.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('321', '金奥力', '/Public/upload/brand/2016/04-01/321526928.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('322', '欧姆龙/Omron', '/Public/upload/brand/2016/04-01/322286795.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('323', '鱼跃/yuyue', '/Public/upload/brand/2016/04-01/323423162.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('324', '雅培/Abbott', '/Public/upload/brand/2016/04-01/324479440.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('325', '龙贝儿/Loboor', '/Public/upload/brand/2016/04-01/325862121.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('326', '迈克大夫/microlife', '/Public/upload/brand/2016/04-01/326654067.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('327', '爱科来/arkray', '/Public/upload/brand/2016/04-01/327462164.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('328', '爱安德/AND', '/Public/upload/brand/2016/04-01/328511849.jpg', '', '', '50', '中西药品、医疗器械', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('329', '星巴克/STARBUCKS', '/Public/upload/brand/2016/04-01/329851025.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('330', '卡夫/KRAFT', '/Public/upload/brand/2016/04-01/330175833.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('331', '花王/Merries', '/Public/upload/brand/2016/04-01/331140814.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('332', '善存/Centrum', '/Public/upload/brand/2016/04-01/332865939.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('333', 'LG', '/Public/upload/brand/2016/04-01/333803015.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('334', '钙尔奇/Caltrate', '/Public/upload/brand/2016/04-01/334173965.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('335', '瑞士莲/Lindt', '/Public/upload/brand/2016/04-01/335443487.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('336', '宝氏/Post', '/Public/upload/brand/2016/04-01/336838583.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('337', '德运/Devondale', '/Public/upload/brand/2016/04-01/337577465.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('338', '大王/GOO.N', '/Public/upload/brand/2016/04-01/338620339.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('339', '雀巢/Nestle', '/Public/upload/brand/2016/04-01/339104559.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('340', '和光堂/WaKODO', '/Public/upload/brand/2016/04-01/340176657.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('341', '可瑞康/Karicare', '/Public/upload/brand/2016/04-01/341483752.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('342', '夏依/summer eve', '/Public/upload/brand/2016/04-01/342136831.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('343', '亨氏/Heinz', '/Public/upload/brand/2016/04-01/343108404.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('344', '谜尚/MISSHA', '/Public/upload/brand/2016/04-01/344877035.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('345', '澳佳宝/BLACKMORES', '/Public/upload/brand/2016/04-01/345381250.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('346', '诺优能/Nutrilon', '/Public/upload/brand/2016/04-01/346495315.jpg', '', '', '50', '海购商品', '0', '0', '0');
INSERT INTO `ym_brand` VALUES ('349', '小米', '/Public/upload/brand/2016/11-01/5818301f2770f.jpg', '', '', '50', '', '0', '1', '0');

-- ----------------------------
-- Table structure for `ym_category_group`
-- ----------------------------
DROP TABLE IF EXISTS `ym_category_group`;
CREATE TABLE `ym_category_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category_id` int(10) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(100) NOT NULL COMMENT '分组名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态0禁用1启用',
  `create_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商品分类分组表';

-- ----------------------------
-- Records of ym_category_group
-- ----------------------------
INSERT INTO `ym_category_group` VALUES ('1', '2', '彩电影音', '1', '1511100942', '1511100942');
INSERT INTO `ym_category_group` VALUES ('2', '2', '冰洗空调', '1', '1511101097', '1511101097');
INSERT INTO `ym_category_group` VALUES ('3', '2', '烟机灶具', '1', '1511101110', '1511101110');
INSERT INTO `ym_category_group` VALUES ('4', null, '顶级分组1', '1', '1511101279', '1511101279');
INSERT INTO `ym_category_group` VALUES ('5', null, '顶级分组2', '1', '1511101305', '1511101305');

-- ----------------------------
-- Table structure for `ym_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `ym_goods_category`;
CREATE TABLE `ym_goods_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分类名称',
  `mobile_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '手机端显示的分类名',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `parent_id_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '家族图谱',
  `level` tinyint(1) DEFAULT '0' COMMENT '等级',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50' COMMENT '顺序排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `image_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '分类图片',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否推荐为热门分类',
  `group_id` int(10) DEFAULT NULL COMMENT '分组ID',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_goods_category
-- ----------------------------
INSERT INTO `ym_goods_category` VALUES ('1', '手机', '手机', '0', '', '0', '10', '1', 'https://img.alicdn.com/tps/TB1wWd8NpXXXXbqXpXXXXXXXXXX-100-100.png_250x225Q50s50.jpg_.webp', '0', '4');
INSERT INTO `ym_goods_category` VALUES ('2', '家电', '家电', '0', '', '0', '10', '1', '', '0', null);
INSERT INTO `ym_goods_category` VALUES ('3', '平板电视', '平板电视', '2', '2', '1', '10', '1', 'https://img.alicdn.com/tps/i1/TB1IQsKGVXXXXXLXpXXMxXJVFXX-100-100.jpg_350x350Q50s50.jpg_.webp', '0', '1');
INSERT INTO `ym_goods_category` VALUES ('4', '电视配件', '电视配件', '2', '2', '1', '10', '1', 'https://img.alicdn.com/tps/i3/TB1SuQDGVXXXXXQaXXXMxXJVFXX-100-100.jpg_350x350Q50s50.jpg_.webp', '0', '1');

-- ----------------------------
-- Table structure for `ym_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ym_menu`;
CREATE TABLE `ym_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `ym_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `ym_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_menu
-- ----------------------------
INSERT INTO `ym_menu` VALUES ('1', '权限管理', null, '/admin/default/index', '19', null);
INSERT INTO `ym_menu` VALUES ('2', '角色列表', '1', '/admin/role/index', '3', null);
INSERT INTO `ym_menu` VALUES ('3', '权限列表', '1', '/admin/permission/index', '4', null);
INSERT INTO `ym_menu` VALUES ('4', '路由列表', '1', '/admin/route/index', '5', null);
INSERT INTO `ym_menu` VALUES ('5', '规则管理', '1', '/admin/rule/index', '6', null);
INSERT INTO `ym_menu` VALUES ('6', '用户列表', '1', '/admin/user/index', '1', null);
INSERT INTO `ym_menu` VALUES ('7', '分配', '1', '/admin/assignment/index', '2', null);
INSERT INTO `ym_menu` VALUES ('8', '菜单列表', '1', '/admin/menu/index', '7', null);
INSERT INTO `ym_menu` VALUES ('9', '系统工具', null, null, '20', null);
INSERT INTO `ym_menu` VALUES ('10', 'Gii', '9', '/gii/default/index', '1', 0x7B2269636F6E223A2266612066612D66696C652D636F64652D6F222C2276697369626C65223A747275657D);
INSERT INTO `ym_menu` VALUES ('11', 'Debug', '9', '/debug/default/index', null, 0x7B2269636F6E223A2266612066612D64617368626F617264222C2276697369626C65223A747275657D);
INSERT INTO `ym_menu` VALUES ('12', '商品管理', null, null, null, null);
INSERT INTO `ym_menu` VALUES ('13', '分类管理', '12', '/goods-category/index', null, null);
INSERT INTO `ym_menu` VALUES ('14', '品牌管理', '12', '/brand/index', null, null);
INSERT INTO `ym_menu` VALUES ('15', '分类分组', '12', '/category-group/index', null, null);

-- ----------------------------
-- Table structure for `ym_migration`
-- ----------------------------
DROP TABLE IF EXISTS `ym_migration`;
CREATE TABLE `ym_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ym_migration
-- ----------------------------
INSERT INTO `ym_migration` VALUES ('m000000_000000_base', '1491062277');
INSERT INTO `ym_migration` VALUES ('m140602_111327_create_menu_table', '1491062281');
INSERT INTO `ym_migration` VALUES ('m160312_050000_create_user', '1491062281');

-- ----------------------------
-- Table structure for `ym_user`
-- ----------------------------
DROP TABLE IF EXISTS `ym_user`;
CREATE TABLE `ym_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) NOT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) NOT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `vip_lv` int(11) NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='管理表';

-- ----------------------------
-- Records of ym_user
-- ----------------------------
INSERT INTO `ym_user` VALUES ('2', 'test', 'NuLWk2cZvKmXypp9r0xC6OhIyg94-IB9', '$2y$13$A4IQqPJN5ld84BLMJY3FuOd1lEO05SpOvG/ePn8lFtKuTCDDUuxrG', '', '', 'test@163.com', '10', '10', '', '0', '1490617774', '1490617774');
INSERT INTO `ym_user` VALUES ('3', 'admin', 'oJLUFY2YFzxsboKx-l3hEODcjvmC4qXH', '$2y$13$6A6wO33K3kWt8xP3/Gk1FulJ50YHrTG/ezSTyDvgJWHNOzmHIdK82', '', '', 'admin@qq.com', '10', '10', '', '0', '1490619369', '1490619369');
INSERT INTO `ym_user` VALUES ('4', 'test888', '6xyxhQn1VbpIzblnxSMxbMxzDAMi3iII', '$2y$13$V0hdiV9tdxTEDgGT73jD6e8cB6bY3rXCiwidS6ebRsEdFiKmfV3hq', '', '', '632867905@qq.com', '10', '10', '', '0', '1491059843', '1491059843');
