CREATE TABLE dept(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '部门名称'
) COMMENT '部门表';
INSERT INTO dept (id, name) VALUES (1, '研发部'),
                                   (2, '市场部'),
                                   (3, '财务部'),
                                   (4, '销售部'),
                                   (5, '总经办');

DROP TABLE emp;
create table emp(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age int comment '年龄',
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
) comment '员工表';
INSERT INTO emp (id, name, age, job,salary, entrydate, managerid, dept_id) VALUES
    (1, '金庸', 66, '总裁',20000, '2000-01-01', null,5),
    (2, '张无忌', 20, '项目经理',12500, '2005-12-05', 1,1),
    (3, '杨逍', 33, '开发', 8400,'2000-11-03', 2,1),
    (4, '韦一笑', 48, '开发', 11000, '2002-02-05', 2,1),
    (5, '常遇春', 43, '开发',10500, '2004-09-07', 3,1),
    (6, '小昭', 19, '程序员鼓励师', 6600, '2004-10-12', 2,1);

SELECT * FROM dept;
SELECT * FROM emp;
-- 增加外键约束
-- 也可以在建表时最后加上 CONSTRAINT ...
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dept(id);
-- 删除外键约束
ALTER TABLE emp DROP FOREIGN KEY fk_emp_dept_id;

/*
 * 删除/更新行为
 * NO ACTION    | 当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有则不允许删除/更新。(默认行为)
 * RESTRICT     | 同 NO ACTION
 * CASCADE      | 当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有，则也删除/更新外键在子表中的记录。
 * SET NULL     | 当在父表中删除对应记录时，首先检查该记录是否有对应外键，如果有则设置子表中该外键值为 null (这就要求该外键允许取 null)。
 * SET DEFAULT  | 父表有变更时，子表将外键列设置成一个默认的值。(Innodb不支持)
 */
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE SET NULL ON DELETE SET NULL;
