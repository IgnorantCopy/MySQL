-- 将 200 分制转换为百分制
CREATE PROCEDURE p4(INOUT score INT, OUT result VARCHAR(10)) BEGIN
    SET score := score / 2;
    IF score >= 85 THEN
        SET result := '优秀';
    ELSEIF score >= 60 THEN
        SET result := '及格';
    ELSE
        SET result := '不及格';
    END IF;
END;

SET @score := 150;
CALL p4(@score, @result);
SELECT @score, @result;