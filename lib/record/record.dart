import 'package:alcorec/tool/debug_database/debug_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/header.dart';
import 'liquor_dialog/liquor_dialog.dart';
import 'member_dialog/member_dialog.dart';
import 'record_model.dart';

class Record extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordModel>(
      create: (_) => RecordModel(),
      child: Consumer<RecordModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: Header(headerWord: '記録する'),
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
                      //お酒の記録
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(
                            //   height: 20,
                            //   width: double.infinity,
                            //   child: Text(
                            //     'お酒の記録',
                            //     textAlign: TextAlign.left,
                            //   ),
                            // ),
                            // todo 選択したお酒を表示する
                            // Text('選択したお酒'),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: const DecoratedBox(
                                decoration:
                                    const BoxDecoration(color: Colors.red),
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RaisedButton(
                                    // shape: StadiumBorder(),
                                    child: Text('新規に登録'),
                                    color: Colors.yellow.shade700,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return LiquorDialog();
                                        },
                                      );
                                    },
                                  ),
                                  RaisedButton(
                                    // shape: StadiumBorder(),
                                    child: Text('過去の記録'),
                                    color: Colors.orange,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return LiquorDialog();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   height: 50,
                            //   width: double.infinity,
                            // child: RaisedButton(
                            //   shape: StadiumBorder(),
                            //   child: Text('過去の記録から'),
                            //   color: Colors.orange,
                            //   textColor: Colors.white,
                            //   onPressed: () {
                            //     showDialog(
                            //       context: context,
                            //       builder: (_) {
                            //         return LiquorDialog();
                            //       },
                            //     );
                            //   },
                            // ),
                            // ),
                            // SizedBox(
                            //   width: double.infinity,
                            //   height: 5,
                            // ),
                            // SizedBox(
                            //   width: double.infinity,
                            //   height: 50,
                            // child: RaisedButton(
                            //   shape: StadiumBorder(),
                            //   child: Text('新規に登録'),
                            //   color: Colors.yellow.shade700,
                            //   textColor: Colors.white,
                            //   onPressed: () {
                            //     showDialog(
                            //       context: context,
                            //       builder: (_) {
                            //         return LiquorDialog();
                            //       },
                            //     );
                            //   },
                            // ),
                            // ),
                          ],
                        ),
                      ),

                      //メンバーの記録
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(
                            //   height: 20,
                            //   width: double.infinity,
                            //   child: Text(
                            //     'メンバーの記録',
                            //     textAlign: TextAlign.left,
                            //   ),
                            // ),
                            // todo 選択したメンバーを表示する
                            model.selectedMember == null
                                ? Text('選択したメンバー')
                                : Text(model.selectedMember[0].toString()),
                            SizedBox(
                              height: 120,
                              width: double.infinity,
                              child: const DecoratedBox(
                                decoration:
                                    const BoxDecoration(color: Colors.red),
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  RaisedButton(
                                    // shape: StadiumBorder(),
                                    child: Text('メンバーを追加'),
                                    color: Colors.yellow.shade700,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return LiquorDialog();
                                        },
                                      );
                                    },
                                  ),
                                  RaisedButton(
                                    // shape: StadiumBorder(),
                                    child: Text('新しいメンバー'),
                                    color: Colors.orange,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return LiquorDialog();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            // SizedBox(
                            //   height: 50,
                            //   width: double.infinity,
                            //   child: RaisedButton(
                            //     shape: StadiumBorder(),
                            //     child: Text('メンバーを追加する'),
                            //     color: Colors.orange,
                            //     textColor: Colors.white,
                            //     onPressed: () async {
                            //       model.selectedMember = await showDialog(
                            //         context: context,
                            //         builder: (_) {
                            //           //return AddToMemberDialog();
                            //           return Provider<List>.value(
                            //             value: model.selectedMember == null
                            //                 ? []
                            //                 : model.selectedMember[1],
                            //             child: AddToMemberDialog(),
                            //           );
                            //         },
                            //       );
                            //       model.displayReload();
                            //     },
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: double.infinity,
                            //   height: 15,
                            // ),
                            // SizedBox(
                            //   width: double.infinity,
                            //   height: 50,
                            //   child: RaisedButton(
                            //     shape: StadiumBorder(),
                            //     child: Text('新しいメンバー'),
                            //     color: Colors.yellow.shade700,
                            //     textColor: Colors.white,
                            //     onPressed: () {
                            //       showDialog(
                            //         context: context,
                            //         builder: (_) {
                            //           return NewMemberDialog();
                            //         },
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          focusNode: model.priceFocusNode,
                          controller: model.priceEditingController,
                          decoration: InputDecoration(
                            labelText: '飲食代',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
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
