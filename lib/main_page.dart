import 'package:flutter/material.dart';
import 'core/route_path.dart';
import 'util/ui_utils.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            // Swipe Back
            buildListItem(
              context: context,
              title: 'Swipe Back',
              subtitle: 'demos of Swipe Back',
              routePath: RoutePath.swipeback_menu,
            ),
            buildListItem(
              context: context,
              title: 'File Picker',
              subtitle: 'demos of File Picker',
              routePath: RoutePath.filepicker_menu,
            ),
            buildListItem(
              context: context,
              title: 'Date Picker',
              subtitle: 'demos of Date Picker',
              routePath: RoutePath.date_picker_menu,
            ),
            buildListItem(
              context: context,
              title: 'Index Stack',
              subtitle: '',
              routePath: RoutePath.indexstack_menu,
            ),

            // dialog menu
            buildListItem(
              context: context,
              title: 'Dialog',
              subtitle: 'demos of dialog ui',
              routePath: RoutePath.dialog_menu,
            ),
            // Video menu
            buildListItem(
                context: context,
                title: 'Video',
                subtitle: 'demos of video ui',
                routePath: RoutePath.video_menu),
            // Side menu
            buildListItem(
                context: context,
                title: 'Slide Menu',
                subtitle: 'demos of menu ui',
                routePath: RoutePath.slide_menu),
            // modal menu
            buildListItem(
                context: context,
                title: 'Modal Menu',
                subtitle: 'demos of menu ui',
                routePath: RoutePath.modal_menu),
            // map menu
            buildListItem(
                context: context,
                title: 'Map Menu',
                subtitle: 'demos of map',
                routePath: RoutePath.map_menu),
            // bar_menu
            buildListItem(
                context: context,
                title: 'Bar Menu',
                subtitle: '',
                routePath: RoutePath.bar_menu),
            // alignment_menu
            buildListItem(
                context: context,
                title: 'Alignment Menu',
                subtitle: '',
                routePath: RoutePath.alignment_menu),
            // shared_menu
            buildListItem(
                context: context,
                title: 'Shared Menu',
                subtitle: '',
                routePath: RoutePath.shared_menu),
            // tab_menu
            buildListItem(
                context: context,
                title: 'Tab Menu',
                subtitle: '',
                routePath: RoutePath.tab_menu),

            // screen_menu
            buildListItem(
                context: context,
                title: 'Screen Menu',
                subtitle: '',
                routePath: RoutePath.screen_menu),

            // list_menu
            buildListItem(
                context: context,
                title: 'List Menu',
                subtitle: '',
                routePath: RoutePath.list_menu),

            // clipoval_menu
            buildListItem(
                context: context,
                title: 'Clip Oval Menu',
                subtitle: '',
                routePath: RoutePath.clipoval_menu),

            // overlay_menu
            buildListItem(
                context: context,
                title: 'OverLay Menu',
                subtitle: '',
                routePath: RoutePath.overlay_menu),

            // database_menu
            buildListItem(
                context: context,
                title: 'DataBase Menu',
                subtitle: '',
                routePath: RoutePath.database_menu),
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
          },
        );

        return WillPopScope(
          onWillPop: () async => false,
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

  Future<void> showLoadingDialog({
    required BuildContext context,
  }) async {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 250),
        barrierColor: Colors.black.withOpacity(0.5),
        // 画面マスクの透明度
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return WillPopScope(
            onWillPop: () async => false,
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
            content: SizedBox(
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
