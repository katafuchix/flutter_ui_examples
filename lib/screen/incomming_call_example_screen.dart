import 'package:flutter/material.dart';

class IncomingCallExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpg'), // アバター画像
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Caller Name',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    '123-456-7890',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(Icons.call_end, Color(0xffFD3C30), '', () {
                    print('拒否');
                  }),
                  _buildActionButton(Icons.call, Color(0xff2ED158), '', () {
                    print('応答');
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 64.0,
          height: 64.0,
          child:
            FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: onPressed,
                backgroundColor: color,
                child: Icon(icon, size: 36, color: Colors.white,),
              ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
