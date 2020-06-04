import 'package:flutterapp/animation/fadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/domain/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterapp/data.dart';
import 'package:flutterapp/shop/shop.dart';
import 'package:flutterapp/maps/full_map.dart';
import 'package:flutterapp/payments/main.dart';
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
                colors: [
                  dataList[shopIndex].gradientColor1,
                  dataList[shopIndex].gradientColor2,
                  dataList[shopIndex].gradientColor3,
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1, Text("Регистрация", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.3, Text("Введите логин, email и пароль", style: TextStyle(color: Colors.white, fontSize: 18),)),
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
                            child: _button("Зарегистрироваться", _registerAction, context),
                        )),
                        FadeAnimation(1.6, Container(
                          child: RaisedButton(
                            color: dataList[shopIndex].gradientColor3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            onPressed: () => Navigator.of(context).push(MaterialPageRoute( // Навигатор осуществляет переход по страницам
                                builder: (context) => Login() // Context - текущее окружение, Products - страница с продуктами
                            )),
                            child: Center(
                              child: Text("Страница авторизации", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
      bottomNavigationBar: Container(
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

//Widget _input(String hint, TextEditingController controller, bool obscure) {
//  return Container(
//    //padding: EdgeInsets.only(left: 20, right: 20),
//    child: TextField(
//      controller: controller,
//      obscureText: obscure,
//      style: TextStyle(fontSize: 20, color: Colors.black),
//      decoration: InputDecoration(
//        hintStyle: TextStyle(color: Colors.grey),
//        hintText: hint,
//        focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Colors.white, width: 3)
//        ),
//        enabledBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Colors.white54, width: 1)
//        ),
////          prefixIcon: Padding(
////            padding: EdgeInsets.only(left: 10, right: 10),
////            child: IconTheme(
////              data: IconThemeData(color:  Colors.white),
////              child: Text(''),
////            ),
////          )
//      ),
//    ),
//  );
//}