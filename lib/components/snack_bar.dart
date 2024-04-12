import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'texts.dart';

// snack barはshowした画面だけで使うようにする
// また、showする画面は、WillPopでsnack barを消すこと

void showInfoSnackBar(
    BuildContext context, {
      required String text,
    }) {
  // 既にスナックバーが表示されていたら削除する
  ScaffoldMessenger.of(context).removeCurrentSnackBar();

  final snackBar = SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.zero),
    ),
    elevation: 0,
    margin: EdgeInsets.all(8),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.grey,
    content: InkWell(
      onTap: () {
        try {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        } catch (_) {}
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: buildNormalText(text),
      ),
    ),
  );

  try {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } catch (_) {}
}

void showErrorSnackBar(
    BuildContext context, {
      required String text,
    }) {
  // 既にスナックバーが表示されていたら削除する
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      elevation: 0,
      margin: EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.redAccent,
      // https://stackoverflow.com/questions/58777482/how-to-display-snackbar-infinite-duration-in-flutter
      duration: Duration(days: 365),
      content: InkWell(
        onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: buildNormalText(text),
        ),
      ),
    ),
  );
}
