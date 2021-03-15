import 'package:alcorec/header.dart';
import 'package:alcorec/member_dialog/member_dialog.dart';
import 'package:alcorec/record/record_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alcorec/header.dart';
import '../member_dialog/member_dialog_model.dart';

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
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // todo 過去飲んだ酒の履歴
                    // todo 最新順に表示する

                    //履歴表示
                    // Container(
                    //   color: Colors.grey,
                    //   height: 200,
                    //   width: double.infinity,
                    //   child: Wrap(
                    //     spacing: 10,
                    //     runSpacing: 10,
                    //     children: [
                    //       Container(
                    //         color: Colors.green,
                    //         height: 80,
                    //         width: 80,
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    //お酒の記録
                    Padding(
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
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: RaisedButton(
                              shape: StadiumBorder(),
                              child: Text('過去の記録から'),
                              color: Colors.orange,
                              textColor: Colors.white,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return ChangeNotifierProvider<
                                        MemberDialogModel>(
                                      create: (_) => MemberDialogModel(),
                                      child: Consumer<MemberDialogModel>(
                                        builder: (context, model, child) {
                                          //return MemberDialog();
                                          return Provider<String>.value(
                                            value: 'add',
                                            child: MemberDialog(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
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
                                    return ChangeNotifierProvider<
                                        MemberDialogModel>(
                                      create: (_) => MemberDialogModel(),
                                      child: Consumer<MemberDialogModel>(
                                        builder: (context, model, child) {
                                          //return MemberDialog();
                                          return Provider<String>.value(
                                            value: 'new',
                                            child: MemberDialog(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //メンバーの記録
                    Padding(
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
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: RaisedButton(
                              shape: StadiumBorder(),
                              child: Text('メンバーを追加する'),
                              color: Colors.orange,
                              textColor: Colors.white,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return ChangeNotifierProvider<
                                        MemberDialogModel>(
                                      create: (_) => MemberDialogModel(),
                                      child: Consumer<MemberDialogModel>(
                                        builder: (context, model, child) {
                                          //return MemberDialog();
                                          return Provider<String>.value(
                                            value: 'add',
                                            child: MemberDialog(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
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
                                    return ChangeNotifierProvider<
                                        MemberDialogModel>(
                                      create: (_) => MemberDialogModel(),
                                      child: Consumer<MemberDialogModel>(
                                        builder: (context, model, child) {
                                          //return MemberDialog();
                                          return Provider<String>.value(
                                            value: 'new',
                                            child: MemberDialog(),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
