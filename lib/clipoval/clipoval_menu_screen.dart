import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'clip oval example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider(),
                      ],
                    ),
                    onTap: () =>
                        context.push('/clipoval_menu/clip_oval_example'))),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'circle avatar example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider(),
                      ],
                    ),
                    onTap: () =>
                        context.push('/clipoval_menu/circle_avatar_example'))),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'circle avatar image cache example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider(),
                      ],
                    ),
                    onTap: () => context.push(
                        '/clipoval_menu/circle_avatar_image_cache_example'))),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'network image example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider(),
                      ],
                    ),
                    onTap: () =>
                        context.push('/clipoval_menu/network_image_example'))),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'network image cache example',
                        ),
                        Text(
                          ' ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Divider(),
                      ],
                    ),
                    onTap: () =>
                        context.push('/clipoval_menu/image_cache_example'))),
          ],
        ),
      ),
    );
  }
}
