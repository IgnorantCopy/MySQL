SHOW INDEX FROM tb_user;
DROP INDEX index_user_phone ON tb_user;
DROP INDEX index_user_name ON tb_user;

EXPLAIN SELECT id, age, phone FROM tb_user ORDER BY age, phone; -- using filesort, 效率较低
CREATE INDEX index_user_age_phone ON tb_user(age, phone);
EXPLAIN SELECT id, age, phone FROM tb_user ORDER BY age, phone; -- using index, 效率较高
EXPLAIN SELECT id, age, phone FROM tb_user ORDER BY age DESC, phone DESC;   -- backward index scan; using index
EXPLAIN SELECT id, age, phone FROM tb_user ORDER BY age, phone DESC;   -- using index; using filesort

CREATE INDEX index_user_age_phone_ad ON tb_user(age ASC , phone DESC );
EXPLAIN SELECT id, age, phone FROM tb_user ORDER BY age, phone DESC;   -- using index
