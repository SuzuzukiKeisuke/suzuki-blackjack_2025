# DB設計
## blackjack_develop データベース
### users テーブル
| フィールド名 | 型 |
|---------------|--------------|
| user_id (PK)  | INT          |
| user_name     | VARCHAR(20)  |
| user_password | VARCHAR(20)  |
| user_isadmin  | BOOLEAN      |
| user_wincount | INT          |
| user_losecount| INT          |
| user_drawcount| INT          |
| user_bjcount  | INT          |
| user_chip     | INT          |

### results テーブル
| フィールド名 | 型 |
|-------------------|-----------|
| result_id (PK)    | INT       |
| user_id (FK)      | INT       |
| result_code       | TINYINT   |
| result_created_at | TIMESTAMP |
| result_win        | INT       |

## blackjack データベース
### users テーブル
| フィールド名 | 型 |
|---------------|--------------|
| user_id (PK)  | INT          |
| user_name     | VARCHAR(20)  |
| user_password | VARCHAR(20)  |
| user_isadmin  | BOOLEAN      |
| user_wincount | INT          |
| user_losecount| INT          |
| user_drawcount| INT          |

### results テーブル
| フィールド名 | 型 |
|-------------------|-----------|
| result_id (PK)    | INT       |
| user_id (FK)      | INT       |
| result_code       | TINYINT   |
| result_created_at | TIMESTAMP |

## SQL文
```SQL
-- 実行コード
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

-- 実行結果
MariaDB [blackjack]> SHOW COLUMNS FROM users;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| user_id        | int(11)     | NO   | PRI | NULL    | auto_increment |
| user_name      | varchar(20) | NO   |     | NULL    |                |
| user_password  | varchar(20) | NO   |     | NULL    |                |
| user_isadmin   | tinyint(1)  | NO   |     | 0       |                |
| user_wincount  | int(11)     | NO   |     | 0       |                |
| user_losecount | int(11)     | NO   |     | 0       |                |
| user_drawcount | int(11)     | NO   |     | 0       |                |
+----------------+-------------+------+-----+---------+----------------+
7 rows in set (0.015 sec)

MariaDB [blackjack]> SHOW COLUMNS from results;
+-------------------+------------+------+-----+---------------------+----------------+
| Field             | Type       | Null | Key | Default             | Extra          |
+-------------------+------------+------+-----+---------------------+----------------+
| result_id         | int(11)    | NO   | PRI | NULL                | auto_increment |
| user_id           | int(11)    | NO   | MUL | NULL                |                |
| result_code       | tinyint(4) | NO   |     | NULL                |                |
| result_created_at | timestamp  | NO   |     | current_timestamp() |                |
+-------------------+------------+------+-----+---------------------+----------------+
4 rows in set (0.009 sec)
```
---
**補足**
user_isadminの値は、そのレコードに該当するユーザーが
- 0 : 管理者権限なし
- 1 : 管理者権限あり
であることを示します。

result_codeの値は、そのレコードが示す勝負結果が
- 0 : 負け
- 1 : 勝ち
- 2 : 引き分け
であったことを示します。


### 開発用DBの作成
```SQL
-- 開発用データベースの作成
CREATE TABLE blackjack_develop;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    user_password VARCHAR(20) NOT NULL,
    user_isadmin BOOLEAN NOT NULL DEFAULT FALSE,
    user_wincount INT NOT NULL DEFAULT 0,
    user_losecount INT NOT NULL DEFAULT 0,
    user_drawcount INT NOT NULL DEFAULT 0
);
CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    result_code TINYINT NOT NULL,
    result_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- テーブルをコピー
INSERT INTO blackjack_develop.users
SELECT * FROM blackjack.users;
INSERT INTO blackjack_develop.results
SELECT * FROM blackjack.results;

-- カラムの追加
ALTER TABLE users ADD COLUMN user_bjcount INT NOT NULL DEFAULT 0 AFTER user_drawcount;
ALTER TABLE users ADD COLUMN user_chip INT NOT NULL DEFAULT 100 AFTER user_bjcount;
ALTER TABLE results ADD COLUMN result_winchips INT NOT NULL DEFAULT 0 AFTER result_created_at;

```


### 更新履歴
2025/06/13 v1.4 鈴木 開発用DBを作成
2025/06/03 v1.3 鈴木 usersの設計を変更
2205/06/02 v1.2 鈴木 データベース名を追加 テーブル/データベースを明記
2025/05/30 v1.1 鈴木 usersの権限管理が定義されていなかった点を修正
2025/05/30 v1.0 鈴木 初版作成