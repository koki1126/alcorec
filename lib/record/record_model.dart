import 'package:flutter/material.dart';

class RecordModel extends ChangeNotifier {
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController priceEditingController;
  TextEditingController memoEditingController;

  var selectedMember;
  List addLiquor;

  // 画面をリロードする用:
  void displayReload() {
    notifyListeners();
  }
}
