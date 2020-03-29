import 'package:flutter/material.dart';

class ProductInfo extends StatefulWidget {
  String name,
      brand,
      picture;
  double price ,
      value,
      oldPrice;
  int id;
  ProductInfo({
    this.name, this.id, this.oldPrice, this.picture,
    this.value, this.price, this.brand
});
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
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
              ), onPressed: () {})
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
          )
        ],
      ),
    );
  }
}