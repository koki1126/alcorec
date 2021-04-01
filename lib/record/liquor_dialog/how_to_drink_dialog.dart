import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'amount_of_liquor_dialog.dart';
import 'liquor_dialog.dart';
import 'liquor_dialog_model.dart';

class HowToDrinkDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LiquorDialogModel>(
      create: (_) => LiquorDialogModel(),
      child: Consumer<LiquorDialogModel>(
        builder: (context, model, child) {
          return AlertDialog(
            title: Text('飲み方を選択'),
            content: Container(
              height: 300.0,
              width: 300.0,
              child: FutureBuilder(
                future: model.getLiquorData('how'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // リストの初期化(initState)
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index]['way']),
                          onTap: () async {
                            model.howToDrinkDialogResult = await showDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(0),
                              builder: (_) {
                                return AmountOfLiquorDialog();
                              },
                            );

                            // todo 途中で入力を中断した時の処理
                            Navigator.pop(context,
                                model.isHowToDrinkResult(snapshot.data[index]));

//                            Navigator.pop(context, [
//                              snapshot.data[index]['way'],
//                              model.howToDrinkDialogResult
//                            ]);
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
                      return LiquorDialog();
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
