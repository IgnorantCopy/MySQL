drop table if exists account;
create table account(
                        id int primary key AUTO_INCREMENT comment 'ID',
                        name varchar(10) comment '姓名',
                        money double(10,2) comment '余额'
) comment '账户表';
insert into account(name, money) VALUES ('张三',2000), ('李四',2000);

SELECT * FROM account;
-- 开始事务
START TRANSACTION;
-- 转账操作
UPDATE account SET money = money - 1000 WHERE name = '张三';
UPDATE account SET money = money + 1000 WHERE name = '李四';
-- 恢复数据
UPDATE account SET money = 2000 WHERE name = '张三' OR name = '李四';

-- 设置事务提交方式
SET @@autocommit = 0;   -- 0: 手动提交；1: 自动提交
SELECT @@autocommit;
-- 提交事务
COMMIT;
-- 回滚事务
ROLLBACK;