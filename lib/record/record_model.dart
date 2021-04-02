import 'package:flutter/material.dart';
import '../database_helper.dart';

class RecordModel extends ChangeNotifier {
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController priceEditingController;
  TextEditingController memoEditingController;

  var selectedMember;
  List addLiquor;

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  Future<void> registerPost() async {
    print(addLiquor);
    print(selectedMember[0]);
    final id = await dbHelper.insertPost(addLiquor, selectedMember[0]);
    print(id);
  }

  // 画面をリロードする用:
  void displayReload() {
    notifyListeners();
  }

  //void liquorInsert() async {
  //Map<String, dynamic> row = {
  //DatabaseHelper.memberColumnName: newLiquorController.text,
  //};
  //final id = await dbHelper.insert(row);
  //print('register new liquor row id: $id');
  //}

}
