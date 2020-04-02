import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'main.dart';

class MapsHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MapsHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:  AppBar(
            automaticallyImplyLeading: true,
            title: new Text('SmartFood Maps'),
            leading: IconButton(
              icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyApp()))
            ),),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(57.625580, 39.891392), minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(57.631380, 39.889960),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
              ])
            ]));
  }
}