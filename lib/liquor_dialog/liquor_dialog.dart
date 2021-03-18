import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'liquor_dialog_model.dart';

class LiquorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LiquorDialogModel>(
      create: (_) => LiquorDialogModel(),
      child: Consumer<LiquorDialogModel>(
        builder: (context, model, child) {
          return 'add' == Provider.of<String>(context)
              ? AlertDialog(
                  title: Text('お酒を追加'),
                  content: Container(
                    height: 300.0,
                    width: 300.0,
                    child: FutureBuilder(
                      future: model.registeredLiquor(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          // リストの初期化(initState)
                          model.checkboxList == null
                              ? model.initValue(snapshot.data.length)
                              : null;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CheckboxListTile(
                                value: model.createCheckbox(index),
                                title: Text(snapshot.data[index]['name']),
                                onChanged: (value) {
                                  model.tapCheckbox(index, value);
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
                  actions: <Widget>[
                    // ボタン領域
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        model.selectedLiquor();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              : AlertDialog(
                  title: Text('お酒を新規追加'),
                  content: TextField(
                    controller: model.newLiquorController,
                    decoration: InputDecoration(
                      labelText: '名前を入力',
                    ),
                  ),
                  actions: <Widget>[
                    // ボタン領域
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        model.newLiquorController.text != ''
                            ? model.liquorInsert()
                            : null; // 新規メンバーを追加
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
