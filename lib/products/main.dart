import 'package:flutter/material.dart';
import 'productList.dart';

class CCTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // приложение, использующее material design
      debugShowCheckedModeBanner: false,  // стандарт от Google
      title: 'SmartFood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Products(),
    );
  }
}

void main() => runApp(CCTracker());