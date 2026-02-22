import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../util/ui_utils.dart';

class ListMenuScreen extends StatefulWidget {
  const ListMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ListMenuScreenState();
  }
}

class _ListMenuScreenState extends State<ListMenuScreen> {
  _ListMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('List Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'list expand example',
              subtitle: '',
              routePath:
                  "${RoutePath.list_menu}/${RoutePath.list_expand_example}",
            ),
            buildListItem(
              context: context,
              title: 'list refresh example',
              subtitle: '',
              routePath:
                  "${RoutePath.list_menu}/${RoutePath.list_refresh_example}",
            ),
          ],
        ),
      ),
    );
  }
}
