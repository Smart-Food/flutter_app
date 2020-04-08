import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productInfo.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/registration/cart.dart';



/*class ShoppingCart extends StatelessWidget{
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

}*/
class ShoppingCart extends StatelessWidget {

  final cart;
  final double sum;
  ShoppingCart(this.cart, this.sum);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Корзина'),
        ),
        body: ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text(cart[index].name),
              subtitle: Text(cart[index].num.toString()),
              /*trailing: Text("\$${cart[index].price*cart[index].num}",
                style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),*/
              trailing: IconButton(
                icon: Icon(
                  Icons.delete ,
                  color: Colors.red,
                ),
                onPressed:() {
                  cart.removeAt(index);

                  },
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: cart.length,
          shrinkWrap: true,
        ),
        Divider(),
        Text("Total : \$$sum"),
        RaisedButton(
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Theme.of(context).primaryColor,
          color: Colors.white,
          child: Text('Оплатить'),
          //style : TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20),
          onPressed: () {

            },


        )

      ],
    )
    );
  }
}

