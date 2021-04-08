import 'package:flutter/material.dart';
import '../../database_helper.dart';

class DebugDatabaseModel extends ChangeNotifier {
  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  // テストデータを登録
  void testMemberInsert() async {
    // テストデータ
    Map<String, dynamic> row = {
      'member_name': 'user',
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  // 全クエリを取得
  Future<List<Map<String, dynamic>>> showAllQuery(tableName) async {
    final allRows = await dbHelper.queryAllRows(tableName);
    print('$tableName query all rows:');
    allRows.forEach((row) => print(row));
    return allRows;
  }

  // データを更新
  void update() async {
    // テストデータ
    Map<String, dynamic> row = {
      'member_id': 1,
      'member_name': 'update user',
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  // データを削除
  void delete(tableName) async {
    final id = await dbHelper.queryRowCount(tableName);
    final rowsDeleted = await dbHelper.delete(id);
    print('$tableName deleted $rowsDeleted row(s): row $id');
  }
}
