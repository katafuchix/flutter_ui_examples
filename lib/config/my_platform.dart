import 'dart:io';

import 'package:flutter/foundation.dart';

class MyPlatform {
  static bool get isWeb => kIsWeb;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isMobileApp =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}

// class MyPlatform {
//   static bool get isWeb => kIsWeb;
//   static bool get isAndroid => !kIsWeb;
//   static bool get isIOS => !kIsWeb;
//   static bool get isMobileApp =>
//       !kIsWeb && (Platform.isAndroid || Platform.isIOS);
// }
