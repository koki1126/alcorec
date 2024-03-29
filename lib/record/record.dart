import 'package:alcorec/tool/debug_database/debug_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/header_model.dart/header.dart';
import 'liquor_dialog/liquor_dialog.dart';
import 'member_dialog/member_dialog.dart';
import 'record_display/display_order_liquor.dart';
import 'record_model.dart';

class Record extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordModel>(
      create: (_) => RecordModel(),
      child: Consumer<RecordModel>(
        builder: (context, model, child) {
          // 渡された今日の日付をmodelファイルに格納
          // todo もう少し効率いい記述あるかも
          model.toDayDate = Provider.of<String>(context);
          return Scaffold(
            appBar: Header(headerWord: model.toDayDate),
            body: GestureDetector(
              onTap: () {
                model.priceFocusNode.unfocus();
                model.memoFocusNode.unfocus();
              },
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // ! お酒の記録
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Container(
                                height: 20,
                                width: double.infinity,
                                child: Text(
                                  '▼お酒の記録',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DisplayOrderLiquor(model: model),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              width: 160,
                              child: RaisedButton(
                                child: Text('注文を追加'),
                                color: Colors.orange,
                                textColor: Colors.white,
                                onPressed: () async {
                                  // todo お酒ダイアログリファクタ
                                  model.orderedLiquorIndex = await showDialog(
                                    context: context,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    builder: (_) {
                                      return LiquorDialog();
                                    },
                                  );
                                  model.createAddLiquorList();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ! メンバーの記録
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Container(
                                height: 20,
                                width: double.infinity,
                                child: Text(
                                  '▼メンバーの記録',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            // ! 画面上に選択メンバーを表示
                            model.selectedMember == null
                                ? Container()
                                : Container(
                                    width: double.infinity,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: List<Widget>.generate(
                                          model.selectedMember[0].length,
                                          (int index) {
                                        // 可変長サイズのボタンを生成
                                        return ConstrainedBox(
                                          constraints:
                                              BoxConstraints(minWidth: 10),
                                          child: ButtonTheme(
                                            minWidth: 10,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  2, 5, 2, 5),
                                              child: Container(
                                                height: 30,
                                                child: RaisedButton(
                                                  child: Text(model
                                                      .selectedMemberName[index]
                                                          ['member_name']
                                                      .toString()),
                                                  color: Colors.white,
                                                  shape: StadiumBorder(
                                                    side: BorderSide(
                                                        color: Colors.orange),
                                                  ),
                                                  onPressed: () {
                                                    // todo 選択削除
                                                  },
                                                  splashColor: Colors.orange,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 40,
                              width: 160,
                              child: RaisedButton(
                                child: Text('メンバーを追加する'),
                                color: Colors.orange,
                                textColor: Colors.white,
                                onPressed: () async {
                                  model.selectedMember = await showDialog(
                                    context: context,
                                    builder: (_) {
                                      return WillPopScope(
                                        // 領域外タップで非表示にしない
                                        onWillPop: () async => false,
                                        child: Provider<List>.value(
                                          // チェックされている状態ならデータを渡す
                                          value: model.selectedMember == null
                                              ? []
                                              : model.selectedMember[1],
                                          child: AddToMemberDialog(),
                                        ),
                                      );
                                    },
                                  );
                                  model.getMemberName();
                                  // todo リファクタ
                                  model.displayReload();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          focusNode: model.priceFocusNode,
                          controller: model.priceEditingController,
                          decoration: InputDecoration(
                            labelText: '使ったお金',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          focusNode: model.memoFocusNode,
                          controller: model.memoEditingController,
                          decoration: InputDecoration(
                            labelText: 'メモ',
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: Text('登録'),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: () {
                          // todo 登録処理
                          model.registerPost();
                          Navigator.pop(context);
                        },
                      ),
                      // ! DBデバッグ用ダイアログ
                      DebugDatabase(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
