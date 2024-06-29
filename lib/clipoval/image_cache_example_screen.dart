import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class ImageCacheExampleScreen extends StatefulWidget {
  @override
  _ImageCacheExampleScreenState createState() => _ImageCacheExampleScreenState();
}

class _ImageCacheExampleScreenState extends State<ImageCacheExampleScreen> {

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
          child:
          /*
        NetworkImageTopThirdAvatar(
          imageUrl: 'https://equal-love.jp/image/profile/otani_emiri.jpg', // Replace with your image URL
        )*/


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
    ImageCropDisplay(
                    imageUrl: 'https://equal-love.jp/image/profile/otani_emiri.jpg', // Replace with your image URL
                  )
              ),
            ),
          ),

        )
    );

  }
}

class ImageCropDisplay extends StatefulWidget {
  final String imageUrl;

  ImageCropDisplay({required this.imageUrl});

  @override
  _ImageCropDisplayState createState() => _ImageCropDisplayState();
}

class _ImageCropDisplayState extends State<ImageCropDisplay> {
  Future<Uint8List?> _fetchAndCropImage() async {
    final ImageStream imageStream = NetworkImage(widget.imageUrl).resolve(ImageConfiguration.empty);
    final Completer<ui.Image> completer = Completer<ui.Image>();
    void imageListener(ImageInfo info, bool _) {
      completer.complete(info.image);
      imageStream.removeListener(ImageStreamListener(imageListener));
    }
    imageStream.addListener(ImageStreamListener(imageListener));

    final ui.Image image = await completer.future;
    final int height = (image.height / 2).toInt();

    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final Paint paint = Paint();

    canvas.drawImageRect(
      image,
      Rect.fromLTRB(0, 0, image.width.toDouble(), height.toDouble()),
      Rect.fromLTRB(0, 0, image.width.toDouble(), height.toDouble()),
      paint,
    );

    final ui.Image croppedImage = await recorder.endRecording().toImage(image.width, height);
    final ByteData? byteData = await croppedImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _fetchAndCropImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data != null) {
          return CircleAvatar(
            backgroundImage: MemoryImage(snapshot.data!),
            radius: 50,
          );
        } else {
          return Text('No image data');
        }
      },
    );
  }
}