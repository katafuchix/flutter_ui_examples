import 'package:flutter/material.dart';
import '../base/base_stateful_widget.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

    _safeAreaHorizontal = _mediaQueryData!.padding.left +
        _mediaQueryData!.padding.right;
    _safeAreaVertical = _mediaQueryData!.padding.top +
        _mediaQueryData!.padding!.bottom;
    safeBlockHorizontal = (screenWidth! -
        _safeAreaHorizontal!) / 100;
    safeBlockVertical = (screenHeight! -
        _safeAreaVertical!) / 100;
  }
}

// https://qiita.com/yasudadesu/items/95f553d5a7c5d345aa6e

double getProportionHeight(BuildContext context, double inputHeight) {
  final screenHeight = MediaQuery.of(context).size.height;//SizeConfig.screenHeight!;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionWidth(BuildContext context, double inputWidth) {
  final screenWidth = MediaQuery.of(context).size.width;//SizeConfig.screenWidth!;
  return (inputWidth / 375.0) * screenWidth;
}

class TabLibraryExampleScreen extends StatefulWidget {
  const TabLibraryExampleScreen({super.key});

  @override
  _TabLibraryExampleScreenState createState() => _TabLibraryExampleScreenState();
}

class _TabLibraryExampleScreenState extends State<TabLibraryExampleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.purple,
                    title: Text('Library'),
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(getProportionHeight(context, 48)),
                        child: _buildTabsRow())),
              ];
            },
            body: _tabBody()));
  }

  Widget _tabBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(child: Center(child: Icon(Icons.car_rental))),
        Container(child: Center(child: Icon(Icons.car_rental))),
        Container(child: Center(child: Icon(Icons.car_rental))),
      ],
    );
  }

  Widget _buildTabsRow() {
    return Stack(
      children: [
        _buildTabTitles(),
        _buildTabActions() // 並び替えとフィルターのactions
      ],
    );
  }

  // タブの左寄せタイトル郡
  Widget _buildTabTitles() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    width: getProportionWidth(context, 3),
                    color: Colors.black,
                  )),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              _tabTitle('Car'),
              _tabTitle('Bike'),
              _tabTitle('Walk'),
            ],
          ),
        ),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }

  Widget _buildTabActions() {
    return Container(
      // tab height
      height: getProportionWidth(context, 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        /*children: [
          _tabAction(
              icon: const Icon(Icons.sort_outlined, color: Colors.white),
              onTap: () {}),
          _tabAction(
              icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
              onTap: () {}),
        ],*/
      ),
    );
  }

  /*
  Widget _tabAction({Icon icon, Function onTap}) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionWidth(20)),
      child: GestureDetector(
        onTap: () => onTap,
        child: icon,
      ),
    );
  }
*/
  Widget _tabTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionWidth(context, 6)),
      child: Container(
        height: getProportionHeight(context, 40),
        width: getProportionWidth(context, 132),
        child: Tab(text: title),
      ),
    );
  }
}