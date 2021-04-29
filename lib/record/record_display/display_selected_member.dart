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
              //children: model.createWrapChildren(),
              children: List<Widget>.generate(model.selectedMember[0].length,
                  (int index) {
                // 可変長サイズのボタンを生成
                return ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 10),
                  child: ButtonTheme(
                    minWidth: 10,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                      child: Container(
                        height: 30,
                        child: RaisedButton(
                          child: Text(model.selectedMemberName[index]
                                  ['member_name']
                              .toString()),
                          color: Colors.white,
                          shape: StadiumBorder(
                            side: BorderSide(color: Colors.orange),
                          ),
                          onPressed: () {
                            // todo 選択削除
                          },
                          splashColor: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
  }
}
