import 'package:flutter/material.dart';
import './example_route.dart';
import './example_routes.dart' as example_routes;
import 'package:ff_annotation_route_library/ff_annotation_route_library.dart';
import '../my_navigator.dart';
import '../components/snack_bar.dart';
import 'app.dart';
import 'dialog/dialog_menu_screen.dart';
import 'video/video_menu_screen.dart';

@FFRoute(
  name: 'fluttercandies://mainpage',
  routeName: 'MainPage',
)

class MainPage extends StatelessWidget {
  MainPage({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('UI examples'),
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
                      'Dialog',
                      //style: TextStyle(inherit: false),
                    ),
                    Text(
                      ' demos of dialog ui',
                      //page.description,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.dialog_menu,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is DialogMenuScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    }
                  },
              )
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'video',
                        //style: TextStyle(inherit: false),
                      ),
                      Text(
                        ' demos of video ui',
                        //page.description,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  onTap: () async {
                    final result = await MyNavigator.pushNamed(
                        context, Routes.video_menu,
                        pageOpenType: PageOpenType.SLIDE);
                    if (result is VideoMenuScreenResult) {
                      showInfoSnackBar(context, text: result.message);
                    }
                  },
                )
            )
          ],
        ),
      ),
    );
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(
          Duration(seconds: 5),
              () {
            Navigator.of(context).pop(true);
            print('aaa');
          },
        );

        return  WillPopScope(
          onWillPop: () async=> false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                //Text(S.of(context)!.processing,style: regularWhite18,),
              ],
            ),
          ),
        );
        /*
        return AlertDialog(
          title: Text('Title Here'),
          content: Text('Data'),
        );
        */
      },
    );
  }

  Future <void> showLoadingDialog({
    required BuildContext context,
  }) async {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 250),
        barrierColor: Colors.black.withOpacity(0.5), // 画面マスクの透明度
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return  WillPopScope(
            onWillPop: () async=> false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  //Text(S.of(context)!.processing,style: regularWhite18,),
                ],
              ),
            ),
          );
        });
  }

  showDataAlert(BuildContext context) {
    showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              "Create ID",
              style: TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 400,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Mension Your ID ",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Id here',
                            labelText: 'ID'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          //primary: Colors.black,
                          // fixedSize: Size(250, 50),
                        ),
                        child: Text(
                          "Submit",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Note'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
                            ' ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud'
                            ' exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum '
                            'dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,'
                            ' sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
