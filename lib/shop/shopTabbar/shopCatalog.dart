import 'package:flutter/material.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/animation/fadeAnimation.dart';
import 'package:flutterapp/data.dart';
import 'package:flutterapp/shop/shopTabbar/shopMenu.dart';
import 'package:flutterapp/shop/shop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: ShopCatalog(),
            );
          },
        );
      },
    );
  }
}

class ShopCatalog extends StatefulWidget {
  final String title;
  ShopCatalog({Key key, this.title}) : super(key: key);

  @override
  _ShopCatalogState createState() => _ShopCatalogState();
}

class _ShopCatalogState extends State<ShopCatalog> {
  @override
  Widget build(BuildContext context) {
    var cardColumn1 = dataList[shopIndex].cardsColumn1;
    var cardColumn2 = dataList[shopIndex].cardsColumn2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: cardColumn1.map((item) => Column(
                        children: <Widget>[
                          FadeAnimation(
                            1,
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  catalogPosition = 1;
                                });
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => ShopMenu()));
                              },
                              child: _buildProductCard(item.cardName, item.cardImage, item.cardColor1, item.cardColor2),
                            ),
                          ),
                          SizedBox(height: 8)
                        ],
                      )).toList(),
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          Container(
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color(0xffECEDF1)
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Text("Весенний сюрприз", style: TextStyle(
                                        fontFamily: 'OpenSans-Bold',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 10.5
                                    ),),
                                    SizedBox(height: 10.0,),
                                    Text("CКИДКА 40%", style: TextStyle(
                                        fontFamily: 'OpenSans-Bold',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17.5
                                    ),),
                                    SizedBox(height: 10.0,),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5.0),
                                          border: Border.all(color: Colors.green)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("По промокоду", style: TextStyle(
                                            color: Colors.green,
                                            fontFamily: 'OpenSans',
                                            fontSize: 11.9,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Text("Используйте код выше для покупок весенней акции",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'OpenSans-Bold',
                                          fontSize: 9.8,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    SizedBox(height: 30.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Column(
                          children: cardColumn2.map((item) => Column(
                            children: <Widget>[
                              FadeAnimation(
                                1,
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      catalogPosition = 1;
                                    });
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => ShopMenu()));
                                  },
                                  child: _buildProductCard(item.cardName, item.cardImage, item.cardColor1, item.cardColor2),
                                ),
                              ),
                              SizedBox(height: 8)
                            ],
                          )).toList(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildProductCard(String name, String asset, int color, int color2) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(color2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add, color: Colors.grey,),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
              height: 120,
              width: 120),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(name, style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontWeight: FontWeight.bold,
                fontSize: 17.5
            ),),
          ),
          SizedBox(height: 16)
        ],
      ),
    );
  }
}