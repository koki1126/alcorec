import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class LiquorDialogModel extends ChangeNotifier {
  List<bool> checkboxList;
  var newLiquorController = TextEditingController();

  // Widgetを作成する前にbool格納用の固定長のリストを作成
  void initValue(count) {
    checkboxList = List<bool>.filled(count, false);
  }

  bool createCheckbox(index) {
    return checkboxList[index];
  }

  void tapCheckbox(index, value) {
    checkboxList[index] = value;
    notifyListeners();
  }

  void selectedLiquor() {
    List selectedLiquor = [];
    for (int i = 0; i < checkboxList.length; i++) {
      if (checkboxList[i] == true) {
        selectedLiquor.add(i);
      }
    }
    print(selectedLiquor);
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

  // 全クエリを取得
  Future<dynamic> registeredLiquor() async {
    final allRows = await dbHelper.queryAllRows('liquor');
    return allRows;
  }
}
