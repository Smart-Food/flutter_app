import 'package:flutter/material.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/registration/cart.dart';
import 'package:provider/provider.dart';
void main() => runApp(ProductInfoMain());
class ProductInfoMain extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    /*return MaterialApp(
      //debugShowCheckedModeBanner: false, // стандарт от Google
      home: ProductInfo(),
    );*/

     return ChangeNotifierProvider<Cart>(
        create: (context){return Cart();},
        child: MaterialApp(
          debugShowCheckedModeBanner: false,  // стандарт от Google
          home: Consumer<Cart> (
            builder: (context,whatever,child) {return ProductInfo();},
            //ProductInfo()
          ),
        )
    );
    /*return ChangeNotifierProvider<Cart>(
      create: (context) => new Cart(),
      child: Consumer<Cart>(
        builder: (context,cart,_)
        { return MaterialApp(
        //debugShowCheckedModeBanner: false, // стандарт от Google
        home: ProductInfo(),
      );}
      )
    );*/


    /*return ChangeNotifierProvider<Cart>.value(
        value: Cart(),
        child: MaterialApp(
          //debugShowCheckedModeBanner: false,  // стандарт от Google
          home: ProductInfo(),
            //ProductInfo()
          ),
        );*/
  }
}
class ProductInfo extends StatefulWidget {
  String name,
      brand,
      picture;
  double price ,
      value,
      oldPrice;
  int id;
  ProductInfo({ Key key,
    this.name, this.id, this.oldPrice, this.picture,
    this.value, this.price, this.brand
}):super(key:key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {

  @override
  Widget build(BuildContext context) {
    Cart bloc = Provider.of<Cart>(context);
    /*int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }*/

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Text('Продукт ' + widget.id.toString()),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ), onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ShoppingCart()))
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(widget.picture),
                //child: Text('Цена: ' + widget.price.toString()),
              )),
            height: 300.0,
          ),
         /* GestureDetector(
              onTap: () {
                bloc.addToCart(widget);
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    //image: AssetImage("assets/${index + 1}.jpg"),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              )
          ),*/
          RaisedButton(
            splashColor: Theme.of(context).primaryColor,
            highlightColor: Theme.of(context).primaryColor,
            color: Colors.white,
            child: Text('Добавить в корзину'),
            //style : TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20),
            onPressed: () {
                //var bloc = Provider.of<Cart>(context, listen: false);
                bloc.addToCart(widget);
            },
          )
        ],
      ),
    );
  }
}