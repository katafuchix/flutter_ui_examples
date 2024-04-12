import 'package:flutter/material.dart';


class DialogMenuPage extends StatelessWidget {
  DialogMenuPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Dialog examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                    //showDataAlert(context);
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