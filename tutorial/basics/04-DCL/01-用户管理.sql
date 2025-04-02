-- 查询
USE mysql;
SELECT * FROM mysql.user;

-- 创建用户
CREATE USER 'username'@'127.0.0.1' IDENTIFIED BY 'password';
-- examples
-- 创建用户itcast, 只能够在当前主机localhost访问, 密码123456;
CREATE USER 'itcast'@'localhost' IDENTIFIED BY '123456';
-- 创建用户heima, 可以在任意主机访问该数据库, 密码123456;
CREATE USER 'heima'@'%' IDENTIFIED BY '123456';

-- 修改用户密码
ALTER USER 'username'@'127.0.0.1' IDENTIFIED WITH 'old password' BY 'new password';
-- example
-- 修改用户heima的访问密码为1234;
ALTER USER 'heima'@'%' IDENTIFIED WITH '123456' BY '1234';

-- 删除用户
DROP USER 'username'@'127.0.0.1';
-- 删除 itcast@localhost 用户
DROP USER 'itcast'@'localhost';
