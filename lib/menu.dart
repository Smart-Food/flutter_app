import 'package:flutter/material.dart';
import 'package:flutterapp/catalog/globus/globusPages/globusMain.dart';
import 'package:flutterapp/maps/full_map.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutterapp/catalog/globus/globus.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutterapp/payments/main.dart';
import 'package:flutterapp/login/profileMenu.dart';

Color appColor = Colors.green;
Color appColor50 = Colors.green[50];

class Menu extends StatefulWidget {
  Menu({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> { // Меню приложения

  int selectedIndex = 0;

  PageController controller = PageController();

  List<GButton> tabs = new List();
  final List<Widget> _children = [
    Globus(logo: 'https://bit-ly.ru/AHOI', shop: 'https://bit-ly.ru/elXLDTr', fileName: 'data.json'),
    FullMapPage(),
    Payment(),
    ProfileMenu(),
  ];

  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(horizontal: 12, vertical: 5);
    double gap = 30;

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: appColor,
      iconColor: appColor,
      textColor: appColor,
      color: appColor50,
      iconSize: 24,
      padding: padding,
      icon: LineIcons.home,
      // textStyle: t.textStyle,
      text: 'Каталог',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: appColor,
      iconColor: appColor,
      textColor: appColor,
      color: appColor50,
      iconSize: 24,
      padding: padding,
      icon: LineIcons.map,
      // textStyle: t.textStyle,
      text: 'Карта',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: appColor,
      iconColor: appColor,
      textColor: appColor,
      color: appColor50,
      iconSize: 24,
      padding: padding,
      icon: LineIcons.credit_card,
      // textStyle: t.textStyle,
      text: 'Оплата',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: appColor,
      iconColor: appColor,
      textColor: appColor,
      color: appColor50,
      iconSize: 24,
      padding: padding,
      icon: LineIcons.user,
      // textStyle: t.textStyle,
      text: 'Профиль',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(child: _children[position],);
          },
          itemCount: tabs.length, // Can be null
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(color :Colors.white,boxShadow: [
              BoxShadow(spreadRadius: -10, blurRadius: 60, color: Colors.black.withOpacity(.20), offset: Offset(0,15))
            ]),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: GNav(
                  tabs: tabs,
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    print(index);
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.jumpToPage(index);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}