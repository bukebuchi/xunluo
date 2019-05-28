-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: 2019-05-27 10:03:40
-- 服务器版本： 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_estate`
--

-- --------------------------------------------------------

--
-- 表的结构 `es_activity`
--

DROP TABLE IF EXISTS `es_activity`;
CREATE TABLE IF NOT EXISTS `es_activity` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属片区编号，建议CM开头',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `content` text COMMENT '活动内容',
  `place` varchar(255) NOT NULL COMMENT '活动地点',
  `begin_time` int(10) UNSIGNED DEFAULT NULL COMMENT '活动开始时间',
  `end_time` int(10) UNSIGNED DEFAULT NULL COMMENT '活动截止时间',
  `sponsor_unit` varchar(255) NOT NULL COMMENT '举办单位',
  `status` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '状态 0 无效 1 有效',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区活动信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_admin`
--

DROP TABLE IF EXISTS `es_admin`;
CREATE TABLE IF NOT EXISTS `es_admin` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='管理员表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `es_admin`
--

INSERT INTO `es_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', '超级管理员', '30db7c7a6f88e33afa132e1a855af308', '13deb6', '/assets/img/avatar.png', 'admin@admin.com', 0, 1558938315, 1492186163, 1558938315, '13ba590c-98d1-4240-9608-3cba2dd9590f', 'normal'),
(2, 'root', '李四', '7008dab2af836eb070b30452881bb356', 'fvmoIy', '/assets/img/avatar.png', '247364041@qq.com', 0, 1558701223, 1558596136, 1558701304, '', 'normal'),
(3, 'zhangsan', '张三', '906109827b0b2634ba52a888c5d3ace2', 'NDeZuU', '/assets/img/avatar.png', '247364043@qq.com', 0, 0, 1558692144, 1558692144, '', 'normal'),
(4, 'wangming', '王明', 'fffe2c0457e1048d62d681246320e74b', 'grXvVs', '/assets/img/avatar.png', '247364046@qq.com', 0, 0, 1558693977, 1558693977, '', 'normal'),
(5, 'ddwwww', 'dd', 'fe87328f0e53017f10431123c3c017c7', 'yXYVM2', '/assets/img/avatar.png', 'ddd@qq.com', 0, 0, 1558938460, 1558938460, '', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `es_admin_log`
--

DROP TABLE IF EXISTS `es_admin_log`;
CREATE TABLE IF NOT EXISTS `es_admin_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=789 DEFAULT CHARSET=utf8 COMMENT='管理员日志表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `es_admin_log`
--

