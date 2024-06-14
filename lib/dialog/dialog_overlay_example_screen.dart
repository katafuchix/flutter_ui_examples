import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import '../components/texts.dart';
import '../config/colors.dart';

class DialogOverlayExampleScreenResult {
  final String message;
  DialogOverlayExampleScreenResult(this.message);
}

class DialogOverlayExampleScreen extends StatefulWidget {
  @override
  DialogOverlayExampleScreenState createState() => DialogOverlayExampleScreenState();
}

class DialogOverlayExampleScreenState extends State<DialogOverlayExampleScreen> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初期化時にオーバーレイを削除しておく
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _removeOverlayIfNeeded();
    });
  }

  @override
  void dispose() {
    _removeOverlayIfNeeded();
    super.dispose();
  }

  void _removeOverlayIfNeeded() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  void _showOverlay(BuildContext context) {
    _removeOverlayIfNeeded(); // オーバーレイを表示する前に既存のオーバーレイを削除する
    _overlayEntry = _createOverlayEntry(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _removeOverlayIfNeeded();
              },
              child: Container(
                color: Colors.black.withOpacity(0.5), // 背景を半透明の黒に設定
              ),
            ),
          ),
          Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('カスタムダイアログのタイトル'),
                    SizedBox(height: 10),
                    Text('これはカスタムダイアログの内容です。'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _removeOverlayIfNeeded();
                      },
                      child: Text('閉じる'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Dialog Overlay examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              _showOverlay(context);
            },
            child: Text('カスタムダイアログを表示'),
          ),
      ),
    );
  }

}