import 'package:flutter/material.dart';
import '../../database_helper.dart';

class DebugDatabaseModel extends ChangeNotifier {
  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  // テストデータを登録
  void insert() async {
    // テストデータ
    Map<String, dynamic> row = {
      DatabaseHelper.memberColumnName: 'user',
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  // 全クエリを取得
  Future<dynamic> query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
    return allRows;
  }

  // データを更新
  void update() async {
    // テストデータ
    Map<String, dynamic> row = {
      DatabaseHelper.memberColumnId: 1,
      DatabaseHelper.memberColumnName: 'update user',
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  // データを削除
  void delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
