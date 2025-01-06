import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/util/my_logger.dart';

class ListRefreshExampleScreen extends StatefulWidget {
  @override
  ListViewRefreshExampleScreenState createState() =>
      ListViewRefreshExampleScreenState();
}

class ListViewRefreshExampleScreenState
    extends State<ListRefreshExampleScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _items = List.generate(20, (index) => index);
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // 下方向の引っ張り検知
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        MyLogger.d("下方向の引っ張り検知");
        _loadMoreItems();
      }
    });

    // 下方向（reverse: true の場合）での引っ張り検知
    // _scrollController.position.pixels <= 0
  }

  Future<void> _refreshItems() async {
    // 上方向の更新処理
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _items.insertAll(0, List.generate(5, (index) => _items.length + index));
    });
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      _isLoading = true;
    });

    // 下方向の更新処理
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _items.addAll(List.generate(5, (index) => _items.length + index));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView上下更新')),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _refreshItems,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _items.length + 1,
              itemBuilder: (context, index) {
                if (index < _items.length) {
                  return ListTile(title: Text('Item ${_items[index]}'));
                } else if (_isLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
