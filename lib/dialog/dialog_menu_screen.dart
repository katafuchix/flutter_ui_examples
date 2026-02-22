import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import '../util/ui_utils.dart';
import 'dialog_alert_example_screen.dart';
import 'dialog_overlay_example_screen.dart';
import 'dialog_overlay_custom_screen.dart';

class DialogMenuScreenResult {
  final String message;

  DialogMenuScreenResult(this.message);
}

class DialogMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogMenuScreenState();
  }
}

class _DialogMenuScreenState extends BaseState<DialogMenuScreen> {
  _DialogMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Alert Dialog examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'dialog alert',
              subtitle: '',
              routePath: Routes.dialog_alert_example,
            ),
            buildListItem(
              context: context,
              title: 'dialog overlay',
              subtitle: '',
              routePath: Routes.dialog_overlay_example,
            ),
            buildListItem(
              context: context,
              title: 'dialog overlay custom',
              subtitle: '',
              routePath: Routes.dialog_overlay_custom,
            ),
            buildListItem(
              context: context,
              title: 'dialog stack custom',
              subtitle: '',
              routePath: Routes.dialog_stack_example,
            ),
          ],
        ),
      ),
    );
  }
}
