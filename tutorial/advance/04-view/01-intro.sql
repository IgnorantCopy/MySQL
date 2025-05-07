-- 视图 (view)：一种虚拟存在的表，保存的是查询的 SQL 逻辑，不保存查询结果

DROP TABLE student;
CREATE TABLE IF NOT EXISTS student(
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT "序号",
    name VARCHAR(10) NOT NULL COMMENT "姓名",
    no CHAR(10) COMMENT "学号"
);
INSERT INTO student VALUES (1, '黛绮丝', 2000100100),
                           (2, '谢逊', 2000100102),
                           (3, '殷天正', 2000100103),
                           (4, '韦一笑', 2000100104);

-- 创建视图
CREATE OR REPLACE VIEW stu_v1 AS SELECT id, name FROM student WHERE id <= 10;

-- 查询视图
SHOW CREATE VIEW stu_v1;

SELECT * FROM stu_v1;
SELECT * FROM stu_v1 WHERE id < 3;

-- 修改
ALTER VIEW stu_v1 AS SELECT id, name, no FROM student WHERE student.id <= 10;

-- 删除
DROP VIEW IF EXISTS stu_v1;
