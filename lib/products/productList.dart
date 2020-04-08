import 'package:flutter/material.dart';
import 'package:flutterapp/products/productInfo.dart';
import 'product.dart';
import 'dart:convert';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

//var productList = jsonDecode('data.json');
List<ProductInfo> cart = [];
double sum = 0;
class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {
    return Scaffold( // отображение страницы
        appBar: AppBar( //панель виджетов на странице
          title: Text('Продукты'), // заголовок
        ),
        body: new Center (
            child: FutureBuilder(builder: (context, snapshot){ // тип данных Future - работа с
              var productList=json.decode(snapshot.data.toString()); // данными, когда они будут доступны
              return GridView.builder(
                gridDelegate: // контролирует расположение объектов GridView
                new SliverGridDelegateWithFixedCrossAxisCount( // таблица расположений
                                            // с фиксированным набором колонок / строк
                    crossAxisCount: 2), // два объекта по горизонтали
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
            }, future: DefaultAssetBundle.of(context).loadString("assets/data.json"), // загрузка
            ),                                                             // данных из JSON-файла
        ),
        );
  }
}