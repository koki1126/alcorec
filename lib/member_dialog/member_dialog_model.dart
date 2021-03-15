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

  // テストデータを登録
  void insert() async {
    // テストデータ
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'user',
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
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'update user',
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
