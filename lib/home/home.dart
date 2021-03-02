import 'package:alcorec/home/home_model.dart';
import 'package:alcorec/main.dart';
import 'package:alcorec/record/record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:flutter_calendar_carousel/classes/event.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      child: Consumer<HomeModel>(
        builder: (context, model, child) {
          return Container(
            child: Text('aaaaa'),
          );
        },
      ),
    );
  }
}
