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
        bottom:
        TabBar(
          controller: _tabController,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: CustomUnderlineTabIndicator(
            insets: EdgeInsets.only(top: 10, bottom: 2),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          /*tabs: const <Widget>[
            Tab(icon: Icon(Icons.cloud_outlined)),
            Tab(icon: Icon(Icons.beach_access_sharp)),
            Tab(icon: Icon(Icons.brightness_5_sharp)),
          ],*/
          tabs: ["11", "2", "3"].map((str) {
            return Container(
              height: 50,
              color: Colors.blue,
              child: Center(
                child: new Text(
                  str,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            );
          }).toList(),

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


///参考UnderlineTabIndicator,仅仅修改画笔StrokeCap.square 为 StrokeCap.round
class CustomUnderlineTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const CustomUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  })  : assert(borderSide != null),
        assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the tab
  /// indicator's bounds in terms of its (centered) tab widget with
  /// [TabBarIndicatorSize.label], or the entire tab with
  /// [TabBarIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is UnderlineTabIndicator) {
      return UnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is UnderlineTabIndicator) {
      return UnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  _UnderlinePainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left-10,
      indicator.bottom - borderSide.width,
      indicator.width+20,
      borderSide.width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  final CustomUnderlineTabIndicator? decoration;

  BorderSide? get borderSide => decoration?.borderSide;

  EdgeInsetsGeometry? get insets => decoration?.insets;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration? configuration) {
    assert(configuration != null);
    assert(configuration!.size != null);
    final Rect rect = offset & configuration!.size!;
    //final Rect rect = configuration!.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration!._indicatorRectFor(rect, textDirection)
        .deflate(decoration!.borderSide.width / 2.0);
    final Paint paint = decoration!.borderSide.toPaint();
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round; //主要是修改此处  圆角
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}