-- Active: 1742204081843@@127.0.0.1@3306@tutorial
-- 创建
CREATE TABLE table_name(
    -- 字段 类型 [COMMENT 注释]
    id INT UNSIGNED COMMENT '编号', -- UNSIGNED 无符号整型
    name VARCHAR(50) COMMENT '姓名',
    age TINYINT UNSIGNED COMMENT '年龄',    -- TINYINT: 1 字节的整型，范围 (0, 255)
    gender ENUM('男', '女') COMMENT '性别'  -- 注意不能有逗号
) COMMENT '注释';
-- example
CREATE TABLE emp(
    id INT COMMENT '编号',
    work_no VARCHAR(10) COMMENT '工号',
    name VARCHAR(10) COMMENT '姓名',
    gender ENUM('男', '女') COMMENT '性别',
    age TINYINT UNSIGNED COMMENT '年龄',
    id_card CHAR(18) COMMENT '身份证号',
    entry_date DATE COMMENT '入职日期'
) COMMENT '员工表';
-- 查询
SHOW TABLES;    -- 查询所有表
DESC table_name;    -- 查询表结构
SHOW CREATE TABLE table_name;   -- 显示创建表的 SQL 语句
-- 修改
ALTER TABLE table_name ADD column_name type [COMMENT '注释'];    -- 添加字段
ALTER TABLE table_name MODIFY column_name type [COMMENT '注释'];    -- 修改字段类型
ALTER TABLE table_name CHANGE old_column_name new_column_name type [COMMENT '注释'] [constraint];    -- 修改字段名和类型
ALTER TABLE table_name DROP column_name;    -- 删除字段
ALTER TABLE table_name RENAME TO new_table_name;    -- 重命名表
-- 删除
DROP TABLE [IF EXISTS] table_name;    -- 删除表
TRUNCATE TABLE table_name;    -- 清空表 (删除所有记录，保留表结构)