import 'package:flutter/material.dart';
import '../core/route_path.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import '../util/ui_utils.dart';
import 'map_example_screen.dart';

class MapMenuScreenResult {
  final String message;

  MapMenuScreenResult(this.message);
}

class MapMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapMenuScreenState();
  }
}

class _MapMenuScreenState extends BaseState<MapMenuScreen> {
  _MapMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Map examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'map example',
              subtitle: '',
              routePath: RoutePath.map_example,
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'map example',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.map_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is MapExampleScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    }
                    ;
                  },
                ))
          ],
        ),
      ),
    );
  }
}
