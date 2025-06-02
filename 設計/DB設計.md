# DB設計
## blackjack データベース
### users テーブル
| フィールド名 | 型 |
|---------------|--------------|
| user_id (PK)  | INT          |
| user_name     | VARCHAR(20)  |
| user_password | VARCHAR(20)  |
| user_isadmin  | BOOLEAN      |

### results テーブル
| フィールド名 | 型 |
|----------------|---------|
| result_id (PK) | INT     |
| user_id (FK)   | INT     |
| result_code    | TINYINT |

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
2205/06/02 v1.2 鈴木 データベース名を追加 テーブル/データベースを明記
2025/05/30 v1.1 鈴木 usersの権限管理が定義されていなかった点を修正
2025/05/30 v1.0 鈴木 初版作成