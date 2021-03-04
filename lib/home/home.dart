import 'package:alcorec/home/home_model.dart';
import 'package:alcorec/main.dart';
import 'package:alcorec/record/record.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      //ここまでおまじない
      child: Consumer<HomeModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Alcohol '),
            ),

            body: Container(
              child: CalendarCarousel<Event>(
                  onDayPressed: model.onDayPressed,
                  weekendTextStyle: TextStyle(color: Colors.red),
                  nextMonthDayBorderColor: Colors.grey.shade400,
                  thisMonthDayBorderColor: Colors.yellow.shade700,
                  prevMonthDayBorderColor: Colors.grey.shade400,
                  selectedDayButtonColor: Colors.yellowAccent.shade700,
                  weekFormat: false,
                  height: 420.0,
                  selectedDateTime: model.currentDate,
                  daysHaveCircularBorder: true,
                  // customGridViewPhysics: NeverScrollableScrollPhysics(),
                  markedDateShowIcon: true,
                  markedDateIconMaxShown: 3,
                  todayTextStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  markedDateIconBuilder: (event) {
                    return event.icon;
                  },
                  // todayBorderColor: Colors.green,
                  markedDateMoreShowTotal: false),
            ),

            //ここまで

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Record(),
                  ),
                  //現状飛ばない
                );
              },
              child: Icon(Icons.add),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Theme.of(context).primaryColor,
              notchMargin: 6.0,
              shape: AutomaticNotchedShape(
                RoundedRectangleBorder(),
                StadiumBorder(
                  side: BorderSide(),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {},
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

// CalendarCarousel<Event>(
//   onDayPressed: onDayPressed, MaterialColor thisMonthDayBorderColor,
// )

// DateTime _curerntDate = Datetime.now();

// void onDayPressed(DateTime date, List<Event> events){
//   this.setState(() => _curerntDate = date);
//   Fluttertoast.showToast(msg: date.toString());
// }
