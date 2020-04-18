import 'package:flutter/material.dart';
import 'package:flutterapp/products/productInfo.dart';
import 'package:flutterapp/products/productList.dart';

class Product extends StatefulWidget {
  String name,
      brand,
      picture;
  double price,
      value,
      oldPrice;
  int id;
  Product({
    this.name, this.brand, this.price, this.value,
    this.picture, this.oldPrice, this.id
  });

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    var prodHeight = MediaQuery.of(context).size.height * 0.198;
//    var prodWidth = prodHeight * 0.5;
    return Card(
      child: Hero(
          tag: widget.id,
          child: Material(
            child: InkWell(
              child: Container(
                height: prodHeight,
                child: ListTile(
                  trailing: IconButton(
                  icon: Icon(Icons.add), iconSize: 30,
                  tooltip: 'Добавить в корзину',
                  onPressed: () {}
                  ),
                  leading: Image.network(widget.picture),
                  title: Text(
                    widget.name + '\n' +  widget.price.toString() + 'р',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  subtitle: Text(
                    widget.oldPrice.toString() + 'р',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      decoration:TextDecoration.lineThrough),
                ),
              ),),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductInfo(
                    name: widget.name, id:widget.id, picture: widget.picture,
                    value: widget.value, brand: widget.brand,
                    oldPrice: widget.oldPrice, price: widget.price,
                  )
              )),
            ),
          )),
    );
  }
}