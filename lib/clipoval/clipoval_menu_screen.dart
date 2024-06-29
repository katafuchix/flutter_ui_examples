import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import 'clipoval_example_screen.dart';
import 'circleavatar_example_screen.dart';
import 'circleavatar_image_cache_example_screen.dart';
import 'network_image_example.dat.dart';

class ClipovalMenuScreenResult {
  final String message;
  ClipovalMenuScreenResult(this.message);
}

class ClipovalMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClipovalMenuScreenState();
  }
}

class _ClipovalMenuScreenState extends BaseState<ClipovalMenuScreen> {
  _ClipovalMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Clip Oval examples'),
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
                      Text(
                        'clip oval example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(),
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return ClipovalExampleScreen();
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
                      Text(
                        'circle avatar example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(),
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return CircleavatarExampleScreen();
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
                      Text(
                        'circle avatar image cache example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(),
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return CircleavatarImageCacheExampleScreen();
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
                      Text(
                        'network image example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(),
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return NetworkImageExampleScreen();
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