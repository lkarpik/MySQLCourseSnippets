-- INSERT INTO people
-- VALUES("Luty", "1982-01-31", CURTIME(), "1982-01-31 02:02:02");

-- CREATE TABLE comments
-- (
--     post varchar(250),
--     created_at TIMESTAMP DEFAULT NOW(),
--     changed_at TIMESTAMP DEFAULT NOW()
--     ON
--     UPDATE CURRENT_TIMESTAMP
--     );

SELECT DATE_FORMAT(birth, "%a %D-%m-%y %T")
FROM people;

SELECT DATEDIFF(now(), birth)
FROM people;

SELECT birth - INTERVAL
1 MONTH - INTERVAL 22 DAY - INTERVAL 3 HOUR FROM people;

SELECT CAST("2019-11-24" AS DATETIME);
-- BETWEEN -- IN -- NOT IN -- % MODULO --
SELECT *
FROM people
WHERE birthdate BETWEEN CAST("1983-01-01" AS DATETIME) AND CAST("2019-06-18" AS DATETIME);

SELECT *
FROM books
WHERE released_year IN (2000, 2003, 2008);

SELECT *
FROM books
WHERE released_year NOT IN (2000, 2003, 2008);

SELECT *
FROM books
WHERE released_year >= 2000
    AND released_year % 2 != 0;

-- CASE --
SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 
        THEN "New one"
        ELSE "Old one"
    END AS ERA
FROM books;


SELECT title, author_lname, author_fname,
    CASE WHEN released_year >=2000 
    THEN "NEW!" 
    ELSE "" 
    END AS HOT
FROM books;

SELECT title, stock_quantity,
    CASE
    WHEN stock_quantity > (SELECT AVG(stock_quantity)
    FROM books)
    THEN "***"
    WHEN stock_quantity < (SELECT AVG(stock_quantity)
    FROM books) && stock_quantity > (SELECT AVG(stock_quantity)
    FROM books)/2
    THEN "**"
    ELSE "*"
END AS STOCK
FROM books;

SELECT title, stock_quantity,
    CASE
    WHEN stock_quantity <= (SELECT AVG(stock_quantity)
    FROM books)/2
    THEN "*"
    WHEN stock_quantity <= (SELECT AVG(stock_quantity)
    FROM books)
    THEN "**"
    ELSE "***"
END AS STOCK
FROM books;




