import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import 'package:flutter/widgets.dart';
import 'main_page.dart';

/*
import 'pages/complex/text_demo.dart';
import 'pages/main_page.dart';
import 'pages/simple/custom_toolbar.dart';
import 'pages/simple/no_keyboard.dart';
import 'pages/simple/selectable_text.dart';
import 'pages/simple/widget_span.dart';
*/

/// Get route settings base on route name, auto generated by https://github.com/fluttercandies/ff_annotation_route
FFRouteSettings getRouteSettings({
  required String name,
  Map<String, dynamic>? arguments,
  PageBuilder? notFoundPageBuilder,
}) {
  final Map<String, dynamic> safeArguments =
      arguments ?? const <String, dynamic>{};
  switch (name) {
    case 'fluttercandies://mainpage':
      return FFRouteSettings(
        name: name,
        arguments: arguments,
        builder: () => MainPage(),
        routeName: 'MainPage',
      );
    default:
      return FFRouteSettings(
        name: FFRoute.notFoundName,
        routeName: FFRoute.notFoundRouteName,
        builder: notFoundPageBuilder ?? () => Container(),
      );
  }
}