import 'package:flutter/material.dart';

class RecordModel extends ChangeNotifier {
  FocusNode palceFocusNode = FocusNode();
  FocusNode memberFocusNode = FocusNode();
  FocusNode priceFocusNode = FocusNode();
  FocusNode memoFocusNode = FocusNode();

  TextEditingController palceEditingController;
  TextEditingController memberEditingController;
  TextEditingController priceEditingController;
  TextEditingController memoEditingController;
}
