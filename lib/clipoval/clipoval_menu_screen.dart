import 'package:flutter/material.dart';

import '../core/route_path.dart';
import '../util/ui_utils.dart';

class ClipovalMenuScreen extends StatefulWidget {
  const ClipovalMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ClipovalMenuScreenState();
  }
}

class _ClipovalMenuScreenState extends State<ClipovalMenuScreen> {
  _ClipovalMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Clip Oval examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'clip oval example',
              subtitle: '',
              routePath:
                  "${RoutePath.clipovalMenu}/${RoutePath.clipOvalExample}",
            ),
            buildListItem(
              context: context,
              title: 'circle avatar example',
              subtitle: '',
              routePath:
                  "${RoutePath.clipovalMenu}/${RoutePath.circleAvatarExample}",
            ),
            buildListItem(
              context: context,
              title: 'circle avatar image cache example',
              subtitle: '',
              routePath:
                  "${RoutePath.clipovalMenu}/${RoutePath.circleAvatarImageCacheExample}",
            ),
            buildListItem(
              context: context,
              title: 'network image example',
              subtitle: '',
              routePath:
                  "${RoutePath.clipovalMenu}/${RoutePath.networkImageExample}",
            ),
            buildListItem(
              context: context,
              title: 'network image cache example',
              subtitle: '',
              routePath:
                  "${RoutePath.clipovalMenu}/${RoutePath.imageCacheExample}",
            ),
          ],
        ),
      ),
    );
  }
}
