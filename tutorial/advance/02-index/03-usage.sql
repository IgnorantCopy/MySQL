-- 验证索引效率
SELECT * FROM tb_sku WHERE id = 1;      -- 888 ms
SELECT * FROM tb_sku WHERE sn = '100000003145001';  -- 15 s
-- 创建索引
CREATE INDEX index_sku_sn ON tb_sku(sn);    -- 构建 B+ 树，耗时 38 s
SELECT * FROM tb_sku WHERE sn = '100000003145001';  -- 323 ms
EXPLAIN SELECT * FROM tb_sku WHERE sn = '100000003145001';

-- 最左前缀法则：在联合索引中，查询从索引的最左列开始，且不会跳过索引中的列
SHOW INDEX FROM tb_user;
EXPLAIN SELECT * FROM tb_user WHERE profession = '软件工程' AND age = 31 AND status = '0';
EXPLAIN SELECT * FROM tb_user WHERE profession = '软件工程' AND age = 31;
EXPLAIN SELECT * FROM tb_user WHERE profession = '软件工程';
EXPLAIN SELECT * FROM tb_user WHERE age = 31 AND status = '0';  -- 失效
EXPLAIN SELECT * FROM tb_user WHERE profession = '软件工程' AND status = '0';   -- 索引长度只有 47
EXPLAIN SELECT * FROM tb_user WHERE age = 31 AND status = '0' AND profession = '软件工程';  -- 仍然有效
-- 联合索引中，范围查询右侧的列索引会失效
EXPLAIN SELECT * FROM tb_user WHERE profession = '软件工程' AND age > 30 AND status = '0';  -- 索引长度只有 49
EXPLAIN SELECT * FROM tb_user WHERE profession = '软件工程' AND age >= 30 AND status = '0';  -- 有效

-- 避免在索引列上进行运算，会导致索引失效
EXPLAIN SELECT * FROM tb_user WHERE phone = '17799990015';
EXPLAIN SELECT * FROM tb_user WHERE substr(phone, 10, 2) = '15';
-- 字符串查询的时候必须加单引号，否则会导致索引失效
EXPLAIN SELECT * FROM tb_user WHERE phone = 17799990015;
-- 避免头部模糊匹配，会导致索引失效 (尾部不会)
EXPLAIN SELECT * FROM tb_user WHERE profession LIKE '软件%';      -- 生效
EXPLAIN SELECT * FROM tb_user WHERE profession LIKE '%工程';      -- 失效

-- or 连接的条件，如果 or 前的条件有索引，后面的条件无索引，那么设计的索引都会失效
EXPLAIN SELECT * FROM tb_user WHERE id = 10 OR age = 23;
EXPLAIN SELECT * FROM tb_user WHERE phone = '17799990015' OR age = 23;
CREATE INDEX index_user_age ON tb_user(age);
EXPLAIN SELECT * FROM tb_user WHERE id = 10 OR age = 23;
-- 数据分布影响：MySQL 评估索引比全表扫描慢时，索引会失效
EXPLAIN SELECT * FROM tb_user WHERE phone >= '17799990020';     -- 生效
EXPLAIN SELECT * FROM tb_user WHERE phone >= '17799990000';     -- 失效
EXPLAIN SELECT * FROM tb_user WHERE phone >= '17799990010';     -- 失效

EXPLAIN SELECT * FROM tb_user WHERE profession IS NULL;
EXPLAIN SELECT * FROM tb_user WHERE profession IS NOT NULL;
UPDATE tb_user SET profession = NULL;
EXPLAIN SELECT * FROM tb_user WHERE profession IS NULL;
EXPLAIN SELECT * FROM tb_user WHERE profession IS NOT NULL;

-- SQL 提示：在 SQL 语句中加入一些人为的提示来达到优化操作的目的
CREATE INDEX index_user_pro ON tb_user(profession);
EXPLAIN SELECT * FROM tb_user WHERE profession = '软件工程';
-- 向 MySQL 建议使用索引，但是是否采取取决于 MySQL 自己的判断
EXPLAIN SELECT * FROM tb_user USE INDEX (index_user_pro) WHERE profession = '软件工程';
-- 忽略索引
EXPLAIN SELECT * FROM tb_user IGNORE INDEX (index_user_pro) WHERE profession = '软件工程';
-- 强制使用索引
EXPLAIN SELECT * FROM tb_user FORCE INDEX (index_user_pro_age_stat) WHERE profession = '软件工程';

-- 覆盖索引：查询使用了索引，且需要返回的列在该索引中已经能够全部能够找到
SHOW INDEX FROM tb_user;
DROP INDEX index_user_age ON tb_user;
DROP INDEX index_user_pro ON tb_user;
-- 关注 Extra
EXPLAIN SELECT id, profession, age, status FROM tb_user
        WHERE profession = '软件工程' AND age = 31 AND status = '0';    -- Using where; Using index
EXPLAIN SELECT id, profession, age, status, name FROM tb_user
        WHERE profession = '软件工程' AND age = 31 AND status = '0';    -- Using index condition, 指需要回表查询

-- 前缀索引：当字段类型为字符串时，有时需要索引很长的字符串，这会让索引变得很大。此时可以将字符串的一部分前缀建立索引。
SELECT count(*) FROM tb_user;
SELECT count(DISTINCT email) FROM tb_user;
SELECT count(DISTINCT email) / count(*) FROM tb_user;   -- 计算选择性
SELECT count(DISTINCT substring(email, 1, 10)) / count(*) FROM tb_user;
SELECT count(DISTINCT substring(email, 1, 9)) / count(*) FROM tb_user;
SELECT count(DISTINCT substring(email, 1, 5)) / count(*) FROM tb_user;
SELECT count(DISTINCT substring(email, 1, 4)) / count(*) FROM tb_user;

CREATE INDEX index_email_5 ON tb_user(email(5));
SHOW INDEX FROM tb_user;
EXPLAIN SELECT * FROM tb_user WHERE email = 'daqiao666@sina.com';
