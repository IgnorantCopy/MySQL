-- curdate：当前日期
SELECT curdate();
-- curtime：当前时间
SELECT curtime();
-- now：当前日期和时间
SELECT now();
-- YEAR(date), MONTH(date), DAY(date)：当前年、月、日
SELECT year(now());
SELECT month(now());
SELECT day(now());
-- date_add(date, INTERVAL expr type)：增加指定的时间间隔
SELECT date_add(now(), INTERVAL 70 DAY);
-- datediff(date1, date2)：获取两个日期相差的天数
SELECT datediff('2025-5-18', now());

-- exercise
-- 查询所有员工的入职天数，并根据入职天数倒序排序
SELECT name, datediff(now(), entry_date) AS 'entryDays' FROM emp ORDER BY entryDays DESC;