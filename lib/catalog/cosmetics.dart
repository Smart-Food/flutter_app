import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Cosmetics(),
    );
  }
}

class Cosmetics extends StatefulWidget {
  Cosmetics({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _CosmeticsState createState() => _CosmeticsState();
}

class _CosmeticsState extends State<Cosmetics> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
