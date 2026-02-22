import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import '../util/ui_utils.dart';
import 'map_example_screen.dart';

class MapMenuScreenResult {
  final String message;

  MapMenuScreenResult(this.message);
}

class MapMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapMenuScreenState();
  }
}

class _MapMenuScreenState extends BaseState<MapMenuScreen> {
  _MapMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Map examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'map example',
              subtitle: '',
              routePath: "${RoutePath.map_menu}/${RoutePath.map_example}",
            ),
          ],
        ),
      ),
    );
  }
}
