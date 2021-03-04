import 'package:alcorec/home/home.dart';
import 'package:flutter/material.dart';
import 'package:alcorec/header.dart';
import 'package:alcorec/kari.dart';
//カレンダー関係
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:flutter_calendar_carousel/';

class HomeModel extends ChangeNotifier {
//  ロジックを記述
  final String title = '酒';

  //画面部分
  final mainTabs = [
    HomePage(),
    Kari(),
  ];

  // final headerTabs = [
  //   Header(headerTitle: 'ホーム'),
  //   Header(headerTitle: '工事中'), //名前は変更する
  // ];

  // @override
  // void notifyListeners() {
  //   // TODO: implement notifyListeners
  //   super.notifyListeners();
  // }

  //カレンダー部分　以下手写し
  DateTime currentDate = DateTime.now();

  void onDayPressed(DateTime date, List<Event> events) {
    // this.setState(() = > _currentDate = date);
    Fluttertoast.showToast(msg: date.toString(), textColor: Colors.pink);
  }
}
