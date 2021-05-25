/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : survey

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 25/05/2021 11:38:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2087 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (2073, 'admin', '433db2fa87c8e880868dcf6ae9c2fca2', 'admin', '123456', '', 0);
INSERT INTO `tb_admin` VALUES (2086, 'test1', '0645dafaeb55214d17122f68e2ffb670', '1', '1', '测试一', 1);

-- ----------------------------
-- Table structure for tb_answer_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_opt`;
CREATE TABLE `tb_answer_opt`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `opt_id` int NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1radio|2checkbox',
  `create_time` datetime NULL DEFAULT NULL,
  `voter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_2`(`opt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_answer_opt
-- ----------------------------
INSERT INTO `tb_answer_opt` VALUES (23, 19, 33, 96, '1', '2020-06-16 09:39:38', 'ef539923-716d-4735-a286-81167a1f4e63');
INSERT INTO `tb_answer_opt` VALUES (24, 19, 34, 100, '2', '2020-06-16 09:39:38', 'ef539923-716d-4735-a286-81167a1f4e63');
INSERT INTO `tb_answer_opt` VALUES (25, 19, 33, 97, '1', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (26, 19, 34, 100, '2', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (27, 19, 34, 102, '2', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (28, 19, 33, 98, '1', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_opt` VALUES (29, 19, 34, 103, '2', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_opt` VALUES (30, 19, 33, 97, '1', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (31, 19, 34, 101, '2', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (32, 19, 34, 103, '2', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (33, 20, 41, 120, '1', '2020-07-12 22:52:48', '1ec92c75-1692-4ecb-9786-6346ab9f4162');
INSERT INTO `tb_answer_opt` VALUES (34, 20, 42, 124, '2', '2020-07-12 22:52:48', '1ec92c75-1692-4ecb-9786-6346ab9f4162');
INSERT INTO `tb_answer_opt` VALUES (35, 20, 42, 125, '2', '2020-07-12 22:52:48', '1ec92c75-1692-4ecb-9786-6346ab9f4162');
INSERT INTO `tb_answer_opt` VALUES (36, 5, 44, 132, '1', '2021-05-25 08:15:35', '18dedfcc-a609-4253-9c6a-a8e8090736b8');
INSERT INTO `tb_answer_opt` VALUES (37, 6, 45, 135, '1', '2021-05-25 10:11:05', '3736a3b0-b30c-4a84-ae62-412b53fbc447');
INSERT INTO `tb_answer_opt` VALUES (38, 8, 46, 136, '2', '2021-05-25 10:41:11', '83562fbb-e228-4168-978c-e7a0b91b186d');
INSERT INTO `tb_answer_opt` VALUES (39, 8, 46, 137, '2', '2021-05-25 10:41:11', '83562fbb-e228-4168-978c-e7a0b91b186d');
INSERT INTO `tb_answer_opt` VALUES (40, 8, 46, 138, '2', '2021-05-25 10:41:11', '83562fbb-e228-4168-978c-e7a0b91b186d');
INSERT INTO `tb_answer_opt` VALUES (41, 8, 46, 136, '2', '2021-05-25 10:41:11', '2d0d00ec-efcb-4876-9b90-43002a4d8b3c');
INSERT INTO `tb_answer_opt` VALUES (42, 8, 46, 137, '2', '2021-05-25 10:41:11', '2d0d00ec-efcb-4876-9b90-43002a4d8b3c');
INSERT INTO `tb_answer_opt` VALUES (43, 8, 46, 138, '2', '2021-05-25 10:41:11', '2d0d00ec-efcb-4876-9b90-43002a4d8b3c');
INSERT INTO `tb_answer_opt` VALUES (44, 8, 46, 137, '2', '2021-05-25 10:43:36', '29b49818-500a-4903-9d52-e09d29517e1c');
INSERT INTO `tb_answer_opt` VALUES (45, 8, 46, 138, '2', '2021-05-25 10:46:17', '02356d5e-9a11-48b2-ac86-c8ce5050c572');

-- ----------------------------
-- Table structure for tb_answer_txt
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_txt`;
CREATE TABLE `tb_answer_txt`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `voter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_answer_txt
-- ----------------------------
INSERT INTO `tb_answer_txt` VALUES (9, 19, 38, '111', '2020-06-16 09:39:38', NULL);
INSERT INTO `tb_answer_txt` VALUES (10, 19, 38, '11222', '2020-06-16 09:39:45', NULL);

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL COMMENT '1radio|2checkbox|3text|4textarea',
  `required` int NULL DEFAULT NULL COMMENT '0非必填1必填',
  `check_style` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'text;number;date',
  `order_style` int NULL DEFAULT NULL COMMENT '0顺序1随机',
  `show_style` int NULL DEFAULT NULL COMMENT '1;2;3;4',
  `test` int NULL DEFAULT NULL COMMENT '0不测评1测评',
  `score` int NULL DEFAULT NULL,
  `orderby` int NULL DEFAULT NULL,
  `creator` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `survey_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`survey_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (44, '是否打了新冠疫苗', '描述', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2021-05-25 08:14:55', 5);
INSERT INTO `tb_question` VALUES (45, '标题1', '描述1', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2021-05-25 10:10:37', 6);
INSERT INTO `tb_question` VALUES (46, '多项选择测试', '这是多项选择测试', 2, 1, NULL, NULL, NULL, 1, 4, NULL, NULL, '2021-05-25 10:40:35', 8);

-- ----------------------------
-- Table structure for tb_question_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_question_opt`;
CREATE TABLE `tb_question_opt`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NULL DEFAULT NULL,
  `question_id` int NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1radio|2checkbox',
  `opt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderby` int NULL DEFAULT NULL,
  `answer` int NULL DEFAULT NULL COMMENT '默认为NULL；1答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_question_opt
-- ----------------------------
INSERT INTO `tb_question_opt` VALUES (132, 5, 44, '1', '已打', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (133, 5, 44, '1', '未打', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (134, 6, 45, '1', '选项1', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (135, 6, 45, '1', '选项2', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (136, 8, 46, '2', 'A', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (137, 8, 46, '2', 'B', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (138, 8, 46, '2', 'C', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (139, 8, 46, '2', 'D', 4, NULL);

-- ----------------------------
-- Table structure for tb_survey
-- ----------------------------
DROP TABLE IF EXISTS `tb_survey`;
CREATE TABLE `tb_survey`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bounds` int NULL DEFAULT NULL COMMENT '0:不限制;1:限制',
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `rules` int NULL DEFAULT NULL COMMENT '0公开;1密码',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建、执行中、结束',
  `logo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bgimg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `anon` int NULL DEFAULT NULL COMMENT '0匿名；1不匿名',
  `creator` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_survey
-- ----------------------------
INSERT INTO `tb_survey` VALUES (5, '你是否已经打了新型冠状病毒疫苗？', '请选择是或不是', 0, '2021-05-24 16:00:00', '2021-05-30 16:00:00', 0, '', 'http://localhost:8080/survey/dy/7bb720e8-076a-4cbe-9031-e8aadc8e3347', '执行中', NULL, NULL, 1, 2073, '2021-05-25 08:13:53');
INSERT INTO `tb_survey` VALUES (6, '单项选择', '单项选择测试', 0, '2021-05-24 16:00:00', '2021-05-30 16:00:00', 1, 'abc', 'http://localhost:8080/survey/dy/9bef7f02-5409-4c05-bd4b-ade65db32e2d', '执行中', NULL, NULL, 0, 2073, '2021-05-25 10:10:20');
INSERT INTO `tb_survey` VALUES (8, '多项选择', '多项选择测试', 0, '2021-05-24 16:00:00', '2021-05-25 16:00:00', 0, '', 'http://localhost:8080/survey/dy/d671020f-97e4-4fa3-b7cb-5e9e79cd841a', '执行中', NULL, NULL, 0, 2086, '2021-05-25 10:12:19');

SET FOREIGN_KEY_CHECKS = 1;
