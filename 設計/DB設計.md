### users
| user_id (PK) | INT |
|--------------|--------------|
| user_name     | VARCHAR(20)  |
| user_password | VARCHAR(20)  |

### results
| result_id (PK) | INT |
|--------------|--------------|
| user_name (FK)     | VARCHAR(20)  |
| result_value | INT  |

---
**考えていること**
戦績を表示するときに、過去の履歴をすべて集計して表示するのは処理が重くなりそう？
しかし、全員分集計するのは管理者権限メニューのみだから考慮しない？
WHERE句の検索速度を考慮する