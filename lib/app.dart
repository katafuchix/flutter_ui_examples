import 'package:flutter/material.dart';
import 'my_navigator.dart';
import 'main_page.dart';
import 'dialog/dialog_menu_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
    };
  }
}

class Routes {
  static const String home = '/home';
  static const String dialog_menu = '/dialog_menu';
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

