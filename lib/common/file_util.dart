import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

// assets 内のファイルをFileに変換
Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');
  final _fs = path.split('/');
  final file_name = _fs[_fs.length-1];
  //print(fila_name);
  final file = File('${(await getApplicationDocumentsDirectory()).path}/$file_name');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}