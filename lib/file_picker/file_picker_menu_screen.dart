import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import 'file_picker_example_screen.dart';
import 'file_picker_multi_example_screen.dart';

class FilePickerMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FilePickerMenuScreenState();
  }
}

class _FilePickerMenuScreenState extends BaseState<FilePickerMenuScreen> {
  _FilePickerMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top:20, bottom: 0, left: 20, right: 20);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('FilePicker Menu examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            Container(
                margin: edgeInsets,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'file picker example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return FilePickerExampleScreen();
                    }));
                  },
                )
            ),

            Container(
                margin: edgeInsets,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'file picker multi example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider()
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) {
                      return FilePickerMultiExampleScreen();
                    }));
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}