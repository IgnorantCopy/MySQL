-- 插入
INSERT INTO emp VALUES (1, '1', 'mkh', '男', 20, '320582200507040339', '2005-07-04');
INSERT INTO emp(id, work_no, name, gender, age) VALUES (2, '2', 'lcj', '男', 20);
INSERT INTO emp VALUES (3, '3', '张无忌', '男', 18, '123456789012345670', '2005-01-01'),
                       (4, '4', '韦一笑', '男', 38,'123456789012345670', '2005-01-01'),
                       (5, '5', '赵敏', '女', 18, '1234675712345670', '2005-01-01');
-- 修改
UPDATE emp SET entry_date = '2023-09-01' WHERE id = 2;
UPDATE emp SET entry_date = '2008-01-01' WHERE id >= 3;
-- 删除
DELETE FROM emp WHERE id < 3;