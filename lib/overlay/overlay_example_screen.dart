import 'package:flutter/material.dart';


class OverlayExampleScreen extends StatefulWidget {
  @override
  _OverlayExampleScreenState createState() => _OverlayExampleScreenState();
}

class _OverlayExampleScreenState extends State<OverlayExampleScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(OverlayExampleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
  }

  final GlobalKey _actionKey = GlobalKey();
  OverlayEntry? _menuOverlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {_showOverlay();},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma make
    );
  }

  void _showOverlay() {
    _menuOverlayEntry = OverlayEntry(builder: (context) {
      return Stack(
        children: [
          // メニュー外をタップした時にもメニューを閉じれるように透明な背景を画面全体に表示
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeOverlay,
              child: Container(color: Colors.transparent),
            ),
          ),
          // メニューを表示するWidget
          Positioned(
            top: 200.0,
            right: 20.0,
            child:
              Material(
                child: Text('Floating widget in Overlay'),
              ),
            )
        ],
      );
    });
    // オーバーレイを表示
    Overlay.of(context).insert(_menuOverlayEntry!);
  }

  void _closeOverlay() {
    // メニューを閉じる
    _menuOverlayEntry?.remove();
    _menuOverlayEntry = null;
  }
}