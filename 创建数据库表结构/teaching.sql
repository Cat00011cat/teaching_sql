/*
 Navicat Premium Data Transfer

 Source Server         : 本机开发数据库
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : teaching

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 05/10/2023 16:53:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courseno` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程号',
  `cname` char(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程名',
  `credit` tinyint(4) NULL DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`courseno`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lecture
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture`  (
  `teacherno` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师编号',
  `courseno` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程号',
  `location` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上课地点',
  PRIMARY KEY (`teacherno`, `courseno`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `studentno` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学号',
  `courseno` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '课程号',
  `grade` tinyint(4) NULL DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`studentno`, `courseno`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for speciality
-- ----------------------------
DROP TABLE IF EXISTS `speciality`;
CREATE TABLE `speciality`  (
  `specialityno` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '专业代码',
  `specialityname` char(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业名称',
  PRIMARY KEY (`specialityno`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `studentno` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学号',
  `sname` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `ssex` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '男' COMMENT '性别',
  `sbirthday` date NOT NULL COMMENT '出生日期',
  `tc` tinyint(4) NULL DEFAULT NULL COMMENT '总学分',
  `specialityno` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '专业代码',
  PRIMARY KEY (`studentno`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师编号',
  `tname` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `tsex` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '男' COMMENT '性别',
  `tbirthday` date NOT NULL COMMENT '出生日期',
  `title` char(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '职称',
  `school` char(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学院',
  PRIMARY KEY (`teacher`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

SET FOREIGN_KEY_CHECKS = 1;