INSERT INTO `es_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(1, 0, 'Unknown', '/admin/index/login?url=/', '', '{\"url\":\"\\/\",\"__token__\":\"64aa31f3162f22abbc2992863b00b44a\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558524239),
(2, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"2fe133d17e001ea194040807acc063a5\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558524242),
(3, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558524251),
(4, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558524251),
(5, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558524251),
(6, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558524252),
(7, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558525911),
(8, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558525912),
(9, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558525912),
(10, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558525912),
(11, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558571517),
(12, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558571518),
(13, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558571518),
(14, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558571518),
(15, 1, 'admin', '/admin/auth/rule/multi/ids/1', '', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573858),
(16, 1, 'admin', '/admin/auth/rule/multi/ids/1', '', '{\"action\":\"\",\"ids\":\"1\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573863),
(17, 1, 'admin', '/admin/auth/rule/multi/ids/4', '', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573880),
(18, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573891),
(19, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573891),
(20, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573891),
(21, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573892),
(22, 1, 'admin', '/admin/auth/rule/multi/ids/4', '', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573903),
(23, 1, 'admin', '/admin/auth/rule/edit/ids/4?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"Addon\",\"icon\":\"fa fa-rocket\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"Addon tips\",\"status\":\"normal\"},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558573916),
(24, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574030),
(25, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574030),
(26, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574030),
(27, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574030),
(28, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574563),
(29, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574563),
(30, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574563),
(31, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574564),
(32, 1, 'admin', '/admin/auth/rule/multi/ids/55', '', '{\"action\":\"\",\"ids\":\"55\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574612),
(33, 1, 'admin', '/admin/auth/rule/multi/ids/56', '', '{\"action\":\"\",\"ids\":\"56\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574623),
(34, 1, 'admin', '/admin/auth/rule/multi/ids/57', '', '{\"action\":\"\",\"ids\":\"57\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574629),
(35, 1, 'admin', '/admin/auth/rule/multi/ids/58', '', '{\"action\":\"\",\"ids\":\"58\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574635),
(36, 1, 'admin', '/admin/auth/rule/multi/ids/59', '', '{\"action\":\"\",\"ids\":\"59\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574640),
(37, 1, 'admin', '/admin/auth/rule/multi/ids/60', '', '{\"action\":\"\",\"ids\":\"60\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574645),
(38, 1, 'admin', '/admin/auth/rule/multi/ids/61', '', '{\"action\":\"\",\"ids\":\"61\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574650),
(39, 1, 'admin', '/admin/auth/rule/multi/ids/62', '', '{\"action\":\"\",\"ids\":\"62\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574654),
(40, 1, 'admin', '/admin/auth/rule/multi/ids/63', '', '{\"action\":\"\",\"ids\":\"63\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574659),
(41, 1, 'admin', '/admin/auth/rule/multi/ids/64', '', '{\"action\":\"\",\"ids\":\"64\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574664),
(42, 1, 'admin', '/admin/auth/rule/multi/ids/65', '', '{\"action\":\"\",\"ids\":\"65\",\"params\":\"ismenu=1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574669),
(43, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574699),
(44, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574699),
(45, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574699),
(46, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574699),
(47, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"d00324a3206038c5d799df5bfb968bf8\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574720),
(48, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574722),
(49, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574723),
(50, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574723),
(51, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558574723),
(52, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583709),
(53, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583710),
(54, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583711),
(55, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583711),
(56, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583757),
(57, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583757),
(58, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583757),
(59, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583757),
(60, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583767),
(61, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583767),
(62, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583767),
(63, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583767),
(64, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583917),
(65, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583917),
(66, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583917),
(67, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583917),
(68, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"26c0164cd67fd879a4407f22b448aa95\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583929),
(69, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583931),
(70, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583931),
(71, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583931),
(72, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558583931),
(73, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"96b12e91ae6eba70f3eac857c1516376\",\"username\":\"root\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584096),
(74, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"192cc2f5f32bd68869afb2ee47c79679\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584101),
(75, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584105),
(76, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584105),
(77, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584105),
(78, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584106),
(79, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584124),
(80, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584124),
(81, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584124),
(82, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584124),
(83, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584129),
(84, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584129),
(85, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584130),
(86, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584130),
(87, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584134),
(88, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584134),
(89, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584134),
(90, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584134),
(91, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584408),
(92, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584408),
(93, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584408),
(94, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584408),
(95, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584413),
(96, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584413),
(97, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584414),
(98, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584414),
(99, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"d0a49e21a46e8cbd3bc9f5e6c04aee17\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584429),
(100, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584432),
(101, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584432),
(102, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584432),
(103, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584432),
(104, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584510),
(105, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584510),
(106, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584510),
(107, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558584510),
(108, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"ebd0acad70ca1b6c70d7dad41cadb941\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1558584645),
(109, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1558584648),
(110, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1558584648),
(111, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1558584648),
(112, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', 1558584649),
(113, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558585154),
(114, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558585154),
(115, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558585155),
(116, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558585155),
(117, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588367),
(118, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588367),
(119, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588367),
(120, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588367),
(121, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588598),
(122, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588598),
(123, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588599),
(124, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558588599),
(125, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590614),
(126, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590614),
(127, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590615),
(128, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590615),
(129, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590619),
(130, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590620),
(131, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590620),
(132, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558590620),
(133, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558591543),
(134, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558591544),
(135, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558591544),
(136, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558591544),
(137, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558591549),
(138, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558591570),
(139, 1, 'admin', '/admin/command/command/action/execute', '在线命令管理 Command', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"es_activity\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558592451),
(140, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_test\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558592488),
(141, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558592573),
(142, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_test\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558592584),
(143, 1, 'admin', '/admin/command/command/action/command', '在线命令管理 Command', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"es_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558592833),
(144, 1, 'admin', '/admin/command/command/action/command', '在线命令管理 Command', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"es_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558592835),
(145, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593062),
(146, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_test\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593066),
(147, 1, 'admin', '/admin/command/command/action/command', '在线命令管理 Command', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"es_test\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593070),
(148, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593228),
(149, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593229),
(150, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593229),
(151, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593229),
(152, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"1,581,598,599,604,609,610,615,620,625,626,631,658,659,665,671,677,683,587,588,593,689,2,706,6,7,8,104,3,5,9,10,11,12,4,693\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593264),
(153, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"706,4,693,5,12,11,10,9,3,2,104,8,7,6,689,587,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581,1\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593276),
(154, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593394),
(155, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593395),
(156, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593395),
(157, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593395),
(158, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"67b5ee4e5a1935b7a9b1304032552951\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593432),
(159, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593434),
(160, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593434),
(161, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593434),
(162, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593434),
(163, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,693,5,12,11,10,9,3,2,706,104,8,7,6,689,587,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581,1\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593486),
(164, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593493),
(165, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593493),
(166, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593493),
(167, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593493),
(168, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,693,5,12,706,11,10,9,3,2,104,8,7,6,689,587,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581,1\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593533),
(169, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"706,4,693,5,12,11,10,9,3,2,104,8,7,6,689,587,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581,1\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593539),
(170, 1, 'admin', '/admin/auth/rule/edit/ids/706?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"test\",\"title\":\"\\u6d4b\\u8bd5\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"1\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"706\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593564),
(171, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593574),
(172, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593574),
(173, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593574),
(174, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593574),
(175, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"4,693,5,12,11,10,9,3,2,104,8,7,6,689,587,593,588,683,658,677,671,706,665,659,625,631,626,609,620,615,610,598,604,599,581,1\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593606),
(176, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593613),
(177, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593613),
(178, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593613),
(179, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593613),
(180, 1, 'admin', '/admin/auth/rule/edit/ids/1?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"dashboard\",\"title\":\"Dashboard\",\"icon\":\"fa fa-dashboard\",\"weigh\":\"1\",\"condition\":\"\",\"remark\":\"Dashboard tips\",\"status\":\"normal\"},\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593643),
(181, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593654),
(182, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593654),
(183, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593654),
(184, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593654),
(185, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593705),
(186, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593705),
(187, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593705),
(188, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593705),
(189, 1, 'admin', '/admin/auth/rule/edit/ids/706?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"test\",\"title\":\"\\u5de1\\u903b\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"183\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"706\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593726),
(190, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593731),
(191, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593731),
(192, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593731),
(193, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558593732),
(194, 1, 'admin', '/admin/admin/index', '', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"w\",\"field\":\"nickname\",\"order_by\":[[\"nickname\",\"ASC\"]],\"pkey_name\":\"id\",\"pkey_value\":\"w\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595952),
(195, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595953),
(196, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595954),
(197, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595957),
(198, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595959),
(199, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"w\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"w\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595961),
(200, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\\u6211\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\\u6211\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595962),
(201, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595964),
(202, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595964),
(203, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"1\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595965),
(204, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595966),
(205, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"1\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595967);
INSERT INTO `es_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(206, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595982),
(207, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595984),
(208, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595985),
(209, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"11\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"11\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595994),
(210, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"1\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595994),
(211, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595995),
(212, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595996),
(213, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558595998),
(214, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"222\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"222\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596000),
(215, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"ad\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"ad\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596002),
(216, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"admin\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596003),
(217, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"1\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596007),
(218, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596009),
(219, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596009),
(220, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596010),
(221, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596010),
(222, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596011),
(223, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596011),
(224, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596012),
(225, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596012),
(226, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596042),
(227, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596086),
(228, 1, 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 操作员管理 添加', '{\"dialog\":\"1\",\"group\":[\"2\"],\"community_code\":[\"\"],\"row\":{\"username\":\"root\",\"email\":\"247364041@qq.com\",\"nickname\":\"ss\",\"password\":\"123456\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596136),
(229, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596142),
(230, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596143),
(231, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596144),
(232, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596144),
(233, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596144),
(234, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596145),
(235, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596147),
(236, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"d\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"d\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596149),
(237, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596150),
(238, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596152),
(239, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"1\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596154),
(240, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596155),
(241, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596155),
(242, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596159),
(243, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596164),
(244, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596166),
(245, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"test\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596171),
(246, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596172),
(247, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596173),
(248, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596174),
(249, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596174),
(250, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596174),
(251, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596251),
(252, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596251),
(253, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596252),
(254, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596252),
(255, 1, 'admin', '/admin/auth/rule/multi/ids/4', '', '{\"action\":\"\",\"ids\":\"4\",\"params\":\"ismenu=0\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596268),
(256, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596277),
(257, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596277),
(258, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596277),
(259, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596277),
(260, 1, 'admin', '/admin/auth/rule/edit/ids/4?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"0\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"Addon\",\"icon\":\"fa fa-rocket\",\"weigh\":\"87\",\"condition\":\"\",\"remark\":\"Addon tips\",\"status\":\"hidden\"},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596291),
(261, 1, 'admin', '/admin/auth/rule/edit/ids/4?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"Addon\",\"icon\":\"fa fa-rocket\",\"weigh\":\"87\",\"condition\":\"\",\"remark\":\"Addon tips\",\"status\":\"hidden\"},\"ids\":\"4\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596295),
(262, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596300),
(263, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596300),
(264, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596300),
(265, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558596301),
(266, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597901),
(267, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597901),
(268, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597902),
(269, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597902),
(270, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597922),
(271, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597922),
(272, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597922),
(273, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558597923),
(274, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598349),
(275, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598350),
(276, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598350),
(277, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598350),
(278, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598407),
(279, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598407),
(280, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598407),
(281, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598407),
(282, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598422),
(283, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598422),
(284, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598422),
(285, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598422),
(286, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598488),
(287, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598488),
(288, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598488),
(289, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598488),
(290, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558598684),
(291, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600090),
(292, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600090),
(293, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600090),
(294, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600090),
(295, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600169),
(296, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600170),
(297, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600170),
(298, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600170),
(299, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600190),
(300, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600191),
(301, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600191),
(302, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600191),
(303, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600941),
(304, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600941),
(305, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600941),
(306, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600941),
(307, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600947),
(308, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600947),
(309, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600947),
(310, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600947),
(311, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600980),
(312, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600981),
(313, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600981),
(314, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558600981),
(315, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601148),
(316, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601148),
(317, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601148),
(318, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601148),
(319, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601158),
(320, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601158),
(321, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601158),
(322, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601159),
(323, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601510),
(324, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601510),
(325, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601510),
(326, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601510),
(327, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601545),
(328, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601546),
(329, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601546),
(330, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558601546),
(331, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"b2172c959ad9f7e5df6279456e5220a0\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558606734),
(332, 1, 'admin', '/admin/index/login?url=/', '', '{\"url\":\"\\/\",\"__token__\":\"b2172c959ad9f7e5df6279456e5220a0\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558606735),
(333, 1, 'admin', '/admin/index/login?url=/', '', '{\"url\":\"\\/\",\"__token__\":\"b2172c959ad9f7e5df6279456e5220a0\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558606736),
(334, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558606764),
(335, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558606764),
(336, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558606765),
(337, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558606765),
(338, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608318),
(339, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608318),
(340, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608320),
(341, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608320),
(342, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608339),
(343, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608339),
(344, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608339),
(345, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608339),
(346, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608380),
(347, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608380),
(348, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608380),
(349, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608381),
(350, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608554),
(351, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608555),
(352, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608555),
(353, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608555),
(354, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608616),
(355, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608616),
(356, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608616),
(357, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608616),
(358, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608644),
(359, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608644),
(360, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608644),
(361, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608644),
(362, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608660),
(363, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608660),
(364, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608660),
(365, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608660),
(366, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608675),
(367, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608675),
(368, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608676),
(369, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608676),
(370, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608923),
(371, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608923),
(372, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608924),
(373, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558608924),
(374, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"04bb68c2ad4920218390065c678bd5b6\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680183),
(375, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680188),
(376, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680188),
(377, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680188),
(378, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680188),
(379, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680540),
(380, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680540),
(381, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680540),
(382, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680541);
INSERT INTO `es_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(383, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"e1e3cebf0af8cc35ab5cba2ed7ae2d52\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680689),
(384, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680691),
(385, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680691),
(386, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680692),
(387, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680692),
(388, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680818),
(389, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680818),
(390, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680819),
(391, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680819),
(392, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"396db4f3a695dcf4e81d60f521d89026\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680832),
(393, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680834),
(394, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680834),
(395, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680834),
(396, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558680834),
(397, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681165),
(398, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681166),
(399, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681166),
(400, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681167),
(401, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681800),
(402, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681800),
(403, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681800),
(404, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681800),
(405, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681861),
(406, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681861),
(407, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681861),
(408, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681861),
(409, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681991),
(410, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681991),
(411, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681992),
(412, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558681992),
(413, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682089),
(414, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682089),
(415, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682089),
(416, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682090),
(417, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682139),
(418, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682139),
(419, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682140),
(420, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682140),
(421, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682301),
(422, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682301),
(423, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682301),
(424, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558682301),
(425, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684094),
(426, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684095),
(427, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684096),
(428, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684096),
(429, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684219),
(430, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684219),
(431, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684220),
(432, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684220),
(433, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684246),
(434, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684246),
(435, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684246),
(436, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684246),
(437, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684261),
(438, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684261),
(439, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684261),
(440, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684261),
(441, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"74d90a3432e2e518921d17d8953b3865\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684556),
(442, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684558),
(443, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684558),
(444, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684558),
(445, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684558),
(446, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684613),
(447, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684613),
(448, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684613),
(449, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684614),
(450, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684787),
(451, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684787),
(452, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684787),
(453, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684787),
(454, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684942),
(455, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684943),
(456, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684943),
(457, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684943),
(458, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684985),
(459, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684985),
(460, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684985),
(461, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684986),
(462, 2, 'root', '/admin/index/login?url=/admin/index/index', '登录', '{\"url\":\"\\/admin\\/index\\/index\",\"__token__\":\"52c94bfa748a1d9e876c65c123647b40\",\"username\":\"root\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684996),
(463, 2, 'root', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684998),
(464, 2, 'root', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684998),
(465, 2, 'root', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684998),
(466, 2, 'root', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558684998),
(467, 0, 'Unknown', '/admin/index/login', '', '{\"__token__\":\"7f9e3eeed375bf82ef15d51743d91586\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685023),
(468, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"2b2a067688080a6770da62afa720c953\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685028),
(469, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"be775ec721f3674f100f66a45788d84a\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685032),
(470, 1, 'admin', '/admin/dashboard/get_general_data', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685035),
(471, 1, 'admin', '/admin/dashboard/get_activity', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685035),
(472, 1, 'admin', '/admin/dashboard/get_expenses', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685035),
(473, 1, 'admin', '/admin/dashboard/get_repair', '', '[]', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685035),
(474, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685046),
(475, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685064),
(476, 1, 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"585,583,582,603,602,601,600,608,607,606,605,614,613,612,611,619,618,617,616,624,623,622,621,630,629,628,627,635,634,633,632,664,663,662,661,660,670,669,668,667,666,676,675,674,673,672,682,681,680,679,678,688,687,686,685,684,592,591,590,589,597,596,595,594,690,40,41,42,43,44,45,46,13,14,16,15,17,1,9,10,683,677,671,665,659,658,631,626,625,620,615,610,609,604,599,598,593,588,587,581,689,5\",\"pid\":\"1\",\"name\":\"\\u5de1\\u66f4\\u4eba\\u5458\",\"status\":\"normal\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685100),
(477, 1, 'admin', '/admin/duty/index/add?code=null&selDate=1556668800000&dialog=1', '值班管理 添加', '{\"code\":\"null\",\"selDate\":\"1556668800000\",\"dialog\":\"1\",\"id\":\"\",\"row\":{\"community_code\":\"null\",\"name\":[\"ss\"],\"start_time\":1556668800,\"end_time\":1556712000,\"remark\":\"\\u52a0\\u73ed\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685162),
(478, 1, 'admin', '/admin/duty/index/add?code=null&selDate=1556668800000&dialog=1', '值班管理 添加', '{\"code\":\"null\",\"selDate\":\"1556668800000\",\"dialog\":\"1\",\"id\":\"\",\"row\":{\"community_code\":\"null\",\"name\":[\"ss\"],\"start_time\":1556668800,\"end_time\":1556676000,\"remark\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685190),
(479, 1, 'admin', '/admin/duty/index/add?code=null&selDate=1556668800000&dialog=1', '值班管理 添加', '{\"code\":\"null\",\"selDate\":\"1556668800000\",\"dialog\":\"1\",\"id\":\"\",\"row\":{\"community_code\":\"null\",\"name\":[\"ss\"],\"start_time\":1556668800,\"end_time\":1556668800,\"remark\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685252),
(480, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685284),
(481, 1, 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"1,9,10,13,14,15,16,17,40,41,42,43,44,45,46,582,583,585,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,5,581\",\"pid\":\"1\",\"name\":\"\\u5de1\\u66f4\\u4eba\\u5458\",\"status\":\"normal\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685292),
(482, 1, 'admin', '/admin/duty/index/add?code=null&selDate=1556668800000&dialog=1', '值班管理 添加', '{\"code\":\"null\",\"selDate\":\"1556668800000\",\"dialog\":\"1\",\"id\":\"\",\"row\":{\"community_code\":\"null\",\"name\":[\"ss\"],\"start_time\":1556668800,\"end_time\":1556668800,\"remark\":\"\\u52a0\\u73ed\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685309),
(483, 1, 'admin', '/admin/duty/index/add?code=null&selDate=1556755200000&dialog=1', '值班管理 添加', '{\"code\":\"null\",\"selDate\":\"1556755200000\",\"dialog\":\"1\",\"id\":\"\",\"row\":{\"community_code\":\"null\",\"name\":[\"ss\"],\"start_time\":1556755200,\"end_time\":1556841600,\"remark\":\"\\u52a0\\u73ed\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685319),
(484, 1, 'admin', '/admin/community/index/add?dialog=1', '小区管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e61\\u9547\\u5de1\\u903b\\u4eba\\u5458\\u7ba1\\u7406\\u7cfb\\u7edf\",\"address\":\"ss\",\"area\":\"ss\",\"developer\":\"ss\",\"estate\":\"ss\",\"greening_rate\":\"ss\",\"total_building\":\"ss\",\"total_owner\":\"1\",\"thumb\":\"\",\"code\":\"CM2019052400001\"},\"admins\":[\"2\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685497),
(485, 1, 'admin', '/admin/community/index/add?dialog=1', '小区管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e61\\u9547\\u5de1\\u903b\\u4eba\\u5458\\u7ba1\\u7406\\u7cfb\\u7edf\",\"address\":\"ss\",\"area\":\"ss\",\"developer\":\"ss\",\"estate\":\"ss\",\"greening_rate\":\"ss\",\"total_building\":\"ss\",\"total_owner\":\"1\",\"thumb\":\"\",\"code\":\"CM2019052400001\"},\"admins\":[\"2\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685504),
(486, 1, 'admin', '/admin/community/index/add?dialog=1', '小区管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e61\\u9547\\u5de1\\u903b\\u4eba\\u5458\\u7ba1\\u7406\\u7cfb\\u7edf\",\"address\":\"1\",\"area\":\"1\",\"developer\":\"1\",\"estate\":\"1\",\"greening_rate\":\"1\",\"total_building\":\"1\",\"total_owner\":\"1\",\"thumb\":\"\",\"code\":\"CM2019052400001\"},\"admins\":[\"2\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685517),
(487, 1, 'admin', '/admin/duty/index/add?code=CM2019052400001&selDate=1556668800000&dialog=1', '值班管理 添加', '{\"code\":\"CM2019052400001\",\"selDate\":\"1556668800000\",\"dialog\":\"1\",\"id\":\"\",\"row\":{\"community_code\":\"CM2019052400001\",\"name\":[\"ss\"],\"start_time\":1556668800,\"end_time\":1556676000,\"remark\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558685535),
(488, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686122),
(489, 1, 'admin', '/admin/auth/rule/edit/ids/609?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"owners\",\"title\":\"\\u4eba\\u5458\\u4fe1\\u606f\\u7ba1\\u7406\",\"icon\":\"fa fa-user\",\"weigh\":\"180\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"609\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686168),
(490, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686286),
(491, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686286),
(492, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686287),
(493, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686287),
(494, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686290),
(495, 1, 'admin', '/admin/auth/rule/edit/ids/581?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"community\\/index\",\"title\":\"\\u7247\\u533a\\u7ba1\\u7406\",\"icon\":\"fa fa-list-alt\",\"weigh\":\"182\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u5c55\\u793a\\u7247\\u533a\\u5217\\u8868\\u4fe1\\u606f\\uff0c\\u4ee5\\u53ca\\u589e\\u52a0\\u3001\\u4fee\\u6539\\u3001\\u5220\\u9664\\u7b49\\u64cd\\u4f5c\",\"status\":\"normal\"},\"ids\":\"581\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686318),
(496, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686324),
(497, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686324),
(498, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686324),
(499, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686324),
(500, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686573),
(501, 1, 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"585,583,582,603,602,601,600,608,607,606,605,614,613,612,611,619,618,617,616,624,623,622,621,630,629,628,627,635,634,633,632,664,663,662,661,660,670,669,668,667,666,676,675,674,673,672,682,681,680,679,678,688,687,686,685,684,592,591,590,589,597,596,595,594,692,691,690,40,41,42,43,44,45,46,13,14,16,15,17,1,9,10,689,683,677,671,665,659,658,631,626,625,620,615,610,609,604,599,598,593,588,587,581,5\",\"pid\":\"1\",\"name\":\"\\u7247\\u533a\\u5de1\\u66f4\\u4eba\\u5458\",\"status\":\"normal\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686578),
(502, 1, 'admin', '/admin/auth/group/roletree', '', '{\"id\":\"2\",\"pid\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686581),
(503, 1, 'admin', '/admin/auth/group/edit/ids/2?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"row\":{\"rules\":\"585,583,582,603,602,601,600,608,607,606,605,614,613,612,611,619,618,617,616,624,623,622,621,630,629,628,627,635,634,633,632,664,663,662,661,660,670,669,668,667,666,676,675,674,673,672,682,681,680,679,678,688,687,686,685,684,592,591,590,589,597,596,595,594,690,40,41,42,43,44,45,46,13,14,16,15,17,1,9,10,683,677,671,665,659,658,631,626,625,620,615,610,609,604,599,598,593,588,587,581,689,5\",\"pid\":\"1\",\"name\":\"\\u7247\\u533a\\u5de1\\u66f4\\u4eba\\u5458\",\"status\":\"normal\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686588),
(504, 2, 'root', '/admin/index/login', '登录', '{\"__token__\":\"92fe50e0070fe5991aba07702ab4e928\",\"username\":\"root\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686597),
(505, 2, 'root', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686598),
(506, 2, 'root', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686598),
(507, 2, 'root', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686598),
(508, 2, 'root', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686599),
(509, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"f8fd1090f7b9fc9f6ccf9a628c225696\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686628),
(510, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686629),
(511, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686629),
(512, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686629),
(513, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558686629),
(514, 1, 'admin', '/admin/community/index/edit/ids/1?dialog=1', '片区管理 修改', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u53cc\\u9f99\\u6e56\\u8857\\u9053\",\"address\":\"\\u53cc\\u9f99\\u6e56\\u8857\\u9053\",\"area\":\"1.00\",\"developer\":\"1\",\"estate\":\"1\",\"greening_rate\":\"1.00\",\"total_building\":\"1\",\"total_owner\":\"2000\",\"thumb\":\"\"},\"admins\":[\"2\"],\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558687055),
(515, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558687783),
(516, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558687783),
(517, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558687783),
(518, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558687783),
(519, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558688864),
(520, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_arrest\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558688867),
(521, 1, 'admin', '/admin/command/command/action/command', '在线命令管理 Command', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"es_arrest\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558688878),
(522, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689079),
(523, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689079),
(524, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689079),
(525, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689079),
(526, 1, 'admin', '/admin/auth/rule/edit/ids/716?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"arrest\",\"title\":\"\\u6293\\u83b7\\u73b0\\u884c\",\"icon\":\"fa fa-warning\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"716\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689262),
(527, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"706,581,598,599,604,609,610,615,620,625,626,631,658,659,665,671,677,683,587,588,716,593,689,2,6,7,8,104,3,5,9,10,11,12,693,4,1\",\"changeid\":\"716\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689289),
(528, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689298),
(529, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689298),
(530, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689299),
(531, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689299),
(532, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"716,1,4,693,5,12,11,10,9,3,2,104,8,7,6,689,587,593,588,683,658,677,706,671,665,659,625,631,626,609,620,615,610,598,604,599,581\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689328),
(533, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"716,1,4,693,5,12,11,10,9,3,2,104,8,7,6,689,587,706,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689345),
(534, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"716,1,4,693,5,12,11,10,9,706,3,2,104,8,7,6,689,587,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689358),
(535, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"716,1,706,4,693,5,12,11,10,9,3,2,104,8,7,6,689,587,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689365),
(536, 1, 'admin', '/admin/ajax/weigh', '', '{\"ids\":\"716,706,1,4,693,5,12,11,10,9,3,2,104,8,7,6,689,587,593,588,683,658,677,671,665,659,625,631,626,609,620,615,610,598,604,599,581\",\"changeid\":\"706\",\"pid\":\"0\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"auth_rule\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689374),
(537, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689378),
(538, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689378),
(539, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689379),
(540, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689379),
(541, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689402),
(542, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689402),
(543, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689403),
(544, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689403),
(545, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689454),
(546, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558689455),
(547, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558691934),
(548, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558691936),
(549, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558691967),
(550, 1, 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 操作员管理 添加', '{\"dialog\":\"1\",\"group\":[\"2\"],\"community_code\":[\"CM2019052400001\"],\"row\":{\"username\":\"zhangsan\",\"email\":\"247364043@qq.com\",\"nickname\":\"\\u5f20\\u4e09\",\"password\":\"123456\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558692144),
(551, 1, 'admin', '/admin/auth/admin/edit/ids/2?dialog=1', '权限管理 操作员管理 编辑', '{\"dialog\":\"1\",\"group\":[\"2\"],\"community_code\":[\"\",\"CM2019052400001\"],\"row\":{\"username\":\"root\",\"email\":\"247364041@qq.com\",\"nickname\":\"\\u674e\\u56db\",\"password\":\"123456\",\"status\":\"normal\"},\"ids\":\"2\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558692161),
(552, 1, 'admin', '/admin/community/index/add?dialog=1', '片区管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\" \\u56de\\u5174\\u8857\\u9053\",\"address\":\"\\u56de\\u5174\\u8857\\u9053\",\"area\":\"2000\",\"developer\":\"ss\",\"estate\":\"ss\",\"greening_rate\":\"1\",\"total_building\":\"100\",\"total_owner\":\"1000\",\"thumb\":\"\",\"code\":\"CM2019052400002\"},\"admins\":[\"3\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558693882),
(553, 1, 'admin', '/admin/community/index/edit/ids/1?dialog=1', '片区管理 修改', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u53cc\\u9f99\\u6e56\\u8857\\u9053\",\"address\":\"\\u53cc\\u9f99\\u6e56\\u8857\\u9053\",\"area\":\"1.00\",\"developer\":\"1\",\"estate\":\"1\",\"greening_rate\":\"1.00\",\"total_building\":\"1\",\"total_owner\":\"2000\",\"thumb\":\"\"},\"admins\":[\"2\"],\"ids\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558693898),
(554, 1, 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 操作员管理 添加', '{\"dialog\":\"1\",\"group\":[\"2\"],\"row\":{\"username\":\"wangming\",\"email\":\"247364046@qq.com\",\"nickname\":\"\\u738b\\u660e\",\"password\":\"123456\",\"status\":\"normal\"},\"community_code\":[\"\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558693978),
(555, 1, 'admin', '/admin/community/index/add?dialog=1', '片区管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5927\\u7af9\\u6797\\u8857\\u9053\",\"address\":\"\\u5927\\u7af9\\u6797\\u8857\\u9053\",\"area\":\"100\",\"developer\":\"ss\",\"estate\":\"ss\",\"greening_rate\":\"1\",\"total_building\":\"1\",\"total_owner\":\"1000\",\"thumb\":\"\",\"code\":\"CM2019052400003\"},\"admins\":[\"4\"]}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558694046),
(556, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558694062),
(557, 1, 'admin', '/admin/parking/usage/get_parking_by_cm_code', '', '{\"community_code\":\"\",\"status\":\"1\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558694082),
(558, 1, 'admin', '/admin/parking/usage/get_parking_by_cm_code', '', '{\"community_code\":\"CM2019052400001\",\"parking_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558694084),
(559, 1, 'admin', '/admin/parking/usage/get_parking_by_cm_code', '', '{\"community_code\":\"CM2019052400001\",\"parking_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558694109),
(560, 1, 'admin', '/admin/owners/pet/get_member_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558694126),
(561, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558694133),
(562, 1, 'admin', '/admin/auth/rule/edit/ids/659?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"658\",\"name\":\"service\\/activity\",\"title\":\"\\u6293\\u83b7\\u73b0\\u884c\",\"icon\":\"fa fa-list-alt\",\"weigh\":\"62\",\"condition\":\"\",\"remark\":\"\\u7528\\u4e8e\\u7ba1\\u7406\\u5c0f\\u533a\\u91cc\\u4e0d\\u5b9a\\u671f\\u4e3e\\u529e\\u7684\\u5404\\u79cd\\u6d3b\\u52a8\",\"status\":\"normal\"},\"ids\":\"659\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558695316),
(563, 1, 'admin', '/admin/auth/rule/edit/ids/716?dialog=1', '权限管理 规则管理 编辑', '{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"arrest\",\"title\":\"\\u6293\\u83b7\\u73b0\\u884c\\u6d4b\\u8bd5\",\"icon\":\"fa fa-warning\",\"weigh\":\"194\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"716\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558695324),
(564, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558695331),
(565, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558695331),
(566, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558695332);
INSERT INTO `es_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(567, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558695332),
(568, 1, 'admin', '/admin/service/activity/add?dialog=1', '服务管理 抓获现行 添加', '{\"dialog\":\"1\",\"row\":{\"community_code\":\"CM2019052400001\",\"title\":\"\\u6293\\u83b7\\u73b0\\u884c\",\"place\":\"\\u5b9e\\u65f6\",\"sponsor_unit\":\"\\u8bd5\\u8bd5\",\"begin_time\":1558695300,\"end_time\":false,\"status\":\"0\",\"content\":\"<p>ss<\\/p>\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558695529),
(569, 2, 'root', '/admin/index/login', '登录', '{\"__token__\":\"99e87392ec0b1341998a27342f2aaa7f\",\"username\":\"root\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701223),
(570, 2, 'root', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701225),
(571, 2, 'root', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701225),
(572, 2, 'root', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701225),
(573, 2, 'root', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701226),
(574, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"a0bb33f8b76a7de878672af56fda5d7e\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701311),
(575, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701312),
(576, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701313),
(577, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701313),
(578, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701313),
(579, 1, 'admin', '/admin/service/activity/del/ids/1', '服务管理 抓获现行 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701347),
(580, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701589),
(581, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701589),
(582, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701589),
(583, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701590),
(584, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701755),
(585, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701756),
(586, 1, 'admin', '/admin/owners/vehicle/get_member_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701864),
(587, 1, 'admin', '/admin/owners/pet/get_member_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701872),
(588, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701907),
(589, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701908),
(590, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701908),
(591, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701908),
(592, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701924),
(593, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701924),
(594, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701924),
(595, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701924),
(596, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701947),
(597, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701947),
(598, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701947),
(599, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701948),
(600, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701978),
(601, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701978),
(602, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701978),
(603, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558701978),
(604, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702053),
(605, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702055),
(606, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702290),
(607, 1, 'admin', '/admin/command/command/action/command', '在线命令管理 Command', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"\",\"action\":\"command\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702318),
(608, 1, 'admin', '/admin/command/get_controller_list', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702320),
(609, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702336),
(610, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702336),
(611, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702336),
(612, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702337),
(613, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702352),
(614, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_test\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558702356),
(615, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558703958),
(616, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558704232),
(617, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558706962),
(618, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"s\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"s\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558706964),
(619, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\\u662f\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\\u662f\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558706965),
(620, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558706966),
(621, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"arrest\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558706967),
(622, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707106),
(623, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707106),
(624, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707106),
(625, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707107),
(626, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707188),
(627, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707188),
(628, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707188),
(629, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558707188),
(630, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"arrest\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709272),
(631, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"arrest\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709276),
(632, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"arrest\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709282),
(633, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709290),
(634, 1, 'admin', '/admin/admin/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"nickname\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"nickname\",\"ASC\"]],\"field\":\"nickname\",\"pkey_name\":\"id\",\"search_field\":[\"nickname\"],\"nickname\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709302),
(635, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709458),
(636, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709458),
(637, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709458),
(638, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558709458),
(639, 1, 'admin', '/admin/category/selectpage', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"page\":\"1\",\"per_page\":\"10\",\"and_or\":\"AND\",\"order_by\":[[\"name\",\"ASC\"]],\"field\":\"name\",\"pkey_name\":\"id\",\"search_field\":[\"name\"],\"name\":\"\",\"custom\":{\"type\":\"arrest\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558712982),
(640, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713928),
(641, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713928),
(642, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713928),
(643, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713929),
(644, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713959),
(645, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713959),
(646, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713959),
(647, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713959),
(648, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713971),
(649, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713971),
(650, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713971),
(651, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558713971),
(652, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714016),
(653, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714016),
(654, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714016),
(655, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714016),
(656, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714042),
(657, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714043),
(658, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714043),
(659, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714043),
(660, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714078),
(661, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714078),
(662, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714078),
(663, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714078),
(664, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714180),
(665, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714181),
(666, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714181),
(667, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714181),
(668, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714221),
(669, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714221),
(670, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714221),
(671, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714222),
(672, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714287),
(673, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714287),
(674, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714287),
(675, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714287),
(676, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714416),
(677, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714416),
(678, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714417),
(679, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714417),
(680, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714520),
(681, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714520),
(682, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714520),
(683, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714520),
(684, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714679),
(685, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714679),
(686, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714679),
(687, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714679),
(688, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714698),
(689, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714698),
(690, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714698),
(691, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714698),
(692, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714755),
(693, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714755),
(694, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714755),
(695, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714755),
(696, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714779),
(697, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714779),
(698, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714779),
(699, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558714779),
(700, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715831),
(701, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715831),
(702, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715831),
(703, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715831),
(704, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715868),
(705, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715868),
(706, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715868),
(707, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715868),
(708, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715935),
(709, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558715936),
(710, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558716035),
(711, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558716035),
(712, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558716035),
(713, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558716035),
(714, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717193),
(715, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717193),
(716, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717194),
(717, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717194),
(718, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717323),
(719, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717323),
(720, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717323),
(721, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558717323),
(722, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"21db6f044ae22ac08f8602faf8384c48\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864094),
(723, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864097),
(724, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864097),
(725, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864097),
(726, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864097),
(727, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864120),
(728, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864123),
(729, 1, 'admin', '/admin/house/index/get_building_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864152),
(730, 1, 'admin', '/admin/house/index/get_building_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864153),
(731, 1, 'admin', '/admin/expenses/index/get_project_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864177),
(732, 1, 'admin', '/admin/expenses/index/get_project_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864181),
(733, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558864196),
(734, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885688),
(735, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885688),
(736, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885688),
(737, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885688),
(738, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885837),
(739, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885837),
(740, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885838),
(741, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558885838),
(742, 1, 'admin', '/admin/index/login?url=/', '登录', '{\"url\":\"\\/\",\"__token__\":\"7fe0b12a3e4e42c87b3f219c3e956239\",\"username\":\"admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938315),
(743, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938317),
(744, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938318),
(745, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938318),
(746, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938318),
(747, 1, 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 操作员管理 添加', '{\"dialog\":\"1\",\"group\":[\"2\"],\"community_code\":[\"CM2019052400001\"],\"row\":{\"username\":\"admin\",\"email\":\"ddd@qq.com\",\"nickname\":\"dd\",\"password\":\"123456\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938448),
(748, 1, 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 操作员管理 添加', '{\"dialog\":\"1\",\"group\":[\"2\"],\"community_code\":[\"CM2019052400001\"],\"row\":{\"username\":\"ddwwww\",\"email\":\"ddd@qq.com\",\"nickname\":\"dd\",\"password\":\"admin111\",\"status\":\"normal\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938460),
(749, 1, 'admin', '/admin/community/index/edit/ids/3?dialog=1', '片区管理 修改', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5927\\u7af9\\u6797\\u8857\\u9053\",\"address\":\"\\u5927\\u7af9\\u6797\\u8857\\u9053\",\"area\":\"100.00\",\"developer\":\"ss\",\"estate\":\"ss\",\"greening_rate\":\"1.00\",\"total_building\":\"1\",\"total_owner\":\"1000\",\"thumb\":\"\"},\"admins\":[\"4\",\"5\"],\"ids\":\"3\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938477),
(750, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938498),
(751, 1, 'admin', '/admin/expenses/index/get_project_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938823),
(752, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938865),
(753, 1, 'admin', '/admin/house/index/get_building_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938892),
(754, 1, 'admin', '/admin/house/index/get_building_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938894),
(755, 1, 'admin', '/admin/house/building/add?dialog=1', '房产管理 栋数管理 添加', '{\"dialog\":\"1\",\"row\":{\"community_code\":\"CM2019052400001\",\"name\":\"\\u4e61\\u9547\\u5de1\\u903b\\u4eba\\u5458\\u7ba1\\u7406\\u7cfb\\u7edf\",\"house\":\"22\",\"desc\":\"\",\"code\":\"BD2019052700001\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938967),
(756, 1, 'admin', '/admin/house/index/get_building_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938975),
(757, 1, 'admin', '/admin/house/index/add?dialog=1', '房产管理 房产管理 添加', '{\"dialog\":\"1\",\"row\":{\"community_code\":\"CM2019052400001\",\"building_code\":\"BD2019052700001\",\"name\":\"2\",\"owner_name\":\"2\",\"owner_tel\":\"13212384180\",\"rooms\":\"1\",\"unit\":\"1\",\"floor\":\"1\",\"enter_time\":1558886400,\"desc\":\"\",\"code\":\"HS2019052700001\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558938990),
(758, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939002),
(759, 1, 'admin', '/admin/owners/index/add?dialog=1', '人员信息管理 人员管理 添加', '{\"dialog\":\"1\",\"row\":{\"community_code\":\"CM2019052400001\",\"house_code\":\"HS2019052700001\",\"name\":\"\\u4e61\\u9547\\u5de1\\u903b\\u4eba\\u5458\\u7ba1\\u7406\\u7cfb\\u7edf\",\"identity_id\":\"510922198511207956\",\"birth\":\"2019-04-30\",\"tel\":\"\",\"occupation\":\"\",\"gender\":\"1\",\"owner_type\":\"1\",\"photo\":\"\",\"remark\":\"\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939015),
(760, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939032),
(761, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939976);
INSERT INTO `es_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(762, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939993),
(763, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939993),
(764, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939993),
(765, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_admin\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558939993),
(766, 1, 'admin', '/admin/expenses/project/add?dialog=1', '收费管理 收费项目管理 添加', '{\"dialog\":\"1\",\"row\":{\"community_code\":\"CM2019052400001\",\"name\":\"\\u4e61\\u9547\\u5de1\\u903b\\u4eba\\u5458\\u7ba1\\u7406\\u7cfb\\u7edf\",\"code\":\"EP2017110100011\"}}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558941226),
(767, 1, 'admin', '/admin/expenses/index/get_project_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558941238),
(768, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558941509),
(769, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942764),
(770, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942764),
(771, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942764),
(772, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942764),
(773, 1, 'admin', '/admin/house/index/get_building_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942764),
(774, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942815),
(775, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942815),
(776, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942816),
(777, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558942816),
(778, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558943131),
(779, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_activity\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558950507),
(780, 1, 'admin', '/admin/command/get_field_list', '', '{\"table\":\"es_arrest\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558950511),
(781, 1, 'admin', '/admin/command/command/action/command', '在线命令管理 Command', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"es_arrest\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558950515),
(782, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558951101),
(783, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558951102),
(784, 1, 'admin', '/admin/owners/index/get_house_by_cm_code', '', '{\"community_code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558951285),
(785, 1, 'admin', '/admin/dashboard/get_activity', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558951400),
(786, 1, 'admin', '/admin/dashboard/get_general_data', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558951401),
(787, 1, 'admin', '/admin/dashboard/get_repair', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558951401),
(788, 1, 'admin', '/admin/dashboard/get_expenses', '', '{\"code\":\"CM2019052400001\"}', '0.0.0.0', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 1558951401);

-- --------------------------------------------------------

--
-- 表的结构 `es_arrest`
--

DROP TABLE IF EXISTS `es_arrest`;
CREATE TABLE IF NOT EXISTS `es_arrest` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `name` varchar(255) NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `identity_id` varchar(30) NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading') NOT NULL COMMENT '爱好(多选):music=刑事案件,reading=民事案件',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `es_attachment`
--

DROP TABLE IF EXISTS `es_attachment`;
CREATE TABLE IF NOT EXISTS `es_attachment` (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(30) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='附件表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `es_attachment`
--

INSERT INTO `es_attachment` (`id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');

-- --------------------------------------------------------

--
-- 表的结构 `es_auth_group`
--

DROP TABLE IF EXISTS `es_auth_group`;
CREATE TABLE IF NOT EXISTS `es_auth_group` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分组表';

--
-- 转存表中的数据 `es_auth_group`
--

INSERT INTO `es_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, '超级管理员', '*', 1490883540, 149088354, 'normal'),
(2, 1, '片区巡更人员', '585,583,582,603,602,601,600,608,607,606,605,614,613,612,611,619,618,617,616,624,623,622,621,630,629,628,627,635,634,633,632,664,663,662,661,660,670,669,668,667,666,676,675,674,673,672,682,681,680,679,678,688,687,686,685,684,592,591,590,589,597,596,595,594,690,40,41,42,43,44,45,46,13,14,16,15,17,1,9,10,683,677,671,665,659,658,631,626,625,620,615,610,609,604,599,598,593,588,587,581,689,5', 1490883540, 1558686588, 'normal'),
(3, 2, '片区普通员工', '', 1509948028, 1509948028, 'normal'),
(4, 2, '业主', '658,659,660,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682', 1510275700, 1510797745, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `es_auth_group_access`
--

DROP TABLE IF EXISTS `es_auth_group_access`;
CREATE TABLE IF NOT EXISTS `es_auth_group_access` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

--
-- 转存表中的数据 `es_auth_group_access`
--

INSERT INTO `es_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- 表的结构 `es_auth_rule`
--

DROP TABLE IF EXISTS `es_auth_rule`;
CREATE TABLE IF NOT EXISTS `es_auth_rule` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=726 DEFAULT CHARSET=utf8 COMMENT='节点表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `es_auth_rule`
--

INSERT INTO `es_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `condition`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1558593643, 97, 'normal'),
(2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 9, 'normal'),
(3, 'file', 0, 'category', 'Category', 'fa fa-list\r', '', 'Category tips', 1, 1497429920, 1497429920, 15, 'hidden'),
(4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1558596294, 84, 'hidden'),
(5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 21, 'normal'),
(6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 42, 'normal'),
(7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 49, 'normal'),
(8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user\r', '', '', 1, 1497429920, 1497429920, 55, 'normal'),
(9, 'file', 5, 'auth/admin', 'Operator', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 22, 'normal'),
(10, 'file', 5, 'auth/adminlog', 'Operator log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 27, 'normal'),
(11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 31, 'normal'),
(12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 36, 'normal'),
(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 16, 'normal'),
(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 17, 'normal'),
(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 19, 'normal'),
(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 18, 'normal'),
(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 20, 'normal'),
(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal'),
(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal'),
(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal'),
(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 53, 'normal'),
(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal'),
(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 43, 'normal'),
(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 44, 'normal'),
(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 45, 'normal'),
(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 46, 'normal'),
(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 47, 'normal'),
(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal'),
(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal'),
(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal'),
(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal'),
(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 59, 'normal'),
(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 60, 'normal'),
(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 61, 'normal'),
(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 10, 'hidden'),
(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 11, 'hidden'),
(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 12, 'hidden'),
(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 13, 'hidden'),
(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 14, 'hidden'),
(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 23, 'normal'),
(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 24, 'normal'),
(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 25, 'normal'),
(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 26, 'normal'),
(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal'),
(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal'),
(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal'),
(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal'),
(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal'),
(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 34, 'normal'),
(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 35, 'normal'),
(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 37, 'normal'),
(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 38, 'normal'),
(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 39, 'normal'),
(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 40, 'normal'),
(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 183, 'normal'),
(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 182, 'normal'),
(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 181, 'normal'),
(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 180, 'normal'),
(59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 179, 'normal'),
(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 178, 'normal'),
(61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 177, 'normal'),
(62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 176, 'normal'),
(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 175, 'normal'),
(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 174, 'normal'),
(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 1, 1502035509, 1502035509, 173, 'normal'),
(104, 'file', 2, 'general/crontab', '定时任务', 'fa fa-tasks', '', '类似于Linux的Crontab定时任务,可以按照设定的时间进行任务的执行,目前仅支持三种任务:请求URL、执行SQL、执行Shell', 1, 1505542785, 1505542785, 172, 'normal'),
(105, 'file', 104, 'general/crontab/index', '查看', 'fa fa-circle-o', '', '', 0, 1505542785, 1505542785, 171, 'normal'),
(106, 'file', 104, 'general/crontab/add', '添加', 'fa fa-circle-o', '', '', 0, 1505542785, 1505542785, 170, 'normal'),
(107, 'file', 104, 'general/crontab/edit', '编辑 ', 'fa fa-circle-o', '', '', 0, 1505542785, 1505542785, 169, 'normal'),
(108, 'file', 104, 'general/crontab/del', '删除', 'fa fa-circle-o', '', '', 0, 1505542785, 1505542785, 168, 'normal'),
(109, 'file', 104, 'general/crontab/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1505542785, 1505542785, 167, 'normal'),
(581, 'file', 0, 'community/index', '片区管理', 'fa fa-list-alt', '', '用于展示片区列表信息，以及增加、修改、删除等操作', 1, 1509669650, 1558686317, 1, 'normal'),
(582, 'file', 581, 'community/index/index', '查看', 'fa fa-circle-o', '', '', 0, 1509669650, 1509669650, 166, 'normal'),
(583, 'file', 581, 'community/index/detail', '详情', 'fa fa-circle-o', '', '', 0, 1509669650, 1509669650, 165, 'normal'),
(584, 'file', 581, 'community/index/add', '添加', 'fa fa-circle-o', '', '', 0, 1509669650, 1509669650, 164, 'normal'),
(585, 'file', 581, 'community/index/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509669650, 1509669650, 163, 'normal'),
(586, 'file', 581, 'community/index/del', '删除', 'fa fa-circle-o', '', '', 0, 1509669650, 1509669650, 162, 'normal'),
(587, 'file', 0, 'expenses', '收费管理', 'fa fa-usd', '', '', 1, 1509669659, 1509669659, 7, 'normal'),
(588, 'file', 587, 'expenses/index', '收费明细管理', 'fa fa-list-alt', '', '用于展示物业收费明细列表信息，以及增加、修改、删除等操作', 1, 1509669659, 1509669659, 69, 'normal'),
(589, 'file', 588, 'expenses/index/index', '查看', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 161, 'normal'),
(590, 'file', 588, 'expenses/index/add', '添加', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 160, 'normal'),
(591, 'file', 588, 'expenses/index/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 159, 'normal'),
(592, 'file', 588, 'expenses/index/del', '删除', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 158, 'normal'),
(593, 'file', 587, 'expenses/project', '收费项目管理', 'fa fa-list-alt', '', '用于展示收费项目列表信息，以及增加、修改、删除等操作', 1, 1509669659, 1509669659, 74, 'normal'),
(594, 'file', 593, 'expenses/project/index', '查看', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 157, 'normal'),
(595, 'file', 593, 'expenses/project/add', '添加', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 156, 'normal'),
(596, 'file', 593, 'expenses/project/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 155, 'normal'),
(597, 'file', 593, 'expenses/project/del', '删除', 'fa fa-circle-o', '', '', 0, 1509669659, 1509669659, 154, 'normal'),
(598, 'file', 0, 'house', '房产管理', 'fa fa-home', '', '', 1, 1509669664, 1509669664, 2, 'normal'),
(599, 'file', 598, 'house/index', '房产管理', 'fa fa-list-alt', '', '用于展示房产列表信息，以户为单位', 1, 1509669664, 1509669664, 68, 'normal'),
(600, 'file', 599, 'house/index/index', '查看', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 153, 'normal'),
(601, 'file', 599, 'house/index/add', '添加', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 152, 'normal'),
(602, 'file', 599, 'house/index/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 151, 'normal'),
(603, 'file', 599, 'house/index/del', '删除', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 150, 'normal'),
(604, 'file', 598, 'house/building', '栋数管理', 'fa fa-list-alt', '', '用于展示小区里每一栋的基础信息', 1, 1509669664, 1509669664, 73, 'normal'),
(605, 'file', 604, 'house/building/index', '查看', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 149, 'normal'),
(606, 'file', 604, 'house/building/add', '添加', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 148, 'normal'),
(607, 'file', 604, 'house/building/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 147, 'normal'),
(608, 'file', 604, 'house/building/del', '删除', 'fa fa-circle-o', '', '', 0, 1509669664, 1509669664, 146, 'normal'),
(609, 'file', 0, 'owners', '人员信息管理', 'fa fa-user', '', '', 1, 1509688838, 1558686167, 3, 'normal'),
(610, 'file', 609, 'owners/index', '人员管理', 'fa fa-list-alt', '', '用于管理小区里每个住户的基本信息，包括业主、家庭成员及租户等信息', 1, 1509688838, 1509688838, 64, 'normal'),
(611, 'file', 610, 'owners/index/index', '查看', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 145, 'normal'),
(612, 'file', 610, 'owners/index/add', '添加', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 144, 'normal'),
(613, 'file', 610, 'owners/index/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 143, 'normal'),
(614, 'file', 610, 'owners/index/del', '删除', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 142, 'normal'),
(615, 'file', 609, 'owners/vehicle', '车辆管理', 'fa fa-list-alt', '', '用于管理小区里的车辆信息，包括业主、家庭成员及租户的车辆', 1, 1509688838, 1509688838, 67, 'normal'),
(616, 'file', 615, 'owners/vehicle/index', '查看', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 141, 'normal'),
(617, 'file', 615, 'owners/vehicle/add', '添加', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 140, 'normal'),
(618, 'file', 615, 'owners/vehicle/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 139, 'normal'),
(619, 'file', 615, 'owners/vehicle/del', '删除', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 138, 'normal'),
(620, 'file', 609, 'owners/pet', '宠物管理', 'fa fa-list-alt', '', '用于管理小区里的宠物信息，包括业主、家庭成员及租户饲养的宠物', 1, 1509688838, 1509688838, 72, 'normal'),
(621, 'file', 620, 'owners/pet/index', '查看', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 137, 'normal'),
(622, 'file', 620, 'owners/pet/add', '添加', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 136, 'normal'),
(623, 'file', 620, 'owners/pet/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 135, 'normal'),
(624, 'file', 620, 'owners/pet/del', '删除', 'fa fa-circle-o', '', '', 0, 1509688838, 1509688838, 134, 'normal'),
(625, 'file', 0, 'parking', '停车位管理', 'fa fa-film', '', '', 1, 1509934859, 1509934859, 4, 'normal'),
(626, 'file', 625, 'parking/index', '车位管理', 'fa fa-list-alt', '', '用于管理小区里每一个停车位的基本信息', 1, 1509934859, 1509934859, 66, 'normal'),
(627, 'file', 626, 'parking/index/index', '查看', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 133, 'normal'),
(628, 'file', 626, 'parking/index/add', '添加', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 132, 'normal'),
(629, 'file', 626, 'parking/index/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 131, 'normal'),
(630, 'file', 626, 'parking/index/del', '删除', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 130, 'normal'),
(631, 'file', 625, 'parking/usage', '车位使用管理', 'fa fa-list-alt', '', '用于管理小区里每一个停车位的使用情况', 1, 1509934859, 1509934859, 71, 'normal'),
(632, 'file', 631, 'parking/usage/index', '查看', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 129, 'normal'),
(633, 'file', 631, 'parking/usage/add', '添加', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 128, 'normal'),
(634, 'file', 631, 'parking/usage/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 127, 'normal'),
(635, 'file', 631, 'parking/usage/del', '删除', 'fa fa-circle-o', '', '', 0, 1509934859, 1509934859, 126, 'normal'),
(658, 'file', 0, 'service', '服务管理', 'fa fa-coffee', '', '', 1, 1509958393, 1509958393, 5, 'normal'),
(659, 'file', 658, 'service/activity', '抓获现行', 'fa fa-list-alt', '', '用于管理小区里不定期举办的各种活动', 1, 1509958393, 1558695316, 62, 'normal'),
(660, 'file', 659, 'service/activity/index', '查看', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 125, 'normal'),
(661, 'file', 659, 'service/activity/add', '添加', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 124, 'normal'),
(662, 'file', 659, 'service/activity/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 123, 'normal'),
(663, 'file', 659, 'service/activity/del', '删除', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 122, 'normal'),
(664, 'file', 659, 'service/activity/detail', '查看详情', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 121, 'normal'),
(665, 'file', 658, 'service/repair', '报修管理', 'fa fa-list-alt', '', '用于管理小区里业主的报修信息', 1, 1509958393, 1509958393, 63, 'normal'),
(666, 'file', 665, 'service/repair/index', '查看', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 120, 'normal'),
(667, 'file', 665, 'service/repair/add', '添加', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 119, 'normal'),
(668, 'file', 665, 'service/repair/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 118, 'normal'),
(669, 'file', 665, 'service/repair/del', '删除', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 117, 'normal'),
(670, 'file', 665, 'service/repair/detail', '查看详情', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 116, 'normal'),
(671, 'file', 658, 'service/complain', '投诉管理', 'fa fa-list-alt', '', '用于管理小区里业主的投诉信息', 1, 1509958393, 1509958393, 65, 'normal'),
(672, 'file', 671, 'service/complain/index', '查看', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 115, 'normal'),
(673, 'file', 671, 'service/complain/add', '添加', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 114, 'normal'),
(674, 'file', 671, 'service/complain/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 113, 'normal'),
(675, 'file', 671, 'service/complain/del', '删除', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 112, 'normal'),
(676, 'file', 671, 'service/complain/detail', '查看详情', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 111, 'normal'),
(677, 'file', 658, 'service/mailbox', '信箱管理', 'fa fa-list-alt', '', '用于管理小区里业主的信箱信息，包括工作建议，意见反馈等。', 1, 1509958393, 1509958393, 70, 'normal'),
(678, 'file', 677, 'service/mailbox/index', '查看', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 110, 'normal'),
(679, 'file', 677, 'service/mailbox/add', '添加', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 109, 'normal'),
(680, 'file', 677, 'service/mailbox/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 108, 'normal'),
(681, 'file', 677, 'service/mailbox/del', '删除', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 107, 'normal'),
(682, 'file', 677, 'service/mailbox/detail', '查看详情', 'fa fa-circle-o', '', '', 0, 1509958393, 1509958393, 106, 'normal'),
(683, 'file', 0, 'device/index', '资产设备管理', 'fa fa-legal', '', '用于管理小区里的公共设备，比如电梯，路灯，垃圾桶，配电箱等', 1, 1510019471, 1510019471, 6, 'normal'),
(684, 'file', 683, 'device/index/index', '查看', 'fa fa-circle-o', '', '', 0, 1510019471, 1510019471, 105, 'normal'),
(685, 'file', 683, 'device/index/add', '添加', 'fa fa-circle-o', '', '', 0, 1510019471, 1510019471, 104, 'normal'),
(686, 'file', 683, 'device/index/edit', '修改', 'fa fa-circle-o', '', '', 0, 1510019471, 1510019471, 103, 'normal'),
(687, 'file', 683, 'device/index/del', '删除', 'fa fa-circle-o', '', '', 0, 1510019471, 1510019471, 102, 'normal'),
(688, 'file', 683, 'device/index/detail', '查看详情', 'fa fa-circle-o', '', '', 0, 1510019471, 1510019471, 101, 'normal'),
(689, 'file', 0, 'duty/index', '值班管理', 'fa fa-calendar', '', '用于管理小区物业的员工值班情况', 1, 1510212847, 1510212847, 8, 'normal'),
(690, 'file', 689, 'duty/index/index', '查看', 'fa fa-circle-o', '', '', 0, 1510212847, 1510212847, 100, 'normal'),
(691, 'file', 689, 'duty/index/add', '添加', 'fa fa-circle-o', '', '', 0, 1510212847, 1510212847, 99, 'normal'),
(692, 'file', 689, 'duty/index/edit', '修改', 'fa fa-circle-o', '', '', 0, 1510212847, 1510212847, 98, 'normal'),
(693, 'file', 0, 'command', '在线命令管理', 'fa fa-circle-o', '', '', 1, 1558591536, 1558591536, 41, 'normal'),
(694, 'file', 693, 'command/add', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 96, 'normal'),
(695, 'file', 693, 'command/detail', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 95, 'normal'),
(696, 'file', 693, 'command/execute', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 94, 'normal'),
(697, 'file', 693, 'command/command', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 93, 'normal'),
(698, 'file', 693, 'command/_empty', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 92, 'normal'),
(699, 'file', 693, 'command/index', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 91, 'normal'),
(700, 'file', 693, 'command/edit', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 90, 'normal'),
(701, 'file', 693, 'command/create', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 89, 'normal'),
(702, 'file', 693, 'command/modify', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 88, 'normal'),
(703, 'file', 693, 'command/del', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 87, 'normal'),
(704, 'file', 693, 'command/delete', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 86, 'normal'),
(705, 'file', 693, 'command/multi', 'Command', 'fa fa-circle-o', '', '', 0, 1558591537, 1558591537, 85, 'normal'),
(706, 'file', 0, 'test', '巡逻管理', 'fa fa-circle-o', '', '', 1, 1558593223, 1558593726, 184, 'normal'),
(707, 'file', 706, 'test/_empty', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 83, 'normal'),
(708, 'file', 706, 'test/index', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 82, 'normal'),
(709, 'file', 706, 'test/add', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 81, 'normal'),
(710, 'file', 706, 'test/edit', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 80, 'normal'),
(711, 'file', 706, 'test/create', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 79, 'normal'),
(712, 'file', 706, 'test/modify', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 78, 'normal'),
(713, 'file', 706, 'test/del', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 77, 'normal'),
(714, 'file', 706, 'test/delete', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 76, 'normal'),
(715, 'file', 706, 'test/multi', 'Test', 'fa fa-circle-o', '', '', 0, 1558593223, 1558593223, 75, 'normal'),
(716, 'file', 0, 'arrest', '抓获现行测试', 'fa fa-warning', '', '', 1, 1558689072, 1558695324, 194, 'normal'),
(717, 'file', 716, 'arrest/_empty', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 193, 'normal'),
(718, 'file', 716, 'arrest/index', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 192, 'normal'),
(719, 'file', 716, 'arrest/add', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 191, 'normal'),
(720, 'file', 716, 'arrest/edit', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 190, 'normal'),
(721, 'file', 716, 'arrest/create', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 189, 'normal'),
(722, 'file', 716, 'arrest/modify', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 188, 'normal'),
(723, 'file', 716, 'arrest/del', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 187, 'normal'),
(724, 'file', 716, 'arrest/delete', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 186, 'normal'),
(725, 'file', 716, 'arrest/multi', 'Arrest', 'fa fa-circle-o', '', '', 0, 1558689072, 1558689072, 185, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `es_building`
--

DROP TABLE IF EXISTS `es_building`;
CREATE TABLE IF NOT EXISTS `es_building` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '栋数编号，建议BD开头',
  `name` varchar(255) NOT NULL COMMENT '栋数名称',
  `house` int(10) NOT NULL COMMENT '总户数',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  `lift` int(10) DEFAULT NULL COMMENT '电梯数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='栋数信息表';

--
-- 转存表中的数据 `es_building`
--

INSERT INTO `es_building` (`id`, `community_code`, `code`, `name`, `house`, `desc`, `create_time`, `update_time`, `lift`) VALUES
(1, 'CM2019052400001', 'BD2019052700001', '乡镇巡逻人员管理系统', 22, '', 1558938967, 1558938967, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `es_category`
--

DROP TABLE IF EXISTS `es_category`;
CREATE TABLE IF NOT EXISTS `es_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `es_command`
--

DROP TABLE IF EXISTS `es_command`;
CREATE TABLE IF NOT EXISTS `es_command` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='在线命令表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `es_command`
--

INSERT INTO `es_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES
(1, 'crud', '[\"--table=es_activity\",\"--local=0\"]', 'php think crud --table=es_activity --local=0', 'model already exists!\nIf you need to rebuild again, use the parameter --force=true', 1558592451, 1558592451, 1558592451, 'failured'),
(2, 'crud', '[\"--table=es_test\",\"--local=0\"]', 'php think crud --table=es_test --local=0', NULL, 1558592492, 1558592492, 1558592492, 'failured'),
(3, 'crud', '[\"--table=es_test\"]', 'php think crud --table=es_test', NULL, 1558592587, 1558592587, 1558592587, 'failured'),
(4, 'crud', '[\"--table=es_test\"]', 'php think crud --table=es_test', NULL, 1558592882, 1558592882, 1558592882, 'failured'),
(5, 'crud', '[\"--table=es_test\"]', 'php think crud --table=es_test', NULL, 1558593001, 1558593001, 1558593001, 'failured'),
(6, 'crud', '[\"--table=es_test\"]', 'php think crud --table=es_test', NULL, 1558593046, 1558593046, 1558593046, 'failured');

-- --------------------------------------------------------

--
-- 表的结构 `es_community`
--

DROP TABLE IF EXISTS `es_community`;
CREATE TABLE IF NOT EXISTS `es_community` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) NOT NULL COMMENT '片区编号，建议CM开头',
  `name` varchar(255) NOT NULL COMMENT '片区名称',
  `introduction` text COMMENT '简介',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `address` varchar(255) NOT NULL COMMENT '坐落地址',
  `area` decimal(15,2) NOT NULL COMMENT '占地面积，单位：平米',
  `developer` varchar(255) NOT NULL COMMENT '开发商名称',
  `estate` varchar(255) NOT NULL COMMENT '物业公司名称',
  `greening_rate` decimal(10,2) NOT NULL COMMENT '绿化率，单位：百分比',
  `total_building` int(11) NOT NULL COMMENT '总栋数',
  `total_owner` int(11) NOT NULL COMMENT '总户数',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='小区信息表';

--
-- 转存表中的数据 `es_community`
--

INSERT INTO `es_community` (`id`, `code`, `name`, `introduction`, `thumb`, `address`, `area`, `developer`, `estate`, `greening_rate`, `total_building`, `total_owner`, `create_time`, `update_time`) VALUES
(1, 'CM2019052400001', '双龙湖街道', NULL, '', '双龙湖街道', '1.00', '1', '1', '1.00', 1, 2000, 1558685517, 1558687055),
(2, 'CM2019052400002', ' 回兴街道', NULL, '', '回兴街道', '2000.00', 'ss', 'ss', '1.00', 100, 1000, 1558693881, 1558693881),
(3, 'CM2019052400003', '大竹林街道', NULL, '', '大竹林街道', '100.00', 'ss', 'ss', '1.00', 1, 1000, 1558694045, 1558694045);

-- --------------------------------------------------------

--
-- 表的结构 `es_community_admin`
--

DROP TABLE IF EXISTS `es_community_admin`;
CREATE TABLE IF NOT EXISTS `es_community_admin` (
  `community_code` varchar(50) NOT NULL COMMENT '片区编号，建议CM开头',
  `admin_id` int(11) UNSIGNED NOT NULL COMMENT '管理员id',
  UNIQUE KEY `cm_admin_id` (`community_code`,`admin_id`),
  KEY `community_code` (`community_code`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小区管理员关系表';

--
-- 转存表中的数据 `es_community_admin`
--

INSERT INTO `es_community_admin` (`community_code`, `admin_id`) VALUES
('', 2),
('CM2019052400001', 2),
('CM2019052400002', 3),
('', 4),
('CM2019052400003', 4),
('CM2019052400001', 5),
('CM2019052400003', 5);

-- --------------------------------------------------------

--
-- 表的结构 `es_complain`
--

DROP TABLE IF EXISTS `es_complain`;
CREATE TABLE IF NOT EXISTS `es_complain` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属片区编号，建议CM开头',
  `member_id` int(11) NOT NULL COMMENT '投诉成员id',
  `title` varchar(255) NOT NULL COMMENT '投诉名称',
  `reason` text COMMENT '投诉事由',
  `is_anonymity` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '是否匿名 0 不匿名 1 匿名',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业主投诉信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_config`
--

DROP TABLE IF EXISTS `es_config`;
CREATE TABLE IF NOT EXISTS `es_config` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

--
-- 转存表中的数据 `es_config`
--

INSERT INTO `es_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `value`, `content`, `rule`, `extend`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '巡更人员管理系统', '', 'required', ''),
(2, 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', ''),
(3, 'cdnurl', 'basic', 'Cdn url', '如果使用CDN云储存请配置该值', 'string', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', ''),
(5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', ''),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', ''),
(7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', ''),
(8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', ''),
(9, 'categorytype', 'dictionary', 'Cateogry type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', ''),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', ''),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `es_crontab`
--

DROP TABLE IF EXISTS `es_crontab`;
CREATE TABLE IF NOT EXISTS `es_crontab` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '延迟秒数执行',
  `maximums` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最大执行次数 0为不限',
  `executes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '已经执行的次数',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `begintime` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '结束时间',
  `executetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `es_device`
--

DROP TABLE IF EXISTS `es_device`;
CREATE TABLE IF NOT EXISTS `es_device` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '设备编号，建议DV开头',
  `name` varchar(255) NOT NULL COMMENT '设备名称',
  `brand` varchar(100) NOT NULL COMMENT '品牌',
  `price` decimal(10,2) NOT NULL COMMENT '购买价格（单价）',
  `quantity` int(10) UNSIGNED DEFAULT NULL COMMENT '购买数量',
  `buy_time` int(10) UNSIGNED DEFAULT NULL COMMENT '购买时间',
  `durable_years` int(10) UNSIGNED DEFAULT NULL COMMENT '预计使用年限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产设备信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_device_maintain`
--

DROP TABLE IF EXISTS `es_device_maintain`;
CREATE TABLE IF NOT EXISTS `es_device_maintain` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `device_code` varchar(50) NOT NULL COMMENT '设备编号，建议DV开头',
  `unit` varchar(100) NOT NULL COMMENT '维修单位名称',
  `contacts` varchar(50) NOT NULL COMMENT '维修人名称',
  `contacts_tel` varchar(50) NOT NULL COMMENT '维修人联系方式',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `last_maintain_time` int(10) UNSIGNED DEFAULT NULL COMMENT '最后一次维护时间',
  `next_maintain_time` int(10) UNSIGNED DEFAULT NULL COMMENT '下次维护时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产设备维修记录表';

-- --------------------------------------------------------

--
-- 表的结构 `es_duty`
--

DROP TABLE IF EXISTS `es_duty`;
CREATE TABLE IF NOT EXISTS `es_duty` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `name` varchar(255) NOT NULL COMMENT '值班人名称，多个值班人用英文逗号隔开',
  `start_time` int(10) UNSIGNED DEFAULT NULL COMMENT '值班开始时间',
  `end_time` int(10) UNSIGNED DEFAULT NULL COMMENT '值班结束时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='物业员工值班信息表';

--
-- 转存表中的数据 `es_duty`
--

INSERT INTO `es_duty` (`id`, `community_code`, `name`, `start_time`, `end_time`, `remark`) VALUES
(1, 'null', 'ss', 1556668800, 1556712000, '加班'),
(2, 'null', 'ss', 1556668800, 1556676000, ''),
(3, 'null', 'ss', 1556668800, 1556668800, ''),
(4, 'null', 'ss', 1556668800, 1556668800, '加班'),
(5, 'null', 'ss', 1556755200, 1556841600, '加班'),
(6, 'CM2019052400001', 'ss', 1556668800, 1556676000, '');

-- --------------------------------------------------------

--
-- 表的结构 `es_expenses`
--

DROP TABLE IF EXISTS `es_expenses`;
CREATE TABLE IF NOT EXISTS `es_expenses` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `house_code` varchar(50) NOT NULL COMMENT '缴费人，即房产编号，建议HS开头',
  `project_code` varchar(50) NOT NULL COMMENT '缴费项目编号，建议EP开头',
  `amount_total` decimal(10,2) NOT NULL COMMENT '应收金额',
  `amount_paid` decimal(10,2) NOT NULL COMMENT '实收金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '缴费时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='费用信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_expenses_project`
--

DROP TABLE IF EXISTS `es_expenses_project`;
CREATE TABLE IF NOT EXISTS `es_expenses_project` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '项目编号，建议EP开头',
  `name` varchar(255) NOT NULL COMMENT '项目名称',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='收费项目信息表';

--
-- 转存表中的数据 `es_expenses_project`
--

INSERT INTO `es_expenses_project` (`id`, `community_code`, `code`, `name`, `create_time`, `update_time`) VALUES
(1, 'CM2017110100001', 'EP2017110100001', '清洁卫生费用', 1509522333, 1510810378),
(2, 'CM2017110100002', 'EP2017110100002', '绿化养护费用', 1509522353, 1510810389),
(3, 'CM2017110100001', 'EP2017110100003', '机动车停车费用', 1510810452, 1510810452),
(4, 'CM2017110100001', 'EP2017110100004', '房屋共用部位维修费用', 1510810483, 1510810542),
(5, 'CM2017110100001', 'EP2017110100005', '片区共用设施维修费用', 1510810518, 1510810549),
(6, 'CM2017110100001', 'EP2017110100006', '绿化养护费用', 1510810576, 1510810576),
(7, 'CM2017110100002', 'EP2017110100007', '清洁卫生费用', 1510810598, 1510810598),
(8, 'CM2017110100002', 'EP2017110100008', '机动车停车费用', 1510810618, 1510810618),
(9, 'CM2017110100002', 'EP2017110100009', '房屋共用部位维修费用', 1510810630, 1510810630),
(10, 'CM2017110100002', 'EP2017110100010', '片区共用设施维修费用', 1510810638, 1510810638),
(11, 'CM2019052400001', 'EP2017110100011', '乡镇巡逻人员管理系统', 1558941226, 1558941226);

-- --------------------------------------------------------

--
-- 表的结构 `es_house`
--

DROP TABLE IF EXISTS `es_house`;
CREATE TABLE IF NOT EXISTS `es_house` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `building_code` varchar(50) NOT NULL COMMENT '栋数编号，建议BD开头',
  `code` varchar(50) NOT NULL COMMENT '房产编号，建议HS开头',
  `name` varchar(255) NOT NULL COMMENT '房产名称',
  `owner_name` varchar(100) NOT NULL COMMENT '户主姓名',
  `owner_tel` varchar(50) NOT NULL COMMENT '户主联系方式',
  `rooms` int(10) NOT NULL COMMENT '房间数',
  `unit` varchar(50) NOT NULL COMMENT '单元信息',
  `floor` int(10) NOT NULL COMMENT '楼层信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '房产描述',
  `enter_time` int(10) UNSIGNED DEFAULT NULL COMMENT '入住时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='房产信息表';

--
-- 转存表中的数据 `es_house`
--

INSERT INTO `es_house` (`id`, `community_code`, `building_code`, `code`, `name`, `owner_name`, `owner_tel`, `rooms`, `unit`, `floor`, `desc`, `enter_time`) VALUES
(1, 'CM2019052400001', 'BD2019052700001', 'HS2019052700001', '2', '2', '13212384180', 1, '1', 1, '', 1558886400);

-- --------------------------------------------------------

--
-- 表的结构 `es_mailbox`
--

DROP TABLE IF EXISTS `es_mailbox`;
CREATE TABLE IF NOT EXISTS `es_mailbox` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `title` varchar(255) NOT NULL COMMENT '信件标题',
  `content` text COMMENT '信件内容',
  `member_id` int(11) NOT NULL COMMENT '成员id',
  `status` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '状态 0 未读 1 已读',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业主信箱信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_member`
--

DROP TABLE IF EXISTS `es_member`;
CREATE TABLE IF NOT EXISTS `es_member` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `house_code` varchar(50) NOT NULL COMMENT '房产编号，建议HS开头',
  `name` varchar(255) NOT NULL COMMENT '成员姓名',
  `identity_id` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `tel` varchar(50) NOT NULL COMMENT '联系方式',
  `occupation` varchar(255) DEFAULT NULL COMMENT '职业',
  `birth` varchar(20) NOT NULL COMMENT '出生日期',
  `gender` tinyint(1) NOT NULL COMMENT '性别 0 女 1 男',
  `owner_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '成员类型 1 户主 2 家庭成员，3 租户',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `photo` text COMMENT '成员照片，拍照上传即可',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='小区成员信息表';

--
-- 转存表中的数据 `es_member`
--

INSERT INTO `es_member` (`id`, `community_code`, `house_code`, `name`, `identity_id`, `tel`, `occupation`, `birth`, `gender`, `owner_type`, `create_time`, `update_time`, `remark`, `photo`) VALUES
(1, 'CM2019052400001', 'HS2019052700001', '乡镇巡逻人员管理系统', '510922198511207956', '', '', '2019-04-30', 1, 1, 1558939015, 1558939015, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `es_parking_space`
--

DROP TABLE IF EXISTS `es_parking_space`;
CREATE TABLE IF NOT EXISTS `es_parking_space` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `code` varchar(50) NOT NULL COMMENT '车位编号，建议PK开头',
  `name` varchar(255) NOT NULL COMMENT '车位名称',
  `status` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '状态 0 闲置中 1 使用中',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车位基本信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_parking_space_use`
--

DROP TABLE IF EXISTS `es_parking_space_use`;
CREATE TABLE IF NOT EXISTS `es_parking_space_use` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `pk_code` varchar(50) NOT NULL COMMENT '车位编号，建议PK开头',
  `license_plate` varchar(50) NOT NULL COMMENT '车辆牌照',
  `owner` varchar(100) NOT NULL COMMENT '车辆所有人',
  `tel` varchar(50) NOT NULL COMMENT '联系电话',
  `begin_time` int(10) UNSIGNED DEFAULT NULL COMMENT '开始时间',
  `end_time` int(10) UNSIGNED DEFAULT NULL COMMENT '截止时间',
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT '使用性质 1 租 2 买',
  `cost` decimal(10,2) NOT NULL COMMENT '费用',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='停车位使用记录表';

-- --------------------------------------------------------

--
-- 表的结构 `es_pet`
--

DROP TABLE IF EXISTS `es_pet`;
CREATE TABLE IF NOT EXISTS `es_pet` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` int(11) NOT NULL COMMENT '家庭成员id',
  `name` varchar(255) NOT NULL COMMENT '宠物名称',
  `color` varchar(50) DEFAULT NULL COMMENT '宠物颜色',
  `photo` text COMMENT '宠物照片，拍照上传即可',
  `adopt_time` int(10) UNSIGNED DEFAULT NULL COMMENT '收养时间',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='宠物信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_repair`
--

DROP TABLE IF EXISTS `es_repair`;
CREATE TABLE IF NOT EXISTS `es_repair` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `community_code` varchar(50) NOT NULL COMMENT '所属小区编号，建议CM开头',
  `member_id` int(11) NOT NULL COMMENT '报修成员id',
  `device_name` varchar(255) NOT NULL COMMENT '报修设备名称',
  `desc` text COMMENT '报修描述',
  `status` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '状态 0 待受理 1 已受理 2 已维修',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业主报修信息表';

-- --------------------------------------------------------

--
-- 表的结构 `es_test`
--

DROP TABLE IF EXISTS `es_test`;
CREATE TABLE IF NOT EXISTS `es_test` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `es_vehicle`
--

DROP TABLE IF EXISTS `es_vehicle`;
CREATE TABLE IF NOT EXISTS `es_vehicle` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` int(11) NOT NULL COMMENT '家庭成员id',
  `name` varchar(255) NOT NULL COMMENT '车辆名称',
  `license_plate` varchar(50) NOT NULL COMMENT '车辆牌照',
  `color` varchar(50) DEFAULT NULL COMMENT '车辆颜色',
  `photo` text COMMENT '车辆照片，拍照上传即可',
  `create_time` int(10) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息表';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
