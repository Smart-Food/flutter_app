import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Alcohol(),
    );
  }
}

class Alcohol extends StatefulWidget {
  Alcohol({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _AlcoholState createState() => _AlcoholState();
}

class _AlcoholState extends State<Alcohol> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}