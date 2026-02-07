import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/clipoval/clipoval_menu_screen.dart';
import 'package:go_router/go_router.dart';
import 'overlay_example_screen.dart';
import 'overlay_tap_example_screen.dart';

class OverlayMenuScreen extends StatefulWidget {
  const OverlayMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OverlayMenuScreenState();
  }
}

class _OverlayMenuScreenState extends State<OverlayMenuScreen> {
  _OverlayMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Overlay Menu examples'),
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
                          'overlay example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider()
                      ],
                    ),
                    onTap: () =>
                        context.push('/overlay_menu/overlay_example'))),
            Container(
                margin: edgeInsets,
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'overlay tap example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider()
                      ],
                    ),
                    onTap: () =>
                        context.push('/overlay_menu/overlay_tap_example')))
          ],
        ),
      ),
    );
  }
}
