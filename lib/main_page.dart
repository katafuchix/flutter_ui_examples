import 'package:flutter/material.dart';
import './example_route.dart';
import './example_routes.dart' as example_routes;
import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';

@FFRoute(
  name: 'fluttercandies://mainpage',
  routeName: 'MainPage',
)

class MainPage extends StatelessWidget {
  MainPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('UI examples'),
      ),
      body: Center(
        child: ListView(
          //scrollDirection: Axis.horizontal, // 横
          padding: EdgeInsets.all(2.0),
          //shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'title',
                      //style: TextStyle(inherit: false),
                    ),
                    Text(
                      ' demos of extended_text_field',
                      //page.description,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                onTap: () {
                  /*
                  Navigator.pushNamed(
                    context,
                    Routes.fluttercandiesDemogrouppage,
                    arguments: <String, dynamic>{
                      'keyValue': routesGroup.entries.toList()[index],
                    },
                  );
                  */
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
