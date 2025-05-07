/*
 * 视图中的行与基础表中的行之间必须存在一对一的关系，视图才能够更新
 * 如果视图包含以下任何一项，则该视图不可更新：
 *  ① 聚合函数或窗口函数 SUM、COUNT、MIN、MAX 等
 *  ② DISTINCT
 *  ③ GROUP BY
 *  ④ HAVING
 *  ⑤ UNION 或 UNION ALL
 */

CREATE OR REPLACE VIEW stu_v_count AS SELECT count(*) FROM student;

INSERT INTO stu_v_count VALUES (10);    -- fail
