import 'package:alcorec/record/record_model.dart';
import 'package:flutter/material.dart';

// ダイアログで選択した注文を表示
class DisplayOrderLiquor extends StatelessWidget {
  // 名前付きコンストラクタ
  RecordModel model;
  DisplayOrderLiquor({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.addLiquor == null
        ? Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.grey, width: 0.3),
            ),
            child: Icon(
              Icons.liquor,
              size: 100,
              color: Colors.orange[200],
            ),
          )
        : Column(
            children: [
              Container(
                height: 20,
                //color: Colors.orange[300],
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text('お酒')),
                    Expanded(flex: 3, child: Text('飲み方')),
                    Expanded(flex: 3, child: Text('量')),
                    Expanded(flex: 3, child: Container()),
                  ],
                ),
              ),
              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 0.3),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.addOrderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onLongPress: () {
                        // todo
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text('削除しますか？'),
                              actions: <Widget>[
                                // ボタン領域
                                FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                FlatButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    // todo
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          model.addOrderList[index][0]
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          model.addOrderList[index][1]
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.orange,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          model.addOrderList[index][2]
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              // todo 杯数カウント
                              flex: 1,
                              child: Row(
                                children: [
                                  // todo カウント加減処理
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(Icons.remove_rounded),
                                      onPressed: () {
                                        // todo
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      // todo
                                      child: Text('10'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        // todo
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}

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
