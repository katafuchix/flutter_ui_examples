import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../base/base_stateful_widget.dart';
//import '../components/snack_bar.dart';
//import '../app.dart';

class MapExampleScreenResult {
  final String message;
  MapExampleScreenResult(this.message);
}

class MapExampleScreen extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapExampleScreenState();
  }
}


class _MapExampleScreenState extends State<MapExampleScreen> {
  // マップビューの初期位置
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0)); // 追加
  // マップの表示制御用
  late GoogleMapController mapController; // 追加

  @override
  Widget build(BuildContext context) {
    // 画面の幅と高さを決定する
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Map examples'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Stack(
          children: <Widget>[
            // 追加
            GoogleMap(
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ],
        ),
      ),
    );
  }
}
