import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../base/base_stateful_widget.dart';
import '../util/ui_utils.dart';

class SharedMenuScreenResult {
  final String message;

  SharedMenuScreenResult(this.message);
}

class SharedMenuScreen extends BaseStatefulWidget {
  const SharedMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SharedMenuScreenState();
  }
}

class _SharedMenuScreenState extends BaseState<SharedMenuScreen> {
  _SharedMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
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
            buildListItem(
              context: context,
              title: 'sharedpreference menu simple',
              subtitle: '',
              routePath:
                  "${RoutePath.sharedMenu}/${RoutePath.sharedSimpleExample}",
            ),
            buildListItem(
              context: context,
              title: 'shared user example',
              subtitle: '',
              routePath:
                  "${RoutePath.sharedMenu}/${RoutePath.sharedUserExample}",
            ),
          ],
        ),
      ),
    );
  }
}
