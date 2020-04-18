import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productInfo.dart';
class ProductSearch extends SearchDelegate<Product>{
  final List<Product> productdata;
  ProductSearch(this.productdata);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? productdata
        : productdata.where((p) => p.name.contains(RegExp(query, caseSensitive: false))).toList();

    return ListView.separated(
      controller: ScrollController(),
      itemBuilder: (context, index){
        return ListTile(
          title: Text(suggestionList[index].name),
          subtitle: Text(suggestionList[index].brand.toString()),
          trailing: Text("\$${suggestionList[index].price}",
                  style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
          leading: Image.network(suggestionList[index].picture),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductInfo(product: Product(name: suggestionList[index].name, id:suggestionList[index].id, picture: suggestionList[index].picture,
                  value: suggestionList[index].value, brand: suggestionList[index].brand,
                  oldPrice: suggestionList[index].oldPrice, price: suggestionList[index].price,)),
              ),
            );
          },
        );
        //);
      },
      itemCount: suggestionList.length,
      separatorBuilder: (context, index){
        return Divider();
      },
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? productdata
        : productdata.where((p) => p.name.contains(RegExp(query, caseSensitive: false))).toList();


    return ListView.separated(
      controller: ScrollController(),
      separatorBuilder: (context, index){
          return Divider();
        },
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index){
      return ListTile(
        onTap: () {
          Navigator.push(
           context,
            MaterialPageRoute(
              builder: (context) => ProductInfo(product: Product(name: suggestionList[index].name, id:suggestionList[index].id, picture: suggestionList[index].picture,
                value: suggestionList[index].value, brand: suggestionList[index].brand,
                oldPrice: suggestionList[index].oldPrice, price: suggestionList[index].price,)),
            ),
          );
        },
        trailing: Text("\$${suggestionList[index].price}",
         style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].name.substring(0, query.length),
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index].name.substring(query.length),
                  style: TextStyle(color: Colors.grey)),
            ]),
        ),
        subtitle: Text(suggestionList[index].brand.toString()),
        leading: Image.network(suggestionList[index].picture),
     );},

      itemCount: suggestionList.length,
    );
  }

}