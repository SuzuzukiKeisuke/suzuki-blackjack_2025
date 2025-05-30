### users
| user_id (PK) | INT |
|--------------|--------------|
| user_name     | VARCHAR(20)  |
| user_password | VARCHAR(20)  |

### results
| result_id (PK) | INT |
|--------------|--------------|
| user_id (FK)     | VARCHAR(20)  |
| result_code | TINYINT  |

---
**補足**
result_codeの値は、そのレコードが示す勝負結果が
- 0 : 負け
- 1 : 勝ち
- 2 : 引き分け
だったことを示します。