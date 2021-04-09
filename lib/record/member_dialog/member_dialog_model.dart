import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  List<bool> checkboxList;
  var newMemberController = TextEditingController();
  List memberNameList;

  // 登録済メンバーの数だけチェックボックスを作る
  void initValue(List data, List takeOverMember) {
    int count = data.length;
    memberNameList = [];

    data.forEach((memberName) {
      memberNameList.add(memberName['member_id']);
    });

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
    List<int> selectedMemberIdList = [];

    // チェックがついてるメンバーのmember_idを配列に格納
    int i = 0;
    checkboxList.forEach((bool tf) {
      if (tf == true) {
        selectedMemberIdList.add(memberNameList[i]);
      }
      i++;
    });

    // メンバーのmember_idを格納する
    return [selectedMemberIdList, checkboxList];
  }

  // ! DB関連
  final dbHelper = DatabaseHelper.instance;

  void memberInsert() async {
    Map<String, dynamic> row = {
      'member_name': newMemberController.text,
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
