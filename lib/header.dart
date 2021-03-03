import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String headerTitle;
  //↓よくわからない
  Header({Key key, @required this.headerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow,
      title: Text(
        headerTitle,
        //styleの指定をする
      ),
    );
  }
}
