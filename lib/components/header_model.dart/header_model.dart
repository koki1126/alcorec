import 'package:flutter/material.dart';

class HeaderModel extends ChangeNotifier {
  String headerWord;

  String convertTimeToJa() {
    List<String> splitDate = headerWord.split("-");
    String convertDate = '';

    for (int i = 0; i < 3; i++) {
      if (splitDate[i].substring(0, 1) == "0") {
        splitDate[i] = splitDate[i].substring(1, 2);
      }

      if (i == 0) {
        convertDate += splitDate[i] + '年';
      } else if (i == 1) {
        convertDate += splitDate[i] + '月';
      } else {
        convertDate += splitDate[i] + '日';
      }
    }

    return convertDate;
  }
}
