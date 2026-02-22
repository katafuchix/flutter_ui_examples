import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget buildListItem({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String routePath,
}) {
  const edgeInsets = EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20);
  return Container(
    margin: edgeInsets,
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.push(routePath),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          const Divider()
        ],
      ),
    ),
  );
}
