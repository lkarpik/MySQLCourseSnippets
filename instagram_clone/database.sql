DROP DATABASE instagram_clone;
CREATE DATABASE instagram_clone;
USE instagram_clone;
-- users
CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  create_at TIMESTAMP DEFAULT NOW()
);
-- photos
CREATE TABLE photos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  user_id INT NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id)
);
-- comments
CREATE TABLE comments(
  id INT AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id)
);
-- likes
CREATE TABLE likes(
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id),
  PRIMARY KEY(user_id, photo_id)
);
-- hashtags
CREATE TABLE tags(
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag VARCHAR(100) UNIQUE,
  created TIMESTAMP DEFAULT NOW()
);
CREATE TABLE hashtags(
  tag_id INT,
  photo_id INT,
  created TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(tag_id) REFERENCES tags(id),
  FOREIGN KEY(photo_id) REFERENCES photos(id),
  PRIMARY KEY(tag_id, photo_id)
);
-- followes/followees
CREATE TABLE follows(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY(follower_id) REFERENCES users(id),
  FOREIGN KEY(followee_id) REFERENCES users(id),
  PRIMARY KEY(follower_id, followee_id)
);
-- INSERT INTO TABLES TEST DATA
-- users
INSERT INTO
  users(username)
VALUES
  ("lkarpik"),
  ("Henry"),
  ("Lakis");
-- photos
INSERT INTO
  photos(image_url, user_id)
VALUES
  ("https://source.unsplash.com/800x600/?nature", 1),
  ("https://source.unsplash.com/800x600/?water", 1),
  ("https://source.unsplash.com/800x600/?sun", 1),
  ("https://source.unsplash.com/800x600/?fruit", 2),
  ("https://source.unsplash.com/800x600/?apple", 2),
  ("https://source.unsplash.com/800x600/?castle", 3),
  ("https://source.unsplash.com/800x600/?fort", 3);
-- comments
INSERT INTO
  comments(comment_text, user_id, photo_id)
VALUES
  ("I love it", 1, 4),
  ("It was fun", 1, 5),
  ("I love it greatly", 1, 6),
  ("I love it, but...", 1, 7),
  ("I love it as You do ", 2, 1),
  ("I love it maybe", 1, 2),
  ("I love it", 1, 3),
  ("I love it too", 3, 1);
-- likes
INSERT INTO
  likes(user_id, photo_id)
VALUES
  (1, 7),
  (1, 6),
  (2, 7),
  (2, 6),
  (3, 7);
-- hashtags
INSERT INTO
  tags(tag)
VALUES
  ("fruits"),
  ("nature"),
  ("castles"),
  ("old"),
  ("buildings");
INSERT INTO
  hashtags(tag_id, photo_id)
VALUES
  (1, 4),
  (1, 5),
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4),
  (2, 5),
  (3, 6),
  (3, 7),
  (4, 6),
  (4, 7),
  (5, 6),
  (5, 7);
-- followes/followees
INSERT INTO
  follows(follower_id, followee_id)
VALUES
  (2, 1),
  (3, 1),
  (1, 2);