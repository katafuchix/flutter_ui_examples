import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import '../core/route_path.dart';
import '../util/ui_utils.dart';

class IndexstackMenuScreen extends BaseStatefulWidget {
  const IndexstackMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _IndexstackMenuScreenState();
  }
}

class _IndexstackMenuScreenState extends BaseState<IndexstackMenuScreen> {
  _IndexstackMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Indexstack examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'indexstack example',
              subtitle: '',
              routePath:
                  "${RoutePath.indexstackMenu}/${RoutePath.indexstackExample}",
            ),
          ],
        ),
      ),
    );
  }
}
