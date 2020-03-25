import 'package:flutter/material.dart';
import 'productList.dart';

class CCTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartFood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Products(),
    );
  }
}

void main() => runApp(CCTracker());

