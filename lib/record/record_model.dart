import 'package:flutter/material.dart';
import '../database_helper.dart';

class RecordModel extends ChangeNotifier {
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController priceEditingController;
  TextEditingController memoEditingController;

  var selectedMember;
  List<int> addLiquor;
  List<List<int>> addLiquorList = [];

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  Future<void> registerPost() async {
    print(addLiquor);
    print(selectedMember[0]);
    final id = await dbHelper.insertPost(addLiquor, selectedMember[0]);
    print(id);
  }

  // ダイアログで選択したお酒をリストに追加
  void createAddLiquorList() {
    addLiquorList.add(addLiquor);
    notifyListeners();
    addLiquor = [];
  }

  // 画面を再描画する用メソッド
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
