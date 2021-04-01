## テーブル構造(仮)

<br>

### 注文したお酒テーブル(orderliquor)

- トランザクションデータ

| カラム名        | データ型 | 属性                  |
| --------------- | -------- | --------------------- |
| order_liquor_id | INT      | NOT NULL<br>PK <br>AI |
| drinking_id     | INT      | NOT NULL              |
| liquor_id       | INT      | NOT NULL              |
| how_id          | INT      | NOT NULL              |
| amount_id       | INT      | NOT NULL              |
| count           | INT      | NOT NULL              |

<br>

### 飲み会テーブル(drinking)

| カラム名    | データ型 | 属性                 |
| ----------- | -------- | -------------------- |
| drinking_id | INT      | NOT NULL<br>PK<br>AI |
| memo        | TEXT     | NOT NULL             |
| created_at  | TEXT     | NOT NULL             |

<br>

### メンバーテーブル(member)

- マスタデータ

| カラム名    | データ型 | 属性                 |
| ----------- | -------- | -------------------- |
| member_id   | INT      | NOT NULL<br>PK<br>AI |
| member_name | TEXT     | NOT NULL             |

<br>

### お酒種類テーブル(liquor)

- マスタデータ

| カラム名    | データ型 | 属性                 |
| ----------- | -------- | -------------------- |
| liquor_id   | INT      | NOT NULL<br>PK<br>AI |
| liquor_name | TEXT     | NOT NULL             |

<br>

### 飲み方テーブル(how)

- マスタデータ

| カラム名 | データ型 | 属性                 |
| -------- | -------- | -------------------- |
| how_id   | INT      | NOT NULL<br>PK<br>AI |
| way      | TEXT     | NOT NULL             |

<br>

### 酒量テーブル(amount)

- マスタデータ

| カラム名  | データ型 | 属性                  |
| --------- | -------- | --------------------- |
| amount_id | INT      | NOT NULL<br>PK <br>AI |
| capacity  | TEXT     | NOT NULL              |

<br>
