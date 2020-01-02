SELECT title
FROM books
WHERE title LIKE '%stories%';

SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1 ;

SELECT CONCAT
(title, " - " , released_year) AS summary 
FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname
FROM books
WHERE author_lname LIKE "% %";

SELECT title, released_year, stock_quantity
FROM books
ORDER BY 3 ASC, 1 ASC
LIMIT 3;

SELECT title
, author_lname 
FROM books ORDER BY 2 ASC, 1 ASC;

SELECT UPPER(CONCAT("My favourite author is ", author_fname, " ", author_lname, "!")) AS yell
FROM books
ORDER BY author_lname ASC;

SELECT author_fname, author_lname, SUM(stock_quantity)
FROM books
GROUP BY author_lname, author_fname;