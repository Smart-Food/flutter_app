
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  final cart;
  double sum;
  ShoppingCart(this.cart, this.sum);
  @override
  _ShoppingCart createState() => _ShoppingCart(cart, sum);
}

class _ShoppingCart extends State<ShoppingCart> {
  @override
  final cart;
  double sum;
  _ShoppingCart(this.cart, this.sum);
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Корзина'),
        ),
        body: ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
          controller: ScrollController(),
          itemCount: cart.length,
          itemBuilder: (context, index){
            return /*Dismissible(
              key: Key(cart[index].toString()),
              onDismissed: (direction){
                setState(() {


                sum = sum - cart[index].price*cart[index].num;
                cart.removeAt(index);
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Продукт был удалён")));});
              },
              background: Container(
                color: Colors.red,
              ),
              child:*/ ListTile(
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
                    setState(() {
                      sum = sum - cart[index].price*cart[index].num;
                      cart.removeAt(index);
                    });
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Продукт был удалён")));

                    },
                ),
              );
            //);
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
        ),
        Divider(),
        Text("Total : \$$sum"),
        RaisedButton(
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Theme.of(context).primaryColor,
          color: Colors.white,

          child: Text('Оплатить',
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20)),

          onPressed: () {

            },
        )
      ],
    )
    );
  }

}