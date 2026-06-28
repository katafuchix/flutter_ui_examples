import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension AppNavigation on BuildContext {
  Future<T?> appPush<T>(String location, {Object? extra}) {
    _removeSnackBar();
    return push<T>(location, extra: extra);
  }

  void appGo(String location, {Object? extra}) {
    _removeSnackBar();
    go(location, extra: extra);
  }

  void _removeSnackBar() {
    try {
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
    } catch (_) {}
  }
}
