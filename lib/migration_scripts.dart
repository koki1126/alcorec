Map<int, String> migrationScripts = {
  1: '''
          CREATE TABLE member (
            _id INTEGER PRIMARY KEY,
            member_name TEXT NOT NULL
          )
      ''',
  2: '''
          CREATE TABLE liquor (
            _id INTEGER PRIMARY KEY,
            liquor_name TEXT NOT NULL
          )
      ''',
  3: '''
          CREATE TABLE how_to_drink (
            _id INTEGER PRIMARY KEY,
            way TEXT NOT NULL,
            liquor_id INTEGER
          )
      ''',
  4: '''
          CREATE TABLE amount_of_liquor (
            _id INTEGER PRIMARY KEY,
            capacity TEXT NOT NULL,
            liquor_id INTEGER
          )
      ''',
  5: '''
          INSERT INTO liquor (_id, liquor_name) VALUES
          (1, 'ビール'),
          (2, 'ウィスキー'),
          (3, 'サワー'),
          (4, '焼酎'),
          (5, '日本酒'),
          (6, 'ワイン'),
          (7, 'カクテル'),
          (8, '梅酒')
      ''',
  6: '''
          INSERT INTO how_to_drink (_id, way) VALUES
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
  7: '''
          INSERT INTO amount_of_liquor (_id, capacity) VALUES
          (1, '350ml'),
          (2, '500ml'),
          (3, '中ジョッキ'),
          (4, '大ジョッキ'),
          (5, 'おちょこ'),
          (6, '1合'),
          (7, 'グラス')
      ''',
};
