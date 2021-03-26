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

                            // liquor用
                            Container(
                              color: Colors.blue,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text('liquor用'),
                                  RaisedButton(
                                    child: Text(
                                      'query',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      model.showAllQuery('liquor');
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      'delete',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      model.delete('liquor');
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
