/*
 * 常见聚合函数
 *   COUNT()：计算行数
 *   SUM()：求和
 *   AVG()：平均值
 *   MAX()：最大值
 *   MIN()：最小值
 */
-- 统计该企业员工数量
SELECT count(*) FROM emp;
-- 统计该企业员工的平均年龄
SELECT avg(age) FROM emp;
-- 统计该企业员工的最大年龄
SELECT max(age) FROM emp;
-- 统计该企业员工的最小年龄
SELECT min(age) FROM emp;
-- 统计西安地区员工的年龄之和
SELECT sum(age) FROM emp WHERE work_address = '西安';