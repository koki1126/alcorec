import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class LiquorDialogModel extends ChangeNotifier {
  TextEditingController newLiquorController = TextEditingController();
  List<int> wayAmountResult;
  int capacityResult;

  // お酒、飲み方、酒量を格納して返却する
  List isWayAmountResult(liquorId) {
    if (wayAmountResult != null) {
      wayAmountResult.insert(0, liquorId);
    }
    return wayAmountResult;
  }

  // 飲み方、酒量を格納して返却する
  List isCapacityResult(howId) {
    List<int> result = [];
    if (capacityResult != null) {
      result = [howId, capacityResult];
    }
    return result;
  }

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  void liquorInsert() async {
    Map<String, dynamic> row = {
      'member_name': newLiquorController.text,
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
