# DB設計
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
| user_winrate  | FROAT        |

### results テーブル
| フィールド名 | 型 |
|----------------|---------|
| result_id (PK) | INT     |
| user_id (FK)   | INT     |
| result_code    | TINYINT |

## SQL文
```SQL
-- 実行コード
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    user_password VARCHAR(20) NOT NULL,
    user_isadmin BOOLEAN NOT NULL DEFAULT FALSE,
    user_wincount INT NOT NULL,
    user_losecount INT NOT NULL,
    user_drawcount INT NOT NULL
);

CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    result_code TINYINT NOT NULL,
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
| user_wincount  | int(11)     | NO   |     | NULL    |                |
| user_losecount | int(11)     | NO   |     | NULL    |                |
| user_drawcount | int(11)     | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
7 rows in set (0.015 sec)

MariaDB [blackjack]> SHOW COLUMNS FROM results;
+-------------+------------+------+-----+---------+----------------+
| Field       | Type       | Null | Key | Default | Extra          |
+-------------+------------+------+-----+---------+----------------+
| result_id   | int(11)    | NO   | PRI | NULL    | auto_increment |
| user_id     | int(11)    | NO   | MUL | NULL    |                |
| result_code | tinyint(4) | NO   |     | NULL    |                |
+-------------+------------+------+-----+---------+----------------+
3 rows in set (0.007 sec)
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



### 更新履歴
2025/06/03 v1.3 鈴木 usersの設計を変更
2205/06/02 v1.2 鈴木 データベース名を追加 テーブル/データベースを明記
2025/05/30 v1.1 鈴木 usersの権限管理が定義されていなかった点を修正
2025/05/30 v1.0 鈴木 初版作成