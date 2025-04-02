-- concat(s1, s2,...) : 字符串拼接
SELECT concat('hello', 'mysql');
-- lower(str) : 全部转小写
SELECT lower('Hello');
-- upper(str) : 全部转大写
SELECT upper('Hello');
-- lpad(str, len, pad) : 左填充
SELECT lpad('01', 5, '-');
-- rpad(str, len, pad) : 右填充
SELECT rpad('01', 5, '-');
-- trim(str) : 去除空格
SELECT trim('  Hello MySQL    ');
-- substring(str, start, len) : 截取子字符串
SELECT substring('Hello MySQL', 1, 5);

-- exercise
-- 企业员工的工号，统一为 5 位数，目前不足 5 位数的全部在前面补 0
UPDATE emp SET work_no = lpad(work_no, 5, '0');
SELECT * FROM emp;
