import 'package:flutter/material.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';
import 'login.dart';
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
  Widget build(BuildContext context) {
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
      body: Container( // контейнер, в котором содержатся кнопки
        child: Row( // строка, которая объединяет кнопки в один объект
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Image.network('https://clck.ru/Mf43i', width: 70, height: 50), // url картинки, ширина и высота
              onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                  builder: (context) => Products() // context - текущее окружение, CCList - страница с продуктами
              )),
            ),
            RaisedButton(
              //child: Text('Регистрация'),
              child: Image.network('https://clck.ru/Mf49G', width: 70, height: 50),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Login() // страница регистрации/входа
                  )),
            ),
            RaisedButton(
              child: Image.network('https://clck.ru/Mf49x', width: 70, height: 50),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SmartMaps()  // карты
              )),
            ),
          ],
        ),
      ),
    );
  }
}