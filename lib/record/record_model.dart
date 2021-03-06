import 'package:flutter/material.dart';

class RecordModel extends ChangeNotifier {
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController priceEditingController;
  TextEditingController memoEditingController;

  bool user1 = false;
  void checkboxChange(value) {
    print(value);
    user1 = value;
    notifyListeners();
    print('notifyListenrs');
  }
}
