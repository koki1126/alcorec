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
                  itemCount: model.addLiquorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        // todo
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Aの動作の確認'),
                            );
                          },
                        );
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    model.addLiquorList[index][0].toString(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    model.addLiquorList[index][1].toString(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    model.addLiquorList[index][2].toString(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              // todo 杯数カウント
                              flex: 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // todo カウント加減処理
                                  Icon(Icons.remove_rounded),
                                  Text('1'),
                                  Icon(Icons.add),
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
