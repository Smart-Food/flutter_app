import 'package:flutter/material.dart';
class Product extends StatelessWidget{
  String name,
      brand,
      picture;
  double price ,
      value,
      oldPrice;
  int id;
  Product({this.name, this.brand, this.price, this.value, this.picture, this.oldPrice, this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: id,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$oldPrice",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration:TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.network(picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
