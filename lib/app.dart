import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'config/colors.dart';
import 'core/router.dart';

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
