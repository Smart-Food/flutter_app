import 'package:flutterapp/animation/fadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/domain/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'signup.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[400]
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Вход", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Добро пожаловать домой", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        FadeAnimation(1.4, Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: input('Email', _emailController, false),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: input('Пароль', _passwordController, true),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 40,),
                        FadeAnimation(1.5, Text("Забыли пароль?", style: TextStyle(color: Colors.blue),)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.6, Container(
                            child: button("Войти", _loginAction, context)
                        )),
                        FadeAnimation(1.6, Container(
                          child: RaisedButton(
                            color: Colors.orange[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                              onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                                  builder: (context) => SignUp() // Context - текущее окружение, Products - страница с продуктами
                              )),
                            child: Center(
                              child: Text("Страница регистрации", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
}

Widget input(String hint, TextEditingController controller, bool obscure) {
  return Container(
    //padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1)
          ),
//          prefixIcon: Padding(
//            padding: EdgeInsets.only(left: 10, right: 10),
//            child: IconTheme(
//              data: IconThemeData(color:  Colors.white),
//              child: Text(''),
//            ),
//          )
      ),
    ),
  );
}

Widget button(String text, void func(), context) {
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