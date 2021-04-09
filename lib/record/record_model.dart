import 'package:flutter/material.dart';
import '../database_helper.dart';

class RecordModel extends ChangeNotifier {
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController priceEditingController = TextEditingController();
  TextEditingController memoEditingController = TextEditingController();

  var selectedMember;
  List<int> addLiquor;
  List<List<int>> addLiquorList = [];

  String toDayDate;

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  Future<void> registerPost() async {
    // 登録内容
    Map<String, dynamic> post = {
      'event_date': toDayDate,
      'liquor': addLiquorList,
      'member': selectedMember[0],
      'price': priceEditingController.text,
      'memo': memoEditingController.text
    };
    final result = await dbHelper.insertPost(post);
    print(result);
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
