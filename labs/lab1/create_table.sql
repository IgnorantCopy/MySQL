-- create table
create table stuinfo (
    S CHAR (4) not null, -- 学号
    Sn CHAR (5) not null, -- 姓名
    Sd CHAR(2) not null, -- 专业
    Sa INTEGER (2) not null, -- 年龄
    C INTEGER (3) not null,
    Cn CHAR (3) not null,
    P INTEGER (3),
    G INTEGER(1) not null
)

-- insert data
INSERT INTO stuinfo VALUES ('0001', '王剑飞', 'CS', 17, 101, 'ABC', 102, 5);
INSERT INTO stuinfo VALUES ('0001', '王剑飞', 'CS', 17, 102, 'ACD', 105, 5);
INSERT INTO stuinfo VALUES ('0001', '王剑飞', 'CS', 17, 103, 'BBC', 105, 4);
INSERT INTO stuinfo VALUES ('0001', '王剑飞', 'CS', 17, 105, 'AEF', 107, 3);
INSERT INTO stuinfo(S, Sn, Sd, Sa, C, Cn, G) VALUES ('0001', '王剑飞', 'CS', 17, 110, 'BCF', 4);
INSERT INTO stuinfo VALUES ('0002', '陈瑛', 'MA', 19, 103, 'BBC', 105, 3);
INSERT INTO stuinfo VALUES ('0002', '陈瑛', 'MA', 19, 105, 'AEF', 107, 3);
INSERT INTO stuinfo VALUES ('0003', '方世觉', 'CS', 17, 107, 'BHD', 110, 4);

INSERT INTO stuinfo(C, Cn, P) VALUES(104, 'DB', 103);

-- delete data
DELETE FROM stuinfo WHERE S = '0003';

-- select data
CREATE Table S as select distinct S, Sn, Sd, Sa from stuinfo order by S;
CREATE Table C as select distinct C, Cn, P from stuinfo order by C;
CREATE Table SC as select S, C, G from stuinfo order by S;