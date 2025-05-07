-- 思想：代码封装和复用
-- 创建
CREATE PROCEDURE p1()
BEGIN
    SELECT count(*) FROM student;
END;

-- 调用
CALL p1();

-- 查看
SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA = 'tutorial';
SHOW CREATE PROCEDURE p1;

-- 删除
DROP PROCEDURE IF EXISTS p1;
