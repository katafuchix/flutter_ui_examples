import 'package:flutter/material.dart';
import '../components/widget_circular_progress.dart';
import '../my_navigator.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  final ScreenArgs? args;
  //BaseStatefulWidget({this.args});
  BaseStatefulWidget({super.key, this.args});

  // TODO abstractにしたい abstractにすると全体的に修正が必要になるので、いったんダミー値を返すようにする
  String getArgsKey() {
    return 'DUMMY';
  }

  @protected
  T? getArgs<T>() {
    if (args == null) return null;
    return _parseArgs(args!);
  }

  T? _parseArgs<T>(ScreenArgs screenArgs) {
    final key = getArgsKey();
    if (key == 'DUMMY') throw UnimplementedError('getArgsKey()でargsをセットすること');
    return screenArgs.get(key) as T?;
  }
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T>
    with WidgetsBindingObserver {

  bool _showingProgress = false;

  @protected
  @mustCallSuper
  void onResume() {}

  @protected
  @mustCallSuper
  void onPaused() {}

  @protected
  @mustCallSuper
  void onInactive() {}

  @protected
  @mustCallSuper
  void onDetached() {}

  @protected
  @mustCallSuper
  void onBuildWidget() {}

  @mustCallSuper
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    WidgetsBinding.instance?.addPostFrameCallback((_) => onBuildWidget());
    super.initState();
  }

  @mustCallSuper
  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @mustCallSuper
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
      case AppLifecycleState.hidden:
        break;
        // TODO: Handle this case.
    }
  }

  @protected
  showProgress(BuildContext context) {
    _showingProgress = true;
    showCircularProgress(context);
  }

  @protected
  closeProgressIfNeed(BuildContext context) {
    if (_showingProgress) {
      _showingProgress = false;
      closeCircularProgress(context);
    }
  }
}
