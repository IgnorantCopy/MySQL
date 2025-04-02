/*
 * WHERE 和 HAVING 的区别
 *  1. 执行时间不同
 *  2. WHERE 不能使用聚合函数，而 HAVING 可以
 */
-- 根据性别分组 , 统计男性员工 和 女性员工的数量
SELECT gender, count(*) FROM emp GROUP BY gender;
-- 根据性别分组 , 统计男性员工 和 女性员工的平均年龄
SELECT gender, avg(age) FROM emp GROUP BY gender;
-- 查询年龄小于 45 的员工 , 并根据工作地址分组 , 获取员工数量大于等于 3 的工作地址
SELECT work_address, count(*) AS '员工数量' FROM emp WHERE age < 45 GROUP BY work_address HAVING count(*) >= 3;
-- 统计各个工作地址上班的男性及女性员工的数量
SELECT work_address, gender, count(*) AS '员工数量' FROM emp GROUP BY work_address, gender;