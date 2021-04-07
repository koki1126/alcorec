import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  List<bool> checkboxList;
  var newMemberController = TextEditingController();
  List selectedMemberIndexList;

  // 登録済メンバーの数だけチェックボックスを作る
  void initValue(List data, List takeOverMember) {
    int count = data.length;
    print(data);
    if (takeOverMember.isEmpty) {
      checkboxList = List<bool>.filled(count, false);
    } else {
      checkboxList = takeOverMember;
    }
  }

  // tapした時にチェックマークをつける
  void tapCheckbox(int index, bool value) {
    checkboxList[index] = value;
    notifyListeners();
  }

  Future<List> createSelectedMemberList() async {
    List<int> selectedMemberIndexList = [];
    // チェックがついてるメンバーのmember_idを配列に格納
    int i = 1;
    checkboxList.forEach((bool tf) {
      if (tf == true) {
        selectedMemberIndexList.add(i);
      }
      i++;
    });

    return [selectedMemberIndexList, checkboxList];
  }

  // ! DB関連
  final dbHelper = DatabaseHelper.instance;

  void memberInsert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.memberColumnName: newMemberController.text,
    };
    final id = await dbHelper.insert(row);
    print('register new member row id: $id');
  }

  // 全登録済メンバーを取得
  Future<dynamic> getRegisteredMember() async {
    List registeredMember = [];
    final allRows = await dbHelper.queryAllMemberName();
    allRows.forEach((name) {
      registeredMember.add(name);
    });
    return registeredMember;
  }
}
