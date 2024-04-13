import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';

class ModalSimpleExampleScreenResult {
  final String message;
  ModalSimpleExampleScreenResult(this.message);
}

class ModalSimpleExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ModalSimpleExampleScreenState();
  }
}

class _ModalSimpleExampleScreenState extends BaseState<ModalSimpleExampleScreen> {
  _ModalSimpleExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Simple example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: ElevatedButton(
            child: Text('フルスクリーンダイアログを表示'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenDialogPage(),
                  fullscreenDialog: true, // true だとモーダル遷移になる
                ),
              );
            },
          )
      ),
    );
  }
}

class FullScreenDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Dialog Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: const Text('Full Screen Dialog Page'),
      ),
    );
  }
}