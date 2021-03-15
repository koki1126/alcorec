import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  List<bool> checkboxList = [];
  var newMemberController = TextEditingController();

  bool createCheckbox(index) {
    checkboxList.add(false);
    return checkboxList[index];
  }

  void tapCheckbox(index, value) {
    checkboxList[index] = value;
    notifyListeners();
  }

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  void memberInsert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: newMemberController.text,
    };
    final id = await dbHelper.insert(row);
    print('register new member row id: $id');
  }

  // 全クエリを取得
  Future<dynamic> registeredMember() async {
    final allRows = await dbHelper.queryAllRows();
    return allRows;
  }
}
