import 'package:flutter/material.dart';


class TabControllerExampleScreen extends StatefulWidget {
  const TabControllerExampleScreen({Key? key}) : super(key: key);

  @override
  State<TabControllerExampleScreen> createState() => _TabControllerExampleScreen();
}

class _TabControllerExampleScreen extends State<TabControllerExampleScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タブ画面移動サンプル'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.cloud_outlined)),
            Tab(icon: Icon(Icons.beach_access_sharp)),
            Tab(icon: Icon(Icons.brightness_5_sharp)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(child: Text('くもり', style: TextStyle(fontSize: 50))),
          Center(child: Text('雨', style: TextStyle(fontSize: 50))),
          Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
        ],
      ),
    );
  }
}