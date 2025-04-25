-- 查询员工 及其 所属领导的名字
SELECT e1.name, e2.name FROM emp e1 JOIN emp e2 ON e1.managerid = e2.id;

-- 查询所有员工 emp 及其领导的名字 emp , 如果员工没有领导, 也需要查询出来
SELECT e1.name '员工', e2.name '领导' FROM emp e1 LEFT JOIN emp e2 ON e1.managerid = e2.id;
