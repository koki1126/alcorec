## テーブル構造(仮)

<br>
<br>
<br>

### 注文したお酒テーブル(order_liquor)

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
<br>

### 飲み会テーブル(drinking)

- マスタデータ

| カラム名    | データ型 | 属性                 |
| ----------- | -------- | -------------------- |
| drinking_id | INT      | NOT NULL<br>PK<br>AI |
| memo        | TEXT     | NOT NULL             |
| created_at  | TEXT     | NOT NULL             |

<br>
<br>

### メンバーテーブル(member)

- マスタデータ

| カラム名    | データ型 | 属性                 |
| ----------- | -------- | -------------------- |
| member_id   | INT      | NOT NULL<br>PK<br>AI |
| member_name | TEXT     | NOT NULL             |

<br>
<br>

### お酒種類テーブル(liquor)

- マスタデータ

| カラム名    | データ型 | 属性                 |
| ----------- | -------- | -------------------- |
| liquor_id   | INT      | NOT NULL<br>PK<br>AI |
| liquor_name | TEXT     | NOT NULL             |

<br>
<br>

### 飲み方テーブル(how)

- マスタデータ

| カラム名 | データ型 | 属性                 |
| -------- | -------- | -------------------- |
| how_id   | INT      | NOT NULL<br>PK<br>AI |
| way      | TEXT     | NOT NULL             |

<br>
<br>

### 酒量テーブル(amount)

- マスタデータ

| カラム名  | データ型 | 属性                  |
| --------- | -------- | --------------------- |
| amount_id | INT      | NOT NULL<br>PK <br>AI |
| capacity  | TEXT     | NOT NULL              |

<br>
<br>
