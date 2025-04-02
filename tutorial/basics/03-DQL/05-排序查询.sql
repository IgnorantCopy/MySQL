-- 根据年龄对公司的员工进行升序排序
SELECT * FROM emp ORDER BY age;
-- 根据入职时间, 对员工进行降序排序
SELECT * FROM emp ORDER BY entry_date DESC;
-- 根据年龄对公司的员工进行升序排序 , 年龄相同 , 再按照入职时间进行降序排序
SELECT * FROM emp ORDER BY age ASC, entry_date DESC;