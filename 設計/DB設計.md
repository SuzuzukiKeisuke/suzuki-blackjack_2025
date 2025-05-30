### users
| user_id (PK) | INT |
|--------------|--------------|
| user_name     | VARCHAR(20)  |
| user_password | VARCHAR(20)  |
| user_isadmin  | BOOLEAN      |

### results
| result_id (PK) | INT |
|--------------|--------------|
| user_id (FK)     | VARCHAR(20)  |
| result_code | TINYINT  |

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
2025/05/30 usersの権限管理が定義されていなかった点を修正
2025/05/30 初版作成