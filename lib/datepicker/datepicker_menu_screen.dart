import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import 'datepicker_example_screen.dart';
import 'cupertino_datepicker_example_screen.dart';

class DatePickerMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DatePickerMenuScreenState();
  }
}

class _DatePickerMenuScreenState extends BaseState<DatePickerMenuScreen> {
  _DatePickerMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('DatePicker examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('datepicker example',),
                      Text( ' ',style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return DatePickerExampleScreen();
                    }));
                  },
                )
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('cupertino datepicker example',),
                      Text( ' ',style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return CupertinoDatePickerExampleScreen();
                    }));
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}