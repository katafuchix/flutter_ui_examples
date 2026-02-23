import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../clipoval/circleavatar_example_screen.dart';
import '../clipoval/circleavatar_image_cache_example_screen.dart';
import '../clipoval/clipoval_example_screen.dart';
import '../clipoval/clipoval_menu_screen.dart';
import '../clipoval/image_cache_example_screen.dart';
import '../clipoval/network_image_example.dat.dart';
import '../database/database_example_screen.dart';
import '../database/database_menu_screen.dart';
import '../datepicker/cupertino_datepicker_example_screen.dart';
import '../datepicker/datepicker_example_screen.dart';
import '../datepicker/datepicker_menu_screen.dart';
import '../file_picker/file_picker_example_screen.dart';
import '../file_picker/file_picker_menu_screen.dart';
import '../file_picker/file_picker_multi_example_screen.dart';
import '../indexstack/indexstack_example_screen.dart';
import '../indexstack/indexstack_menu_screen.dart';
import '../list/list_expand_example_screen.dart';
import '../list/list_menu_screen.dart';
import '../list/list_refresh_example_screen.dart';
import '../main_page.dart';
import '../overlay/overlay_example_screen.dart';
import '../overlay/overlay_menu_screen.dart';
import '../overlay/overlay_tap_example_screen.dart';
import '../screen/incomming_call_button_example_screen.dart';
import '../screen/incomming_call_example_screen.dart';
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
import 'route_path.dart';

final router = GoRouter(
  initialLocation: RoutePath.init,
  observers: [FlutterSmartDialog.observer, FlutterSmartDialog.observer],
  routes: [
    // メインの検索画面
    GoRoute(
      path: RoutePath.init,
      builder: (context, state) => MainPage(),
    ),
    // SwipeBack
    GoRoute(
      path: RoutePath.swipebackMenu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: SwipeBackMenuScreen(),
        );
      },
      // 子ルートをここに追加
      routes: [
        GoRoute(
          path: RoutePath.swipebackExample, // 注意：先頭の '/' は不要です
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
      path: RoutePath.filepickerMenu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: FilePickerMenuScreen(),
        );
      },
      // 子ルートをここに追加
      routes: [
        GoRoute(
          path: RoutePath.filepickerExample, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: FilePickerExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.filepickerMultiExample, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: FilePickerMultiExampleScreen(),
            );
          },
        ),
      ],
    ),

    // DialogMenuScreen(),
    GoRoute(
        path: RoutePath.dialogMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogMenuScreen(),
          );
        },
        routes: [
          // DialogAlertExampleScreen(),
          GoRoute(
              name: RoutePath.dialogAlertExample,
              path: RoutePath.dialogAlertExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: DialogAlertExampleScreen(),
                );
              }),

          // DialogOverlayExampleScreen(),
          GoRoute(
              name: RoutePath.dialogOverlayExample,
              path: RoutePath.dialogOverlayExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: DialogOverlayExampleScreen(),
                );
              }),

          // DialogOverlayCustomScreen(),
          GoRoute(
              name: RoutePath.dialogOverlayCustom,
              path: RoutePath.dialogOverlayCustom,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: DialogOverlayCustomScreen(),
                );
              }),

          // DialogStackExampleScreen(),
          GoRoute(
              name: RoutePath.dialogStackExample,
              path: RoutePath.dialogStackExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: DialogStackExampleScreen(),
                );
              }),
        ]),

    // VideoMenuScreen(),
    GoRoute(
        path: RoutePath.videoMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: VideoMenuScreen(),
          );
        },
        routes: [
          GoRoute(
              name: RoutePath.videoPlayerExample,
              path: RoutePath.videoPlayerExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: VideoPlayerExampleScreen(),
                );
              }),
        ]),
    // SlideMenuScreen(),
    GoRoute(
        path: RoutePath.slideMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SlideMenuScreen(),
          );
        },
        routes: [
          // SlideMenuSimpleExampleScreen(),
          GoRoute(
              name: RoutePath.slideSimpleExample,
              path: RoutePath.slideSimpleExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SlideMenuSimpleExampleScreen(),
                );
              }),
          // SlideMenuDrawerExampleScreen(),
          GoRoute(
              name: RoutePath.slideDrawerExample,
              path: RoutePath.slideDrawerExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SlideMenuDrawerExampleScreen(),
                );
              }),
        ]),

