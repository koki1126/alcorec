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

// todo 登録されているメンバーを取得
  int memberCount() {
    return 50;
  }

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  // データを登録
  void insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Bob',
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
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Mary',
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
