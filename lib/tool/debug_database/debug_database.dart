import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'debug_database_model.dart';

class DebugDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DebugDatabaseModel>(
      create: (_) => DebugDatabaseModel(),
      child: Consumer<DebugDatabaseModel>(
        builder: (context, model, child) {
          return RaisedButton(
            child: Text('DBtool'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text('DBデバッグ用'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context),
                        child: Column(
                          children: [
                            // member用
                            Container(
                              width: double.infinity,
                              color: Colors.red,
                              child: Column(
                                children: [
                                  Text('member用'),
                                  RaisedButton(
                                    child: Text(
                                      'insert',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      model.testMemberInsert();
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'query',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      model.showAllQuery('member');
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'delete',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      model.delete('member');
                                    },
                                  ),
                                ],
                              ),
                            ),

                            // クエリ確認用カスタム
                            Container(
                              color: Colors.green,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text('カスタム用'),
                                  RaisedButton(
                                    child: Text(
                                      'query',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      // ! 引数にテーブル名を入力
                                      model.showAllQuery('drinking');
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'delete',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      // ! 引数にテーブル名を入力
                                      model.delete('drinking');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            RaisedButton(
                              child: Text(
                                'DatabaseDelete',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                model.dbHelper.databaseDelete();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
