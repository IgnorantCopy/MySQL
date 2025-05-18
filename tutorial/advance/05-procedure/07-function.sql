/*
 * characteristic
 *  DETERMINISTIC: 相同的输入总是产生相同的输出
 *  NO SQL: 不包含 SQL 语句
 *  READS SQL DATA: 包含读取数据的语句，但不包含写入数据的语句
 */
CREATE FUNCTION f(n INT)    -- 均为 IN
RETURNS INT DETERMINISTIC NO SQL
BEGIN
    DECLARE result INT DEFAULT 0;
    WHILE n > 0 DO
        SET result := result + n;
        SET n := n - 1;
    END WHILE;
    RETURN result;
END;

SELECT f(100);