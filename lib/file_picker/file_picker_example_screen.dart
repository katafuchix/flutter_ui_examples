import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';

class FilePickerExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FilePickerExampleScreenState();
  }
}

class _FilePickerExampleScreenState extends State<FilePickerExampleScreen> {

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
            child: const Text('Picker'),
            onPressed: () {
              pickMultipleImages();
            },
          )
      ),
    );
  }

  Future<void> pickMultipleImages() async {
    // 複数の画像を選択
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,         // 画像ファイルのみを対象
      allowMultiple: true,           // 複数選択を許可
    );

    if (result != null) {
      // 選択されたファイルのパスを取得
      List<String> imagePaths = result.paths.map((path) => path!).toList();

      // 各画像パスを使用して処理を実行
      for (String path in imagePaths) {
        print("Selected image path: $path");
        // 画像を表示したり、アップロードしたりする処理
      }
    } else {
      // ユーザーがキャンセルした場合
      print("No images selected");
    }
  }
}
