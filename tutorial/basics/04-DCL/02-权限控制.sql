/*
 * 常见权限
 * ALL, ALL PRIVILEGES      所有权限
 * SELECT                   查询数据
 * INSERT                   插入数据
 * UPDATE                   修改数据
 * DELETE                   删除数据
 * ALTER                    修改表
 * DROP                     删除数据库/表/视图
 * CREATE                   创建数据库/表
 */
-- 查询权限
SHOW GRANTS FOR 'username'@'localhost';

-- 授予权限
--                                                      数据库名.表名, * 表示所有
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, DROP, CREATE ON *.* TO 'username'@'localhost';

-- 撤销权限
REVOKE SELECT, INSERT, UPDATE, DELETE, ALTER, DROP, CREATE ON *.* FROM 'username'@'localhost';

-- examples
-- 查询 'heima'@'%' 用户的权限
SHOW GRANTS FOR 'heima'@'%';
-- 授予 'heima'@'%' 用户itcast数据库所有表的所有操作权限
GRANT ALL ON itcast.* TO 'heima'@'%';
-- 撤销 'heima'@'%' 用户的itcast数据库的所有权限
REVOKE ALL ON itcast.* FROM 'heima'@'%';
