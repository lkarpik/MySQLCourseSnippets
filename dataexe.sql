-- 1 --
-- CREATE TABLE inventory
-- (
--     item_name VARCHAR(255),
--     price DECIMAL (8,2),
--     quantity INT
-- );
-- 2 --
SELECT DATE_FORMAT(NOW(),"%M %D at %k:%i");
SELECT DATE_FORMAT(NOW(),"%d/%m/%Y");

-- 3 --
CREATE TABLE tweets
(
    content VARCHAR(255),
    username VARCHAR(40),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_at TIMESTAMP DEFAULT NOW()
    ON
    UPDATE NOW());
