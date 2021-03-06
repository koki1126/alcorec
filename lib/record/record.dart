import 'package:alcorec/header.dart';
import 'package:alcorec/member_dialog/member_dialog.dart';
import 'package:alcorec/record/record_model.dart';
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
            appBar: Header(headerWord: '酒プラス'),
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
                    Container(
                      color: Colors.grey,
                      height: 200,
                      width: double.infinity,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Container(
                            color: Colors.green,
                            height: 80,
                            width: 80,
                          ),
                        ],
                      ),
                    ),

                    RaisedButton(
                      child: Text('メンバーを追加'),
                      color: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return ChangeNotifierProvider<MemberDialogModel>(
                              create: (_) => MemberDialogModel(),
                              child: Consumer<MemberDialogModel>(
                                builder: (context, model, child) {
                                  return MemberDialog();
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),

                    TextField(
                      focusNode: model.priceFocusNode,
                      controller: model.priceEditingController,
                      decoration: InputDecoration(
                        labelText: '飲食代',
                      ),
                    ),
                    TextField(
                      focusNode: model.memoFocusNode,
                      controller: model.memoEditingController,
                      decoration: InputDecoration(
                        labelText: 'メモ',
                      ),
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
