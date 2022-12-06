/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : library_management

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 06/12/2022 19:01:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'username',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'phone',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'email',
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'password',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_key`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '13988997788', NULL, '2022-10-08 22:21:26', '2022-10-11 20:37:20', '4297f44b13955235245b2497399d7a93', 1);
INSERT INTO `admin` VALUES (2, 'admin1', '0411335555', 'admin1@qq.com', '2022-10-10 21:28:42', '2022-12-06 13:45:24', 'a7dbef0f88b54fad3f91d010a30eff55', 1);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'name',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'description',
  `publish_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'publish_date',
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'author',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'publisher',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'category',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'book_no',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'cover',
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT 'createtime',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT 'updatetime',
  `score` int(0) NULL DEFAULT NULL COMMENT 'score',
  `nums` int(0) NULL DEFAULT 0 COMMENT 'nums',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `book_no_index`(`book_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'Vue', '', NULL, 'i', '', 'Technology > Biotechnology', NULL, 'http://localhost:9090/api/book/file/download/1670294926174?&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxIiwiZXhwIjoxNjcxNTkwOTI2fQ._baVT1cipKEeEUw7kdcCm4rdOIkoGyl6ZHULq8YMc7c&play=1', '2022-10-17 21:35:14', '2022-12-06 00:00:00', 10, 1);
INSERT INTO `book` VALUES (6, 'Java', '2222', NULL, '222', '2', 'Technology > Biotechnology', NULL, 'http://localhost:9090/api/book/file/download/1670294958736?&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxIiwiZXhwIjoxNjcxNTkwOTU4fQ.ZzjDcUb6diA-gNcnK_rwUvY4SjhkpqP8JwgwDhkwj30&play=1', '2022-10-17 22:30:01', '2022-12-06 00:00:00', 20, 100);
INSERT INTO `book` VALUES (7, 'Book12', '3333', NULL, '33', '333', 'History > North history', NULL, 'http://localhost:9090/api/book/file/download/1670294890669?&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxIiwiZXhwIjoxNjcxNTkwODkwfQ.tFNd6DNmVsQdr-kZSKW_XXeeAOC9KWEOfKPo8Hchnkc&play=1', '2022-10-17 22:30:59', '2022-12-06 00:00:00', 10, 98);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'book_name',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'book_no',
  `user_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'user_no',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'user_name',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'user_phone',
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT 'createtime',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT 'updatetime',
  `score` int(0) NULL DEFAULT NULL COMMENT 'score',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Loaned' COMMENT 'status',
  `days` int(0) NULL DEFAULT 1 COMMENT 'days of lent',
  `return_date` datetime(0) NULL DEFAULT NULL COMMENT 'return_date',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (2, '222', '333', '20220927-2094581083', 'Li', '138999009988', '2022-10-19 22:06:32', NULL, 10, '已借出', 2, '2022-10-21 00:00:00');
INSERT INTO `borrow` VALUES (3, '222', '22222', '20220927-2094581083', 'Li', '138999009988', '2022-10-19 22:15:28', NULL, 25, '已借出', 3, '2022-10-22 00:00:00');
INSERT INTO `borrow` VALUES (4, '222', '22222', '20220927-2094581083', 'Li', '138999009988', '2022-10-19 22:16:00', NULL, 25, '已借出', 4, '2022-10-23 00:00:00');
INSERT INTO `borrow` VALUES (5, '222', '22222', '20220927-2094581083', 'Li', '138999009988', '2022-10-19 22:16:26', NULL, 30, '已借出', 5, '2022-10-24 00:00:00');
INSERT INTO `borrow` VALUES (6, '222', '22222', '202209271239528742', 'Li', '13988990099', '2022-10-19 22:19:18', NULL, 30, '已借出', 6, '2022-10-25 00:00:00');
INSERT INTO `borrow` VALUES (7, '222', '22222', '202209271239528742', 'Li', '13988990099', '2022-10-19 22:19:40', NULL, 30, '已借出', 7, '2022-10-26 00:00:00');
INSERT INTO `borrow` VALUES (8, '222', '22222', '202209271239528742', 'Li', '13988990099', '2022-10-19 22:19:47', NULL, 30, '已归还', 8, '2022-10-27 00:00:00');
INSERT INTO `borrow` VALUES (9, '222', '22222', '202209271018800687', 'Li', NULL, '2022-10-19 22:30:22', NULL, 30, '已归还', 9, '2022-10-28 00:00:00');
INSERT INTO `borrow` VALUES (10, '222', '22222', '202209271018800687', 'Li', NULL, '2022-10-19 22:30:47', NULL, 30, '已归还', 10, '2022-10-29 00:00:00');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'name',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'remark',
  `pid` int(0) NULL DEFAULT NULL COMMENT '父级id',
  `createtime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (3, 'History', '', NULL, '2022-10-12 20:42:53', '2022-12-06 00:00:00');
INSERT INTO `category` VALUES (5, 'North history', NULL, 3, '2022-10-12 20:46:29', '2022-12-06 00:00:00');
INSERT INTO `category` VALUES (9, 'West history', 'West history', 3, '2022-10-12 21:00:41', '2022-12-06 00:00:00');
INSERT INTO `category` VALUES (10, 'Technology', 'Technology', NULL, '2022-10-12 21:50:08', '2022-12-06 00:00:00');
INSERT INTO `category` VALUES (11, 'AI', NULL, 10, '2022-10-12 21:50:16', '2022-12-06 00:00:00');
INSERT INTO `category` VALUES (12, 'Biotechnology', 'Biotechnology', 10, '2022-10-12 21:50:22', '2022-12-06 00:00:00');

-- ----------------------------
-- Table structure for retur
-- ----------------------------
DROP TABLE IF EXISTS `retur`;
CREATE TABLE `retur`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书名称',
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书标准码',
  `user_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户会员码',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户联系方式',
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `score` int(0) NULL DEFAULT NULL COMMENT '借书积分',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '已借出' COMMENT '借书状态',
  `days` int(0) NULL DEFAULT 1 COMMENT '借书天数',
  `return_date` datetime(0) NULL DEFAULT NULL COMMENT '归还日期',
  `real_date` datetime(0) NULL DEFAULT NULL COMMENT '实际归还日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retur
-- ----------------------------
INSERT INTO `retur` VALUES (2, 'Java学习指南', 'JAVA_212113123', '202209271239528742', '苗洋洋', '13988990099', '2022-10-25 20:18:59', NULL, 20, 'Loaned', 3, '2022-10-28 00:00:00', NULL);
INSERT INTO `retur` VALUES (3, '222', '22222', '202209271018800687', '测试', NULL, '2022-10-25 20:21:41', NULL, 30, 'Loaned', 10, '2022-10-29 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (4, '222', '22222', '202209271018800687', '测试', NULL, '2022-10-25 20:21:53', NULL, 30, 'Loaned', 9, '2022-10-28 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (5, '222', '22222', '202209271239528742', '王二文案', '13988990099', '2022-10-25 20:21:55', NULL, 30, 'Loaned', 8, '2022-10-27 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (6, 'Java学习指南', 'JAVA_212113123', '20220927688792394', '杰克', '13977889988', '2022-10-25 21:19:01', NULL, 20, 'Loaned', 3, '2022-10-28 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (7, 'Java学习指南', 'JAVA_212113123', '20220927688792394', '杰克', '13977889988', '2022-10-25 21:20:04', NULL, 20, 'Loaned', 3, '2022-10-28 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (8, 'Java学习指南', 'JAVA_212113123', '20220927688792394', '杰克', '13977889988', '2022-10-25 21:23:08', NULL, 20, 'Loaned', 3, '2022-10-28 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (9, 'Java学习指南', 'JAVA_212113123', '20220927688792394', '杰克', '13977889988', '2022-10-25 21:24:47', NULL, 20, 'Returned', 3, '2022-10-28 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (10, 'Java学习指南', 'JAVA_212113123', '20220927688792394', '杰克', '13977889988', '2022-10-25 21:27:19', NULL, 20, 'Returned', 4, '2022-10-29 00:00:00', '2022-10-25 00:00:00');
INSERT INTO `retur` VALUES (11, 'Java学习指南', 'JAVA_212113123', '20220927688792394', '杰克', '13977889988', '2022-10-25 21:28:35', NULL, 80, 'Returned', 4, '2022-10-22 00:00:00', '2022-10-25 00:00:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '会员码',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系方式',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `createtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updatetime` datetime(0) NULL DEFAULT NULL,
  `account` int(0) NULL DEFAULT 0 COMMENT '账户余额',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '禁用状态 1不禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (19, 'Li', '202209271239528742', 18, 'male', '0433589655', 'ACT', '2022-09-27 22:10:36', '2022-12-06 13:45:12', 140, 1);
INSERT INTO `user` VALUES (22, 'Karon', '202209271213716465', 22, 'male', '0433528966', NULL, '2022-09-27 22:34:48', '2022-12-06 13:44:48', 100, 1);
INSERT INTO `user` VALUES (23, 'Jack', '20220927688792394', 33, 'male', '', NULL, '2022-09-27 22:35:35', '2022-12-06 13:44:30', -40, 0);
INSERT INTO `user` VALUES (24, 'Linon Linon', '06412022581693596', 22, 'Male', '454544645', '122', '2022-12-06 18:41:48', NULL, 0, 1);
INSERT INTO `user` VALUES (25, 'Kale', '06422022702531164', 54, 'Male', '0222551', 'ACT', '2022-12-06 18:42:06', NULL, 0, 1);

SET FOREIGN_KEY_CHECKS = 1;
