import 'package:alcorec/record/record.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // todo ロールバックする!!!!!!!!!!!!!!!!!!!!!!!
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('日付'),
        ),
        body: Record(),
      ),
    );
  }
}
