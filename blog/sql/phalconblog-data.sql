/*
Navicat MySQL Data Transfer

Source Server         : ubuntu14.04
Source Server Version : 50549
Source Host           : 192.168.20.129:3306
Source Database       : phalconblog

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2016-07-09 18:25:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `url` text NOT NULL,
  `submitted` datetime NOT NULL,
  `publish` tinyint(1) NOT NULL,
  `posts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_posts1` (`posts_id`),
  CONSTRAINT `fk_comments_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('2', '14', 'So good', 'admin', 'admin@blog.io', 'http://dev.blog.io', '2016-07-02 10:30:00', '1', '15');

-- ----------------------------
-- Table structure for post_tags
-- ----------------------------
DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE `post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posts_id` int(11) NOT NULL,
  `tags_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_tags_tags1` (`tags_id`),
  KEY `fk_post_tags_posts1` (`posts_id`),
  CONSTRAINT `fk_post_tags_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_tags_tags1` FOREIGN KEY (`tags_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of post_tags
-- ----------------------------
INSERT INTO `post_tags` VALUES ('1', '14', '1');
INSERT INTO `post_tags` VALUES ('2', '15', '2');
INSERT INTO `post_tags` VALUES ('3', '16', '3');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `title` text,
  `body` text,
  `excerpt` text,
  `published` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `pinged` text,
  `to_ping` text,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users` (`users_id`),
  CONSTRAINT `fk_posts_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('14', '1', 'ç¬¬ä¸€ç¯‡ æ—¥å¿—', 'To be or not to be', 'English', '2016-07-09 13:54:51', '2016-07-09 17:43:25', null, null);
INSERT INTO `posts` VALUES ('15', '2', '2nd post', 'I like to write some stories here.', 'Writing', '2016-07-09 14:11:07', null, null, null);
INSERT INTO `posts` VALUES ('16', '2', 'post1 - user test', 'Phalcon, get started.', 'PHP', '2016-07-09 17:40:59', null, null, null);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', 'language');
INSERT INTO `tags` VALUES ('3', 'php');
INSERT INTO `tags` VALUES ('2', 'writing');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '$2a$08$RIrVZunHumUWaSIA0bxkmer5eirVKrEKDYkToHVLFdLcYdzhnLxNG', 'Jack', 'admin@gmail.com');
INSERT INTO `users` VALUES ('2', 'test', '$2a$08$dZMnMqyAav7dnmAzHCCyC.PGQy72scddTgxkTZol20Xti7zCDVH/K', 'Nick', 'test@gmail.com');
