-- union 的条件：两表列数相同，对应的数据类型也相同
-- 将薪资低于 5000 的员工 , 和 年龄大于 50 岁的员工全部查询出来
SELECT * FROM emp WHERE salary < 5000
UNION ALL
SELECT * FROM emp WHERE age > 50;

-- 去重
SELECT * FROM emp WHERE salary < 5000
UNION
SELECT * FROM emp WHERE age > 50;
