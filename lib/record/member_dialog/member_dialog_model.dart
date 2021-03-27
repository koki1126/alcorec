import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  List<bool> checkboxList;
  var newMemberController = TextEditingController();
  List selectedMemberIndexList;

  // Widgetを作成する前にbool格納用の固定長のリストを作成
  void initValue(int count, List takeOverMember) {
    print(takeOverMember);
    if (takeOverMember.isEmpty) {
      checkboxList = List<bool>.filled(count, false);
    } else {
      checkboxList = takeOverMember;
    }
  }

  bool createCheckbox(int index) {
    return checkboxList[index];
  }

  void tapCheckbox(int index, bool value) {
    checkboxList[index] = value;
    notifyListeners();
  }

  Future<List> createSelectedMemberList() async {
    List<int> selectedMemberIndexList = [];
    List selectedMemberNameList = [];

    // チェックが付いているメンバーのインデックス番号を配列に格納
    for (int i = 0; i < checkboxList.length; i++) {
      if (checkboxList[i] == true) {
        selectedMemberIndexList.add(i);
      }
    }
    selectedMemberNameList =
        await getSelectedMemberName(selectedMemberIndexList);
    return [selectedMemberNameList, checkboxList];
  }

  // ! DB関連
  final dbHelper = DatabaseHelper.instance;

  // 選択されたインデックス番号のメンバー名を取得する関数
  Future<List> getSelectedMemberName(indexList) async {
    List nameList = [];
    final selectedMemberName =
        await dbHelper.querySelectedMemberName(indexList);

    selectedMemberName.forEach((member) {
      nameList.add(member['name']);
    });

    return nameList;
  }

  void memberInsert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: newMemberController.text,
    };
    final id = await dbHelper.insert(row);
    print('register new member row id: $id');
  }

  // 全登録済メンバーを取得
  Future<dynamic> getRegisteredMember() async {
    List registeredMember = [];
    final allRows = await dbHelper.queryAllMemberName();
    allRows.forEach((name) {
      registeredMember.add(name['name']);
    });
    return registeredMember;
  }
}
