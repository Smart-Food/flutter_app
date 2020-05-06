import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/catalog/globus/alcohol.dart';
import 'package:flutterapp/catalog/globus/breads.dart';
import 'package:flutterapp/catalog/globus/house.dart';
import 'package:flutterapp/maps/full_map.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/catalog/globus/globusMain/globusMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
  final String logo, shop;
  final String title, fileName;
  const GlobusCatalog ({ Key key, this.logo, this.shop, this.title, this.fileName }): super(key: key);



  @override
  _GlobusCatalogState createState() => _GlobusCatalogState();
}

class _GlobusCatalogState extends State<GlobusCatalog> with TickerProviderStateMixin{
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
    tabController = TabController(length: 4, vsync: this); // Количество разделов в каталоге
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalCount = 0;
    cart.forEach((item){
      totalCount = totalCount + item.num;
    });

    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Menu(context),
          Dashboard(context),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (isCollapsed)
                        _controller.forward();
                      else
                        _controller.reverse();

                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Center(
                      child: RaisedButton(
                        child: Text("Глобус", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GlobusCatalog(logo: 'NBAyd', shop: 'NBAwq', fileName: 'breads.json')
                        )),
                      )
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (isCollapsed)
                        _controller.forward();
                      else
                        _controller.reverse();

                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Center(
                      child: RaisedButton(
                        child: Text("Ашан", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GlobusCatalog(logo: 'NBAfH', shop: 'NBAQv', fileName: 'alcohol.json')
                        )),
                      )
                  ),

                ),
                SizedBox(height: 10),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (isCollapsed)
                        _controller.forward();
                      else
                        _controller.reverse();

                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Center(
                      child: RaisedButton(
                        child: Text("Метро", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GlobusCatalog(logo: 'NBAfH', shop: 'NBAQv', fileName: 'data.json')
                        )),
                      )
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (isCollapsed)
                        _controller.forward();
                      else
                        _controller.reverse();

                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Center(
                      child: RaisedButton(
                        child: Text("Лента", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GlobusCatalog(logo: 'NBAfH', shop: 'NBAQv', fileName: 'breads.json')
                        )),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
            animationDuration: duration,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            elevation: 8,
            color: Colors.white,
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          child: Icon(Icons.menu, color: Colors.black),
                          onTap: () {
                            setState(() {
                              if (isCollapsed)
                                _controller.forward();
                              else
                                _controller.reverse();

                              isCollapsed = !isCollapsed;
                            });
                          },
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
//                            IconButton(
//                              icon: Icon(Icons.search, color: Colors.black, size: 24),
//                              onPressed: () {showSearch(context: context, delegate: ProductSearch(productList));},
//                            ) // иконка поисковой строки // M
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
//                                        child: Text('$totalCount',
//                                          style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 12.0,
//                                              fontWeight: FontWeight.w500),
//                                        ),
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
                            GlobusMain(logo: widget.logo, shop: widget.shop),
                            Products(fileName: widget.fileName),
                            Products(fileName: 'alcohol.json'),
                            Products(fileName: 'breads.json',),
                            //                    Cosmetics(),
                          ]),
                    ),
                  )
                ]
            )
        ),
      ),
    );
  }
}