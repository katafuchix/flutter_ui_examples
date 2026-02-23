import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../base/base_stateful_widget.dart';
import '../util/ui_utils.dart';

class ModalMenuScreenResult {
  final String message;

  ModalMenuScreenResult(this.message);
}

class ModalMenuScreen extends BaseStatefulWidget {
  const ModalMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ModalMenuScreenState();
  }
}

class _ModalMenuScreenState extends BaseState<ModalMenuScreen> {
  _ModalMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Modal examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'modal simple example',
              subtitle: '',
              routePath:
                  "${RoutePath.modalMenu}/${RoutePath.modalSimpleExample}",
            ),
          ],
        ),
      ),
    );
  }
}
