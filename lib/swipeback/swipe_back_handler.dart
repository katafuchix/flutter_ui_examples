import 'package:flutter/material.dart';

// フリック操作で戻る処理
double swipeDistance = 0;

void handleSwipeUpdate(DragUpdateDetails details) {
  if (details.primaryDelta! > 0) {
    swipeDistance += details.primaryDelta!;
  }
}

// フリックの感度を調整する変数
const _minSwipeDistance = 100;
const _minSwipeVelocity = 500;

Future<void> handleSwipeEnd(
    DragEndDetails details, BuildContext context) async {
  debugPrint("handleSwipeEnd called"); // ← ここで確認

  final navigator = Navigator.of(context);

  if (swipeDistance > _minSwipeDistance &&
      details.primaryVelocity! > _minSwipeVelocity) {
    // 戻り先がある場合は、通常の戻る動作を行う
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  // フリック距離のリセット
  swipeDistance = 0;
}
