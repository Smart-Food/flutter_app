import 'package:flutter/material.dart';
import 'productData.dart';
import 'data.dart';
import 'package:flutterapp/products/productInfo.dart';

//import 'package:http/http.dart' as http;
//import 'dart:convert';
class CCList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
      ),
      body: Container(
          child: ListView(
            children: _buildList(context),
          )
      ),
//
//      ),
    );
  }

  List<Widget> _buildList(context) {
    return data.map((CCData f) =>
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/InfoAboutProduct/${f.id}'!=null?'/InfoAboutProduct/${f.id}':'null');
          },
          title: Text(f.name),
          subtitle: Text(f.brand),
          leading: CircleAvatar(child: Text(f.value.toString())),
          trailing: Text('${f.price}P'),

        )).toList();
  }
}