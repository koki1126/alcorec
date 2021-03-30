import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class LiquorDialogModel extends ChangeNotifier {
  var newLiquorController = TextEditingController();
  List liquorDialogResult;
  String howToDrinkDialogResult;
  var amountOfLiquorResult;

  List isLiquorDialog(data) {
    if (liquorDialogResult != null) {
      liquorDialogResult.insert(0, data['liquor_name']);
    }
    return liquorDialogResult;
  }

  List isHowToDrinkResult(data) {
    List result = [];
    if (howToDrinkDialogResult != null) {
      result = [data['way'], howToDrinkDialogResult];
    }
    return result;
  }

  List isAmountOfLiquorResult(data) {
    if (liquorDialogResult != null) {
      liquorDialogResult.insert(0, data['liquor_name']);
    }
    return liquorDialogResult;
  }

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
