import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.yellowAccent,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.brown,
          ),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.graphic_eq,
            color: Colors.brown,
          ),
          label: '仮3',
        ),
      ],
      // showUnselectedLabels: false,
      // showSelectedLabels: true,
    );
  }
}
