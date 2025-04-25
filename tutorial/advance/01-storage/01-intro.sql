-- 查询建表语句
SHOW CREATE TABLE account;  -- 默认为 InnoDB

-- 查询当前数据库支持的存储引擎
SHOW ENGINES;

-- 创建表 my_myisam , 并指定MyISAM存储引擎
CREATE TABLE IF NOT EXISTS my_myisam (
    id INT,
    name VARCHAR(10)
) ENGINE = MyISAM;

-- 创建表 my_memory , 指定Memory存储引擎
CREATE TABLE IF NOT EXISTS my_memory (
    id INT,
    name VARCHAR(10)
) ENGINE = Memory;
