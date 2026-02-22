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

    return MaterialApp.router(
      routerConfig: router,
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
      //home: MainPage(),
      /*onGenerateRoute: (RouteSettings settings) {
        assert(settings.arguments == null || settings.arguments is ScreenArgs);
        CreatePage createPage = _createScreen(
                context, settings.arguments as ScreenArgs?)[settings.name]
            as CreatePage;
        return _SlideRoute<Object>(
            page: createPage, args: settings.arguments as ScreenArgs);
      },*/
    );
  }
}
