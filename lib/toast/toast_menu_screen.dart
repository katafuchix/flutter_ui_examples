import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../base/base_stateful_widget.dart';
import '../util/ui_utils.dart';

class ToastMenuScreen extends BaseStatefulWidget {
  const ToastMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ToastMenuScreenState();
  }
}

class _ToastMenuScreenState extends BaseState<ToastMenuScreen> {
  _ToastMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Tosat Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'toast example',
              subtitle: '',
              routePath: "${RoutePath.toastMenu}/${RoutePath.toastExample}",
            ),
            buildListItem(
              context: context,
              title: 'toastification example',
              subtitle: '',
              routePath:
                  "${RoutePath.toastMenu}/${RoutePath.toastificationExample}",
            ),
          ],
        ),
      ),
    );
  }
}