// ModalMenuScreen(),
    GoRoute(
        path: RoutePath.modalMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: ModalMenuScreen(),
          );
        },
        routes: [
          // ModalSimpleExampleScreen(),
          GoRoute(
              name: RoutePath.modalSimpleExample,
              path: RoutePath.modalSimpleExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: ModalSimpleExampleScreen(),
                );
              }),
        ]),

    // MapMenuScreen(),
    GoRoute(
        path: RoutePath.mapMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: MapMenuScreen(),
          );
        },
        routes: [
          // MapExampleScreen(),
          GoRoute(
              path: RoutePath.mapExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: MapExampleScreen(),
                );
              }),
        ]),

    // BarMenuScreen(),
    GoRoute(
        path: RoutePath.barMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: BarMenuScreen(),
          );
        },
        routes: [
          // AppBarExampleScreen(),
          GoRoute(
              path: RoutePath.appBarExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: AppBarExampleScreen(),
                );
              }),
        ]),

    // AlignmentMenuScreen(),
    GoRoute(
        path: RoutePath.alignmentMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: AlignmentMenuScreen(),
          );
        },
        routes: [
          // AlignmentExampleScreen(),
          GoRoute(
              path: RoutePath.alignmentExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: AlignmentExampleScreen(),
                );
              }),
          // AlignmentColumnExampleScreen(),
          GoRoute(
              path: RoutePath.alignmentColumnExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: AlignmentColumnExampleScreen(),
                );
              }),
        ]),

    // SharedMenuScreen(),
    GoRoute(
        path: RoutePath.sharedMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SharedMenuScreen(),
          );
        },
        routes: [
          // SharedSimpleExampleScreen(),
          GoRoute(
              path: RoutePath.sharedSimpleExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SharedSimpleExampleScreen(),
                );
              }),
          // SharedUserExampleScreen(),
          GoRoute(
              path: RoutePath.sharedUserExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SharedUserExampleScreen(),
                );
              }),
        ]),

    // TabMenuScreen(),
    GoRoute(
        path: RoutePath.tabMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: TabMenuScreen(),
          );
        },
        routes: [
          // TabExampleScreen(),
          GoRoute(
              path: RoutePath.tabExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabExampleScreen(),
                );
              }),

          // TabControllerExampleScreen(),
          GoRoute(
              path: RoutePath.tabControllerExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabControllerExampleScreen(),
                );
              }),

          // TabLibraryExampleScreen(),
          GoRoute(
              path: RoutePath.tabLibraryExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabLibraryExampleScreen(),
                );
              }),

          // TabIndicatorExampleScreen(),
          GoRoute(
              path: RoutePath.tabIndicatorExample,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabIndicatorExampleScreen(),
                );
              }),
        ]),

    // DatePickerMenuScreen
    GoRoute(
      path: RoutePath.datePickerMenu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: DatePickerMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.datePickerExample, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: DatePickerExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.cupertinoDatePickerExample, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: CupertinoDatePickerExampleScreen(),
            );
          },
        ),
      ],
    ),
    // IndexstackMenuScreen
    GoRoute(
        path: RoutePath.indexstackMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: IndexstackMenuScreen(),
          );
        },
        routes: [
          GoRoute(
            path: RoutePath.indexstackExample, // 注意：先頭の '/' は不要です
            //path: '/indexstackExample',
            pageBuilder: (context, state) {
              return CupertinoPage(
                key: state.pageKey,
                child: IndexstackExampleScreen(),
              );
            },
          ),
        ]),

    // ScreenMenuScreen
    GoRoute(
      path: RoutePath.screenMenu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: ScreenMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.incomingCallExample, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: IncomingCallExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.incomingCallButtonExample, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: IncomingCallButtonExampleScreen(),
            );
          },
        ),
      ],
    ),
    // ListMenuScreen
    GoRoute(
      path: RoutePath.listMenu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: ListMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.listExpandExample,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: ExpandableListView(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.listRefreshExample,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: ListRefreshExampleScreen(),
            );
          },
        ),
      ],
    ),
    // ClipovalMenuScreen
    GoRoute(
      path: RoutePath.clipovalMenu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: ClipovalMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.clipOvalExample,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: ClipovalExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.circleAvatarExample,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: CircleavatarExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.circleAvatarImageCacheExample,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: CircleavatarImageCacheExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.networkImageExample,
          pageBuilder: (context, state) {
            return CupertinoPage(
                key: state.pageKey, child: NetworkImageExampleScreen());
          },
        ),
        GoRoute(
          path: RoutePath.imageCacheExample,
          pageBuilder: (context, state) {
            return CupertinoPage(
                key: state.pageKey, child: ImageCacheExampleScreen());
          },
        ),
      ],
    ),
    // OverlayMenuScreen
    GoRoute(
        path: RoutePath.overlayMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: OverlayMenuScreen(),
          );
        },
        routes: [
          GoRoute(
            path: RoutePath.overlayExample,
            pageBuilder: (context, state) {
              return CupertinoPage(
                key: state.pageKey,
                child: OverlayExampleScreen(),
              );
            },
          ),
          GoRoute(
            path: RoutePath.overlayTapExample,
            pageBuilder: (context, state) {
              return CupertinoPage(
                key: state.pageKey,
                child: OverlayTapExampleScreen(),
              );
            },
          ),
        ]),
    // DatabaseMenuScreen
    GoRoute(
        path: RoutePath.databaseMenu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DatabaseMenuScreen(),
          );
        },
        routes: [
          GoRoute(
            path: RoutePath.databaseExample,
            pageBuilder: (context, state) {
              return CupertinoPage(
                key: state.pageKey,
                child: DatabaseExampleScreen(),
              );
            },
          ),
          /*GoRoute(
            path: RoutePath.databaseSharedExample,
            pageBuilder: (context, state) {
              return CupertinoPage(
                key: state.pageKey,
                child: DatabaseSharedExampleScreen(),
              );
            },
          ),*/
        ]),
  ],
);
