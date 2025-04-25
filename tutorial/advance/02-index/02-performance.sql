-- SQL 执行频率
SHOW GLOBAL STATUS LIKE 'Com_______';

-- 慢查询日志：记录了所有执行时间超过指定参数 (long_query_time，单位：秒，默认10秒) 的所有 SQL 语句的日志
/*
 * mysql 该功能默认没有开启，需要在 /etc/my.cnf 文件中添加以下配置：
 *  show_query_log=1
 * 设置 long_query_time
 *  long_query_time=2
 */
SET GLOBAL SLOW_QUERY_LOG='ON';
SET GLOBAL SLOW_QUERY_LOG_FILE='/var/lib/mysql/localhost-slow.log';
SET GLOBAL LONG_QUERY_TIME=2;

SELECT count(*) FROM tb_sku;

-- performance_schema: 可以监控 MySQL 的内部运行状态，如 CPU 使用率、内存使用率、I/O 操作等，以及 MySQL 的各种操作，如查询、锁等
SHOW VARIABLES LIKE 'performance_schema';   -- 查看是否开启 performance_schema
-- 1. setup_actors: 记录 MySQL 服务器中的所有连接和用户
SELECT * FROM performance_schema.setup_actors;
UPDATE performance_schema.setup_actors
    SET ENABLED = 'NO', HISTORY = 'NO'
    WHERE HOST = '%' AND USER = '%';    -- 禁用所有连接和用户的历史记录
INSERT INTO performance_schema.setup_actors (HOST,USER,ROLE,ENABLED,HISTORY) VALUES     -- 插入新的连接和用户
                                            ('localhost','test_user','%','YES','YES');

-- 2. setup_instruments: 记录所有可用的仪器的信息，包括仪器名称、计数器（counter）的数量、状态等信息
SELECT * FROM performance_schema.setup_instruments;
UPDATE performance_schema.setup_instruments
    SET ENABLED = 'YES', TIMED = 'YES'
    WHERE NAME LIKE '%stage/%';     -- 启用统计 MySQL 内部执行阶段的性能指标数据的仪器

-- 3. setup_consumers: 用于配置数据输出方式
UPDATE performance_schema.setup_consumers
    SET ENABLED = 'YES'
    WHERE NAME LIKE '%events_statements_%';     -- 收集和存储 MySQL 语句执行的性能指标数据
UPDATE performance_schema.setup_consumers
    SET ENABLED = 'YES'
    WHERE NAME LIKE '%events_stages_%';     -- 收集和存储 MySQL 内部执行阶段的性能指标数据

SELECT count(*) FROM tb_sku;
SELECT EVENT_ID, TRUNCATE(TIMER_WAIT/1000000000000, 6) as Duration, SQL_TEXT
    FROM performance_schema.events_statements_history_long WHERE SQL_TEXT like '%tb_sku%';
SELECT event_name AS Stage, TRUNCATE(TIMER_WAIT/1000000000000,6) AS Duration
    FROM performance_schema.events_stages_history_long WHERE NESTING_EVENT_ID=308;

-- explain 执行计划: 获取 MySQL 如何执行 SELECT 语句的信息，包括在 SELECT 语句执行过程中表如何连接和连接的顺序
EXPLAIN SELECT * FROM tb_user WHERE id = 1;
/*
 * 各字段含义：
 * id: select查询的序列号，表示查询中执行 select 子句或者是操作表的顺序 (id 相同，执行顺序从上到下；id 不同，值越大，越先执行)。
 * select_type: 表示 SELECT 的类型，常见的取值有 SIMPLE（简单表，即不使用表连接或者子查询）、PRIMARY（主查询，即外层的查询）、
                UNION（UNION 中的第二个或者后面的查询语句）、SUBQUERY（SELECT/WHERE之后包含了子查询）等
 * type: 表示连接类型，性能由好到差的连接类型为 NULL、system、const、eq_ref、ref、range、index、all
 * possible_key: 显示可能应用在这张表上的索引，一个或多个。
 * key: 实际使用的索引，如果为 NULL，则没有使用索引。
 * key_len: 表示索引中使用的字节数，该值为索引字段最大可能长度，并非实际使用长度，在不损失精确性的前提下，长度越短越好
 * rows: MySQL 认为必须要执行查询的行数，在 innodb 引擎的表中，是一个估计值，可能并不总是准确的。
 * filtered: 表示返回结果的行数占需读取行数的百分比，filtered 的值越大越好。
 */

