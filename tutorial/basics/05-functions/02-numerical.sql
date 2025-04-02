-- ceil(x)：向上取整
SELECT ceil(1.5);
-- floor(x)：向下取整
SELECT floor(1.5);
-- mod(x, y)：取模
SELECT mod(3, 4);
-- rand：获取随机数
SELECT rand();
-- round：四舍五入
SELECT round(3.145, 2);

-- exercise
-- 生成一个六位数的随机验证码
SELECT lpad(round(rand() * 1000000, 0), 6, '0');