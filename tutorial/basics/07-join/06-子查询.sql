-- 标量子查询：返回的结果是单个值
-- 1. 查询 "销售部" 的所有员工信息
SELECT * FROM emp WHERE dept_id = (SELECT dept.id FROM dept WHERE dept.name = '销售部');
-- 2. 查询在 "方东白" 入职之后的员工信息
SELECT * FROM emp WHERE entrydate > (SELECT entrydate FROM emp WHERE name = '方东白');

-- 列子查询：返回的结果是一列
-- 1. 查询 "销售部" 和 "市场部" 的所有员工信息
SELECT * FROM emp WHERE dept_id IN (
    SELECT dept.id FROM dept WHERE dept.name = '销售部' OR dept.name = '市场部'
);
-- 2. 查询比 财务部 所有人工资都高的员工信息
SELECT * FROM emp WHERE salary > ALL (
    SELECT salary FROM emp WHERE dept_id = (
        SELECT dept.id FROM dept WHERE dept.name = '财务部'
    )
);
-- 3. 查询比研发部其中任意一人工资高的员工信息
SELECT * FROM emp WHERE salary > ANY (
    SELECT salary FROM emp WHERE dept_id = (
        SELECT id FROM dept WHERE dept.name = '研发部'
    )
);

-- 行子查询：返回的结果是一行
-- 查询与 "张无忌" 的薪资及直属领导相同的员工信息
SELECT * FROM emp WHERE (salary, managerid) = (
    SELECT salary, managerid FROM emp WHERE name = '张无忌'
);

-- 表子查询：返回的结果是多行多列
-- 1. 查询与 "鹿杖客" , "宋远桥" 的职位和薪资相同的员工信息
SELECT * FROM emp WHERE (job, salary) IN (
    SELECT job, salary FROM emp WHERE name IN ('鹿杖客', '宋远桥')
);
-- 2. 查询入职日期是 "2006-01-01" 之后的员工信息 , 及其部门信息
SELECT * FROM (SELECT * FROM emp WHERE entrydate > '2006-01-01') e LEFT JOIN dept d ON e.dept_id = d.id;
