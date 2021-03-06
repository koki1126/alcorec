import 'package:flutter/material.dart';

class MemberDialogModel extends ChangeNotifier {
  bool user1 = false;
  void checkboxChange(value) {
    user1 = value;
    notifyListeners();
  }
}
