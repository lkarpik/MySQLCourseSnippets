-- 1 --
SELECT *
FROM books
WHERE released_year < 1980;

-- 2 --
SELECT *
FROM books
WHERE author_lname IN ("Eggers", "Chabon");

SELECT *
FROM books
WHERE author_lname = "Eggers" OR author_lname = "Chabon";

-- 3 --
SELECT *
FROM books
WHERE author_lname = "Lahiri" AND released_year > 2000;

-- 4 --
SELECT *
FROM books
WHERE pages BETWEEN 100 AND 200;

-- 5 --
SELECT *
FROM books
WHERE author_lname LIKE ("C%") OR author_lname LIKE ("S%");

SELECT *
FROM books
WHERE SUBSTR(author_lname, 1, 1) = "C" OR SUBSTR(author_lname, 1, 1) = "S";

SELECT *
FROM books
WHERE SUBSTR(author_lname, 1, 1) IN ("C", "S");

-- 6 --

SELECT COUNT(title), COUNT(DISTINCT(author_lname)),
    CASE
    WHEN title LIKE "%stories%"
    THEN "Short Stories"
    WHEN title LIKE "%A heartbreaking Work%" OR title LIKE "%Just Kids%"
    THEN "Memoir"
    ELSE "Novell"
END AS TYPE
FROM books
GROUP BY TYPE;

-- 7 --
SELECT author_lname, author_fname,
    CASE
    WHEN COUNT(title)>1
    THEN CONCAT(COUNT(title), " books")
    ELSE CONCAT(COUNT(title), " book")
    END AS COUNT
FROM books
GROUP BY author_lname, author_fname;