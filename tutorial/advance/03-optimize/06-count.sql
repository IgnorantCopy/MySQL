SELECT count(*) FROM tb_user;   -- 不取值，直接按行累加
SELECT count(id) FROM tb_user;  -- 取主键值，主键不可能为 NULL，不需要判断

UPDATE tb_user SET profession = NULL WHERE id = 24;
SELECT * FROM tb_user;
SELECT count(profession) FROM tb_user;  -- 先判断是否有 NOT NULL 的约束

SELECT count(1) FROM tb_user;   -- 不取值，对每一行放入一个数字进行累加
SELECT count(NULL) FROM tb_user;

-- 因此效率排序为：count(*) = count(1) > count(id) > count(字段)