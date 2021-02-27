import 'package:alcorec/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create:  (_)=> HomeModel(),
          child: Consumer<HomeModel>(
            builder: (context, model, child){
              return Scaffold(
        appBar: AppBar(
            title: Text(model.title),
        ),
        bottomNavigationBar: BottomNavigationBar(
            
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'ホーム',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '追加',
                // 真中部分はFABでかぶせたい
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq),
                label: '仮',
              ),
            ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, 
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: (){
              //record.dartに飛ぶようにする
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
        ),
      );




            },
          ),
    );
  }
}
