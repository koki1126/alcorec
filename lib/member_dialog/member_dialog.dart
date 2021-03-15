import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_dialog_model.dart';

class MemberDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberDialogModel>(
      create: (_) => MemberDialogModel(),
      child: Consumer<MemberDialogModel>(
        builder: (context, model, child) {
          return 'add' == Provider.of<String>(context)
              ? AlertDialog(
                  title: Text('メンバーを追加'),
                  content: Container(
                    height: 300.0,
                    width: 300.0,
                    child: FutureBuilder(
                      future: model.registeredMember(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
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
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                )
              : AlertDialog(
                  title: Text('メンバーを新規追加'),
                  content: TextField(
                    controller: model.newMemberController,
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
                        model.newMemberController.text != ''
                            ? model.memberInsert()
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
