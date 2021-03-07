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

// todo Firesotreで登録されているメンバーを取得
  int memberCount() {
    return 50;
  }
}
