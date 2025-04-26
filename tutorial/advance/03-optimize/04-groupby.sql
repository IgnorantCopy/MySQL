SHOW INDEX FROM tb_user;
DROP INDEX index_user_pro_age_stat ON tb_user;
DROP INDEX index_user_age_phone ON tb_user;
DROP INDEX index_user_age_phone_ad ON tb_user;
DROP INDEX index_email_5 ON tb_user;
EXPLAIN SELECT profession, count(*) FROM tb_user GROUP BY profession;   -- using temporary, 性能较低

CREATE INDEX index_user_pro_age_stat ON tb_user(profession, age, status);
EXPLAIN SELECT profession, count(*) FROM tb_user GROUP BY profession;   -- using index, 性能较高

EXPLAIN SELECT age, count(*) FROM tb_user GROUP BY age;   -- using index; using temporary
EXPLAIN SELECT profession, age, count(*) FROM tb_user GROUP BY profession, age;   -- using index
EXPLAIN SELECT age, count(*) FROM tb_user WHERE profession = '软件工程' GROUP BY age;   -- using index
