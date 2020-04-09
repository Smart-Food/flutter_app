import 'package:flutter/material.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../domain/user.dart';
import '../main.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {

    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 35)
      );
    }

    Widget _button(String text, void func(), context) {
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20)
        ),
        onPressed: () {
          func();
        },
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                  data: IconThemeData(color:  Colors.white),
                  child: icon,
                ),
              )
          ),
        ),
      );
    }


    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top:  5),
              child: _input(Icon(Icons.email), 'Email', _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input(Icon(Icons.lock), 'Пароль', _passwordController, true),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func, context),
              ),
            )
          ],
        )
      );
    }

    void _loginAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;
      
      if (_email.isEmpty || _password.isEmpty) return;
      
      User user = await _authService.signInWithEmailAndPassword(_email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Ошибка входа",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      User user = await _authService.registerWithEmailAndPassword(_email.trim(), _password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: "Ошибка рецистрации",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Container(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: <Widget>[
              _logo(),
              (
                  showLogin
                  ? Column(
                    children: <Widget>[
                      _form('Войти', _loginAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text('Нет аккаунта? Регистрация', style: TextStyle(fontSize: 20, color: Colors.white)),
                          onTap: () {
                            setState(() {
                              showLogin = false;
                          });
                        }
                        ),
                      )
                    ],
                  )
                  : Column(
                    children: <Widget>[
                      _form('Зарегистрироваться', _registerAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                            child: Text('Есть аккаунт? Вход',
                                style: TextStyle(fontSize: 20, color: Colors.white)),
                            onTap :() {
                        setState(() {
                        showLogin = true;
                        });
                        }
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        appBar: AppBar(
        automaticallyImplyLeading: true,
        title:  Text('Sign in / Sign out'),
        leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyApp()))),)
      ),
    );
  }
}

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(title: TextStyle(color:  Colors.white))
      ),
      home: AuthorizationPage(),
    );
  }
}
