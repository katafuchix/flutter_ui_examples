import 'package:flutter/material.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import 'shared_simple_example_screen.dart';
import 'shared_user_example_screen.dart';

class SharedMenuScreenResult {
  final String message;
  SharedMenuScreenResult(this.message);
}

class SharedMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedMenuScreenState();
  }
}

class _SharedMenuScreenState extends BaseState<SharedMenuScreen> {
  _SharedMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top:20, bottom: 0, left: 20, right: 20);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('SharedPreference Menu examples'),
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
                        'sharedpreference menu simple',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.shared_simple_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is SharedSimpleExampleScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    };
                  },
                )
            ),
            Container(
                margin: edgeInsets,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'shared user example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.shared_user_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is SharedUserExampleScreenResult) {
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