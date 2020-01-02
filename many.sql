CREATE TABLE reviewers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);
CREATE TABLE series (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  released_year INT,
  genre VARCHAR(100)
);
CREATE TABLE reviews (
  id INT PRIMARY KEY AUTO_INCREMENT,
  rating DECIMAL(2, 1),
  reviewer_id int,
  series_id int,
  FOREIGN KEY (reviewer_id) REFERENCES reviewers(id),
  FOREIGN KEY (series_id) REFERENCES series(id)
);
INSERT INTO
  series (title, released_year, genre)
VALUES
  ('Archer', 2009, 'Animation'),
  ('Arrested Development', 2003, 'Comedy'),
  ("Bob's Burgers", 2011, 'Animation'),
  ('Bojack Horseman', 2014, 'Animation'),
  ("Breaking Bad", 2008, 'Drama'),
  ('Curb Your Enthusiasm', 2000, 'Comedy'),
  ("Fargo", 2014, 'Drama'),
  ('Freaks and Geeks', 1999, 'Comedy'),
  ('General Hospital', 1963, 'Drama'),
  ('Halt and Catch Fire', 2014, 'Drama'),
  ('Malcolm In The Middle', 2000, 'Comedy'),
  ('Pushing Daisies', 2007, 'Comedy'),
  ('Seinfeld', 1989, 'Comedy'),
  ('Stranger Things', 2016, 'Drama');
INSERT INTO
  reviewers (first_name, last_name)
VALUES
  ('Thomas', 'Stoneman'),
  ('Wyatt', 'Skaggs'),
  ('Kimbra', 'Masters'),
  ('Domingo', 'Cortes'),
  ('Colt', 'Steele'),
  ('Pinkie', 'Petit'),
  ('Marlon', 'Crafford');
INSERT INTO
  reviews(series_id, reviewer_id, rating)
VALUES
  (1, 1, 8.0),(1, 2, 7.5),(1, 3, 8.5),(1, 4, 7.7),(1, 5, 8.9),
  (2, 1, 8.1),(2, 4, 6.0),(2, 3, 8.0),(2, 6, 8.4),(2, 5, 9.9),
  (3, 1, 7.0),(3, 6, 7.5),(3, 4, 8.0),(3, 3, 7.1),(3, 5, 8.0),
  (4, 1, 7.5),(4, 3, 7.8),(4, 4, 8.3),(4, 2, 7.6),(4, 5, 8.5),
  (5, 1, 9.5),(5, 3, 9.0),(5, 4, 9.1),(5, 2, 9.3),(5, 5, 9.9),
  (6, 2, 6.5),(6, 3, 7.8),(6, 4, 8.8),(6, 2, 8.4),(6, 5, 9.1),
  (7, 2, 9.1),(7, 5, 9.7),
  (8, 4, 8.5),(8, 2, 7.8),(8, 6, 8.8),(8, 5, 9.3),
  (9, 2, 5.5),(9, 3, 6.8),(9, 4, 5.8),(9, 6, 4.3),(9, 5, 4.5),
  (10, 5, 9.9),
  (13, 3, 8.0),(13, 4, 7.2),
  (14, 2, 8.5),(14, 3, 8.9),(14, 4, 8.9);
--
SELECT
  title,
  ROUND(rating, 1) AS rating,
  CONCAT(reviewers.last_name, " ", reviewers.first_name) AS reviewer
FROM
  reviews
  JOIN series ON reviews.series_id = series.id
  JOIN reviewers ON reviews.reviewer_id = reviewers.id
WHERE
  title LIKE "A%"
  AND rating > 7.5;
--
SELECT
  title,
  COUNT(*),
  AVG(rating)
FROM
  series
  JOIN reviews ON reviews.series_id = series.id
  JOIN reviewers ON reviews.reviewer_id = reviewers.id
GROUP BY
  title;
--
SELECT
  series.id,
  title,
  COUNT(*),
  AVG(rating)
FROM
  series
  LEFT JOIN reviews ON reviews.series_id = series.id -- JOIN reviewers ON reviews.reviewer_id = reviewers.id
GROUP BY
  title;
--
SELECT
  max(rating),
  min(rating),
  COUNT(*),
  AVG(rating),
  last_name,
  title
FROM
  series
  JOIN reviews ON reviews.series_id = series.id
  JOIN reviewers ON reviews.reviewer_id = reviewers.id
GROUP BY
  last_name;
--
SELECT
  rating,
  title,
  last_name
FROM
  reviewers
  JOIN reviews ON reviews.reviewer_id = reviewers.id
  JOIN series ON reviews.series_id = series.id
ORDER BY
  rating ASC
LIMIT
  3;
--
SELECT
  first_name,
  last_name,
  rating
FROM
  reviewers
  LEFT JOIN reviews ON reviews.reviewer_id = reviewers.id;
--
SELECT
  title AS unreviewed_series
FROM
  series
  LEFT JOIN reviews ON reviews.series_id = series.id
WHERE
  rating IS NULL;
--
SELECT
  genre,
  ROUND(AVG(rating), 2)
FROM
  series
  JOIN reviews ON series.id = reviews.series_id
GROUP BY
  genre;
--
SELECT
  first_name,
  last_name,
  COUNT(rating),
  IFNULL(MIN(rating), 0) AS MIN,
  IFNULL(MAX(rating), 0) AS MAX,
  IFNULL(ROUND(AVG(rating), 2), 0) AS AVG,
  IF(COUNT(rating) > 0, "ACTIVE", "INACTIVE") AS STATUS
FROM
  reviewers
  LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY
  reviewers.id;