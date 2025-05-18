-- 1. 系统变量
-- 查看
SHOW SESSION VARIABLES ;    -- 会话变量
SHOW GLOBAL VARIABLES ;     -- 全局变量

SHOW SESSION VARIABLES LIKE 'auto%';

SELECT @@autocommit;

-- 设置
SET SESSION autocommit = 0;
SELECT @@session.autocommit;

INSERT INTO course VALUES (5, 'Oracle');
COMMIT ;

-- 2. 自定义变量
-- 赋值
SET @var_name := 'mkh';
SET @var_age := 10, @var_gender := 'M';

SELECT @var_color := 'red';
SELECT count(*) INTO @var_count FROM tb_user;

-- 使用
SELECT @var_name, @var_age, @var_gender;
SELECT @var_color, @var_count;
SELECT @abc;

-- 3. 局部变量
CREATE PROCEDURE p2()
BEGIN
    DECLARE stu_count INT DEFAULT 0;
    SELECT count(*) INTO stu_count FROM student;
    SELECT stu_count;
END;

CALL p2();