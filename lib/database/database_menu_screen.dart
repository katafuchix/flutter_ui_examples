import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import '../core/route_path.dart';
import '../util/ui_utils.dart';
import 'database_example_screen.dart';

class DatabaseMenuScreen extends BaseStatefulWidget {
  const DatabaseMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DatabaseMenuScreenState();
  }
}

class _DatabaseMenuScreenState extends BaseState<DatabaseMenuScreen> {
  _DatabaseMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('DataBase Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'database example',
              subtitle: '',
              routePath:
                  "${RoutePath.database_menu}/${RoutePath.database_example}",
            ),
            /*buildListItem(
              context: context,
              title: 'database user example',
              subtitle: '',
              routePath:
                  "${RoutePath.database_menu}/${RoutePath.database_shared_example}",
            ),*/
          ],
        ),
      ),
    );
  }
}
