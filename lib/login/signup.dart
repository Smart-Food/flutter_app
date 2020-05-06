import 'package:flutterapp/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/domain/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'config.dart';
import 'login.dart';
import 'auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
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
                colors: signupColors
            )
        ),
        child: Column(
          crossAxisAlignment: start,
          children: <Widget>[
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: start,
                children: <Widget>[
                  FadeAnimation(1, Text("Регистрация", style: TextStyle(color: Colors.white, fontSize: 40))),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Введите логин, email и пароль", style: TextStyle(color: white, fontSize: 18))),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: white,
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
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: shadowColor,
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
                        SizedBox(height: 40),
                        FadeAnimation(1.5, Text("Забыли пароль?", style: TextStyle(color: Colors.blue),)),
                        SizedBox(height: 20),
                        FadeAnimation(1.6, Container(
                            child: _button("Зарегистрироваться", _registerAction, context),
                        )),
                        FadeAnimation(1.6, Container(
                          child: RaisedButton(
                            color: orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Login()
                            )),
                            child: Center(
                              child: Text("Страница авторизации", style: TextStyle(color: white, fontWeight: bold)),
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
  void _registerAction() async {
    _email = _emailController.text;
    _password = _passwordController.text;

    if (_email.isEmpty || _password.isEmpty) return;

    User user = await _authService.registerWithEmailAndPassword(_email.trim(), _password.trim());
    if (user == null) {
      Fluttertoast.showToast(
          msg: "Ошибка регистрации",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: red,
          textColor: white,
          fontSize: 16.0
      );
    } else {
      _emailController.clear();
      _passwordController.clear();
    }
  }
}

Widget _button(String text, void func(), context) {
  return RaisedButton(
    splashColor: blue,
    highlightColor: blue,
    color: Colors.white,
    child: Text(
        text,
        style: TextStyle(fontWeight: bold, color: blue, fontSize: 20)
    ),
    onPressed: () {
      func();
    },
  );
}