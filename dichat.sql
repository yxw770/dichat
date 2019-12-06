-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2019-12-06 14:43:59
-- 服务器版本： 5.6.44-log
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- 表的结构 `chatMsg`
--

CREATE TABLE `chatMsg` (
  `id` int(11) NOT NULL COMMENT '序号',
  `sendUserid` int(11) NOT NULL COMMENT '发送者id',
  `toUserid` int(11) NOT NULL COMMENT '接收者id',
  `create_at` bigint(20) NOT NULL COMMENT '发送时间',
  `update_at` bigint(20) DEFAULT '0' COMMENT '已读时间',
  `msg` text NOT NULL COMMENT '发送内容',
  `type` tinyint(2) DEFAULT '0' COMMENT '信息类型0文字1图片',
  `isSend` tinyint(4) DEFAULT '0' COMMENT '是否发送',
  `send_is_trush` tinyint(2) DEFAULT '0' COMMENT '发送者是否删除',
  `to_is_trush` tinyint(2) DEFAULT '0' COMMENT '接收者是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录';

-- --------------------------------------------------------

--
-- 表的结构 `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL COMMENT '用户编号',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `sessionId` varchar(128) DEFAULT '' COMMENT 'sessionid防止多用户使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- --------------------------------------------------------

--
-- 表的结构 `UserAddMsg`
--

CREATE TABLE `UserAddMsg` (
  `id` int(11) NOT NULL COMMENT '序号',
  `byUserid` int(11) NOT NULL COMMENT '来自谁',
  `toUserid` int(11) NOT NULL COMMENT '给谁发送',
  `msg` text NOT NULL COMMENT '申请理由',
  `status` tinyint(2) NOT NULL COMMENT '状态0等待验证1同意2不同意',
  `disagreeMsg` text COMMENT '不同意内容',
  `create_at` bigint(20) NOT NULL COMMENT '发送时间',
  `update_at` bigint(20) DEFAULT '0' COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='添加好友消息';

-- --------------------------------------------------------

--
-- 表的结构 `UserDefine`
--

CREATE TABLE `UserDefine` (
  `id` int(11) NOT NULL COMMENT '序号',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `name` text NOT NULL COMMENT '姓名',
  `birthday` bigint(20) NOT NULL COMMENT '出生日期',
  `tel` varchar(11) NOT NULL COMMENT '手机号',
  `email` varchar(128) NOT NULL COMMENT ' 邮箱',
  `instructions` text COMMENT '个人说明',
  `headPortrait` varchar(2133) DEFAULT '/dist/imgs/head.png' COMMENT '用户头像',
  `isFristLogin` tinyint(2) DEFAULT '0' COMMENT '是否第一次登录'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户资料表';

-- --------------------------------------------------------

--
-- 表的结构 `UserFriend`
--

CREATE TABLE `UserFriend` (
  `id` int(11) NOT NULL COMMENT '序号',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `friendUserid` int(11) NOT NULL COMMENT '好友id',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `is_black` int(11) DEFAULT '0' COMMENT '是否黑名单',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_at` bigint(20) DEFAULT '0' COMMENT '修改时间',
  `is_top` tinyint(2) DEFAULT '0' COMMENT '是否聊天置顶置顶'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友列表';

-- --------------------------------------------------------

--
-- 表的结构 `UserImpression`
--

CREATE TABLE `UserImpression` (
  `id` int(11) NOT NULL COMMENT '序号',
  `fromUserid` int(11) NOT NULL COMMENT '来自谁的评价',
  `toUserid` int(11) NOT NULL COMMENT '评价谁',
  `msg` varchar(16) NOT NULL COMMENT '评价内容',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友印象';

-- --------------------------------------------------------

--
-- 表的结构 `UserLog`
--

CREATE TABLE `UserLog` (
  `id` int(11) NOT NULL COMMENT '序号',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `create_at` bigint(20) NOT NULL COMMENT '登录时间',
  `IP` varchar(16) NOT NULL COMMENT '登录ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- --------------------------------------------------------

--
-- 表的结构 `UserLoveLog`
--

CREATE TABLE `UserLoveLog` (
  `id` int(11) NOT NULL COMMENT '序号',
  `impressionId` int(11) NOT NULL COMMENT '印象id',
  `Userid` int(11) NOT NULL COMMENT '谁点的赞',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='印象喜欢记录';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatMsg`
--
ALTER TABLE `chatMsg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserAddMsg`
--
ALTER TABLE `UserAddMsg`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `UserDefine`
--
ALTER TABLE `UserDefine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserFriend`
--
ALTER TABLE `UserFriend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserImpression`
--
ALTER TABLE `UserImpression`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserLog`
--
ALTER TABLE `UserLog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserLoveLog`
--
ALTER TABLE `UserLoveLog`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `chatMsg`
--
ALTER TABLE `chatMsg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号', AUTO_INCREMENT=100000;

--
-- 使用表AUTO_INCREMENT `UserAddMsg`
--
ALTER TABLE `UserAddMsg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `UserDefine`
--
ALTER TABLE `UserDefine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `UserFriend`
--
ALTER TABLE `UserFriend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `UserImpression`
--
ALTER TABLE `UserImpression`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `UserLog`
--
ALTER TABLE `UserLog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `UserLoveLog`
--
ALTER TABLE `UserLoveLog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
