-- 1 --
SELECT count(*)
FROM books;

-- 2 --
SELECT released_year, COUNT(*)
FROM books
GROUP BY released_year;

-- 3 --
SELECT SUM(stock_quantity)
FROM books;

-- 4 --
SELECT author_lname, author_fname, AVG(released_year)
FROM books
GROUP BY author_lname, author_fname;

-- 5 --
SELECT CONCAT(author_lname, " ", author_fname) AS full_name, pages
FROM books
ORDER BY pages DESC;
-- LIMIT 1;

SELECT released_year, COUNT(*), AVG(pages)
FROM books
GROUP BY released_year;