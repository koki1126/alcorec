import 'package:alcorec/record/record_liquor_button.dart';
import 'package:alcorec/record/record_member_button.dart';
import 'package:alcorec/tool/debug_database/debug_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/header.dart';
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
                      RecordLiquorButton(),
                      //メンバーの記録
                      RecordMemberButton(),
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
