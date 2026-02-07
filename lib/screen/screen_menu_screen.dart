import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../base/base_stateful_widget.dart';

class ScreenMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenMenuScreenState();
  }
}

class _ScreenMenuScreenState extends BaseState<ScreenMenuScreen> {
  _ScreenMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Screen examples'),
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
                          'incomming call example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider()
                      ],
                    ),
                    onTap: () =>
                        context.push('/screen_menu/incoming_call_example'))),
            Container(
                margin: edgeInsets,
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'incomming call button example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider()
                      ],
                    ),
                    onTap: () => context
                        .push('/screen_menu/incoming_call_button_example'))),
          ],
        ),
      ),
    );
  }
}
