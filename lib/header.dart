import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final String headerWord;
  Header({Key key, @required this.headerWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light, // ステータスバー白黒反転
      title: Text(
        headerWord,
        style: TextStyle(
          color: Colors.lightBlue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
