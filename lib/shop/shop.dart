import 'dart:convert';
import 'package:flutterapp/shop/shopTabbar/shopMenu.dart';
import 'package:flutterapp/data.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/shop/shopTabbar/shopMain.dart';
import 'package:flutterapp/maps/full_map.dart';
import 'package:flutterapp/login/login.dart';
import 'package:flutterapp/payments/main.dart';
import 'searchPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return MaterialApp(
              debugShowCheckedModeBanner: false, // Убрана надпись Debug
              title: 'SmartFood',
              home: Shop(),
            );
          },
        );
      },
    );
  }
}

int navbarIndex = 0;
int shopIndex = 0;

class Shop extends StatefulWidget {
  final String logo, shop;
  final String title, fileName;
  const Shop ({ Key key, this.logo, this.shop, this.title, this.fileName }): super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> with TickerProviderStateMixin{
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
                      shopIndex = 0;
                    });
                  },
                  child: Center(
                    child: Text("Глобус", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                      shopIndex = 1;
                    });
                  },
                  child: Center(
                    child: Text("Метро", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                      shopIndex = 2;
                    });
                  },
                  child: Center(
                    child: Text("Ашан", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                      shopIndex = 3;
                    });
                  },
                  child: Center(
                    child: Text("Лента", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  FutureBuilder(builder: (context, snapshot){
//  var productList1=json.decode(snapshot.data.toString());
//  List<Product> productList = [];
//  productList1.forEach((item) {
//  productList.add(Product(name: item['name'],brand: item['name'],price: item['price'],picture: item['picture'],));
//  });


//  },future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
//    ));

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
            child: FutureBuilder(builder: (context, snapshot){
            var productList1 = json.decode(snapshot.data.toString());
              List<Product> productList = [];
              productList1.forEach((item) {
               productList.add(Product(name: item['name'],brand: item['name'],price: item['price'],picture: item['picture'],));
            }); return Column(
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
                        SizedBox(width: 10,),
                        GestureDetector(
                          child: Container(
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
                          onTap: () {showSearch(context: context, delegate: ProductSearch(productList));},
                        ),
                        Spacer(),
                        Stack( // иконка корзины
                            children:<Widget>[
                              IconButton(
                                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ShoppingCart()
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
                      indicatorColor: dataList[shopIndex].shopColor,
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
                          child: Text("Каталог", style: TextStyle(
                              fontSize: 17.5,
                              fontFamily: 'OpenSans'
                          ),),
                        ),
                        Tab(
                          child: Text("Акции", style: TextStyle(
                              fontSize: 17.5,
                              fontFamily: 'OpenSans'
                          ),),
                        ),
                        Tab(
                          child: Text("Собственное производство", style: TextStyle(
                              fontSize: 17.5,
                              fontFamily: 'OpenSans'
                          ),),
                        ),
                      ]
                      ),
                  Expanded( // переход по разделам товаров
                    child: Container(
                      child: TabBarView(
                          controller: tabController,
                          children: <Widget>[
                            ShopMain(logo: widget.logo, shop: widget.shop),
                            ShopMenu(),
                            Products(fileName: 'alcohol.json'),
                            Products(fileName: 'breads.json',),
                          ]),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      color: dataList[shopIndex].shopColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:40.0, right: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                  Icons.home,
                                  size: 20,
                                  color: navbarIndex == 0 ? Colors.black : Colors.white
                              ),
                              onPressed: () {
                                setState(() {
                                  navbarIndex = 0;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Shop(logo: 'NBAfH', shop: 'NBAQv', fileName: 'data.json'),
                                ));
                              }
                          ),
                          IconButton(
                              icon: Icon(
                                  Icons.map,
                                  size: 20,
                                  color: navbarIndex == 1 ? Colors.black : Colors.white
                              ),
                              onPressed: () {
                                setState(() {
                                  navbarIndex = 1;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FullMapPage(),
                                ));
                              }
                          ),
                          IconButton(
                              icon: Icon(
                                  Icons.credit_card,
                                  size: 20,
                                  color: navbarIndex == 2 ? Colors.black : Colors.white
                              ),
                              onPressed: () {
                                setState(() {
                                  navbarIndex = 2;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Payment(),
                                ));
                              }
                          ),
                          IconButton(
                              icon: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: navbarIndex == 3 ? Colors.black : Colors.white
                              ),
                              onPressed: () {
                                setState(() {
                                  navbarIndex = 3;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                ]
            );
            },future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
    )),

        ),

      );
  }
}