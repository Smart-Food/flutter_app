import 'package:flutter/material.dart';
import 'package:flutterapp/products/productInfo.dart';

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
    return Card(
      child: Hero(
          tag: widget.id,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductInfo(
                  name: widget.name, id:widget.id, picture: widget.picture,
                  value: widget.value, brand: widget.brand,
                  oldPrice: widget.oldPrice, price: widget.price,
                )
              )),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        widget.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        widget.price.toString() + 'р',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        widget.oldPrice.toString() + 'р',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration:TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.network(widget.picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}