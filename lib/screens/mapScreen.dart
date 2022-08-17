import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
   Completer<GoogleMapController> _controller = Completer();


  static const initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late GoogleMapController _googleMapController;
  //Variables de positions de depart et de position d arrivee
  late Marker _origin;
  late Marker _destination;

  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value) => null).onError((error, stackTrace){ print('error'+error.toString());} );

    return await Geolocator.getCurrentPosition();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    _googleMapController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      //GoogleMap Widget
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition:initialCameraPosition ,
        onMapCreated: (controller)=>_googleMapController = controller,
      //  markers: {
         // if(_origin != null) _origin,
          //if(_destination != null) _destination,


     //   },
        //onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          getUserCurrentLocation().then(
                  (value){
                    print('my location');
                    print(
                        value.latitude.toString() +''+ value.longitude.toString()
                    );
                  }
                  );
          },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }
  void _addMarker(LatLng pos){
    if( _origin == null || ( _origin !=null && _destination !=null)){
      setState((){
        _origin= Marker(
            markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,

        );
        //initialisation de la destination
        //_destination = null;
      });
    }else{
      setState((){

        _destination= Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,

        );
        //initialisation de la destination
        //_destination = null;
      });

    }

  }
}

