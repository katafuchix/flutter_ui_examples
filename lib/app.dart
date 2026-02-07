import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'config/colors.dart';
import 'core/router.dart';
import 'my_navigator.dart';
import 'main_page.dart';
import 'dialog/dialog_menu_screen.dart';
import 'dialog/dialog_alert_example_screen.dart';
import 'dialog/dialog_overlay_example_screen.dart';
import 'dialog/dialog_overlay_custom_screen.dart';
import 'dialog/dialog_stack_example_screen.dart';
import 'video/video_menu_screen.dart';
import 'video/video_player_example_screen.dart';
import 'slide_menu/slide_menu_screen.dart';
import 'slide_menu/slide_menu_simple_example.dart';
import 'slide_menu/slide_menu_drawer_esample.dart';
import 'modal/modal_menu_screen.dart';
import 'modal/modal_simple_screen.dart';
import 'map/map_menu_screen.dart';
import 'map/map_example_screen.dart';
import 'bar/bar_menu_screen.dart';
import 'bar/app_bar_example_screen.dart';
import 'alignment/alignment_menu_screen.dart';
import 'alignment/alignment_example_screen.dart';
import 'alignment/alignment_column_example_screen.dart';
import 'shared/shared_menu_screen.dart';
import 'shared/shared_simple_example_screen.dart';
import 'shared/shared_user_example_screen.dart';
import 'tab/tab_menu_screen.dart';
import 'tab/tab_example_screen.dart';
import 'tab/tab_controller_example_screen.dart';
import 'tab/tab_library_example_screen.dart';
import 'tab/tab_indicator_example_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppColors colors = MyColors();

    //return MaterialApp(
    return MaterialApp.router(
      builder: FlutterSmartDialog.init(),
      //navigatorObservers: [FlutterSmartDialog.observer],   // GoRouter へ
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      theme: ThemeData(
        primaryColor: colors.primary,
        useMaterial3: true,
        dialogBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        /*
        colorScheme: const ColorScheme.light(
          primary: Colors.grey,
          secondary: Colors.amber,
        ),*/
      ),
      scaffoldMessengerKey: GlobalSnackBar.scaffoldMessengerKey,
      //home: const YahooImageSearchScreen(),
      routerConfig: router, // ここで定義した地図を渡す
    );
  }
}

class GlobalSnackBar {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void show(String message) {
    scaffoldMessengerKey.currentState?.clearSnackBars();
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class _MyApp extends StatefulWidget {
  const _MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppColors colors = MyColors();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: colors.primary,
        useMaterial3: true,
        dialogBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        /*colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: Colors.purple,
          accentColor: Colors.red,
        ),*/
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: MainPage(),
      onGenerateRoute: (RouteSettings settings) {
        assert(settings.arguments == null || settings.arguments is ScreenArgs);
        CreatePage createPage = _createScreen(
                context, settings.arguments as ScreenArgs?)[settings.name]
            as CreatePage;
        return _SlideRoute<Object>(
            page: createPage, args: settings.arguments as ScreenArgs);
      },
    );
  }

  Map<String, CreatePage> _createScreen(
      BuildContext context, ScreenArgs? args) {
    return {
      Routes.home: () => MainPage(),
      Routes.dialog_menu: () => DialogMenuScreen(),
      Routes.dialog_alert_example: () => DialogAlertExampleScreen(),
      Routes.dialog_overlay_example: () => DialogOverlayExampleScreen(),
      Routes.dialog_overlay_custom: () => DialogOverlayCustomScreen(),
      Routes.dialog_stack_example: () => DialogStackExampleScreen(),
      Routes.video_menu: () => VideoMenuScreen(),
      Routes.video_player_example: () => VideoPlayerExampleScreen(),
      Routes.slide_menu: () => SlideMenuScreen(),
      Routes.slide_menu_simple_example: () => SlideMenuSimpleExampleScreen(),
      Routes.slide_menu_drawer_example: () => SlideMenuDrawerExampleScreen(),
      Routes.modal_menu: () => ModalMenuScreen(),
      Routes.modal_simple_example: () => ModalSimpleExampleScreen(),
      Routes.map_menu: () => MapMenuScreen(),
      Routes.map_example: () => MapExampleScreen(),
      Routes.bar_menu: () => BarMenuScreen(),
      Routes.app_bar_example: () => AppBarExampleScreen(),
      Routes.alignment_menu: () => AlignmentMenuScreen(),
      Routes.alignment_example: () => AlignmentExampleScreen(),
      Routes.alignment_column_example: () => AlignmentColumnExampleScreen(),
      Routes.shared_menu: () => SharedMenuScreen(),
      Routes.shared_simple_example: () => SharedSimpleExampleScreen(),
      Routes.shared_user_example: () => SharedUserExampleScreen(),
      Routes.tab_menu: () => TabMenuScreen(),
      Routes.tab_example: () => TabExampleScreen(),
      Routes.tab_controller_example: () => TabControllerExampleScreen(),
      Routes.tab_library_example: () => TabLibraryExampleScreen(),
      Routes.tab_indicator_example: () => TabIndicatorExampleScreen(),
    };
  }
}

class Routes {
  static const String home = '/home';
  static const String dialog_menu = '/dialog_menu';
  static const String dialog_alert_example = '/dialog_alert_example';
  static const String dialog_overlay_example = '/dialog_overlay_example';
  static const String dialog_overlay_custom = '/dialog_overlay_custom';
  static const String dialog_stack_example = '/dialog_stack_example';
  static const String video_menu = '/video_menu';
  static const String video_player_example = '/video_player_example';
  static const String slide_menu = '/slide_menu';
  static const String slide_menu_simple_example = '/slide_menu_simple_example';
  static const String slide_menu_drawer_example = '/slide_menu_drawer_example';
  static const String modal_menu = '/modal_menu';
  static const String modal_simple_example = '/modal_simple_example';
  static const String map_menu = '/map_menu';
  static const String map_example = '/map_example';
  static const String bar_menu = '/bar_menu';
  static const String app_bar_example = '/app_bar_example';
  static const String alignment_menu = '/alignment_menu';
  static const String alignment_example = '/alignment_example';
  static const String alignment_column_example = '/alignment_column_example';
  static const String shared_menu = '/shared_menu_screen';
  static const String shared_simple_example = '/shared_simple_example';
  static const String shared_user_example = '/shared_user_example';
  static const String tab_menu = '/tab_menu';
  static const String tab_example = '/tab_example';
  static const String tab_controller_example = '/tab_controller_example';
  static const String tab_library_example = '/tab_library_example';
  static const String tab_indicator_example = '/tab_indicator_example';
}

class _SlideRoute<T> extends PageRouteBuilder<T> {
  final CreatePage page;
  final ScreenArgs args;

  _SlideRoute({required this.page, required this.args})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page(),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: Offset(_dxFrom(args), _dyFrom(args)),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );

  static double _dxFrom(ScreenArgs args) {
    PageOpenType? type = MyNavigator.getPageOpenType(args);
    if (type == null || type == PageOpenType.PUSH)
      return 0;
    else
      return 1;
  }

  static double _dyFrom(ScreenArgs args) {
    PageOpenType? type = MyNavigator.getPageOpenType(args);
    if (type == null || type == PageOpenType.PUSH)
      return 1;
    else
      return 0;
  }
}
