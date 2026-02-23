import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../base/base_stateful_widget.dart';
import '../util/ui_utils.dart';

class BarMenuScreenResult {
  final String message;

  BarMenuScreenResult(this.message);
}

class BarMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BarMenuScreenState();
  }
}

class _BarMenuScreenState extends BaseState<BarMenuScreen> {
  _BarMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Bar examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'AppBar example',
              subtitle: 'bar buttons',
              routePath: "${RoutePath.barMenu}/${RoutePath.appBarExample}",
            ),
          ],
        ),
      ),
    );
  }
}
