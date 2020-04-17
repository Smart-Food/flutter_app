import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: House(),
    );
  }
}

class House extends StatefulWidget {
  House({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _HouseState createState() => _HouseState();
}

class _HouseState extends State<House> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}