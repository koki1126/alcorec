import 'package:alcorec/record/record_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'liquor_dialog/liquor_dialog.dart';
import 'liquor_dialog/new_liquor_dialog.dart';

class RecordLiquorButton extends StatelessWidget {
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
                    'お酒の記録',
                    textAlign: TextAlign.left,
                  ),
                ),
                // 選択したお酒を表示する
                model.addLiquor == null
                    ? Text('お酒を追加してね')
                    : Text(model.addLiquor.toString()),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    child: Text('過去の記録から'),
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () async {
                      model.addLiquor = await showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (_) {
                          return LiquorDialog();
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
                    child: Text('新規に登録'),
                    color: Colors.yellow.shade700,
                    textColor: Colors.white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return NewLiquorDialog();
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
