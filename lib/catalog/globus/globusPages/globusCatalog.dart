import 'package:flutter/material.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/catalog/globus/globusPages/globusMenu.dart';
import 'package:flutterapp/animation/fadeAnimation.dart';

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
              home: GlobusCatalog(),
            );
          },
        );
      },
    );
  }
}

class GlobusCatalog extends StatefulWidget {
  final String title;
  GlobusCatalog({Key key, this.title}) : super(key: key);

  @override
  _GlobusCatalogState createState() => _GlobusCatalogState();
}

class _GlobusCatalogState extends State<GlobusCatalog> {

  @override
  Widget build(BuildContext context) {
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
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Алкоголь", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Бакалея", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Всё для автомобилей и дачи", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Всё для сада и огорода", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                      ],
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
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FadeAnimation(
                          1,
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                globusPosition = 1;
                              });
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => GlobusMenu()));
                            },
                            child: _buildProductCard("Собственное производство", "assets/globusCatalog/globusPng/Собственное производство.png", 0xffC4D4A3, 0XffE0E8CF),
                          ),
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
      width: 170,
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
              width: 120,),
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