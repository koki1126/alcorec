import 'package:alcorec/home/home_model.dart';
import 'package:alcorec/record/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';
import 'footer.dart';
import 'header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ChangeNotifierProvider<HomeModel>(
      //   create: (_) => HomeModel(),
      // ),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        // appBar: headerTabs[currentIndex], //モデルから引っ張ってくる
        body: HomePage(),
        bottomNavigationBar: Footer(),

        // floating action button
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown.shade600,
          onPressed: () {
            Navigator.push(
              //ToDo record.dartに飛べるようにする
              context,
              MaterialPageRoute(
                builder: (context) => Record(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white70,
          ),
        ),
        // ここまで
      ),
    );
  }
}
