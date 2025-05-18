-- IF
CREATE PROCEDURE p3() BEGIN
    DECLARE score INT DEFAULT 58;
    DECLARE result VARCHAR(10);

    IF score >= 85 THEN
        SET result := '优秀';
    ELSEIF score >= 60 THEN
        SET result := '及格';
    ELSE
        SET result := '不及格';
    END IF;

    SELECT result;
END;

CALL p3();

-- CASE
CREATE PROCEDURE p5(IN gender CHAR(1)) BEGIN
    DECLARE result CHAR(2);
    CASE gender
        WHEN gender IN ('M', '男') THEN
            SET result := '男性';
        WHEN gender IN ('F', '女') THEN
            SET result := '女性';
        ELSE
            SET result := '未知';
    END CASE;
    SELECT result;
END;

CALL p5('男');