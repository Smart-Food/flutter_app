import 'package:flutter/material.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/products/productInfo.dart';
import 'domain/user.dart';
import 'login.dart';
import 'maps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String, WidgetBuilder> staticRoutes = {
    '/': (context) => MyHomePage(title: 'SmartFood'),
  };


  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = Map();
    routes.addAll(staticRoutes);
    return StreamProvider<User>.value(
        value: AuthService().currentUser,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SmartFood',
          theme: ThemeData(
              primaryColor: Color.fromRGBO(50, 65, 85, 1),
              textTheme: TextTheme(title: TextStyle(color:  Colors.white))
          ),
          initialRoute: '/',
            routes: {
              '/':(BuildContext context) => MyHomePage(),
              '/CCList':(BuildContext context) => CCList(),
              '/InfoAboutProduct':(BuildContext context) => InfoAboutProduct(),
            },
            // ignore: missing_return
            onGenerateRoute: (routeSettings) {
              var path = routeSettings.name.split('/');
              if (path[1] == 'InfoAboutProduct') {
                return MaterialPageRoute(
                  builder: (context) => InfoAboutProduct(id:path[2]),
                  settings: routeSettings,
                );
              }
            },
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
        title: Text(title !=null? title:'SmartFood'),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            AuthService().logOut();
          },
              icon: Icon(Icons.supervised_user_circle),
              label: SizedBox.shrink())
        ],
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Image.network('https://im0-tub-ru.yandex.net/i?id=81d989f22df4cd58bdea6bd59c4ce2d1&n=13&exp=1', width: 70, height: 50),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CCList())),
            ),
            RaisedButton(
              //child: Text('Регистрация'),
              child: Image.network('https://im0-tub-ru.yandex.net/i?id=c4d28986a4cc08245787991e0cce8b02&n=13&exp=1', width: 70, height: 50),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Login())),
            ),
            RaisedButton(
              child: Image.network('https://im0-tub-ru.yandex.net/i?id=51a93fe94f96a8b88001a1523577d1a1&n=13&exp=1', width: 70, height: 50),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SmartMaps())),
            ),
          ],
        ),
      ),
    );
  }
}

//Padding(
//padding: EdgeInsets.only(top: 35),
//child: Container(
//child: Align(
//child: Text('', style: TextStyle(
//fontWeight: FontWeight.bold,
//fontSize: 45,
//color: Colors.white
//)),
//),
//),
//),