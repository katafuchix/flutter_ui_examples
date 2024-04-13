import 'package:flutter/material.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import 'slide_menu_simple_example.dart';
import 'slide_menu_drawer_esample.dart';

class SlideMenuScreenResult {
  final String message;
  SlideMenuScreenResult(this.message);
}

class SlideMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SlideMenuScreenState();
  }
}

class _SlideMenuScreenState extends BaseState<SlideMenuScreen> {
  _SlideMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Video Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(2.0),
          children: [
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'slide menu simple',
                      ),
                      Text(
                        ' ',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.slide_menu_simple_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is SlideMenuSimpleExampleScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    };
                  },
                )
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'slide menu drawer',
                      ),
                      Text(
                        ' ',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.slide_menu_drawer_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is SlideMenuDrawerExampleScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    };
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}