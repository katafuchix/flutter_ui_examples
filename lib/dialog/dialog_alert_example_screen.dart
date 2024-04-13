import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';
import '../components/texts.dart';
import '../config/colors.dart';

class DialogAlertExampleScreenResult {
  final String message;
  DialogAlertExampleScreenResult(this.message);
}

class DialogAlertExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogAlertExampleScreenState();
  }
}

class _DialogAlertExampleScreenState extends BaseState<DialogAlertExampleScreen> {
  _DialogAlertExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Dialog examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: ElevatedButton(
                    child: const Text('アラートダイアログを表示'),
                    onPressed: () {
                      showPostDoneDialog(context);
                    },
                  )
      ),
    );
  }

  // 投稿完了ダイアログ
  showPostDoneDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)
        {
          return AlertDialog(
            //backgroundColor: Colors.white, //MyColors().white1,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 0.0,
            ),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 220,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                      child:
                      Row(children: [
                        const Spacer(),
                        IconButton(icon:Icon(Icons.close, color:MyColors().grey1, size: 16),
                            onPressed: () =>  {}),
                      ],
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Row(children: [
                      const Spacer(),
                        buildNormalBoldText("投稿が完了しました", maxLines: 1),
                      const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                        padding: const EdgeInsets.all(2.0),
                        child:
                        Column(
                          children: [
                            Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                              child:
                              TextButton(
                                  child: buildNormalBoldText("続けて投稿する", maxLines: 1, colors: TextColors.WHITE),
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 46)),
                                      backgroundColor: MaterialStateProperty.all<Color>(MyColors().button1Bg),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(23.0),
                                              side: BorderSide(color: MyColors().button1Bg)
                                          )
                                      )
                                  ),
                                  onPressed: () => {
                                    Navigator.pop(context), // ピッカーを閉じる
                                  }),
                            ),

                            Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 0),
                              child:
                              TextButton(
                                  child: buildNormalBoldText("ルームへ戻る", maxLines: 1, colors: TextColors.SECONDARY_TEXT),
                                  style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 46)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(23.0),
                                              side: BorderSide(color: MyColors().grey2)
                                          )
                                      )
                                  ),
                                  onPressed: () => {
                                    Navigator.pop(context), // ピッカーを閉じる
                                  }),
                            )
                          ],
                        )

                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}