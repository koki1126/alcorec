Map<int, String> migrationScripts = {
  1: '''
          CREATE TABLE order_liquor (
            order_liquor_id INTEGER PRIMARY KEY AUTOINCREMENT,
            drinking_id INTEGER NOT NULL,
            liquor_id INTEGER NOT NULL,  
            how_id INTEGER NOT NULL,
            amount_id INTEGER NOT NULL,
            count INTEGER NOT NULL
          )
      ''',
  2: '''
          CREATE TABLE drinking (
            drinking_id INTEGER PRIMARY KEY AUTOINCREMENT,
            memo TEXT NOT NULL,
            created_at DATE DEFAULT (datetime('now','localtime'))
          )
      ''',
  3: '''
          CREATE TABLE member (
            member_id INTEGER PRIMARY KEY AUTOINCREMENT,
            member_name TEXT NOT NULL
          )
      ''',
  4: '''
          CREATE TABLE liquor (
            liquor_id INTEGER PRIMARY KEY AUTOINCREMENT,
            liquor_name TEXT NOT NULL
          )
      ''',
  5: '''
          CREATE TABLE how (
            how_id INTEGER PRIMARY KEY AUTOINCREMENT,
            way TEXT NOT NULL
          )
      ''',
  6: '''
          CREATE TABLE amount (
            amount_id INTEGER PRIMARY KEY AUTOINCREMENT,
            capacity TEXT NOT NULL
          )
      ''',
  7: '''
          INSERT INTO liquor (liquor_id, liquor_name) VALUES
          (1, 'ビール'),
          (2, 'ウィスキー'),
          (3, 'サワー'),
          (4, '焼酎'),
          (5, '日本酒'),
          (6, 'ワイン'),
          (7, 'カクテル'),
          (8, '梅酒')
      ''',
  8: '''
          INSERT INTO how (how_id, way) VALUES
          (1, 'ストレート'),
          (2, 'ロック'),
          (3, 'ハイボール'),
          (4, '水割り'),
          (5, 'レモン'),
          (6, 'グレープフルーツ'),
          (7, 'お湯割り'),
          (8, 'カシスオレンジ'),
          (9, 'カシスソーダ'),
          (10, 'ジントニック'),
          (11, 'ソーダ割り')
      ''',
  9: '''
          INSERT INTO amount (amount_id, capacity) VALUES
          (1, '350ml'),
          (2, '500ml'),
          (3, '中ジョッキ'),
          (4, '大ジョッキ'),
          (5, 'おちょこ'),
          (6, '1合'),
          (7, 'グラス')
      ''',
};
