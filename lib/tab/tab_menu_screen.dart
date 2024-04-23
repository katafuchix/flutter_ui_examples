import 'package:flutter/material.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import 'tab_example_screen.dart';
import 'tab_controller_example_screen.dart';

class TabMenuScreenResult {
  final String message;
  TabMenuScreenResult(this.message);
}

class TabMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabMenuScreenState();
  }
}

class _TabMenuScreenState extends BaseState<TabMenuScreen> {
  _TabMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Tab Menu examples'),
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
                        'tab example',
                      ),
                      Text(
                        'DefaultTabController',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.tab_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is TabExampleScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    };
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
                        'tab controller example',
                      ),
                      Text(
                        'TabController',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.tab_controller_example,
                        pageOpenType: PageOpenType.SLIDE);
                    //if (result is TabControllerExampleScreenResult) {
                    //  showInfoSnackBar(context, text: result.message);
                    //};
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}