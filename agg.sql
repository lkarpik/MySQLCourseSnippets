-- GROUP BY
SELECT
  author_fname,
  author_lname,
  SUM(stock_quantity)
FROM
  books
GROUP BY
  author_lname,
  author_fname;
SELECT
  author_fname,
  author_lname,
  stock_quantity
FROM
  books;
SELECT
  COUNT(*)
FROM
  books
WHERE
  stock_quantity >= 100;
SELECT
  author_fname,
  author_lname,
  COUNT(title)
FROM
  books
GROUP BY
  author_fname,
  author_lname
ORDER BY
  COUNT(title) DESC;
SELECT
  author_fname,
  author_lname,
  COUNT(*)
FROM
  books
GROUP BY
  author_fname,
  author_lname
ORDER BY
  COUNT(*) DESC;
-- MIN MAX
SELECT
  MIN(stock_quantity)
FROM
  books;
SELECT
  title,
  pages
FROM
  books
WHERE
  pages = (
    SELECT
  MAX(pages)
FROM
  books
  );
-- FASTER SOLUTION:
-- SELECT title, pages
-- FROM books
-- ORDER BY pages DESC
-- LIMIT 1 ;
SELECT
  stock_quantity,
  title
FROM
  books
WHERE
  stock_quantity = (
    SELECT
  MIN(stock_quantity)
FROM
  books
  );
SELECT
  author_fname,
  author_lname,
  MIN(released_year)
FROM
  books
GROUP BY
  author_lname,
  author_fname;
SELECT
  author_fname,
  author_lname,
  title,
  MAX(pages)
FROM
  books
GROUP BY
  author_lname,
  author_fname;
SELECT
  author_fname,
  author_lname,
  SUM(pages)
FROM
  books
GROUP BY
  author_lname,
  author_fname;
SELECT