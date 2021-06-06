-- USING PostgreSQL
-- TASKS 1
-- кол-во действий за определённый месяц (скажем февраль 2020);
SELECT COUNT(*) FROM actions WHERE dt >= '2020-02-01' AND dt < '2020-03-01';

-- кол-во сотрудников, которые выполняли хоть какие-нибудь действия за указанный период;
SELECT COUNT(DISTINCT employee_id) FROM actions WHERE dt >= '2020-02-01' AND dt < '2020-03-01';
-- It's might be better to use:
-- SELECT COUNT(*) FROM
-- (SELECT DISTINCT employee_id FROM actions WHERE dt >= '2020-02-01' AND dt < '2020-03-01') AS temp;
-- As proposed here: https://stackoverflow.com/questions/11250253/postgresql-countdistinct-very-slow

-- TASKS 2
-- Составить запрос, который выводит логины сотрудников, которые не выполняли никаких действий в феврале 2020.
SELECT login
FROM employees
WHERE id IN
        (SELECT id FROM employees EXCEPT
            (SELECT employee_id FROM actions WHERE dt >= '2020-02-01' AND dt < '2020-03-01'));

-- TASKS 3
-- Составить запрос, который выводит 5 сотрудников с наибольшим количеством действий за февраль 2020,
-- а также кол-во их действий, отсортированных в порядке убывания.

-- Login is unique so it's possible to group by it
SELECT login, COUNT(*) as count
FROM actions JOIN employees e on actions.employee_id = e.id
WHERE dt >= '2020-02-01' AND dt < '2020-03-01'
GROUP BY login
ORDER BY count desc
LIMIT 5;