import 'package:flutter/material.dart';

class IncomingCallButtonExampleScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Screen examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
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
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.volume_off, Colors.grey, '消音', () {
                        print('消音');
                      }),
                      _buildActionButton(Icons.volume_up, Colors.grey, 'スピーカー', () {
                        print('スピーカー');
                      }),
                    ],
                  ),*/
                  //SizedBox(height: 30),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(Icons.call_end, Colors.red, '拒否', () {
                        print('拒否');
                      }),
                      _buildActionButton(Icons.call, Colors.green, '応答', () {
                        print('応答');
                      }),

                      _buildCustomButton(Icons.volume_up, 'スピーカー', () {
                        print('スピーカー');
                      }),
                    ],
                  ),*/

                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      _buildCustomButton(Icons.mic_off_outlined, '', () {
                        print('消音');
                      }),

                      _buildActionButton(Icons.call_end, Colors.red, '', () {
                        print('拒否');
                      }),

                      _buildCustomButton(Icons.volume_up, '', () {
                        print('スピーカー');
                      }),
                    ],
                  ),
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

  /*
  Widget _buildActionButton(IconData icon, Color color, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: color,
          child: Icon(icon, size: 36),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
  */
  Widget _buildCustomButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Icon(icon, size: 36, color: Colors.grey),
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
