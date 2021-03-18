import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  List<bool> checkboxList;
  var newMemberController = TextEditingController();

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

  void selectedMember() {
    List selectedMember = [];
    for (int i = 0; i < checkboxList.length; i++) {
      if (checkboxList[i] == true) {
        selectedMember.add(i);
      }
    }
    print(selectedMember);
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
