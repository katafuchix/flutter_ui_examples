import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_ui_examples/database/database_example_screen.dart';
import 'package:flutter_ui_examples/datepicker/cupertino_datepicker_example_screen.dart';
import 'package:flutter_ui_examples/datepicker/datepicker_example_screen.dart';
import 'package:flutter_ui_examples/indexstack/indexstack_example_screen.dart';
import 'package:go_router/go_router.dart';

import '../clipoval/circleavatar_example_screen.dart';
import '../clipoval/circleavatar_image_cache_example_screen.dart';
import '../clipoval/clipoval_example_screen.dart';
import '../clipoval/clipoval_menu_screen.dart';
import '../clipoval/image_cache_example_screen.dart';
import '../clipoval/network_image_example.dat.dart';
import '../database/database_menu_screen.dart';
import '../datepicker/datepicker_menu_screen.dart';
import '../file_picker/file_picker_example_screen.dart';
import '../file_picker/file_picker_menu_screen.dart';
import '../file_picker/file_picker_multi_example_screen.dart';
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
      path: RoutePath.swipeback_menu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: SwipeBackMenuScreen(),
        );
      },
      // 子ルートをここに追加
      routes: [
        GoRoute(
          path: RoutePath.swipeback_example, // 注意：先頭の '/' は不要です
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
      path: RoutePath.filepicker_menu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: FilePickerMenuScreen(),
        );
      },
      // 子ルートをここに追加
      routes: [
        GoRoute(
          path: RoutePath.filepicker_example, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: FilePickerExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.filepicker_multi_example, // 注意：先頭の '/' は不要です
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
        path: RoutePath.dialog_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DialogMenuScreen(),
          );
        },
        routes: [
          // DialogAlertExampleScreen(),
          GoRoute(
              name: RoutePath.dialog_alert_example,
              path: RoutePath.dialog_alert_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: DialogAlertExampleScreen(),
                );
              }),

          // DialogOverlayExampleScreen(),
          GoRoute(
              name: RoutePath.dialog_overlay_example,
              path: RoutePath.dialog_overlay_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: DialogOverlayExampleScreen(),
                );
              }),

          // DialogOverlayCustomScreen(),
          GoRoute(
              name: RoutePath.dialog_overlay_custom,
              path: RoutePath.dialog_overlay_custom,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: DialogOverlayCustomScreen(),
                );
              }),

          // DialogStackExampleScreen(),
          GoRoute(
              name: RoutePath.dialog_stack_example,
              path: RoutePath.dialog_stack_example,
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
        path: RoutePath.slide_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SlideMenuScreen(),
          );
        },
        routes: [
          // SlideMenuSimpleExampleScreen(),
          GoRoute(
              name: RoutePath.slide_simple_example,
              path: RoutePath.slide_simple_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SlideMenuSimpleExampleScreen(),
                );
              }),
          // SlideMenuDrawerExampleScreen(),
          GoRoute(
              name: RoutePath.slide_drawer_example,
              path: RoutePath.slide_drawer_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SlideMenuDrawerExampleScreen(),
                );
              }),
        ]),

