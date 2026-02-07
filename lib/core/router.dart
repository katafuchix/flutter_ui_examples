import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../main_page.dart';
import '../swipeback/swipe_back_example_screen.dart';
import '../swipeback/swipe_back_menu_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  observers: [FlutterSmartDialog.observer],
  routes: [
    // メインの検索画面
    GoRoute(
      path: '/',
      builder: (context, state) => MainPage(),
    ),
    // SwipeBack
    GoRoute(
      path: '/swipeback_menu',
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: SwipeBackMenuScreen(),
        );
      },
      // 子ルートをここに追加
      routes: [
        GoRoute(
          path: 'swipeback_example', // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: SwipeBackExampleScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
