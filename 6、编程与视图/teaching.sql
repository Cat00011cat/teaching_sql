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

 Date: 24/11/2023 07:44:30
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
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1004', '数据库系统', 4);
INSERT INTO `course` VALUES ('1009', '软件工程', 3);
INSERT INTO `course` VALUES ('1201', '英语', 4);
INSERT INTO `course` VALUES ('4008', '通信原理', 4);
INSERT INTO `course` VALUES ('8001', '高等数学', 4);

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
-- Records of lecture
-- ----------------------------
INSERT INTO `lecture` VALUES ('100004', '1004', '5-314');
INSERT INTO `lecture` VALUES ('120037', '1201', '4-317');
INSERT INTO `lecture` VALUES ('400012', '4008', '1-208');
INSERT INTO `lecture` VALUES ('800023', '8001', '6-105');

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
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('193001', '1004', 93);
INSERT INTO `score` VALUES ('193002', '1004', 86);
INSERT INTO `score` VALUES ('193003', '1004', 94);
INSERT INTO `score` VALUES ('193001', '1201', 93);
INSERT INTO `score` VALUES ('198001', '4008', 92);
INSERT INTO `score` VALUES ('198001', '8001', 91);
INSERT INTO `score` VALUES ('193002', '1201', 85);
INSERT INTO `score` VALUES ('193003', '1201', 93);
INSERT INTO `score` VALUES ('198001', '1201', 91);
INSERT INTO `score` VALUES ('198002', '1201', NULL);
INSERT INTO `score` VALUES ('198004', '1201', 92);
INSERT INTO `score` VALUES ('198002', '4008', 79);
INSERT INTO `score` VALUES ('198004', '4008', 87);
INSERT INTO `score` VALUES ('193001', '8001', 91);
INSERT INTO `score` VALUES ('193002', '8001', 89);
INSERT INTO `score` VALUES ('193003', '8001', 87);
INSERT INTO `score` VALUES ('198002', '8001', 77);
INSERT INTO `score` VALUES ('198004', '8001', 95);

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
-- Records of speciality
-- ----------------------------
INSERT INTO `speciality` VALUES ('080701', '电子信息工程');
INSERT INTO `speciality` VALUES ('080702', '电子科学与技术');
INSERT INTO `speciality` VALUES ('080703', '通信工程');
INSERT INTO `speciality` VALUES ('080901', '计算机科学与技术');
INSERT INTO `speciality` VALUES ('080902', '软件工程');
INSERT INTO `speciality` VALUES ('080903', '网络工程');

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
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('193001', '梁俊松', '男', '1992-12-05', 52, '080903');
INSERT INTO `student` VALUES ('193002', '周玲', '女', '1998-04-17', 50, '080903');
INSERT INTO `student` VALUES ('193003', '夏玉坊', '女', '1999-06-25', 52, '080903');
INSERT INTO `student` VALUES ('198001', '康文卓', '男', '1998-10-14', 50, '080703');
INSERT INTO `student` VALUES ('198002', '张小翠', '女', '1998-09-21', 48, '080703');
INSERT INTO `student` VALUES ('198004', '洪啵', '男', '1999-11-08', 52, '080703');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacherno` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '教师编号',
  `tname` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `tsex` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '男' COMMENT '性别',
  `tbirthday` date NOT NULL COMMENT '出生日期',
  `title` char(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '职称',
  `school` char(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学院',
  PRIMARY KEY (`teacherno`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('100004', '郭逸超', '男', '1975-07-24', '教授', '计算机学院');
INSERT INTO `teacher` VALUES ('100021', '任敏', '女', '1979-10-05', '教授', '计算机学院');
INSERT INTO `teacher` VALUES ('800023', '杨静', '女', '1983-03-12', '副教授', '外国语学院');
INSERT INTO `teacher` VALUES ('120037', '周章群', '女', '1988-09-21', '僵尸', '通信学院');
INSERT INTO `teacher` VALUES ('400012', '黄玉杰', '男', '1985-12-18', '副教授', '数学学院');

-- ----------------------------
-- View structure for v_teachercourselecture
-- ----------------------------
DROP VIEW IF EXISTS `v_teachercourselecture`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_teachercourselecture` AS select `teacher`.`teacherno` AS `teacherno`,`teacher`.`tname` AS `tname`,`teacher`.`title` AS `title`,`teacher`.`school` AS `school`,`lecture`.`location` AS `location` from ((`teacher` join `lecture`) join `course`) where ((`teacher`.`teacherno` = `lecture`.`teacherno`) and (`lecture`.`courseno` = `course`.`courseno`) and (`teacher`.`school` = '计算机学院')) order by `teacher`.`teacherno`;

-- ----------------------------
-- View structure for v_teacherlecture
-- ----------------------------
DROP VIEW IF EXISTS `v_teacherlecture`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_teacherlecture` AS select `teacher`.`teacherno` AS `teacherno`,`teacher`.`tname` AS `tname`,`teacher`.`title` AS `title`,`teacher`.`school` AS `school`,`lecture`.`location` AS `location` from (`teacher` join `lecture`) where (`teacher`.`teacherno` = `lecture`.`teacherno`)  WITH CASCADED CHECK OPTION;

-- ----------------------------
-- View structure for v_teacherrenewable
-- ----------------------------
DROP VIEW IF EXISTS `v_teacherrenewable`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_teacherrenewable` AS select `teacher`.`teacherno` AS `teacherno`,`teacher`.`tname` AS `tname`,`teacher`.`tsex` AS `tsex`,`teacher`.`tbirthday` AS `tbirthday`,`teacher`.`title` AS `title`,`teacher`.`school` AS `school` from `teacher` where (`teacher`.`school` = '计算机学院');

SET FOREIGN_KEY_CHECKS = 1;
