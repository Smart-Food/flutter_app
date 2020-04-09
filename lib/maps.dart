import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'main.dart';

class SmartMaps extends StatefulWidget {
  @override
  _SmartMapsState createState() => new _SmartMapsState();
}

class _SmartMapsState extends State<SmartMaps> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:  AppBar(
            title: new Text('SmartFood Maps'),
            leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApp()))
            ),),
          body: Maps()
        );
  }
}

class Maps extends StatefulWidget {
@override
_MapState createState() => new _MapState();
}

class _MapState extends State<Maps> {
  GoogleMapController mapController;
  static const _initialPosition = LatLng(12.92, 77.02);
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};


  @override
  Widget build(BuildContext context) {
       return Stack(
        children: <Widget>[
          GoogleMap(initialCameraPosition: CameraPosition(
              target: _initialPosition, zoom: 10),
            onMapCreated: onCreated,
            myLocationEnabled: true,
            mapType: MapType.normal,
          )
        ],
      );
  }
  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}



