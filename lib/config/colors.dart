import 'dart:ui';

import 'package:flutter/material.dart';

// 参考 : https://saruwakakun.com/en/material-color

class _MyColors {
  static const Color white1 = Color(0xFFFFFFFF);

  static const Color black1 = Color(0xFF000000);
  static const Color black2 = Color(0xFF212121);

  static const Color grey1 = Color(0xFF757575);
  static const Color grey2 = Color(0xFFBDBDBD);

  static const Color brown1 = Color(0xFF795548);
  static const Color brown2 = Color(0xFFD7CCC8);
  static const Color brown3 = Color(0xFF5D4037);

  static const Color pink1 = Color(0xFFE91E63);
  static const Color pink2 = Color(0xFFF8BBD0);
  static const Color pink3 = Color(0xFFC2185B);
  static const Color pink4 = Color(0xFFFF4081);

  static const Color orange1 = Color(0xFFFF5722);

  static const Color green1 = Color(0xFF8BC34A);
  static const Color green2 = Color(0xFFDCEDC8);
  static const Color green3 = Color(0xFF689F38);

  static const Color blue1 = Color(0xFF03A9F4);
}

AppColors getAppColors() {
  return MaleColors();
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
}

// https://www.materialpalette.com/light-green/deep-orange
class FemaleColors extends AppColors {
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
}

// https://www.materialpalette.com/light-green/deep-orange
class MaleColors extends AppColors {
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
}
