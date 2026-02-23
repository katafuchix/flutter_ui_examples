import 'package:flutter/material.dart';

class OverlayTapExampleScreen extends StatefulWidget {
  const OverlayTapExampleScreen({super.key});

  @override
  OverlayTapExampleScreenState createState() => OverlayTapExampleScreenState();
}

class OverlayTapExampleScreenState extends State<OverlayTapExampleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(OverlayTapExampleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  //@override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  OverlayEntry? MenuOverlayEntry;
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GestureDetector(
        onTapDown: (details) {
          var position = details.globalPosition;
          //print(position);
          x = position.dx;
          y = position.dy;
          _showOverlay();
        },
        /*onLongPress: () { // 長押し利用時
          _showOverlay();
        },*/
        child: Container(
          color: Colors.transparent, // colorがないとタップを検出できない？
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {_showOverlay();},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }

  void _showOverlay() {
    MenuOverlayEntry = OverlayEntry(builder: (context) {
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
            left: x,
            top: y,
            child: Center(
              child: Text(
                "Hello, World!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      );
    });
    // オーバーレイを表示
    Overlay.of(context).insert(MenuOverlayEntry!);
  }

  void _closeOverlay() {
    // メニューを閉じる
    MenuOverlayEntry?.remove();
    MenuOverlayEntry = null;
  }
}
