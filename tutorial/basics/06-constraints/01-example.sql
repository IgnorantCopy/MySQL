/*
 * 约束的类型
 *  约束                          描述                          关键字
 * 非空约束 | 限制该字段的数据不能为 null                        | NOT NULL
 * 唯一约束 | 保证该字段的所有数据都是唯一、不重复的                |  UNIQUE
 * 主键约束 | 主键是一行数据的唯一标识，要求非空且唯一              | PRIMARY KEY
 * 默认约束 | 保存数据时，如果未指定该字段的值，则采用默认值         |  DEFAULT
 * 检查约束 | 保证字段值满足某一个条件                           |   CHECK
 * 外键约束 | 用来让两张表的数据之间建立连接，保证数据的一致性和完整性 | FOREIGN KEY
 */
CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
    name VARCHAR(10) NOT NULL UNIQUE COMMENT '姓名',
    age INT CHECK ( age BETWEEN 0 AND 120 ) COMMENT '年龄',
    status CHAR(1) DEFAULT '1' COMMENT '状态',
    gender CHAR(1) COMMENT '性别'
) COMMENT '用户表';

SELECT * FROM user;

insert into user(name, age, status, gender) values ('Tom1', 19, '1', '男'),
                                                ('Tom2', 25, '0', '男');
insert into user(name, age, status, gender) values ('Tom3', 19,'1', '男');
insert into user(name, age, status, gender) values (null, 19, '1', '男');
insert into user(name, age, status, gender) values ('Tom3', 19, '1', '男');
insert into user(name, age, status, gender) values ('Tom4', 80, '1', '男');
insert into user(name, age, status, gender) values ('Tom5', -1, '1', '男');
insert into user(name, age, status, gender) values ('Tom5', 121, '1', '男');
insert into user(name, age, gender) values ('Tom5', 120, '男');