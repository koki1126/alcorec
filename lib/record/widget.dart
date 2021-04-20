import 'dart:ffi';

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
            height: 240,
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
                color: Colors.orange[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('お酒'),
                    Text('飲み方'),
                    Text('量'),
                  ],
                ),
              ),
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey, width: 0.3),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.addLiquorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          child: Text(model.addLiquorList[index][0].toString()),
                          color: Colors.orange[100],
                          shape: Border(
                            top: BorderSide(color: Colors.green),
                            //right: BorderSide(color: Colors.green),
                            bottom: BorderSide(color: Colors.green),
                            left: BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            // todo 選択削除
                          },
                          splashColor: Colors.orange,
                        ),
                        RaisedButton(
                          child: Text(model.addLiquorList[index][1].toString()),
                          color: Colors.orange[100],
                          shape: Border(
                            top: BorderSide(color: Colors.green),
                            //right: BorderSide(color: Colors.green),
                            bottom: BorderSide(color: Colors.green),
                            //left: BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            // todo 選択削除
                          },
                          splashColor: Colors.orange,
                        ),
                        RaisedButton(
                          child: Text(model.addLiquorList[index][2].toString()),
                          color: Colors.orange[100],
                          shape: Border(
                            top: BorderSide(color: Colors.green),
                            right: BorderSide(color: Colors.green),
                            bottom: BorderSide(color: Colors.green),
                            //left: BorderSide(color: Colors.green),
                          ),
                          onPressed: () {
                            // todo 選択削除
                          },
                          splashColor: Colors.orange,
                        ),
                        //RaisedButton(
                        //child: Text(model.addLiquorList[index][1].toString()),
                        //color: Colors.green[100],
                        //shape: StadiumBorder(
                        //side: BorderSide(color: Colors.green),
                        //),
                        //onPressed: () {
                        //// todo 選択削除
                        //},
                        //splashColor: Colors.orange,
                        //),
                        //RaisedButton(
                        //child: Text(model.addLiquorList[index][2].toString()),
                        //color: Colors.green[100],
                        //shape: StadiumBorder(
                        //side: BorderSide(color: Colors.green),
                        //),
                        //onPressed: () {
                        //// todo 選択削除
                        //},
                        //splashColor: Colors.orange,
                        //),
                        Text('1'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // todo 選択削除
                          },
                        ),
                      ],
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
