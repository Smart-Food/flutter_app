import 'package:flutter/material.dart';
import 'mapbox_gl.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'page.dart';
import 'dart:math';
import 'page.dart';

class FullMapPage extends ExamplePage {
  FullMapPage()
      : super(const Icon(Icons.map), 'Full screen map');

  @override
  Widget build(BuildContext context) {
    return const FullMap();
  }
}

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}



class FullMapState extends State<FullMap> {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(57.6299, 39.8737),
    zoom: 11.0,
  );

  MapboxMapController mapController;
  bool _myLocationEnabled = true;
  MyLocationTrackingMode _myLocationTrackingMode = MyLocationTrackingMode.Tracking;
  CameraPosition _position = _kInitialPosition;
  bool _isMoving = false;
  bool _compassEnabled = true;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  String _styleString = MapboxStyles.MAPBOX_STREETS;
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = true;
  bool _zoomGesturesEnabled = true;
  bool _telemetryEnabled = true;
  double _distanceRemaining;
  double _durationRemaining;
  bool _arrived = false;
  int _symbolCount = 0;
  MapboxNavigation _directions;
  initState(){
    _directions = MapboxNavigation(onRouteProgress: (arrived) async{
      _distanceRemaining = await _directions.distanceRemaining;
      _durationRemaining = await _directions.durationRemaining;
      setState((){
        _arrived = arrived;
      });
      if(arrived) await _directions.finishNavigation();
    });
  }
  final home = Location(name: 'Home', latitude:57.633720,longitude: 39.862031);
  final magaz = Location(name: 'Magnit',latitude:57.621942,longitude: 39.847892);
  void _add(String iconImage) {
    mapController.addSymbol(
      SymbolOptions(
        geometry: LatLng(
          mapController.cameraPosition.target.latitude + sin(_symbolCount * pi / 6.0) / 20.0,
          mapController.cameraPosition.target.longitude + cos(_symbolCount * pi / 6.0) / 20.0,
        ),
        iconImage: iconImage,
      ),
    );
    setState(() {
      _symbolCount += 1;
    });
  }
  
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context){
    //mapController.setMapLanguage("name_Russian");
    //mapController.matchMapLanguageWithDeviceDefault();
    return Scaffold(
        appBar: AppBar(
          title: Text('Карты'),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: <Widget>[
            MapboxMap(

              onMapCreated: _onMapCreated,
              initialCameraPosition:_kInitialPosition,
              myLocationEnabled: _myLocationEnabled,
              myLocationTrackingMode: _myLocationTrackingMode,
              myLocationRenderMode: MyLocationRenderMode.GPS,
             // onMapClick:  ,


            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.add_circle, color: Colors.green),
                iconSize: 50,
                onPressed: (){
                  mapController.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
              ),
            ),
            Positioned(
              top: 75,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.green),
                iconSize: 50,
                onPressed: (){
                  mapController.animateCamera(
                    CameraUpdate.zoomBy(-0.5),
                  );
                },
              )
            ),
            Positioned(
                top: 140,
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.my_location, color: Colors.green),
                  iconSize: 50,
                  onPressed: (){
                    mapController.requestMyLocationLatLng();

                  },
                )
            ),
            /*Positioned(
              top:140,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.directions_car, color: Colors.green),
                iconSize: 50,
                onPressed: (){
                  await _directions.startNavigation(
                    origin: home,
                    destination: magaz,
                    mode: NavigationMode.walking,
                    simulateRoute: true,
                    language: "Russian"
                  );
                },
              ),
            )*/
          ]
        )
    );
  }
}
