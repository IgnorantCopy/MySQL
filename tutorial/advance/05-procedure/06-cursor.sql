-- 根据传入的参数 uage，来查询用户表 tb_user 中，所有的用户年龄小于等于 uage 的用户姓名 (name)和专业 (profession)，
-- 并将用户的姓名和专业插入到所创建的一张新表 (id, name, profession) 中
CREATE PROCEDURE p9(IN uage INT) BEGIN
    DECLARE uname VARCHAR(100);
    DECLARE uprofession VARCHAR(100);
    DECLARE u_cursor CURSOR FOR SELECT name, age FROM tb_user WHERE age <= uage;    -- 声明游标
    /*
     * SQLSTATE: 状态码
     * SQLWARNING: 以 01 开头的状态码
     * NOT FOUND: 以 02 开头的状态码
     * SQLEXCEPTION: 除了 SQLWARNING 和 NOT FOUND 以外的异常
     */
    DECLARE EXIT HANDLER FOR SQLSTATE '02000' CLOSE u_cursor;   -- 声明异常处理

    DROP TABLE IF EXISTS tb_user_pro;
    CREATE TABLE IF NOT EXISTS tb_user_pro (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100),
        profession VARCHAR(100)
    );

    OPEN u_cursor;  -- 打开游标
    LOOP
        FETCH u_cursor INTO uname, uprofession; -- 获取游标记录
        INSERT INTO tb_user_pro (name, profession) VALUES (uname, uprofession);
    END LOOP;
END;

CALL p9(40);