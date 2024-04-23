import 'package:flutter/material.dart';

class TabIndicatorExampleScreen extends StatefulWidget {
  const TabIndicatorExampleScreen({Key? key}) : super(key: key);

  @override
  State<TabIndicatorExampleScreen> createState() => _TabIndicatorExampleScreen();
}

class _TabIndicatorExampleScreen extends State<TabIndicatorExampleScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('タブ画面移動サンプル'),
          bottom:
          const TabBar(
              labelColor: const Color(0xff525c6e),
              unselectedLabelColor: const Color(0xffacb3bf),
              indicatorPadding: EdgeInsets.all(0.0),
              indicatorWeight: 4.0,
              labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              indicator: ShapeDecoration(
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 0, style: BorderStyle.solid)),
                  gradient: LinearGradient(colors: [Color(0xff0081ff), Color(0xff01ff80)])),

            tabs: <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
           ]
          ),
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
  }
}
