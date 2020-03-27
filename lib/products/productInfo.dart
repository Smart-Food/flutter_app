import 'package:flutter/material.dart';
import 'package:flutterapp/products/productList.dart';
class InfoAboutProduct extends StatefulWidget {
  String _id;
  InfoAboutProduct({String id}): _id = id;

  @override
  _InfoAboutProduct createState() => _InfoAboutProduct(id:_id);
}

class _InfoAboutProduct extends State<InfoAboutProduct> {
  String _id;
  _InfoAboutProduct({String id}): _id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Информация о продукте $_id'),
        )
    );}
}