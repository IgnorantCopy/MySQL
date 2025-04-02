/*
 * 比较运算符
 *  > >= < <= = !=/<>
 *  BETWEEN ... AND ...
 * IN(...)
 * LIKE
 * IS NULL
 */
/*
 * 逻辑运算符
 *  AND &&
 *  OR ||
 *  NOT !
 */
-- 查询年龄等于 88 的员工
SELECT * FROM emp WHERE age = 88;
-- 查询年龄小于 20 的员工信息
SELECT * FROM emp WHERE age < 20;
-- 查询年龄小于等于 20 的员工信息
SELECT * FROM emp WHERE age <= 20;
-- 查询没有身份证号的员工信息
SELECT * FROM emp WHERE id_card IS NULL;
-- 查询有身份证号的员工信息
SELECT * FROM emp WHERE id_card IS NOT NULL;
-- 查询年龄不等于 88 的员工信息
SELECT * FROM emp WHERE age != 88;
-- 查询年龄在15岁(包含) 到 20岁(包含)之间的员工信息
SELECT * FROM emp WHERE age BETWEEN 15 AND 20;
-- 查询性别为 女 且年龄小于 25岁的员工信息
SELECT * FROM emp WHERE gender = '女' AND age < 25;
-- 查询年龄等于18 或 20 或 40 的员工信息
SELECT * FROM emp WHERE age IN (18, 20, 40);
-- 查询姓名为两个字的员工信息 _ %
SELECT * FROM emp WHERE name LIKE '__';
-- 查询身份证号最后一位是 X 的员工信息
SELECT * FROM emp WHERE id_card LIKE '%X';