import 'dart:ui';

import 'package:flutter/material.dart';

// 参考 : https://saruwakakun.com/en/material-color

class _MyColors {
  static const Color white1 = Color(0xFFFFFFFF);

  static const Color black1 = Color(0xFF000000);
  static const Color black2 = Color(0xFF212121);

  static const Color grey1 = Color(0xFF757575);
  static const Color grey2 = Color(0xFFBDBDBD);
  static const Color grey3 = Color(0xFFF5F5F5);

  static const Color brown1 = Color(0xFF795548);
  static const Color brown2 = Color(0xFFD7CCC8);
  static const Color brown3 = Color(0xFF5D4037);

  static const Color pink1 = Color(0xFFE91E63);
  static const Color pink2 = Color(0xFFF8BBD0);
  static const Color pink3 = Color(0xFFC2185B);
  static const Color pink4 = Color(0xFFFF4081);

  static const Color red1 = Color(0xFFE53935);
  static const Color red2 = Color(0xFFF44336);

  static const Color orange1 = Color(0xFFFF5722);

  static const Color green1 = Color(0xFF8BC34A);
  static const Color green2 = Color(0xFFDCEDC8);
  static const Color green3 = Color(0xFF689F38);

  static const Color blue1 = Color(0xFF03A9F4);

  static const Color button1 = Color(0xFFEA6C7F);
}

AppColors getAppColors() {
  return MyColors();
}

abstract class AppColors {
  Color get primary;
  Color get primaryLight;
  Color get primaryDark;
  Color get accent;
  Color get primaryText;
  Color get secondaryText;
  Color get textOrIcons;
  Color get divider;
  Color get primaryBg;
  Color get secondaryBg;
  Color get button1Bg;
  Color get button2Bg;
  Color get white1;
  Color get grey1;
  Color get grey2;
  Color get grey3;
}

// https://www.materialpalette.com/light-green/deep-orange
class MyColors extends AppColors {
  @override
  Color get primary => _MyColors.green1;

  @override
  Color get primaryLight => _MyColors.green2;

  @override
  Color get primaryDark => _MyColors.green3;

  @override
  Color get accent => _MyColors.orange1;

  @override
  Color get primaryText => _MyColors.black2;

  @override
  Color get secondaryText => _MyColors.grey1;

  @override
  Color get textOrIcons => _MyColors.black2;

  @override
  Color get divider => _MyColors.grey2;

  @override
  Color get primaryBg => Colors.grey.shade200;

  @override
  Color get secondaryBg => Colors.white;

  @override
  Color get button1Bg => _MyColors.button1;

  @override
  Color get button2Bg => Colors.white;

  @override
  Color get white1 => _MyColors.white1;

  @override
  Color get grey1 => _MyColors.grey1;

  @override
  Color get grey2 => _MyColors.grey2;

  @override
  Color get grey3 => _MyColors.grey3;
}
