import 'package:flutter/material.dart';
import 'package:flutterapp/products/productList.dart';
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
    final double iconSize = MediaQuery.of(context).size.width * 0.172;
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
            RaisedButton(
              child: Icon(
                Icons.fastfood,
                color: Colors.white,
                  size: iconSize),
              color: Color.fromRGBO(50, 65, 85, 1),// url картинки, ширина и высота
              onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                  builder: (context) => Products() // context - текущее окружение, CCList - страница с продуктами
              )),
            ),
            RaisedButton(
              child: Icon(
                  Icons.assignment_ind,
                  color: Colors.white,
                  size: iconSize),
              color: Color.fromRGBO(50, 65, 85, 1),// url картинки, ширина и высота
              onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                  builder: (context) => Login() // context - текущее окружение, CCList - страница с продуктами
              )),
            ),
            RaisedButton(
              child: Icon(
                  Icons.map,
                  color: Colors.white,
                  size: iconSize),
              color: Color.fromRGBO(50, 65, 85, 1),// url картинки, ширина и высота
              onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                  builder: (context) => SmartMaps() // context - текущее окружение, CCList - страница с продуктами
              )),
            ),
            //Padding(padding: new EdgeInsets.only(left: indentSize)),
            RaisedButton(
              child: Icon(
                  Icons.payment,
                  color: Colors.white,
                  size: iconSize),
              color: Color.fromRGBO(50, 65, 85, 1),// url картинки, ширина и высота
              onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                  builder: (context) => Payment() // context - текущее окружение, CCList - страница с продуктами
              )),
            ),
          //payment
          ],
        ),
      );
  }
}
