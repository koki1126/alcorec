import 'package:alcorec/record/record_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_dialog/member_dialog.dart';

class RecordMemberButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordModel>(
      create: (_) => RecordModel(),
      child: Consumer<RecordModel>(
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                  width: double.infinity,
                  child: Text(
                    'メンバーの記録',
                    textAlign: TextAlign.left,
                  ),
                ),
                // 選択したメンバーを表示する
                model.selectedMember == null
                    ? Text('選択したメンバー')
                    : Text(model.selectedMember[0].toString()),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    child: Text('メンバーを追加する'),
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () async {
                      model.selectedMember = await showDialog(
                        context: context,
                        builder: (_) {
                          //return AddToMemberDialog();
                          return Provider<List>.value(
                            value: model.selectedMember == null
                                ? []
                                : model.selectedMember[1],
                            child: AddToMemberDialog(),
                          );
                        },
                      );
                      model.displayReload();
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    child: Text('新しいメンバー'),
                    color: Colors.yellow.shade700,
                    textColor: Colors.white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return NewMemberDialog();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
