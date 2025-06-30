CREATE DATABASE blackjack;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    user_password VARCHAR(20) NOT NULL,
    user_isadmin BOOLEAN NOT NULL DEFAULT FALSE,
    user_wincount INT NOT NULL DEFAULT 0,
    user_losecount INT NOT NULL DEFAULT 0,
    user_drawcount INT NOT NULL DEFAULT 0,
    user_bjcount INT NOT NULL DEFAULT 0,
    user_chip INT NOT NULL DEFAULT 100
);

CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    result_code TINYINT NOT NULL,
    result_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    result_win INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

