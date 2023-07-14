import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Location2 extends StatefulWidget {
  const Location2({super.key});

  @override
  State<Location2> createState() => _Location2State();
}

class _Location2State extends State<Location2> {
  // final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // Completer<GoogleMapController> _controller = Completer();

  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //     print("ERROR" + error.toString());
  //   });
  //   return await Geolocator.getCurrentPosition();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Stack(children: [
            // GoogleMap(
            //   mapType: MapType.hybrid,
            //   initialCameraPosition: CameraPosition(
            //     target: LatLng(20.42796133580664, 80.885749655962),
            //     zoom: 14.4746,
            //   ),
            //   myLocationButtonEnabled: true,
            //   compassEnabled: true,
            //   onMapCreated: (controller) {
            //     _controller.complete(controller);
            //   },
            // ),
          ]),
        ),
      ),
    );
  }
}
