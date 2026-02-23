import 'package:flutter/material.dart';

import '../core/route_path.dart';
import '../util/ui_utils.dart';

class OverlayMenuScreen extends StatefulWidget {
  const OverlayMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OverlayMenuScreenState();
  }
}

class _OverlayMenuScreenState extends State<OverlayMenuScreen> {
  _OverlayMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Overlay Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'overlay example',
              subtitle: '',
              routePath: "${RoutePath.overlayMenu}/${RoutePath.overlayExample}",
            ),
            buildListItem(
              context: context,
              title: 'overlay tap example',
              subtitle: '',
              routePath:
                  "${RoutePath.overlayMenu}/${RoutePath.overlayTapExample}",
            ),
          ],
        ),
      ),
    );
  }
}
