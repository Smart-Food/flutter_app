import 'package:flutter/material.dart';

import 'CCList.dart';

class CCTracker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartFood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CCList(),
    );
  }
}

void main() => runApp(CCTracker());

