import 'package:flutter/material.dart';
import '../database_helper.dart';

class RecordModel extends ChangeNotifier {
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController priceEditingController = TextEditingController();
  TextEditingController memoEditingController = TextEditingController();

  List selectedMember;
  List<Map<String, dynamic>> selectedMemberName;
  List<int> orderedLiquorIndex;
  List<List<String>> allOrderedLiquor = [];

  String toDayDate;

  List<int> allCupCount = [];

  // database_helper.dartのDataBaseHelperをインスタンス化
  final dbHelper = DatabaseHelper.instance;

  Future<void> registerPost() async {
    // 登録内容
    Map<String, dynamic> post = {
      'event_date': toDayDate,
      'liquor': allOrderedLiquor,
      'member': selectedMember[0], // member_idが格納
      'price': priceEditingController.text,
      'memo': memoEditingController.text,
      'cupCount': allCupCount,
    };
    final result = await dbHelper.insertPost(post);
    print(result);
  }

  // ダイアログで選択したお酒をリストに追加
  void createAddLiquorList() async {
    // ダイアログでお酒、飲み方、量が全て選択されていればok
    if (orderedLiquorIndex != null) {
      List<String> addOrderValue =
          await dbHelper.queryOrderValue(orderedLiquorIndex);
      allOrderedLiquor.add(addOrderValue);
      allCupCount.add(1);
      notifyListeners();
      orderedLiquorIndex = [];
    }
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

  // 杯数のプラス処理
  void plusCount(int index) {
    allCupCount[index]++;
    print(allCupCount);
    displayReload();
  }

  // 杯数のマイナス処理
  void minusCount(int index) {
    if (allCupCount[index] != 1) {
      allCupCount[index]--;
      print(allCupCount);
      displayReload();
    }
  }
}
