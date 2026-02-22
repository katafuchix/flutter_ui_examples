import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerMultiExampleScreen extends StatefulWidget {
  @override
  _FilePickerMultiExampleScreenState createState() =>
      _FilePickerMultiExampleScreenState();
}

class _FilePickerMultiExampleScreenState
    extends State<FilePickerMultiExampleScreen> {
  // デフォルトのファイルタイプを設定
  FileType _selectedFileType = FileType.any;

  // ドロップダウンメニューのアイテムリスト
  final List<DropdownMenuItem<FileType>> _fileTypeItems = [
    DropdownMenuItem(child: Text("Any"), value: FileType.any),
    DropdownMenuItem(child: Text("Image"), value: FileType.image),
    DropdownMenuItem(child: Text("Video"), value: FileType.video),
    DropdownMenuItem(child: Text("Audio"), value: FileType.audio),
    DropdownMenuItem(child: Text("Media"), value: FileType.media),
    DropdownMenuItem(child: Text("Custom (PDF)"), value: FileType.custom),
  ];

  // ファイル選択処理
  Future<void> _pickFiles() async {
    List<String>? allowedExtensions;

    // Custom の場合に拡張子を設定
    if (_selectedFileType == FileType.custom) {
      allowedExtensions = ['pdf'];
    }

    final result = await FilePicker.platform.pickFiles(
      type: _selectedFileType,
      allowMultiple: true,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      // 選択されたファイルのパスを取得
      List<String> filePaths = result.paths.map((path) => path!).toList();
      print("Selected files: $filePaths");
      // ここでファイルの処理を行います
    } else {
      // ユーザーがキャンセルした場合
      print("No files selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker Example"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // FileType 切り替え用のドロップダウンメニュー
            DropdownButton<FileType>(
              value: _selectedFileType,
              items: _fileTypeItems,
              onChanged: (FileType? newValue) {
                setState(() {
                  _selectedFileType = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text("Pick Files"),
            ),
          ],
        ),
      ),
    );
  }
}
