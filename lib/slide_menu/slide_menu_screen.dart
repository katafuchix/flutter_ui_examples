import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../base/base_stateful_widget.dart';
import '../util/ui_utils.dart';

class SlideMenuScreenResult {
  final String message;

  SlideMenuScreenResult(this.message);
}

class SlideMenuScreen extends BaseStatefulWidget {
  const SlideMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SlideMenuScreenState();
  }
}

class _SlideMenuScreenState extends BaseState<SlideMenuScreen> {
  _SlideMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Slide Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'slide menu simple example',
              subtitle: '',
              routePath:
                  "${RoutePath.slide_menu}/${RoutePath.slide_simple_example}",
            ),
            buildListItem(
              context: context,
              title: 'slide menu drawer example',
              subtitle: '',
              routePath:
                  "${RoutePath.slide_menu}/${RoutePath.slide_drawer_example}",
            ),
          ],
        ),
      ),
    );
  }
}
