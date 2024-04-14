import 'package:flutter/material.dart';
import 'config/colors.dart';
import 'my_navigator.dart';
import 'main_page.dart';
import 'dialog/dialog_menu_screen.dart';
import 'dialog/dialog_alert_example_screen.dart';
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

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        assert(
        settings.arguments == null || settings.arguments is ScreenArgs);
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
      Routes.app_bar_example: () => AppBarExampleScreen()
    };
  }
}

class Routes {
  static const String home = '/home';
  static const String dialog_menu = '/dialog_menu';
  static const String dialog_alert_example = '/dialog_alert_example';
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

