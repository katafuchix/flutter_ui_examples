import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../clipoval/clipoval_menu_screen.dart';
import '../database/database_menu_screen.dart';
import '../datepicker/datepicker_menu_screen.dart';
import '../file_picker/file_picker_example_screen.dart';
import '../file_picker/file_picker_menu_screen.dart';
import '../file_picker/file_picker_multi_example_screen.dart';
import '../indexstack/indexstack_menu_screen.dart';
import '../list/list_menu_screen.dart';
import '../main_page.dart';
import '../overlay/overlay_menu_screen.dart';
import '../screen/screen_menu_screen.dart';
import '../swipeback/swipe_back_example_screen.dart';
import '../swipeback/swipe_back_menu_screen.dart';
import '../dialog/dialog_menu_screen.dart';
import '../dialog/dialog_alert_example_screen.dart';
import '../dialog/dialog_overlay_example_screen.dart';
import '../dialog/dialog_overlay_custom_screen.dart';
import '../dialog/dialog_stack_example_screen.dart';
import '../video/video_menu_screen.dart';
import '../video/video_player_example_screen.dart';
import '../slide_menu/slide_menu_screen.dart';
import '../slide_menu/slide_menu_simple_example.dart';
import '../slide_menu/slide_menu_drawer_esample.dart';
import '../modal/modal_menu_screen.dart';
import '../modal/modal_simple_screen.dart';
import '../map/map_menu_screen.dart';
import '../map/map_example_screen.dart';
import '../bar/bar_menu_screen.dart';
import '../bar/app_bar_example_screen.dart';
import '../alignment/alignment_menu_screen.dart';
import '../alignment/alignment_example_screen.dart';
import '../alignment/alignment_column_example_screen.dart';
import '../shared/shared_menu_screen.dart';
import '../shared/shared_simple_example_screen.dart';
import '../shared/shared_user_example_screen.dart';
import '../tab/tab_menu_screen.dart';
import '../tab/tab_example_screen.dart';
import '../tab/tab_controller_example_screen.dart';
import '../tab/tab_library_example_screen.dart';
import '../tab/tab_indicator_example_screen.dart';

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
    // FilePicker
    GoRoute(
      path: '/filepicker_menu',
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: FilePickerMenuScreen(),
        );
      },
      // 子ルートをここに追加
      routes: [
        GoRoute(
          path: 'filepicker_example', // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: FilePickerExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: 'filepicker_multi_example', // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: FilePickerMultiExampleScreen(),
            );
          },
        ),
      ],
    ),

// MainPage(),
    GoRoute(
        path: "/home",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: MainPage(),
          );
        }),

// DialogMenuScreen(),
    GoRoute(
        path: "/dialog_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogMenuScreen(),
          );
        }),

// DialogAlertExampleScreen(),
    GoRoute(
        path: "/dialog_alert_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogAlertExampleScreen(),
          );
        }),

// DialogOverlayExampleScreen(),
    GoRoute(
        path: "/dialog_overlay_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogOverlayExampleScreen(),
          );
        }),

// DialogOverlayCustomScreen(),
    GoRoute(
        path: "/dialog_overlay_custom",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogOverlayCustomScreen(),
          );
        }),

// DialogStackExampleScreen(),
    GoRoute(
        path: "/dialog_stack_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogStackExampleScreen(),
          );
        }),

// VideoMenuScreen(),
    GoRoute(
        path: "/video_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: VideoMenuScreen(),
          );
        }),

// VideoPlayerExampleScreen(),
    GoRoute(
        path: "/video_player_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: VideoPlayerExampleScreen(),
          );
        }),

// SlideMenuScreen(),
    GoRoute(
        path: "/slide_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SlideMenuScreen(),
          );
        }),

// SlideMenuSimpleExampleScreen(),
    GoRoute(
        path: "/slide_menu_simple_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SlideMenuSimpleExampleScreen(),
          );
        }),

// SlideMenuDrawerExampleScreen(),
    GoRoute(
        path: "/slide_menu_drawer_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SlideMenuDrawerExampleScreen(),
          );
        }),

// ModalMenuScreen(),
    GoRoute(
        path: "/modal_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: ModalMenuScreen(),
          );
        }),

// ModalSimpleExampleScreen(),
    GoRoute(
        path: "/modal_simple_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: ModalSimpleExampleScreen(),
          );
        }),

// MapMenuScreen(),
    GoRoute(
        path: "/map_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: MapMenuScreen(),
          );
        }),

// MapExampleScreen(),
    GoRoute(
        path: "/map_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: MapExampleScreen(),
          );
        }),

// BarMenuScreen(),
    GoRoute(
        path: "/bar_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: BarMenuScreen(),
          );
        }),

// AppBarExampleScreen(),
    GoRoute(
        path: "/app_bar_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: AppBarExampleScreen(),
          );
        }),

// AlignmentMenuScreen(),
    GoRoute(
        path: "/alignment_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: AlignmentMenuScreen(),
          );
        }),

// AlignmentExampleScreen(),
    GoRoute(
        path: "/alignment_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: AlignmentExampleScreen(),
          );
        }),

// AlignmentColumnExampleScreen(),
    GoRoute(
        path: "/alignment_column_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: AlignmentColumnExampleScreen(),
          );
        }),

// SharedMenuScreen(),
    GoRoute(
        path: "/shared_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SharedMenuScreen(),
          );
        }),

// SharedSimpleExampleScreen(),
    GoRoute(
        path: "/shared_simple_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SharedSimpleExampleScreen(),
          );
        }),

// SharedUserExampleScreen(),
    GoRoute(
        path: "/shared_user_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SharedUserExampleScreen(),
          );
        }),

// TabMenuScreen(),
    GoRoute(
        path: "/tab_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: TabMenuScreen(),
          );
        }),

// TabExampleScreen(),
    GoRoute(
        path: "/tab_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: TabExampleScreen(),
          );
        }),

// TabControllerExampleScreen(),
    GoRoute(
        path: "/tab_controller_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: TabControllerExampleScreen(),
          );
        }),

// TabLibraryExampleScreen(),
    GoRoute(
        path: "/tab_library_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: TabLibraryExampleScreen(),
          );
        }),

// TabIndicatorExampleScreen(),
    GoRoute(
        path: "/tab_indicator_example",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: TabIndicatorExampleScreen(),
          );
        }),

    // DatePickerMenuScreen
    GoRoute(
        path: "/date_picker_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DatePickerMenuScreen(),
          );
        }),
    // IndexstackMenuScreen
    GoRoute(
        path: "/indexstack_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: IndexstackMenuScreen(),
          );
        }),
    // ScreenMenuScreen
    GoRoute(
        path: "/screen_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: ScreenMenuScreen(),
          );
        }),
    // ListMenuScreen
    GoRoute(
        path: "/list_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: ListMenuScreen(),
          );
        }),
    // ClipovalMenuScreen
    GoRoute(
        path: "/clipoval_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: ClipovalMenuScreen(),
          );
        }),
    // OverlayMenuScreen
    GoRoute(
        path: "/overlay_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: OverlayMenuScreen(),
          );
        }),
    // DatabaseMenuScreen
    GoRoute(
        path: "/database_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DatabaseMenuScreen(),
          );
        }),
    // DialogMenuScreen
    GoRoute(
        path: "/daialog_menu",
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogMenuScreen(),
          );
        }),
  ],
);
