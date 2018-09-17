/*
Navicat MySQL Data Transfer

Source Server         : hp
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : jblog

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2018-09-09 13:27:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jblog_articlepm
-- ----------------------------
DROP TABLE IF EXISTS `jblog_articlepm`;
CREATE TABLE `jblog_articlepm` (
  `p` varchar(255) NOT NULL,
  PRIMARY KEY (`p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jblog_articlepm
-- ----------------------------

-- ----------------------------
-- Table structure for jblog_article_common
-- ----------------------------
DROP TABLE IF EXISTS `jblog_article_common`;
CREATE TABLE `jblog_article_common` (
  `article_Id` char(50) NOT NULL,
  `article_Name` varchar(255) DEFAULT NULL,
  `article_Title` varchar(255) DEFAULT NULL,
  `article_Content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jblog_article_common
-- ----------------------------

-- ----------------------------
-- Table structure for jblog_article_temp
-- ----------------------------
DROP TABLE IF EXISTS `jblog_article_temp`;
CREATE TABLE `jblog_article_temp` (
  `temp_Id` char(255) NOT NULL,
  `temp_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`temp_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jblog_article_temp
-- ----------------------------

-- ----------------------------
-- Table structure for jblog_user
-- ----------------------------
DROP TABLE IF EXISTS `jblog_user`;
CREATE TABLE `jblog_user` (
  `user_Id` char(255) NOT NULL,
  `user_Name` varchar(50) DEFAULT NULL,
  `user_Password` varchar(50) DEFAULT NULL,
  `user_Role` char(5) DEFAULT NULL,
  `user_Class` varchar(50) DEFAULT NULL,
  `user_Create_Time` datetime DEFAULT NULL,
  `user_Login_Time` datetime DEFAULT NULL,
  `user_Custom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jblog_user
-- ----------------------------
INSERT INTO `jblog_user` VALUES ('USER0102018090901', 'wj', null, null, null, null, null, null);
