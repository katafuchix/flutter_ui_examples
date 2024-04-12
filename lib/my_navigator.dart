import 'package:flutter/material.dart';
import 'app.dart';

// アプリ内の画面遷移に必用なクラス群

// 画面に対して値を渡したい場合はこのクラスを使う
class ScreenArgs {
  final Map<String, dynamic> _data = Map();

  void put(String key, Object value) {
    _data[key] = value;
  }

  Object? get(String key) {
    return _data[key];
  }
}

// 画面遷移する際に、push(下から突き上がる)か、slide(右から出てくる)か
// MyNavigator.pushNamed()の引数として使用する
enum PageOpenType { PUSH, SLIDE }

typedef CreatePage = Widget Function();

// 画面遷移する際に使う
// 標準のNavigator.push**は使用しないこと
class MyNavigator {
  static final _screenArgsKey = 'SCREE_ARGS_KEY';

  @optionalTypeArgs
  static Future<T?>? pushNamed<T extends Object>(
      BuildContext context, String routeName,
      {ScreenArgs? arguments, PageOpenType pageOpenType = PageOpenType.PUSH}) {

    ScreenArgs? argumentsImpl = arguments;
    if (arguments == null) {
      argumentsImpl = ScreenArgs();
    }
    argumentsImpl!.put(_screenArgsKey, pageOpenType);

    // https://stackoverflow.com/questions/64677196/scaffoldmessenger-throws-a-hero-animation-error
    // 画面遷移時にsnackBarが表示されていると真っ暗な画面に遷移してしまう。そのためremoveする
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    return Navigator.of(context)
        .pushNamed<T>(routeName, arguments: argumentsImpl);
  }

  // @optionalTypeArgs
  // static Future<T> push<T extends Object>(
  //     BuildContext context, String routeName,
  //     {ScreenArgs arguments, PageOpenType pageOpenType}) {
  //   ScreenArgs argumentsImpl = arguments;
  //   if (arguments == null) {
  //     argumentsImpl = ScreenArgs();
  //   }
  //   argumentsImpl.put(_screenArgsKey, pageOpenType);
  //
  //   // https://stackoverflow.com/questions/64677196/scaffoldmessenger-throws-a-hero-animation-error
  //   // 画面遷移時にsnackBarが表示されていると真っ暗な画面に遷移してしまう。そのためremoveする
  //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
  //
  //   return Navigator.of(context).push<T>(
  //       MaterialPageRoute(builder: (_) => ProfileScreen(args: argumentsImpl)));
  // }

  @optionalTypeArgs
  static Future<T?> pushNamedAndRemoveUntil<T extends Object>(
      BuildContext context,
      String newRouteName,
      RoutePredicate predicate, {
        ScreenArgs? arguments,
      }) {

    ScreenArgs? argumentsImpl = arguments;
    if (arguments == null) {
      argumentsImpl = ScreenArgs();
    }
    argumentsImpl!.put(_screenArgsKey, PageOpenType.PUSH);
    return Navigator.of(context).pushNamedAndRemoveUntil<T>(
        newRouteName, predicate,
        arguments: argumentsImpl);
  }

  static Future pushMain(BuildContext context, {String? deepLink}) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => MyApp()),
            (route) => false);
  }

/*
  static Future pushWelcome(BuildContext context) {
    AppEvent.sendPushEvent('/sign_in');
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => MyApp(
              doneSignIn: false,
            )),
            (route) => false);
  }
*/
  static PageOpenType? getPageOpenType(ScreenArgs arguments) {
    if (arguments._data.containsKey(_screenArgsKey) == true) {
      return arguments._data[_screenArgsKey];
    }
    return null;
  }
}
