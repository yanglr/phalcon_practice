/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50712
Source Host           : 127.0.0.1:3306
Source Database       : vokuro

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-07-10 16:52:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for email_confirmations
-- ----------------------------
DROP TABLE IF EXISTS `email_confirmations`;
CREATE TABLE `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `confirmed` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_confirmations
-- ----------------------------
INSERT INTO `email_confirmations` VALUES ('1', '5', 'TZRySwVIy0UfYBaRuPgJtIluquCYsI', '1468140196', null, 'N');

-- ----------------------------
-- Table structure for failed_logins
-- ----------------------------
DROP TABLE IF EXISTS `failed_logins`;
CREATE TABLE `failed_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned DEFAULT NULL,
  `ipAddress` char(15) NOT NULL,
  `attempted` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of failed_logins
-- ----------------------------
INSERT INTO `failed_logins` VALUES ('1', '5', '::1', '65535');

-- ----------------------------
-- Table structure for password_changes
-- ----------------------------
DROP TABLE IF EXISTS `password_changes`;
CREATE TABLE `password_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of password_changes
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profilesId` int(10) unsigned NOT NULL,
  `resource` varchar(16) NOT NULL,
  `action` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '3', 'users', 'index');
INSERT INTO `permissions` VALUES ('2', '3', 'users', 'search');
INSERT INTO `permissions` VALUES ('3', '3', 'profiles', 'index');
INSERT INTO `permissions` VALUES ('4', '3', 'profiles', 'search');
INSERT INTO `permissions` VALUES ('5', '1', 'users', 'index');
INSERT INTO `permissions` VALUES ('6', '1', 'users', 'search');
INSERT INTO `permissions` VALUES ('7', '1', 'users', 'edit');
INSERT INTO `permissions` VALUES ('8', '1', 'users', 'create');
INSERT INTO `permissions` VALUES ('9', '1', 'users', 'delete');
INSERT INTO `permissions` VALUES ('10', '1', 'users', 'changePassword');
INSERT INTO `permissions` VALUES ('11', '1', 'profiles', 'index');
INSERT INTO `permissions` VALUES ('12', '1', 'profiles', 'search');
INSERT INTO `permissions` VALUES ('13', '1', 'profiles', 'edit');
INSERT INTO `permissions` VALUES ('14', '1', 'profiles', 'create');
INSERT INTO `permissions` VALUES ('15', '1', 'profiles', 'delete');
INSERT INTO `permissions` VALUES ('16', '1', 'permissions', 'index');
INSERT INTO `permissions` VALUES ('17', '2', 'users', 'index');
INSERT INTO `permissions` VALUES ('18', '2', 'users', 'search');
INSERT INTO `permissions` VALUES ('19', '2', 'users', 'edit');
INSERT INTO `permissions` VALUES ('20', '2', 'users', 'create');
INSERT INTO `permissions` VALUES ('21', '2', 'profiles', 'index');
INSERT INTO `permissions` VALUES ('22', '2', 'profiles', 'search');

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profiles
-- ----------------------------
INSERT INTO `profiles` VALUES ('1', 'Administrators', 'Y');
INSERT INTO `profiles` VALUES ('2', 'Users', 'Y');
INSERT INTO `profiles` VALUES ('3', 'Read-Only', 'Y');

-- ----------------------------
-- Table structure for remember_tokens
-- ----------------------------
DROP TABLE IF EXISTS `remember_tokens`;
CREATE TABLE `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remember_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for reset_passwords
-- ----------------------------
DROP TABLE IF EXISTS `reset_passwords`;
CREATE TABLE `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `reset` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reset_passwords
-- ----------------------------
INSERT INTO `reset_passwords` VALUES ('1', '1', 'jRpM63WeyCCyGuzHvNGil1Q25zbadveX', '1468140056', null, 'N');
INSERT INTO `reset_passwords` VALUES ('2', '1', 'TzCNBZ4Q0fWyjeXaNZrMJWrF6psADAQa', '1468140089', null, 'N');

-- ----------------------------
-- Table structure for success_logins
-- ----------------------------
DROP TABLE IF EXISTS `success_logins`;
CREATE TABLE `success_logins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of success_logins
-- ----------------------------
INSERT INTO `success_logins` VALUES ('1', '1', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `mustChangePassword` char(1) DEFAULT NULL,
  `profilesId` int(10) unsigned NOT NULL,
  `banned` char(1) NOT NULL,
  `suspended` char(1) NOT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Erik', 'erik@phalconphp.com', '$2a$08$7Yy0rYHvMLXSR8KstiMdtO5k7YWmXmauB8z4tikdnJUjpzRwZpqZq', 'N', '1', 'N', 'N', 'Y');
INSERT INTO `users` VALUES ('2', 'Jack', 'jack@phalconphp.com', '$2a$08$7Yy0rYHvMLXSR8KstiMdtO5k7YWmXmauB8z4tikdnJUjpzRwZpqZq', 'N', '1', 'Y', 'Y', 'Y');
INSERT INTO `users` VALUES ('5', 'Bravo', 'legege007@126.com', '$2a$08$7Yy0rYHvMLXSR8KstiMdtO5k7YWmXmauB8z4tikdnJUjpzRwZpqZq', 'N', '2', 'N', 'N', 'N');
