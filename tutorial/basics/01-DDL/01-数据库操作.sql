-- Active: 1742204081843@@127.0.0.1@3306@tutorial
-- 创建
--                                      设置字符集                 设置排序规则
CREATE DATABASE [IF NOT EXISTS] db_name [DEFAULT CHARSET utf8mb4] [COLLATE utf8_general_ci];
-- 查询
SHOW DATABASES; -- 显示所有数据库

SELECT DATABASE(); -- 显示当前数据库
-- 使用
USE db_name;
-- 删除
DROP DATABASE [IF EXISTS] db_name;
