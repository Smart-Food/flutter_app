import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productInfo.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/registration/cart.dart';
//import 'dart:convert';


class ShoppingCart extends StatelessWidget{
  ShoppingCart({Key key}):super(key:key);

  Widget build(BuildContext context) {
    var bloc = Provider.of<Cart>(context);
    var cart = bloc.cart;
    //var productList=json.decode(snapshot.data.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Корзина"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          ProductInfo giftIndex = cart.keys.toList()[index];
          int count = cart[giftIndex];

          return ListTile(
            leading: Container(
              height: 70,
              width: 70,

              decoration: BoxDecoration(
                image: DecorationImage(
                 //image: Image.network(giftIndex.picture),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            //title: Text('Item Count: $count'),
            title: Text('${giftIndex.name}'),
            trailing: RaisedButton(
              child: Text('Clear'),
              color: Theme.of(context).buttonColor,
              elevation: 1.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                bloc.clear(giftIndex);
              },
            ),
          );
        },
      ),
    );
  }

}

