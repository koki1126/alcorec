import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String title;
  Header({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}
