import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/list/list_refresh_example_screen.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import 'list_expand_example_screen.dart';

class ListMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListMenuScreenState();
  }
}

class _ListMenuScreenState extends BaseState<ListMenuScreen> {
  _ListMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('DataBase Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            Container(
                margin: edgeInsets,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'list expand example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      return ExpandableListView();
                    }));
                  },
                )),
            Container(
                margin: edgeInsets,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'list refresh example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      return ListRefreshExampleScreen();
                    }));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
