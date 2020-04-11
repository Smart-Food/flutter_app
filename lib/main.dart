import 'package:flutter/material.dart';
import 'package:flutterapp/SizeConfig.dart';
import 'package:flutterapp/catalog/alcohol.dart';
import 'package:flutterapp/catalog/breads.dart';
import 'package:flutterapp/catalog/house.dart';
import 'package:flutterapp/catalog/cosmetics.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/services/payment.dart';
import 'login/login.dart';
import 'maps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // Главная страница приложения
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false, // Убрана надпись Debug
              title: 'SmartFood',
              home: MyHomePage(),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this); // Количество разделов в каталоге
  }

  @override
  Widget build(BuildContext context) { // Получение ширины экрана
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
      body: Column(
        children: <Widget>[
          Padding( // Меню магазинов и корзина
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.menu, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,), // иконка меню магазинов
                Spacer(),
                Container(
                  child: IconButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShoppingCart(cart, sum)
                    )),
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.black,
//                    size: 6 * SizeConfig.imageSizeMultiplier,
                  ),
                ), // иконка корзины
              ],
            ),
          ),
          SizedBox(height: 5 * SizeConfig.heightMultiplier,), // отступ для поисковой строки
          Padding( // поисковая строка
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                        fontSize: 2.4 * SizeConfig.textMultiplier,
                        fontFamily: 'OpenSans'
                    ),),
                    Spacer(),
                    Icon(Icons.search, color: Colors.black, size: 6 * SizeConfig.imageSizeMultiplier,) // иконка поисковой строки
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5 * SizeConfig.heightMultiplier,),
          TabBar( // меню каталога товаров
              controller: tabController,
              indicatorColor: Colors.green,
              indicatorWeight: 3.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text("Хлеб, кондитерские изделия", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
                Tab(
                  child: Text("Косметика и гигиена", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
                Tab(
                  child: Text("Дом, хобби, техника", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
                Tab(
                  child: Text("Алкогольные напитки", style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontFamily: 'OpenSans'
                  ),),
                ),
              ]),
          Expanded( // переход по разделам товаров
            child: Container(
              child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Breads(),
                    Cosmetics(),
                    House(),
                    Alcohol(),

                  ]),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          color: Colors.green,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:40.0, right: 40.0),
          child: Row( // Строка, которая объединяет кнопки в один объект
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: IconButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                        builder: (context) => Products() // Context - текущее окружение, Products - страница с продуктами
                    )),
                    icon: Icon(Icons.home),
                    color: Colors.white
                ),
              ),
              Container(
                child: IconButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SmartMaps()
                    )),
                    icon: Icon(Icons.map),
                    color: Colors.white
                ),
              ),
              Container(
                child: IconButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Payment()
                    )),
                    icon: Icon(Icons.payment),
                    color: Colors.white
                ),
              ),
              Container(
                child: IconButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login()
                    )),
                    icon: Icon(Icons.person),
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}