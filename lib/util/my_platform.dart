import 'dart:io';
import 'package:flutter/foundation.dart';

// プラットフォーム判定クラス
class MyPlatform {
  // ブラウザ
  static bool get isWeb => kIsWeb;

  // Android
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  // iOS
  static bool get isIOS => !kIsWeb && Platform.isIOS;

  // モバイルアプリ
  static bool get isMobileApp =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}
