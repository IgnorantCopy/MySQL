-- 查询每一个员工的姓名, 及关联的部门的名称
-- 隐式内连接
SELECT emp.name, dept.name FROM emp, dept WHERE dept_id = dept.id;

-- 显式内连接
SELECT emp.name, dept.name FROM emp INNER JOIN dept ON dept_id = dept.id;
