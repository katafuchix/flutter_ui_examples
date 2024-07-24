import 'package:flutter/material.dart';


class IndexstackExampleScreen extends StatefulWidget {
  @override
  _IndexstackExampleScreenState createState() => _IndexstackExampleScreenState();
}

class _IndexstackExampleScreenState extends State<IndexstackExampleScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack Sample'),
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            Text(
              'Index 0: Home',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Index 1: Business',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Index 2: School',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
        Theme(
              data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child:
              Stack(
                  children: [
                    BottomNavigationBar(
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.business),
                          label: 'Business',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.school),
                          label: 'School',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: Colors.amber[800],
                      onTap: _onItemTapped,
                    ),
                  ]
              )
        ),
    );
  }
}

