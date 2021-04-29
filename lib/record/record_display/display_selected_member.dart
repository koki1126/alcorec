import 'package:flutter/material.dart';
import '../record_model.dart';

// ダイアログで選択したメンバーを表示
class DisplaySelectedMember extends StatelessWidget {
  // 名前付きコンストラクタ
  RecordModel model;
  DisplaySelectedMember({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.selectedMember == null
        ? Container()
        : Container(
            width: double.infinity,
            child: Wrap(
              direction: Axis.horizontal,
              children: model.createWrapChildren(),
            ),
          );
  }
}
