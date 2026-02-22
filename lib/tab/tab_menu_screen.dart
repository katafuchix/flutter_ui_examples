import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import '../util/ui_utils.dart';
import 'tab_example_screen.dart';

class TabMenuScreenResult {
  final String message;

  TabMenuScreenResult(this.message);
}

class TabMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabMenuScreenState();
  }
}

class _TabMenuScreenState extends BaseState<TabMenuScreen> {
  _TabMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Tab Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'tab example',
              subtitle: 'DefaultTabController',
              routePath: "${RoutePath.tab_menu}/${RoutePath.tab_example}",
            ),
            buildListItem(
              context: context,
              title: 'tab controller example',
              subtitle: 'TabController',
              routePath:
                  "${RoutePath.tab_menu}/${RoutePath.tab_controller_example}",
            ),
            buildListItem(
              context: context,
              title: 'tab library example',
              subtitle: 'Tab Custom',
              routePath:
                  "${RoutePath.tab_menu}/${RoutePath.tab_library_example}",
            ),
            buildListItem(
              context: context,
              title: 'tab indicator example',
              subtitle: 'Tab Custom Indicator',
              routePath:
                  "${RoutePath.tab_menu}/${RoutePath.tab_indicator_example}",
            ),
          ],
        ),
      ),
    );
  }
}
