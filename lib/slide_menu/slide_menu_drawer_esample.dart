import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../base/base_stateful_widget.dart';
import '../components/texts.dart';
import '../config/colors.dart';

class SlideMenuDrawerExampleScreenResult {
  final String message;
  SlideMenuDrawerExampleScreenResult(this.message);
}

class SlideMenuDrawerExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SlideMenuDrawerExampleScreenState();
  }
}

class _SlideMenuDrawerExampleScreenState extends BaseState<SlideMenuDrawerExampleScreen> {
  _SlideMenuDrawerExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:
      Container(
        width: 200,
        child:
          Drawer(//①appbar:と同階層に配置
            child: ListView(//②child:としてListViewを配置
              padding: EdgeInsets.zero,
              children: const <Widget>[//③ListViewのchidrenにはHeaderをひとつ、子要素を複数個配置。
              const SizedBox(
                height: 64.0,
                child:
                  DrawerHeader( //　ここでのHeader：DrawerHeader()を入れて、
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  )
              ),
              ListTile( //　子要素としてはListTileを入れる
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Slide Menu Simple examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
    );
  }
}