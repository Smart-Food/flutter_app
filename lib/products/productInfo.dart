import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/products/productList.dart';


class ProductInfo extends StatefulWidget {

  Product product;
  ProductInfo({ Key key,this.product}):super(key:key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {


  @override
  Widget build(BuildContext context) {
    int totalCount = 0;
    cart.forEach((item){
      totalCount = totalCount + item.num;
    });
    Product prod = widget.product;
    return Scaffold(
      key: Key(prod.num.toString()),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Text(prod.name),
        actions: <Widget>[
          Stack(

            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShoppingCart(cart)))
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
          )
            ]
          ),


      body: ListView(
        children: <Widget>[
          Container(
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(prod.picture),
                //child: Text('Цена: ' + widget.price.toString()),
              )),
            height: 300.0,
          ),
          RaisedButton(
            splashColor: Theme.of(context).primaryColor,
            highlightColor: Theme.of(context).primaryColor,
            color: Colors.white,
            child: Text('Добавить в корзину'),
            //style : TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20),
            onPressed: () { setState((){
              if(cart.contains(prod)){
                prod.num += 1;
              }
              else {
                cart.add(prod); //update
                prod.num = 1;
              }
              sum = 0;
              cart.forEach((item){
                sum = sum + item.num*item.price;

              });});
                //var bloc = Provider.of<Cart>(context, listen: false);
                //bloc.addToCart(widget);
            },
          )
        ],
      ),
    );
  }

}