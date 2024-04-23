import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';

class TabExampleScreenResult {
  final String message;
  TabExampleScreenResult(this.message);
}

class TabExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabExampleScreenState();
  }
}

class _TabExampleScreenState extends BaseState<TabExampleScreen> {
  _TabExampleScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Products'),
          bottom: const TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            indicatorColor: Colors.black,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            tabs: [
              SizedBox(height: 40, child: Center(child: Text('Tab 1'))),
              SizedBox(height: 40, child: Center(child: Text('Tab 2'))),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Tab 1')),
            Center(child: Text('Tab 2')),
          ],
        ),
      ),
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('タブ画面移動サンプル def'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(icon: Icon(Icons.cloud_outlined)),
            Tab(icon: Icon(Icons.beach_access_sharp)),
            Tab(icon: Icon(Icons.brightness_5_sharp)),
          ]),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text('くもり', style: TextStyle(fontSize: 50))),
            Center(child: Text('雨', style: TextStyle(fontSize: 50))),
            Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
          ],
        ),
      ),
    );
  }*/
}