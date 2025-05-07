-- WITH CHECK OPTION: 检查视图规则
-- LOCAL: 只会检查本视图
CREATE OR REPLACE VIEW stu_v1 AS SELECT id, name FROM student WHERE id <= 20 WITH LOCAL CHECK OPTION;
SELECT * FROM stu_v1;

INSERT INTO stu_v1 VALUES (5, 'Tom');
SELECT * FROM student;

INSERT INTO stu_v1 VALUES (30, 'Tom');  -- fail

-- CASCADED: 级联，会检查与本视图相关联的视图
CREATE OR REPLACE VIEW stu_v2 AS SELECT * FROM stu_v1 WHERE id >= 10 WITH CASCADED CHECK OPTION ;
INSERT INTO stu_v2 VALUES (7, 'Tom');   -- fail
INSERT INTO stu_v2 VALUES (26, 'Tom');  -- fail
INSERT INTO stu_v2 VALUES (15, 'Tom');