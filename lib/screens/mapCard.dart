import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late GoogleMapController _controller;

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(24.903623, 67.198367));

  final List<Marker> markers = [];

  addMarker(cordinate){

    int id = Random().nextInt(100);

    setState(() {
      markers.add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(
      initialCameraPosition: _initialPosition,
      mapType: MapType.normal,
      onMapCreated: (controller){
        setState(() {
          _controller = controller;
        });
      },
      markers: markers.toSet(),
      onTap: (cordinate){
        _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
        addMarker(cordinate);
      },
    ),

    floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}