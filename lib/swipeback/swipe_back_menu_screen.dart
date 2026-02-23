import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/route_path.dart';
import '../base/base_stateful_widget.dart';
import 'swipe_back_handler.dart';

class SwipeBackScreenResult {
  final String message;

  SwipeBackScreenResult(this.message);
}

class SwipeBackMenuScreen extends BaseStatefulWidget {
  const SwipeBackMenuScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SwipeBackMenuScreenState();
  }
}

class _SwipeBackMenuScreenState extends BaseState<SwipeBackMenuScreen> {
  _SwipeBackMenuScreenState() : super();

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: const Text('Swipe Back examples'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: GestureDetector(
              // GestureDetector が Flutter のシステムジェスチャー（スワイプバックなど）をブロックしてしまうとき
              // GestureDetector を使っていない領域にも影響し、意図しないタッチを拾う可能性がある
              // ここは大丈夫なので使わない
              // behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) => handleSwipeUpdate(details),
              onHorizontalDragEnd: (details) =>
                  handleSwipeEnd(details, context),
              child: Center(
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
                                  'Swipe Back example',
                                ),
                                Text(
                                  ' ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Divider()
                              ],
                            ),
                            //onTap: () => context
                            //    .push('/swipebackMenu/swipebackExample'))),

                            onTap: () => context.push(
                                "${RoutePath.swipebackMenu}/${RoutePath.swipebackExample}"))),
                  ],
                ),
              )),
        ));
  }
}
