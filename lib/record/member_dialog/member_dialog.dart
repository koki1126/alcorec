import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_dialog_model.dart';

class AddToMemberDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberDialogModel>(
      create: (_) => MemberDialogModel(),
      child: Consumer<MemberDialogModel>(
        builder: (context, model, child) {
          // 既にチェック済のリストがあれば繰り越す
          model.takeOverMember = Provider.of<List>(context);
          return AlertDialog(
            insetPadding: EdgeInsets.all(0),
            title: Text('メンバーを追加'),
            content: Container(
              height: 500,
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: model.newMemberController,
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                          icon: Icon(Icons.add_circle_outline),
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text('登録'),
                      color: Colors.blue,
                      onPressed: () {
                        if (model.newMemberController.text != '') {
                          model.memberInsert();
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                content: Text('名前を入力してね'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Back'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                    Container(
                      height: 20,
                      width: double.infinity,
                      child: Text(
                        '▼ 登録済みのメンバー',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 360,
                      child: FutureBuilder(
                        future: model.getRegisteredMember(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            //if (model.checkboxList?.isEmpty ?? true) {
                            //model.initValue(snapshot.data);
                            //}

                            model.initValue(snapshot.data);

                            //if (model.checkboxList == null) {
                            //model.initValue(snapshot.data);
                            //}
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CheckboxListTile(
                                  value: model.checkboxList[index],
                                  title:
                                      Text(snapshot.data[index]['member_name']),
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
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              // todo chear処理
              FlatButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  model.createSelectedMemberList();
                  Navigator.pop(
                    context,
                    [model.selectedMemberIdList, model.checkboxList],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
