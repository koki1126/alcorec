import 'package:alcorec/home/home.dart';
import 'package:flutter/material.dart';
import 'package:alcorec/header.dart';
import 'package:alcorec/kari.dart';
// import 'package:flutter_calendar_carousel/';

class HomeModel extends ChangeNotifier {
//  ロジックを記述
  final String title = '酒プラス';

  //画面部分
  final mainTabs = [
    HomePage(),
    Kari(),
  ];

  final headerTabs = [
    Header(headerTitle: 'ホーム'),
    Header(headerTitle: '工事中'), //名前は変更する
  ];

  // @override
  // void notifyListeners() {
  //   // TODO: implement notifyListeners
  //   super.notifyListeners();
  // }
}
