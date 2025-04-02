-- if
SELECT if(TRUE, 'OK', 'Error');
SELECT if(FALSE, 'OK', 'Error');
-- ifnull
SELECT ifnull('OK', 'default');
SELECT ifnull(NULL, 'default');
-- case
-- 查询 emp 表的员工姓名和工作地址 (北京/上海 ----> 一线城市 , 其他 ----> 二线城市)
SELECT
    name,
    (CASE work_address
        WHEN '北京' THEN '一线城市'
        WHEN '上海' THEN '一线城市'
        ELSE '二线城市'
    END) AS '工作地址'
FROM emp;