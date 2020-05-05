import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';
import 'login.dart';
import 'main.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? MyHomePage() : AuthorizationPage(); // если пользователь не вошел в приложение
  }                                                         //     перебрасывает на страницу авторизации
}