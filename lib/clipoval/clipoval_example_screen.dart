import 'package:flutter/material.dart';


class ClipovalExampleScreen extends StatefulWidget {
  @override
  _ClipovalExampleScreenState createState() => _ClipovalExampleScreenState();
}

class _ClipovalExampleScreenState extends State<ClipovalExampleScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ClipovalExampleScreen oldWidget) {
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
              Center(child:
              ClipOval(
                //clipper: MyClipper(),
                clipper: MyRectClipper(),
                child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
              ),
              ),
*/
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://equal-love.jp/image/profile/otani_emiri.jpg'),
              ),
              /*
              ClipOval(
                  child: Image.network('https://deskplate.net/images/top3.jpg')
              ),
              SizedBox(height: 20,),
              ClipOval(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      'https://deskplate.net/images/top3.jpg',
                      fit: BoxFit.cover,
                    ),
                  )
              ),

              ClipRect(
                clipper: MyRectClipper(),
                child: ClipOval(
                  child:
                  Image.network(
                  'https://deskplate.net/images/top3.jpg',
                  fit: BoxFit.cover,
                ),
                ),
              ),

              ClipPath(
                clipper: InvertedCircleClipper(),
                child:
                Image.network(
                  'https://deskplate.net/images/top3.jpg',
                  fit: BoxFit.cover,
                )
              ),
              */
            ],
          ),
        )
    );
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(size.width / 6.5, 0, size.width / 1.5, size.width / 1.5);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
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