// ModalMenuScreen(),
    GoRoute(
        path: RoutePath.modal_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: ModalMenuScreen(),
          );
        },
        routes: [
          // ModalSimpleExampleScreen(),
          GoRoute(
              name: RoutePath.modal_simple_example,
              path: RoutePath.modal_simple_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: ModalSimpleExampleScreen(),
                );
              }),
        ]),

    // MapMenuScreen(),
    GoRoute(
        path: RoutePath.map_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: MapMenuScreen(),
          );
        },
        routes: [
          // MapExampleScreen(),
          GoRoute(
              path: RoutePath.map_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: MapExampleScreen(),
                );
              }),
        ]),

    // BarMenuScreen(),
    GoRoute(
        path: RoutePath.bar_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: BarMenuScreen(),
          );
        },
        routes: [
          // AppBarExampleScreen(),
          GoRoute(
              path: RoutePath.app_bar_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: AppBarExampleScreen(),
                );
              }),
        ]),

    // AlignmentMenuScreen(),
    GoRoute(
        path: RoutePath.alignment_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: AlignmentMenuScreen(),
          );
        },
        routes: [
          // AlignmentExampleScreen(),
          GoRoute(
              path: RoutePath.alignment_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: AlignmentExampleScreen(),
                );
              }),
          // AlignmentColumnExampleScreen(),
          GoRoute(
              path: RoutePath.alignment_column_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: AlignmentColumnExampleScreen(),
                );
              }),
        ]),

    // SharedMenuScreen(),
    GoRoute(
        path: RoutePath.shared_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: SharedMenuScreen(),
          );
        },
        routes: [
          // SharedSimpleExampleScreen(),
          GoRoute(
              path: RoutePath.shared_simple_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SharedSimpleExampleScreen(),
                );
              }),
          // SharedUserExampleScreen(),
          GoRoute(
              path: RoutePath.shared_user_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: SharedUserExampleScreen(),
                );
              }),
        ]),

    // TabMenuScreen(),
    GoRoute(
        path: RoutePath.tab_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: TabMenuScreen(),
          );
        },
        routes: [
          // TabExampleScreen(),
          GoRoute(
              path: RoutePath.tab_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabExampleScreen(),
                );
              }),

          // TabControllerExampleScreen(),
          GoRoute(
              path: RoutePath.tab_controller_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabControllerExampleScreen(),
                );
              }),

          // TabLibraryExampleScreen(),
          GoRoute(
              path: RoutePath.tab_library_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabLibraryExampleScreen(),
                );
              }),

          // TabIndicatorExampleScreen(),
          GoRoute(
              path: RoutePath.tab_indicator_example,
              pageBuilder: (context, state) {
                return CupertinoPage(
                  key: state.pageKey,
                  child: TabIndicatorExampleScreen(),
                );
              }),
        ]),

    // DatePickerMenuScreen
    GoRoute(
      path: RoutePath.date_picker_menu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: DatePickerMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.date_picker_example, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: DatePickerExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.cupertino_date_picker_example, // 注意：先頭の '/' は不要です
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
        path: RoutePath.indexstack_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: IndexstackMenuScreen(),
          );
        },
        routes: [
          GoRoute(
            path: RoutePath.indexstack_example, // 注意：先頭の '/' は不要です
            //path: '/indexstack_example',
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
      path: RoutePath.screen_menu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: ScreenMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.incoming_call_example, // 注意：先頭の '/' は不要です
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: IncomingCallExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.incoming_call_button_example, // 注意：先頭の '/' は不要です
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
      path: RoutePath.list_menu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: ListMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.list_expand_example,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: ExpandableListView(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.list_refresh_example,
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
      path: RoutePath.clipoval_menu,
      pageBuilder: (context, state) {
        return CupertinoPage(
          key: state.pageKey,
          child: ClipovalMenuScreen(),
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.clip_oval_example,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: ClipovalExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.circle_avatar_example,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: CircleavatarExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.circle_avatar_image_cache_example,
          pageBuilder: (context, state) {
            return CupertinoPage(
              key: state.pageKey,
              child: CircleavatarImageCacheExampleScreen(),
            );
          },
        ),
        GoRoute(
          path: RoutePath.network_image_example,
          pageBuilder: (context, state) {
            return CupertinoPage(
                key: state.pageKey, child: NetworkImageExampleScreen());
          },
        ),
        GoRoute(
          path: RoutePath.image_cache_example,
          pageBuilder: (context, state) {
            return CupertinoPage(
                key: state.pageKey, child: ImageCacheExampleScreen());
          },
        ),
      ],
    ),
    // OverlayMenuScreen
    GoRoute(
        path: RoutePath.overlay_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: OverlayMenuScreen(),
          );
        },
        routes: [
          GoRoute(
            path: RoutePath.overlay_example,
            pageBuilder: (context, state) {
              return CupertinoPage(
                key: state.pageKey,
                child: OverlayExampleScreen(),
              );
            },
          ),
          GoRoute(
            path: RoutePath.overlay_tap_example,
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
        path: RoutePath.database_menu,
        pageBuilder: (context, state) {
          return CupertinoPage(
            key: state.pageKey,
            child: DatabaseMenuScreen(),
          );
        },
        routes: [
          GoRoute(
            path: RoutePath.database_example,
            pageBuilder: (context, state) {
              return CupertinoPage(
                key: state.pageKey,
                child: DatabaseExampleScreen(),
              );
            },
          ),
          /*GoRoute(
            path: RoutePath.database_shared_example,
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
