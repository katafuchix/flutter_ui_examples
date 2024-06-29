import 'package:flutter/material.dart';


class CircleavatarExampleScreen extends StatefulWidget {
  @override
  _CircleavatarExampleScreenState createState() => _CircleavatarExampleScreenState();
}

class _CircleavatarExampleScreenState extends State<CircleavatarExampleScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(CircleavatarExampleScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Overlay Example'),
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
        ),
        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              /*
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://equal-love.jp/image/profile/otani_emiri.jpg'),
              ),
              SizedBox(height: 10,),
              CircleAvatar(
                backgroundImage:
                NetworkImage(
                    'https://equal-love.jp/image/profile/otani_emiri.jpg'),
                backgroundColor: Colors.transparent,
                radius: 50,
              ),
              SizedBox(height: 10,),
              CircleAvatar(
                child: Image.asset('assets/images/otani_emiri.jpg',),
                backgroundColor: Colors.transparent,
                radius: 50,
              ),

              SizedBox(height: 10,),

               */
/*
              ClipOval(
                clipper: MyClipper(),
                child: Image.asset('assets/images/otani_emiri.jpg',),
              ),
*/
              ClipOval(
                clipper: MyClipper(),
                child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
              ),

            ],
          ),
        )
    );
  }
}

class MyClipper extends CustomClipper<Rect>{

  MyClipper();

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width/3, size.width/3),
        radius: size.width/3
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }

}

class MyRectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width / 2, size.height / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class InvertedCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromLTWH(0, 0, size.width, size.height));
    path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 4));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}