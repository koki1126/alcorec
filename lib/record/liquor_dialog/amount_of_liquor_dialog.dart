import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'how_to_drink_dialog.dart';
import 'liquor_dialog_model.dart';

class AmountOfLiquorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LiquorDialogModel>(
      create: (_) => LiquorDialogModel(),
      child: Consumer<LiquorDialogModel>(
        builder: (context, model, child) {
          return AlertDialog(
            title: Text('酒量を選択'),
            content: Container(
              height: 300.0,
              width: 300.0,
              child: FutureBuilder(
                future: model.getLiquorData('amount'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index]['capacity']),
                          onTap: () {
                            // todo 途中で入力を中断した時の処理
                            Navigator.pop(
                                context, snapshot.data[index]['capacity']);
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
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) {
                      return HowToDrinkDialog();
                    },
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
