import 'package:flutter/material.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:flutterapp/services/payment.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';
import 'login/login.dart';
import 'maps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String, WidgetBuilder> staticRoutes = {
    '/': (context) => MyHomePage(title: 'SmartFood'), // Главная страница приложения
  };

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = Map();
    routes.addAll(staticRoutes);
    return StreamProvider<User>.value(
        value: AuthService().currentUser,
        child: MaterialApp(
          debugShowCheckedModeBanner: false, //Убрана надпись Debug
          title: 'SmartFood',
          theme: ThemeData(
              primaryColor: Color.fromRGBO(50, 65, 85, 1),
              textTheme: TextTheme(title: TextStyle(color:  Colors.white))
          ),
          initialRoute: '/',
          routes: routes,
        )
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) { // получение ширины экрана
    final double iconSize = MediaQuery.of(context).size.width * 0.2;
    //final double indentSize = MediaQuery.of(context).size.width * 0.045;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            AuthService().logOut(); //  выход из аккаунта
          },
              icon: Icon(Icons.supervised_user_circle), // иконка выхода
              label: SizedBox.shrink() // shrink делает объект незаметным,
            // применяется там где не используются обязательные параметры
          )
        ],
      ),
      body: Row( // строка, которая объединяет кнопки в один объект
          children: <Widget>[
      Container(
        width: iconSize,
        child: RaisedButton(
              child: Icon(
                Icons.fastfood,
                color: Colors.white),
              color: Theme.of(context).primaryColor,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                  builder: (context) => Products() // context - текущее окружение, Products - страница с продуктами
              )),
            ),),
      Container(
        width: iconSize,
           child: RaisedButton(
              child: Icon(
                  Icons.assignment_ind,
                  color: Colors.white
              ),
              color: Color.fromRGBO(50, 65, 85, 1),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Login()
              )),
            ),),
      Container(
        width: iconSize,
        child: RaisedButton(
              child: Icon(
                  Icons.map,
                  color: Colors.white
              ),
              color: Color.fromRGBO(50, 65, 85, 1),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SmartMaps()
              )),
            ),),
      Container(
        width: iconSize,
        child: RaisedButton(
              child: Icon(
                  Icons.payment,
                  color: Colors.white
              ),
              color: Color.fromRGBO(50, 65, 85, 1),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Payment()
              )),
            ),),
      Container(
        width: iconSize,
        child: RaisedButton(
              child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white
              ),
              color: Color.fromRGBO(50, 65, 85, 1),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShoppingCart(cart, sum)
              )),
            ),)
          ],
        ),
      );
  }
}
