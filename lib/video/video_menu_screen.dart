import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../base/base_stateful_widget.dart';
import '../util/ui_utils.dart';

class VideoMenuScreenResult {
  final String message;

  VideoMenuScreenResult(this.message);
}

class VideoMenuScreen extends BaseStatefulWidget {
  const VideoMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VideoMenuScreenState();
  }
}

class _VideoMenuScreenState extends BaseState<VideoMenuScreen> {
  _VideoMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Video Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'video player',
              subtitle: '',
              routePath:
                  "${RoutePath.videoMenu}/${RoutePath.videoPlayerExample}",
            ),
          ],
        ),
      ),
    );
  }
}
