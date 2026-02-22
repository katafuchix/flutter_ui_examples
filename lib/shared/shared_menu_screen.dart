import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import '../util/ui_utils.dart';
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
    const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);
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
                  "${RoutePath.shared_menu}/${RoutePath.shared_simple_example}",
            ),
            buildListItem(
              context: context,
              title: 'shared user example',
              subtitle: '',
              routePath:
                  "${RoutePath.shared_menu}/${RoutePath.shared_user_example}",
            ),
          ],
        ),
      ),
    );
  }
}
