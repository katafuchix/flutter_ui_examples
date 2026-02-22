import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/core/router.dart';
import 'package:go_router/go_router.dart';
import '../core/route_path.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import '../util/ui_utils.dart';
import 'datepicker_example_screen.dart';
import 'cupertino_datepicker_example_screen.dart';

class DatePickerMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DatePickerMenuScreenState();
  }
}

class _DatePickerMenuScreenState extends BaseState<DatePickerMenuScreen> {
  _DatePickerMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('DatePicker examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            buildListItem(
              context: context,
              title: 'datepicker example',
              subtitle: '',
              routePath:
                  "${RoutePath.date_picker_menu}/${RoutePath.date_picker_example}",
            ),
            buildListItem(
              context: context,
              title: 'cupertino datepicker example',
              subtitle: '',
              routePath:
                  "${RoutePath.date_picker_menu}/${RoutePath.cupertino_date_picker_example}",
            ),
          ],
        ),
      ),
    );
  }
}
