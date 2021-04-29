import 'package:alcorec/database_helper.dart';
import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  List<bool> checkboxList;
  TextEditingController newMemberController = TextEditingController();
  List memberNameList;
  // 繰り越しリスト用の配列
  List takeOverMember;
  List<int> selectedMemberIdList;

  // 登録済メンバーの数だけチェックボックスを作る
  void initValue(List memberData) {
    int count = memberData.length;
    memberNameList = [];

    memberData.forEach((memberName) {
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

  void createSelectedMemberList() {
    // チェックがついてるメンバーのmember_idを配列に格納
    selectedMemberIdList = [];
    int i = 0;
    checkboxList.forEach((bool tf) {
      if (tf == true) {
        selectedMemberIdList.add(memberNameList[i]);
      }
      i++;
    });
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
