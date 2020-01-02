-- 1. FIND 5 OLDEST USERS
SELECT
  username,
  created_at
FROM
  users
ORDER BY
  created_at ASC
LIMIT
  5;
-- 2. WHAT DAY OF THE WEEK MOST USERS REGIESER?
SELECT
  DATE_FORMAT(created_at, "%W") as weekday,
  COUNT(DATE_FORMAT(created_at, "%W")) as registered_users
FROM
  users
GROUP BY
  weekday
ORDER BY
  COUNT(weekday) DESC
LIMIT
  7;
--
SELECT
  DAYNAME(created_at) as weekday,
  COUNT(id),
  COUNT(DAYNAME(created_at)) as registered_users
FROM
  users
GROUP BY
  weekday
ORDER BY
  COUNT(weekday) DESC
LIMIT
  7;
-- 3 Find a users who have never posted a photo
SELECT
  username,
  COUNT(photos.id)
FROM
  users
  LEFT JOIN photos ON photos.user_id = users.id
GROUP BY
  username
HAVING
  COUNT(photos.id) = 0;
-- alternative solution
SELECT
  username
FROM
  users
  LEFT JOIN photos ON photos.user_id = users.id
WHERE
  photos.id IS NULL;
-- 4 Who get the most likes on a single photo?
SELECT
  users.username,
  count(*)
FROM
  likes
  JOIN photos ON likes.photo_id = photos.id
  JOIN users ON photos.user_id = users.id
GROUP BY
  photo_id
ORDER BY
  count(likes.photo_id) DESC
LIMIT
  1;
-- 5 How many times average user posts
SELECT
  (
    SELECT
      COUNT(*)
    FROM
      photos
  ) /(
    SELECT
      COUNT(*)
    FROM
      USERS
  ) as AVG;
-- 6 What are the 5 most used hashtags?
SELECT
  tag_name,
  COUNT(*)
FROM
  tags
  JOIN photo_tags ON photo_tags.tag_id = tags.id
GROUP BY
  tags.id
ORDER BY
  COUNT(*) DESC
LIMIT
  5;
-- Find users who have liked every single photo on the site
SELECT
  likes.user_id
FROM
  likes
GROUP BY
  user_id
HAVING
  COUNT(*) = (
    SELECT
      COUNT(*)
    FROM
      photos
  );
-- alternative solution
SELECT
  username,
  COUNT(*)
FROM
  users
  JOIN likes ON users.id = likes.user_id
GROUP BY
  likes.user_id
HAVING
  COUNT(*) = (
    SELECT
      COUNT(*)
    FROM
      photos
  );