import 'package:flutter/material.dart';
import '../database_helper.dart';

class RecordModel extends ChangeNotifier {
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController priceEditingController = TextEditingController();
  TextEditingController memoEditingController = TextEditingController();

  List selectedMember;
  List<Map<String, dynamic>> selectedMemberName;
  List<int> orderedLiquor;
  List<List<String>> allOrderedLiquor = [];

  String toDayDate;

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  Future<void> registerPost() async {
    // 登録内容
    Map<String, dynamic> post = {
      'event_date': toDayDate,
      'liquor': allOrderedLiquor,
      'member': selectedMember[0],
      'price': priceEditingController.text,
      'memo': memoEditingController.text
    };
    final result = await dbHelper.insertPost(post);
    print(result);
  }

  // ダイアログで選択したお酒をリストに追加
  void createAddLiquorList() async {
    // todo addLiquorに格納された番号からお酒データを引っ張ってくる
    List<String> addOrderValue = await dbHelper.queryOrderValue(orderedLiquor);
    allOrderedLiquor.add(addOrderValue);
    notifyListeners();
    orderedLiquor = [];
  }

  //member_idからmember_nameを検索する
  void getMemberName() async {
    selectedMemberName =
        await dbHelper.querySelectedMemberName(selectedMember[0]);
  }

  // 画面を再描画する用メソッド
  void displayReload() {
    notifyListeners();
  }
}
