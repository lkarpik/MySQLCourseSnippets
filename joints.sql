-- CREATE TABLE customers(
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   first_name VARCHAR(100),
--   last_name VARCHAR(100),
--   email VARCHAR(100)
-- );
-- CREATE TABLE orders(
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   order_date DATE,
--   amount DECIMAL(8, 2),
--   customer_id INT,
--   FOREIGN KEY(customer_id) REFERENCES customers(id)
-- );
-- -- Inserting some customers and orders
-- INSERT INTO
--   customers (first_name, last_name, email)
-- VALUES
--   ('Boy', 'George', 'george@gmail.com'),
--   ('George', 'Michael', 'gm@gmail.com'),
--   ('David', 'Bowie', 'david@gmail.com'),
--   ('Blue', 'Steele', 'blue@gmail.com'),
--   ('Bette', 'Davis', 'bette@aol.com');
-- INSERT INTO
--   orders (order_date, amount, customer_id)
-- VALUES
--   ('2016/02/10', 99.99, 1),
--   ('2017/11/11', 35.50, 1),
--   ('2014/12/12', 800.67, 2),
--   ('2015/01/03', 12.50, 2),
--   ('1999/04/11', 450.25, 5);
-- Implicit inner join
SELECT
  *
FROM
  orders,
  customers
WHERE
  orders.customer_id = customers.id;
-- Explicit inner join
SELECT
  first_name,
  amount
FROM
  customers
  JOIN orders ON customers.id = orders.customer_id;
SELECT
  *
FROM
  orders
  JOIN customers ON orders.customer_id = customers.id;
SELECT
  first_name,
  last_name,
  SUM(amount)
FROM
  orders
  JOIN customers ON customers.id = orders.customer_id
GROUP BY
  customers.id;
-- LEFT/RIGHT JOIN
SELECT
  *
FROM
  customers
  RIGHT JOIN orders ON orders.customer_id = customers.id;
-- ifnull
SELECT
  first_name,
  last_name,
  COALESCE(SUM(amount), 0),
  IFNULL(SUM(amount), 0),
  CASE
    WHEN SUM(amount) IS NULL THEN 0
    ELSE SUM(amount)
  END AS total,
  CASE
    WHEN SUM(amount) = NULL THEN 0
    ELSE SUM(amount)
  END AS bad_total
FROM
  customers
  LEFT JOIN orders ON orders.customer_id = customers.id
GROUP BY
  customers.id;
-- CASCADE DELETE - alter table
  --   CREATE TABLE orders(
  --     id INT AUTO_INCREMENT PRIMARY KEY,
  --     order_date DATE,
  --     amount DECIMAL(8, 2),
  --     customer_id INT,
  --     FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
  --   );