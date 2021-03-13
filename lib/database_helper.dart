import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'migration_scripts.dart';

class DatabaseHelper {
  static final _databaseName = "alcorec.db"; // DB名
  // dbのバージョンを指定
  static final _databaseVersion = 1;

  static final table = 'member'; // テーブル名

  // dbカラム
  static final columnId = '_id'; // 列1
  static final columnName = 'name'; // 列2

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
          //for (int i = 1; i <= version; i++) {
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

  // 挿入
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database; //DBにアクセスする
    return await db.insert(table, row); //テーブルにマップ型のものを挿入。追加時のrowIDを返り値にする
  }

  // 全件取得
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database; //DBにアクセスする
    return await db.query(table); //全件取得
  }

  // データ件数取得
  Future<int> queryRowCount() async {
    Database db = await instance.database; //DBにアクセスする
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // 更新
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database; //DBにアクセスする
    int id = row[columnId]; //引数のマップ型のcolumnIDを取得
    print([id]);
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // 削除
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
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
