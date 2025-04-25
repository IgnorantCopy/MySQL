create table salgrade(
                         grade int,
                         losal int,
                         hisal int
) comment '薪资等级表';
insert into salgrade values (1,0,3000),
                            (2,3001,5000),
                            (3,5001,8000),
                            (4,8001,10000),
                            (5,10001,15000),
                            (6,15001,20000),
                            (7,20001,25000),
                            (8,25001,30000);

-- 查询员工的姓名、年龄、职位、部门信息
SELECT e.name, e.age, e.job, d.* FROM emp e, dept d WHERE dept_id = d.id;
-- 查询拥有员工的部门ID、部门名称
SELECT DISTINCT d.id, d.name FROM emp e, dept d WHERE dept_id = d.id;
-- 查询所有年龄大于40岁的员工, 及其归属的部门名称; 如果员工没有分配部门, 也需要展示出来
SELECT e.*, d.name FROM emp e LEFT JOIN tutorial.dept d ON d.id = e.dept_id WHERE age > 40;
-- 查询所有员工的工资等级
SELECT e.*, s.grade FROM emp e, salgrade s WHERE salary BETWEEN s.losal AND s.hisal;
-- 查询 "研发部" 所有员工的信息及 工资等级
SELECT e.*, s.grade FROM emp e, salgrade s WHERE salary BETWEEN s.losal AND s.hisal AND dept_id = (
    SELECT id FROM dept WHERE dept.name = '研发部'
);
-- 查询 "研发部" 员工的平均工资
SELECT avg(e.salary) from emp e, dept d WHERE dept_id = d.id AND d.name = '研发部';
-- 查询比平均薪资高的员工信息
SELECT * FROM emp WHERE salary > (
    SELECT avg(salary) FROM emp
);
-- 查询低于本部门平均工资的员工信息
SELECT * FROM emp e1 WHERE e1.salary < (
    SELECT avg(e2.salary) FROM emp e2 WHERE e2.dept_id = e1.dept_id
);