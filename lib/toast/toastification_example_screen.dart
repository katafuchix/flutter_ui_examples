import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../base/base_stateful_widget.dart';
import 'package:toastification/toastification.dart';

class ToastificationExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToastificationExampleScreenState();
  }
}

class _ToastificationExampleScreenState
    extends BaseState<ToastificationExampleScreen> {
  _ToastificationExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toastification examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              child: const Text('toastification'),
              onPressed: () async {
                // トースト通知を表示
                toastification.show(
                  context: context,
                  title: Text('Hello, world!'),
                );
              },
            ),
            const SizedBox(height: 16),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
