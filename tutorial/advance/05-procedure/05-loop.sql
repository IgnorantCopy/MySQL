-- WHILE
CREATE PROCEDURE p6(IN n INT) BEGIN
    DECLARE result INT DEFAULT 0;
    WHILE n > 0 DO
        SET result := result + n;
        SET n := n - 1;
    END WHILE;
    SELECT result;
END;

CALL p6(10);

-- REPEAT
CREATE PROCEDURE p7(IN n INT) BEGIN
    DECLARE result INT DEFAULT 0;
    REPEAT
        SET result := result + n;
        SET n := n - 1;
    UNTIL n <= 0
    END REPEAT;
    SELECT result;
END;

CALL p7(10);

-- LOOP
CREATE PROCEDURE p8(IN n INT) BEGIN
    DECLARE result INT DEFAULT 0;
    ood: LOOP
        IF n <= 0 THEN
            LEAVE ood;
        END IF;
        IF mod(n, 2) = 1 THEN
            SET n := n - 1;
            ITERATE ood;
        END IF;
        SET result := result + n;
        SET n := n - 1;
    END LOOP;
    SELECT result;
END;

CALL p8(10);