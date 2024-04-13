import 'package:flutter/material.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import 'video_player_example_screen.dart';

class VideoMenuScreenResult {
  final String message;
  VideoMenuScreenResult(this.message);
}

class VideoMenuScreen extends BaseStatefulWidget {
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
          padding: EdgeInsets.all(2.0),
          children: [
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'video player',
                      ),
                      Text(
                        ' ',
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.video_player_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is VideoPlayerExampleScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    };
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}