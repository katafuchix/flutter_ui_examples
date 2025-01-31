import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/swipeback/swipe_back_handler.dart';
import '../base/base_stateful_widget.dart';

class SwipeBackExampleScreenResult {
  final String message;

  SwipeBackExampleScreenResult(this.message);
}

class SwipeBackExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwipeBackExampleScreenState();
  }
}

class _SwipeBackExampleScreenState extends BaseState<SwipeBackExampleScreen> {
  _SwipeBackExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;

          Navigator.pop(context);
        },
        child: Scaffold(
            //endDrawer: NavDrawer(),
            appBar: AppBar(
              title: const Text('Swipe Back examples'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: GestureDetector(
                //GestureDetector が Flutter のシステムジェスチャー（スワイプバックなど）をブロックしてしまうとき
                behavior: HitTestBehavior.opaque,
                onHorizontalDragUpdate: (details) => handleSwipeUpdate(details),
                onHorizontalDragEnd: (details) =>
                    handleSwipeEnd(details, context),
                child: Center(
                  child: const Text('Example'),
                ))));
  }
}
