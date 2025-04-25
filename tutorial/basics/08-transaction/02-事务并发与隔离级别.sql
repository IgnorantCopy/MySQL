/*
 *      隔离级别                脏读   不可重复读  幻读
 * read uncommitted             √       √       √
 * read committed               ×       √       √
 * repeatable read (default)    ×       ×       √
 * serializable                 ×       ×       ×
 */

-- 查看事务隔离级别
SELECT @@transaction_isolation;
-- 设置事务隔离级别
SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
