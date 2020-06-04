import 'package:flutter/material.dart';
import 'package:flutterapp/shop/shopTabBar/shopCatalog.dart';
import 'package:flutterapp/products/productList.dart';

int catalogPosition = 0;

class ShopMenu extends StatefulWidget {
  ShopMenu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopMenuState createState() => _ShopMenuState();
}

class _ShopMenuState extends State<ShopMenu> { // Меню приложения

  int selectedIndex = 0;

  PageController controller = PageController();

  final List<Widget> _children = [
    ShopCatalog(),
    Products(fileName: 'alcohol.json'),
  ];

  @override
  void initState() {
    super.initState();
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
            return Container(child: _children[catalogPosition]);
          },
          itemCount: 1, // Can be null
        ),
      ),
    );
  }
}