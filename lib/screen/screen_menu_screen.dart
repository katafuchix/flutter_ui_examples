import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import '../core/route_path.dart';
import '../util/ui_utils.dart';

class ScreenMenuScreen extends BaseStatefulWidget {
  const ScreenMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScreenMenuScreenState();
  }
}

class _ScreenMenuScreenState extends BaseState<ScreenMenuScreen> {
  _ScreenMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
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
            buildListItem(
              context: context,
              title: 'incomming call example',
              subtitle: '',
              routePath:
                  "${RoutePath.screenMenu}/${RoutePath.incomingCallExample}",
            ),
            buildListItem(
              context: context,
              title: 'incomming call button example',
              subtitle: '',
              routePath:
                  "${RoutePath.screenMenu}/${RoutePath.incomingCallButtonExample}",
            ),
          ],
        ),
      ),
    );
  }
}
