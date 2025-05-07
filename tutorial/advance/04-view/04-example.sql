-- 1. 为了保证数据库表的安全性，开发人员在操作 tb_user 表时，只能看到的用户的基本字段，屏蔽手机号和邮箱两个字段
CREATE VIEW tb_user_v AS SELECT id, name, profession, age, gender, status, createtime FROM tb_user;
SELECT * FROM tb_user_v;

CREATE TABLE course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL COMMENT '课程名'
);
INSERT INTO course VALUES (1, 'javaEE'),
                          (2, 'Spring'),
                          (3, 'MySQL'),
                          (4, 'Cloud');

CREATE TABLE student_course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    stu_id INT NOT NULL,
    course_id INT NOT NULL
);
INSERT INTO student_course VALUES (1, 1, 1),
                                  (2, 1, 2),
                                  (3, 1, 3),
                                  (4, 2, 2),
                                  (5, 2, 3),
                                  (6, 3, 4);

-- 2. 查询每个学生所选修的课程（三张表联查），这个功能在很多的业务中都有使用到，为了简化操作，定义一个视图
CREATE VIEW stu_course_v AS
    SELECT s.name student_name, s.no student_no, c.name course_name
    FROM student s, student_course sc, course c
    WHERE s.id = sc.stu_id AND sc.course_id = c.id;
SELECT * FROM stu_course_v;