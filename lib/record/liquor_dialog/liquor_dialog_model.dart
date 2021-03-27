import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class LiquorDialogModel extends ChangeNotifier {
  var newLiquorController = TextEditingController();

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  void liquorInsert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.memberColumnName: newLiquorController.text,
    };
    final id = await dbHelper.insert(row);
    print('register new liquor row id: $id');
  }

  // 酒テーブルの情報を全取得
  Future<List<Map<String, dynamic>>> getLiquorData(tableName) async {
    final allRows = await dbHelper.queryAllRows(tableName);
    return allRows;
  }
}
