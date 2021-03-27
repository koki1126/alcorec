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
            child: Text('TestData'),
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
                            RaisedButton(
                              child: Text(
                                'insert',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                model.insert();
                              },
                            ),
                            RaisedButton(
                              child: Text(
                                'query',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                model.query();
                              },
                            ),
                            RaisedButton(
                              child: Text(
                                'update',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                model.update();
                              },
                            ),
                            RaisedButton(
                              child: Text(
                                'delete',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                model.delete();
                              },
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
