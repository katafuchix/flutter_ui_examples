import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageExampleScreen extends StatefulWidget {
  @override
  _NetworkImageExampleScreenState createState() => _NetworkImageExampleScreenState();
}

class _NetworkImageExampleScreenState extends State<NetworkImageExampleScreen> {

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
            NetworkImageTopThirdAvatar(
              imageUrl: 'https://equal-love.jp/image/profile/otani_emiri.jpg', // Replace with your image URL
            )
          ),
        ),
      ),

      )
    );

  }
}

class NetworkImageTopThirdAvatar extends StatefulWidget {
  final String imageUrl;

  const NetworkImageTopThirdAvatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _NetworkImageTopThirdAvatarState createState() => _NetworkImageTopThirdAvatarState();
}

class _NetworkImageTopThirdAvatarState extends State<NetworkImageTopThirdAvatar> {
  ui.Image? _image;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final response = await http.get(Uri.parse(widget.imageUrl));
    final Uint8List bytes = response.bodyBytes;
    final image = await decodeImageFromList(bytes);

    // Calculate dimensions for top 1/3 of the image
    final double targetHeight = image.height.toDouble() / 2.0;
    final Rect topThirdRect = Rect.fromLTWH(0, 0, image.width.toDouble(), targetHeight);
    //final Rect topThirdRect = Rect.fromLTWH(image.width.toDouble() / 6.5, 0, image.width.toDouble() / 1.5, image.width.toDouble() / 1.5);

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    canvas.drawImageRect(image, topThirdRect, Rect.fromPoints(Offset.zero, Offset(image.width.toDouble(), targetHeight)), Paint());

    final croppedImage = await recorder.endRecording().toImage(image.width, targetHeight.toInt());

    setState(() {
      _image = croppedImage;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : FutureBuilder<Uint8List>(
      future: _imageToByteData(_image!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          return CircleAvatar(
            backgroundImage: MemoryImage(snapshot.data!),
            radius: 50,
          );
        }
        return Container();
      },
    );
  }

  Future<Uint8List> _imageToByteData(ui.Image image) async {
    final ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png) ?? ByteData(0);
    return byteData.buffer.asUint8List();
  }

}