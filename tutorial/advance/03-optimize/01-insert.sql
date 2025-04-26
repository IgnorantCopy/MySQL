-- 插入多条记录
-- 1. 批量插入
INSERT INTO tb_test VALUES (1, 'Tom'), (2, 'Cat'), (3, 'Jerry');
-- 2. 手动提交事务
START TRANSACTION ;
INSERT INTO tb_test VALUE (1, 'Tom');
INSERT INTO tb_test VALUE (2, 'Cat');
INSERT INTO tb_test VALUE (3, 'Jerry');
COMMIT ;
-- 3. 主键顺序插入

-- 大批量插入数据
-- 客户端连接时加上参数 --local-infile
-- 并设置全局参数 local_infile 为 1
LOAD DATA LOCAL INFILE 'path/to/data' INTO TABLE tb_user FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';