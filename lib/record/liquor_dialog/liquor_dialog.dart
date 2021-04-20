import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'how_to_drink_dialog.dart';
import 'liquor_dialog_model.dart';

class LiquorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LiquorDialogModel>(
      create: (_) => LiquorDialogModel(),
      child: Consumer<LiquorDialogModel>(
        builder: (context, model, child) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(0),
            title: Text('"お酒"を選択'),
            content: Container(
              height: 500.0,
              width: 300.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: model.newLiquorController,
                      decoration: InputDecoration(
                        hintText: 'Enter Liquor',
                        icon: Icon(Icons.add_circle_outline),
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text('登録'),
                    color: Colors.blue,
                    onPressed: () {
                      model.newLiquorController.text != ''
                          ? model.liquorInsert()
                          : null; // 新規メンバーを追加
                      //Navigator.pop(context);
                    },
                  ),
                  Container(
                    height: 20,
                    width: double.infinity,
                    child: Text(
                      '▼ 登録済みの"お酒"',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 360,
                    child: FutureBuilder(
                      future: model.getLiquorData('liquor'),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title:
                                    Text(snapshot.data[index]['liquor_name']),
                                onTap: () async {
                                  model.wayAmountResult = await showDialog(
                                    context: context,
                                    barrierColor: Colors.black.withOpacity(0),
                                    builder: (_) {
                                      return HowToDrinkDialog();
                                    },
                                  );
                                  // todo 途中で入力を中断した時の処理
                                  Navigator.pop(
                                    context,
                                    model.isWayAmountResult(
                                        snapshot.data[index]['liquor_id']),
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return CircularProgressIndicator(); // データをロードできていなけれなぐるぐるを表示
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // ボタン領域
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
