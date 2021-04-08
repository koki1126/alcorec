import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'migration_scripts.dart';

class DatabaseHelper {
  static final _databaseName = "alcorec.db"; // DB名

  // DatabaseHelperクラスをシングルトンにするためのコンストラクタ
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // DBにアクセスするためのメソッド
  static Database _database;
  Future<Database> get database async {
    //if (_database != null) return _database;
    // 初の場合はDBを作成する
    _database = await _initDatabase();

    return _database;
  }

  // データベースを開く。データベースがない場合は作る関数
  _initDatabase() async {
    // dbのパス
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);

    int migrationScriptsLength = migrationScripts.length;
    return await openDatabase(
      path,
      version: migrationScriptsLength,
      // dbがなければ実行
      onCreate: (Database db, int version) async {
        print('onCreate');
        for (int i = 1; i <= migrationScriptsLength; i++) {
          await db.execute(migrationScripts[i]);
        }
      },
      // dbはあるがmigration_scripts.dartにsqlが追加されていたら実行される
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        print('onUpgrade');
        for (int i = oldVersion + 1; i <= newVersion; i++) {
          await db.execute(migrationScripts[i]);
        }
      },
    );
  }

  // Helper methods

  // 投稿を登録
  Future<int> insertPost(Map<String, dynamic> post) async {
    Database db = await instance.database; //DBにアクセスする
    //await db.insert(
    //orderLiquorTable, rowList); //テーブルにマップ型のものを挿入。追加時のrowIDを返り値にする

    Map<String, dynamic> newDrinkingData = {
      'memo': post['memo'],
      'price': post['price'],
    };
    // 新規飲み会をinsert
    await db.insert('drinking', newDrinkingData);

//    String order_liquor_sql = '''
//          INSERT INTO order_liquor (drinking_id, liquor_id, how_id, amount_id, count) VALUES
//          (1, '350ml'),
//    ''';
//
//    post['liquor'].forEach((order) {
//      print(order);
//    });
    //await db.rawQuery(sql);

    return 1;
  }

  Future<List> queryAllMemberName() async {
    Database db = await instance.database; //DBにアクセスする
    return await db.rawQuery('SELECT * FROM member');
  }

  Future<List> querySelectedMemberName(List indexList) async {
    Database db = await instance.database; //DBにアクセスする
    String sql = 'SELECT member_name FROM member';

    for (int i = 0; i < indexList.length; i++) {
      int index = indexList[i];
      if (i == 0) {
        index++; // 配列のインデックス番号と_idとの差分を修正
        sql += ' WHERE member_id = $index';
      } else {
        index++;
        sql += ' OR member_id = $index';
      }
    }

    return await db.rawQuery(sql);
  }

  // 挿入 テストデータ用
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database; //DBにアクセスする
    return await db.insert('member', row); //テーブルにマップ型のものを挿入。追加時のrowIDを返り値にする
  }

  // 全件取得
  Future<List<Map<String, dynamic>>> queryAllRows(tableName) async {
    Database db = await instance.database; //DBにアクセスする
    return await db.query(tableName); //全件取得
  }

  // データ件数取得 テストデータ用
  Future<int> queryRowCount(tableName) async {
    Database db = await instance.database; //DBにアクセスする
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  // 更新 テストデータ用
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database; //DBにアクセスする
    int id = row['member_id']; //引数のマップ型のcolumnIDを取得
    print([id]);
    return await db.update(
      'member',
      row,
      where: 'member_id = ?',
      whereArgs: [id],
    );
  }

  // 削除 テストデータ用
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete('member', where: 'member_id = ?', whereArgs: [id]);
  }

  // ! DB削除
  Future databaseDelete() async {
    print('delete');
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'alcorec.db');
    await deleteDatabase(path);
  }
}
