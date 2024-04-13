import 'package:flutter/material.dart';
import '../my_navigator.dart';
import '../base/base_stateful_widget.dart';
import '../components/snack_bar.dart';
import '../app.dart';
import './modal_simple_screen.dart';

class ModalMenuScreenResult {
  final String message;
  ModalMenuScreenResult(this.message);
}

class ModalMenuScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ModalMenuScreenState();
  }
}

class _ModalMenuScreenState extends BaseState<ModalMenuScreen> {
  _ModalMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Modal examples'),
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
                        'modal simple',
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.modal_simple_example,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is ModalSimpleExampleScreenResult) {
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