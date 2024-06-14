import 'package:flutter/material.dart';

class DialogStackExampleScreen extends StatefulWidget {
  @override
  DialogStackExampleScreenState createState() => DialogStackExampleScreenState();
}

class DialogStackExampleScreenState extends State<DialogStackExampleScreen> {
  bool _isDialogVisible = false;

  void _toggleDialogVisibility() {
    setState(() {
      _isDialogVisible = !_isDialogVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Dialog Overlay examples'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),*/
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                title: Text('Flutter スタックウィジェット例'),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: _toggleDialogVisibility,
                    child: Text('ダイアログを表示'),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: _isDialogVisible,
            child: GestureDetector(
              onTap: _toggleDialogVisibility,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
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
                            onPressed: _toggleDialogVisibility,
                            child: Text('閉じる'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}