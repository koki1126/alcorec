import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  List<bool> checkboxList = [];

  bool createCheckbox(index) {
    checkboxList.add(false);
    return checkboxList[index];
  }

  void tapCheckbox(index, value) {
    checkboxList[index] = value;
    notifyListeners();
  }
}
