import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'dart:convert';
class Products extends StatefulWidget {
  final String fileName;
  const Products ({ Key key, this.fileName }): super(key: key);
  @override
  _ProductsState createState() => _ProductsState();
}

List<Product> cart = [];
List<Product> history = [];
double sum = 0;

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    return Scaffold( // отображение страницы
      body: new Center (
        child: FutureBuilder(builder: (context, snapshot){ // тип данных Future - работа с
          var productList = json.decode(snapshot.data.toString()); // данными, когда они будут доступны
          return ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return Product( // создание класса Product из Json-файла
                id: productList[index]["id"],
                name: productList[index]["name"],
                picture: productList[index]["picture"],
                oldPrice: productList[index]["oldPrice"],
                price: productList[index]["price"],
              );
            },
            itemCount: productList.length,  // количество продуктов
          );
        }, future: DefaultAssetBundle.of(context).loadString('assets/' + widget.fileName), // загрузка
        ),                                                             // данных из JSON-файла
      ),
    );
  }
}