import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../base/base_stateful_widget.dart';
//import '../components/snack_bar.dart';
//import '../app.dart';

class AlignmentExampleScreenResult {
  final String message;
  AlignmentExampleScreenResult(this.message);
}

class AlignmentExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AlignmentExampleScreenState();
  }
}


class _AlignmentExampleScreenState extends State<AlignmentExampleScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Alignment examples'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                Container(
                    color: Colors.blue,
                    child: Text('start1', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('start2', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('start3', style: TextStyle(fontSize: 15))),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Container(
                    color: Colors.blue,
                    child: Text('center1', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('center2', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('center3', style: TextStyle(fontSize: 15))),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Container(
                    color: Colors.blue,
                    child: Text('end1', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('end2', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('end2', style: TextStyle(fontSize: 15))),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                  Widget>[
                Container(
                    color: Colors.blue,
                    child: Text('spaceAround1', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('spaceAround2', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('spaceAround3', style: TextStyle(fontSize: 15))),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                  Widget>[
                Container(
                    color: Colors.blue,
                    child: Text('spaceBetween1', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('spaceBetween2', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('spaceBetween3', style: TextStyle(fontSize: 15))),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                  Widget>[
                Container(
                    color: Colors.blue,
                    child: Text('spaceEvenly1', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('spaceEvenly2', style: TextStyle(fontSize: 15))),
                Container(
                    color: Colors.blue,
                    child: Text('spaceEvenly3', style: TextStyle(fontSize: 15))),
              ]),
            ],
          ),
        ),
    );
  }
}
