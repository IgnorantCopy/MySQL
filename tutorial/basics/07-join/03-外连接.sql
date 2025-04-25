-- 左外连接
-- 查询 emp 表的所有数据, 和对应的部门信息
SELECT e.*, d.name FROM emp e LEFT JOIN tutorial.dept d ON d.id = e.dept_id;
-- 右外连接
-- 查询 dept 表的所有数据, 和对应的员工信息(右外连接)
SELECT * FROM dept d RIGHT JOIN tutorial.emp e ON d.id = e.dept_id;
