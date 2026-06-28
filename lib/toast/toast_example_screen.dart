import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../base/base_stateful_widget.dart';

class ToastExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToastExampleScreenState();
  }
}

class _ToastExampleScreenState extends BaseState<ToastExampleScreen> {
  _ToastExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              child: const Text('Center Short Toast'),
              onPressed: () async {
                Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Simple Toast'),
              onPressed: () async {
                // Toast表示
                Fluttertoast.showToast(msg: "完了しました");
              },
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              child: const Text('Show Toast'),
              onPressed: () async {
                // Toast表示
                Fluttertoast.showToast(
                  msg: "This is a toast message!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16.0,
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
