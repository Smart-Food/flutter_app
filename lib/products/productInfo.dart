import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/products/product.dart';

class ProductInfo extends StatefulWidget {
  Product product;
  ProductInfo({ Key key,this.product}):super(key:key);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    int totalCount = 0;
    cart.forEach((item){
      totalCount = totalCount + item.num;
    });
    Product prod = widget.product;
    return Scaffold(
      key: Key(prod.num.toString()),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: prod.picture,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: NetworkImage(prod.picture),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        Stack( // иконка корзины
                            children:<Widget>[
                              IconButton(
                                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ShoppingCart()
                                  )),
                                  icon: Icon(Icons.shopping_cart),
                                  color: Colors.black
                              ),
                              Positioned(
                                  child: Stack(
                                    children: <Widget>[
                                      Icon(Icons.brightness_1,
                                          size: 20.0, color: Colors.red[700]),
                                      Positioned(
                                          top: 3.0,
                                          right: 7,
                                          child: Center(
                                            child: Text('$totalCount',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                      ),
                                    ],
                                  )
                              ),
                            ]
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      prod.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.info,
                          size: 15.0,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          prod.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
//                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    prod.name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      prod.price.toString() + 'р',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'за штуку',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              prod.name,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            _buildRatingStars(5),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
//                                Container(
//                                  padding: EdgeInsets.all(5.0),
//                                  width: 70.0,
//                                  decoration: BoxDecoration(
//                                    color: Theme.of(context).accentColor,
//                                    borderRadius: BorderRadius.circular(10.0),
//                                  ),
//                                  alignment: Alignment.center,
//                                  child: Text(
//                                    activity.startTimes[0],
//                                  ),
//                                ),
//                                SizedBox(width: 10.0),
//                                Container(
//                                  padding: EdgeInsets.all(5.0),
//                                  width: 70.0,
//                                  decoration: BoxDecoration(
//                                    color: Theme.of(context).accentColor,
//                                    borderRadius: BorderRadius.circular(10.0),
//                                  ),
//                                  alignment: Alignment.center,
//                                  child: Text(
//                                    activity.startTimes[1],
//                                  ),
//                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(prod.picture, height: 110, width: 110),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:flutterapp/products/product.dart';
//import 'package:flutterapp/registration/shoppingCart.dart';
//import 'package:flutterapp/products/productList.dart';
//
//
//class ProductInfo extends StatefulWidget {
//
//  Product product;
//  ProductInfo({ Key key,this.product}):super(key:key);
//  @override
//  _ProductInfoState createState() => _ProductInfoState();
//}
//
//class _ProductInfoState extends State<ProductInfo> {
//
//
//  @override
//  Widget build(BuildContext context) {
//    int totalCount = 0;
//    cart.forEach((item){
//      totalCount = totalCount + item.num;
//    });
//    Product prod = widget.product;
//    return Scaffold(
//      key: Key(prod.num.toString()),
//      appBar: AppBar(
//          elevation: 0.1,
//          backgroundColor: Colors.blue,
//          title: Text(prod.name),
//          actions: <Widget>[
//            Stack(
//
//                children: <Widget>[
//                  IconButton(
//                      icon: Icon(
//                        Icons.shopping_cart,
//                        color: Colors.white,
//                      ),
//                      onPressed: () => Navigator.of(context).push(
//                          MaterialPageRoute(builder: (context) => ShoppingCart(cart)))
//                  ),
//                  Positioned(
//                      child: Stack(
//                        children: <Widget>[
//                          Icon(Icons.brightness_1,
//                              size: 20.0, color: Colors.red[700]),
//                          Positioned(
//                              top: 3.0,
//                              right: 7,
//                              child: Center(
//                                child: Text('$totalCount',
//                                  style: TextStyle(
//                                      color: Colors.white,
//                                      fontSize: 12.0,
//                                      fontWeight: FontWeight.w500),
//                                ),
//                              )
//                          ),
//                        ],
//                      )
//                  ),
//                ]
//            )
//          ]
//      ),
//
//
//      body: ListView(
//        children: <Widget>[
//          Container(
//            child: GridTile(
//                child: Container(
//                  color: Colors.white,
//                  child: Image.network(prod.picture),
//                  //child: Text('Цена: ' + widget.price.toString()),
//                )),
//            height: 300.0,
//          ),
//          RaisedButton(
//            splashColor: Theme.of(context).primaryColor,
//            highlightColor: Theme.of(context).primaryColor,
//            color: Colors.white,
//            child: Text('Добавить в корзину'),
//            //style : TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20),
//            onPressed: () { setState((){
//              if(cart.contains(prod)){
//                prod.num += 1;
//              }
//              else {
//                cart.add(prod); //update
//                prod.num = 1;
//              }
//              sum = 0;
//              cart.forEach((item){
//                sum = sum + item.num*item.price;
//
//              });});
//              //var bloc = Provider.of<Cart>(context, listen: false);
//              //bloc.addToCart(widget);
//            },
//          )
//        ],
//      ),
//    );
//  }
//
//}