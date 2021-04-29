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

  // 新規投稿を登録
  Future<String> insertPost(Map<String, dynamic> post) async {
    Database db = await instance.database; //DBにアクセスする

    Map<String, dynamic> newDrinkingData = {
      'event_date': post['event_date'],
      'memo': post['memo'],
      'price': post['price'],
    };
    // 新規飲み会をinsert
    // 戻り値は追加時のdrinking_id
    int drinkingIndex = await db.insert('drinking', newDrinkingData);

    // 注文したお酒を1つずつinsert
    // todo order_countを設定
    post['liquor'].forEach((order) async {
      Map<String, dynamic> orderData = {
        'drinking_id': drinkingIndex,
        'liquor_id': order[0],
        'how_id': order[1],
        'amount_id': order[2],
        'order_count': 1,
      };
      await db.insert('order_liquor', orderData);
    });

    // 中間テーブル(drinking_member)にinsert
    // 飲み会にいたメンバーを1つずつinsert
    post['member'].forEach((member) async {
      Map<String, dynamic> drinkingMemberData = {
        'drinking_id': drinkingIndex,
        'member_id': member,
      };
      await db.insert('drinking_member', drinkingMemberData);
    });

    return '登録成功やったぜ';
  }

  Future<List> queryAllMemberName() async {
    Database db = await instance.database; //DBにアクセスする
    return await db.rawQuery('SELECT * FROM member');
  }

  Future<List> querySelectedMemberName(List indexList) async {
    Database db = await instance.database; //DBにアクセスする
    List<Map<String, dynamic>> selectMemberName;
    List<Map<String, dynamic>> selectMemberNameList = [];

    String sql = 'SELECT member_name FROM member';

    int count = 0;
    indexList.forEach((index) {
      if (count == 0) {
        sql += ' WHERE member_id = $index';
      }
      sql += ' OR member_id = $index';
      count++;
    });

    return await db.rawQuery(sql);

//    indexList.forEach((index) async {
//      selectMemberName = await db.query(
//        'member',
//        columns: ['member_name'],
//        where: 'member_id = ?',
//        whereArgs: [index],
//      );
//      print(index);
//      print(selectMemberName);
//      //selectMemberNameList.add(selectMemberName);
//    });
//    return [];

//    String sql = 'SELECT member_name FROM member';
//
//    for (int i = 0; i < indexList.length; i++) {
//      int index = indexList[i];
//      if (i == 0) {
//        index++; // 配列のインデックス番号と_idとの差分を修正
//        sql += ' WHERE member_id = $index';
//      } else {
//        index++;
//        sql += ' OR member_id = $index';
//      }
//    }
//
//    return await db.rawQuery(sql);
  }

  // 注文のidからvalueを返す
  Future<List<String>> queryOrderValue(List orderId) async {
    Database db = await instance.database; //DBにアクセスする
    int liquorId = orderId[0];
    int howId = orderId[1];
    int amountId = orderId[2];

    List<Map<String, dynamic>> liquorName = await db.query(
      'liquor',
      columns: ['liquor_name'],
      where: 'liquor_id = ?',
      whereArgs: [liquorId],
    );
    List<Map<String, dynamic>> way = await db.query(
      'how',
      columns: ['way'],
      where: 'how_id = ?',
      whereArgs: [howId],
    );
    List<Map<String, dynamic>> capacity = await db.query(
      'amount',
      columns: ['capacity'],
      where: 'amount_id = ?',
      whereArgs: [amountId],
    );

    // お酒のvalue、飲み方のvalue、量のvalue
    return [
      liquorName[0]['liquor_name'],
      way[0]['way'],
      capacity[0]['capacity']
    ];
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

  // データ件数取得 memberテストデータ用
  Future<int> queryRowCount(tableName) async {
    Database db = await instance.database; //DBにアクセスする
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM member'));
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
