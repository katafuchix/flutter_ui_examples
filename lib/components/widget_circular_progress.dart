import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/my_platform.dart';

class WidgetCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppColors colors = getAppColors();
    return MyPlatform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator(
      backgroundColor: colors.primary,
      valueColor: AlwaysStoppedAnimation<Color>(colors.accent),
    );
  }
}

Widget buildWidgetCircularProgress() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        color: Colors.black.withOpacity(0.5),
      ),
      WidgetCircularProgress()
    ],
  );
}

void showCircularProgress(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondaryAnimation,
        ) {
      return Center(
        child: WidgetCircularProgress(),
      );
    },
  );
}

// Navigator.popを呼び出せば,閉じることができるが
// 画面を閉じる時と処理が混同しないように敢えて明示している。
void closeCircularProgress(BuildContext context) {
  //Navigator.pop(context);
  Navigator.of(context, rootNavigator: true).pop();
}
