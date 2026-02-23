import 'package:flutter/material.dart';
import '../components/texts.dart';
import '../config/colors.dart';

class DialogOverlayCustomScreenResult {
  final String message;

  DialogOverlayCustomScreenResult(this.message);
}

class DialogOverlayCustomScreen extends StatefulWidget {
  const DialogOverlayCustomScreen({super.key});

  @override
  DialogOverlayCustomScreenState createState() =>
      DialogOverlayCustomScreenState();
}

class DialogOverlayCustomScreenState extends State<DialogOverlayCustomScreen> {
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
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.only(left: 4, top: 8, right: 4, bottom: 20),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          const Spacer(),
                          IconButton(
                              icon: Icon(Icons.close,
                                  color: MyColors().grey1, size: 16),
                              highlightColor: Colors.transparent,
                              // ハイライトカラーを透明に設定
                              splashColor: Colors.transparent,
                              onPressed: () {
                                _removeOverlayIfNeeded();
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        buildNormalBoldText("投稿が完了しました", maxLines: 1),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 8, bottom: 10),
                              child: TextButton(
                                style: ButtonStyle(
                                    //fixedSize: WidgetStateProperty.all(Size(MediaQuery.of(context).size.width, 46)),
                                    fixedSize:
                                        WidgetStateProperty.all(Size(300, 46)),
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            MyColors().button1Bg),
                                    shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(23.0),
                                            side: BorderSide(
                                                color: MyColors().button1Bg)))),
                                onPressed: () => {_removeOverlayIfNeeded()},
                                child: buildNormalBoldText("続けて投稿する",
                                    maxLines: 1, colors: TextColors.WHITE),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 8, bottom: 10),
                              child: TextButton(
                                style: ButtonStyle(
                                    fixedSize: WidgetStateProperty.all(Size(
                                        MediaQuery.of(context).size.width, 46)),
                                    shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(23.0),
                                            side: BorderSide(
                                                color: MyColors().grey2)))),
                                onPressed: () {
                                  _removeOverlayIfNeeded();
                                },
                                child: buildNormalBoldText("ルームへ戻る",
                                    maxLines: 1,
                                    colors: TextColors.SECONDARY_TEXT),
                              ),
                            )
                          ],
                        )),
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
