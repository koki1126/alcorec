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
          return AlertDialog(
            title: Text('メンバーを追加'),
            content: Container(
              height: 300.0,
              width: 300.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    value: model.createCheckbox(index),
                    title: Text(index.toString()),
                    onChanged: (value) {
                      model.tapCheckbox(index, value);
                    },
                  );
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
          );
        },
      ),
    );
  }
}
