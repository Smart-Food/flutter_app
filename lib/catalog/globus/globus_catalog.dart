
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/catalog/globus/alcohol.dart';
import 'package:flutterapp/catalog/globus/breads.dart';
import 'package:flutterapp/catalog/globus/house.dart';
import 'package:flutterapp/maps/full_map.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/catalog/globus/discounts/screens/home_screen.dart';
import 'dart:convert';
import '../searchPage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget { // Главная страница приложения
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
      LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
//            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false, // Убрана надпись Debug
              title: 'SmartFood',
              home: GlobusCatalog(),
            );
          },
        );
      },
    );
  }
}

class GlobusCatalog extends StatefulWidget {
  GlobusCatalog({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GlobusCatalogState createState() => _GlobusCatalogState();
}

class _GlobusCatalogState extends State<GlobusCatalog> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this); // Количество разделов в каталоге
  }
  @override
  Widget build(BuildContext context) { // Получение ширины экрана
    int totalCount = 0;
    cart.forEach((item){
      totalCount = totalCount + item.num;
    });
    return Scaffold(
        backgroundColor: Colors.white,
//      actions: <Widget>[
//        FlatButton.icon(onPressed: (){
//          AuthService().logOut(); //  выход из аккаунта
//        },
//            icon: Icon(Icons.supervised_user_circle), // иконка выхода
//            label: SizedBox.shrink() // shrink делает объект незаметным,
//          // применяется там где не используются обязательные параметры
//        )
//      ],
      body: FutureBuilder(builder: (context, snapshot){
      var productList1=json.decode(snapshot.data.toString());
      List<Product> productList = [];
      productList1.forEach((item) {
        productList.add(Product(name: item['name'],brand: item['name'],price: item['price'],picture: item['picture'],));
      });

        return Column(
          children: <Widget>[
            Padding( // Меню магазинов и корзина
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              child: Row(
                children: <Widget>[
                  Container( // иконка меню магазинов
                    child: IconButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FullMapPage()
                        )),
                        icon: Icon(Icons.menu),
                        color: Colors.black
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.65,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        children: <Widget>[

                          Text("Поиск", style: TextStyle( // текст поисковой строки и его параметры
                              color: Colors.grey,
                              fontSize: 16.8,
                              fontFamily: 'OpenSans'
                          ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.search, color: Colors.black, size: 24),
                            onPressed: () {showSearch(context: context, delegate: ProductSearch(productList));},
                          ) // иконка поисковой строки // M
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Stack( // иконка корзины
                    children:<Widget>[
                      IconButton(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShoppingCart(cart)
                      )),
                      icon: Icon(Icons.shopping_cart),
                      color: Colors.black
                    ),
                      Positioned(
                          child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.red[700]),
                              Positioned(
                                  top: 3.0,
                                  right: 7,
                                  child: Center(
                                    child: Text('$totalCount',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                              ),
                            ],
                          )
                      ),
                    ]
                  ),
                ],
              ),
            ),
            //SizedBox(height: 20), // отступ для поисковой строки
            /*Padding( // поисковая строка
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child:
            ),*/
            SizedBox(height: 20),
            TabBar( // меню каталога товаров

                controller: tabController,
                indicatorColor: Colors.green,
                indicatorWeight: 3.0,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text("Главная", style: TextStyle(
                        fontSize: 17.5,
                        fontFamily: 'OpenSans'
                    ),),
                  ),
                  Tab(
                    child: Text("Хлеб, кондитерские изделия", style: TextStyle(
                        fontSize: 17.5,
                        fontFamily: 'OpenSans'
                    ),),
                  ),
//                Tab(
//                  child: Text("Косметика и гигиена", style: TextStyle(
//                      fontSize: 17.5,
//                      fontFamily: 'OpenSans'
//                  ),),
//                ),
                  Tab(
                    child: Text("Дом, хобби, техника", style: TextStyle(
                        fontSize: 17.5,
                        fontFamily: 'OpenSans'
                    ),),
                  ),
                  Tab(
                    child: Text("Алкогольные напитки", style: TextStyle(
                        fontSize: 17.5,
                        fontFamily: 'OpenSans'
                    ),),
                  ),
                ]),
            Expanded( // переход по разделам товаров
              child: Container(
                child: TabBarView(
                    controller: tabController,

                    children: <Widget>[
                      //HomeScreen(),
                      Products(),
                      Breads(),
//                    Cosmetics(),
                      House(),
                      Alcohol(),
                    ]),
              ),
            )
          ],
        );
  },future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
    ));
  }
}