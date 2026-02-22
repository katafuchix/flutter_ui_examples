import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import '../util/ui_utils.dart';
import 'alignment_example_screen.dart';
import 'alignment_column_example_screen.dart';

class AlignmentMenuScreenResult {
  final String message;

  AlignmentMenuScreenResult(this.message);
}

class AlignmentMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AlignmentMenuScreenState();
  }
}

class _AlignmentMenuScreenState extends BaseState<AlignmentMenuScreen> {
  _AlignmentMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Alignment examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'alignment row example',
              subtitle: '',
              routePath:
                  "${RoutePath.alignment_menu}/${RoutePath.alignment_example}",
            ),
            buildListItem(
              context: context,
              title: 'alignment column example',
              subtitle: '',
              routePath:
                  "${RoutePath.alignment_menu}/${RoutePath.alignment_column_example}",
            ),
          ],
        ),
      ),
    );
  }
}
