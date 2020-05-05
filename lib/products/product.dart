import 'package:flutter/material.dart';
import 'package:flutterapp/products/productInfo.dart';
class Product extends StatefulWidget { // класс, который может обновляться
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
    return Card( // виджет, отвечающий за отображение информации
      child: Hero( // виджет, отвечающий за анимацию
          tag: widget.id,
          child: Material(
            child: InkWell( // область ответственная за касания пользователя
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductInfo(
                  name: widget.name, // передача параметров в класс ProductInfo
                  id:widget.id, // widget - класс Product
                  picture: widget.picture,  
                  value: widget.value, 
                  brand: widget.brand,
                  oldPrice: widget.oldPrice, 
                  price: widget.price,
                )
              )),
              child: GridTile( // прокручиваемая таблица с виджетами
                  footer: Container( // footer - виджет GridTile
                    color: Colors.white70, // цвет с непрозрачностью 70
                    child: ListTile( // список фиксированной длины, содержащий текст
                      leading: Text(
                        widget.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        '$widget.price' + 'р',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800), // 
                      ),
                      subtitle: Text(
                        '$widget.oldPrice' + 'р',
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