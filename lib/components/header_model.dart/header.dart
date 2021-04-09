import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'header_model.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  // コンストラクタ
  String headerWord;
  Header({Key key, @required this.headerWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HeaderModel>(
      create: (_) => HeaderModel(),
      child: Consumer<HeaderModel>(
        builder: (context, model, child) {
          // modelファイルの変数へ代入
          model.headerWord = headerWord;
          return AppBar(
            iconTheme: IconThemeData(
              color: Colors.yellow,
            ),
            backgroundColor: Colors.orange,
            brightness: Brightness.light, // ステータスバー白黒反転
            title: Text(
              model.convertTimeToJa(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
