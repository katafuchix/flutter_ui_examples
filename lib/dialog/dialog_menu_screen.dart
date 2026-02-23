import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import '../core/route_path.dart';
import '../util/ui_utils.dart';

class DialogMenuScreenResult {
  final String message;

  DialogMenuScreenResult(this.message);
}

class DialogMenuScreen extends BaseStatefulWidget {
  const DialogMenuScreen({super.key});

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
              routePath:
                  "${RoutePath.dialogMenu}/${RoutePath.dialogAlertExample}",
            ),
            buildListItem(
              context: context,
              title: 'dialog overlay',
              subtitle: '',
              routePath:
                  "${RoutePath.dialogMenu}/${RoutePath.dialogOverlayExample}",
            ),
            buildListItem(
              context: context,
              title: 'dialog overlay custom',
              subtitle: '',
              routePath:
                  "${RoutePath.dialogMenu}/${RoutePath.dialogOverlayCustom}",
            ),
            buildListItem(
              context: context,
              title: 'dialog stack custom',
              subtitle: '',
              routePath:
                  "${RoutePath.dialogMenu}/${RoutePath.dialogStackExample}",
            ),
          ],
        ),
      ),
    );
  }
}
