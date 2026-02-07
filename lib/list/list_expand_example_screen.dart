import 'package:flutter/material.dart';

class ExpandableListView extends StatefulWidget {
  const ExpandableListView({super.key});

  @override
  ExpandableListViewState createState() => ExpandableListViewState();
}

class ExpandableListViewState extends State<ExpandableListView> {
  final List<Item> _items =
      List.generate(10, (index) => Item(title: 'Item $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable ListView'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ExpandableListItem(
            item: _items[index],
            onTap: () {
              setState(() {
                _items[index].isExpanded = !_items[index].isExpanded;
              });
            },
          );
        },
      ),
    );
  }
}

class ExpandableListItem extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ExpandableListItem(
      {super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    //return InkWell(
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            title: Text(item.title),
          ),
          if (item.isExpanded)
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Text('Expanded content for ${item.title}'),
            ),
        ],
      ),
    );
  }
}

class Item {
  final String title;
  bool isExpanded;

  Item({required this.title, this.isExpanded = false});
}
