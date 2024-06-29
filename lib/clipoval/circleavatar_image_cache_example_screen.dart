import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleavatarImageCacheExampleScreen extends StatefulWidget {
  @override
  _CircleavatarImageCacheExampleScreenState createState() => _CircleavatarImageCacheExampleScreenState();
}

class _CircleavatarImageCacheExampleScreenState extends State<CircleavatarImageCacheExampleScreen> {

  @override
  void initState() {
    super.initState();
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



              Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5, //切り抜き後の高さ/元の高さ
                child: ClipOval(
                  clipper: MyRectClipper(),
                  child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                ),
              ),

              Text('aaa'),
              Container(
                  color: Colors.red,
                  height: 200,
                  width: 200,
                  child:
                          Align(
                            alignment: Alignment.topCenter,
                            heightFactor: 0.9, //切り抜き後の高さ/元の高さ
                            child: ClipOval(
                              clipper: CustomUpperClipper(),
                              child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                            ),
                          ),
                  )

              ,
            /*
            Positioned(
            top: 140,
            right: 0,
            left: 0,
            child: Center( //TODO: Wrap SizedBox with Center
              child: Container(
                color: Colors.red,
                  height: 200,
                  width: 200,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                    Container(
                    width: 50,
                    child:
                    ClipOval(
                      clipper: MyRectClipper(),
                      child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                    ),
                    ),]
                  )
              ))),
*/
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 36,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child:
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 32,
                    child:
                      Align(
                        alignment: Alignment.center,
                        heightFactor: 0.5, //切り抜き後の高さ/元の高さ
                        child: ClipOval(
                          clipper: MyRectClipper(),
                          //clipper: CustomUpperClipper(),
                          child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                        ),
                      ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.2, //切り抜き後の高さ/元の高さ
                child: ClipOval(
                  clipper: MyRectClipper(),
                  child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                ),
              ),
SizedBox(height: 10,),
              Container(
                clipBehavior: Clip.antiAlias,
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child:
                Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.2, //
                  child: // 切り抜き後の高さ/元の高さ
                  ClipOval(
                    //clipper: MyClipper(),
                    clipper: MyRectClipper(),
                    child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                  ),
                )
              ),
/*
              ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg',
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                ),
              ),
*/

            /*
              PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  elevation: 5.0,
                  child: Image.network(
                    'https://equal-love.jp/image/profile/otani_emiri.jpg',
                    width: 150,
                    height: 120,
                    fit: BoxFit.cover,
                  )),
*/
/*
              SizedBox(
                width: 60,
                height: 60,
                child:
                  Container(
                    color: Colors.black,
                    child:
                      ClipOval(
                        //clipper: MyClipper(),
                        clipper: MyRectClipper(),
                        child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                      ),
                  )
              )
              */
              /*
              Center(child:
                ClipOval(
                  //clipper: MyClipper(),
                  clipper: MyRectClipper(),
                  child: Image.network('https://equal-love.jp/image/profile/otani_emiri.jpg'),
                ),
              ),*/



            ],
          ),
        )
    );
  }
}

class CustomUpperClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.width / 2),
        radius: size.width / 2
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    //複数回異なるインスタンスを作るような場合はtrue、この場合false
    return false;
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


class MyClipper extends CustomClipper<Rect>{

  MyClipper();

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width/2, size.width/2),
        radius: size.width/2
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
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