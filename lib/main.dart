import 'package:alcorec/record/record.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(),
        ),
        body: HomePage(),
        bottomNavigationBar: Footer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown.shade600,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Record(),
              ),
              //現状飛ばない
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
