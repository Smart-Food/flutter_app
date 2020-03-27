import 'package:flutter/material.dart';
import 'product.dart';
import 'dart:convert';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

//var productList = jsonDecode('data.json');


class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Продукты'),
        ),
        body: new Center (
            child: FutureBuilder(builder: (context, snapshot){
              var productList=json.decode(snapshot.data.toString());
              return GridView.builder(
                itemCount: productList.length,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index){
                  return Product(
                    id: productList[index]["id"],
                    name: productList[index]["name"],
                    picture: productList[index]["picture"],
                    oldPrice: productList[index]["oldPrice"],
                    price: productList[index]["price"],
                  );
                },
              );
            }, future: DefaultAssetBundle.of(context).loadString("assets/data.json"),

            ),
        ),
        );
  }
}