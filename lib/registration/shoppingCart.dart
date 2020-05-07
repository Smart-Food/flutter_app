import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/products/productList.dart';
import '../payments/main.dart';
import 'package:flutterapp/animation/fadeAnimation.dart';

class ShoppingCart extends StatefulWidget {
  //final cart;
  //ShoppingCart(this.cart);
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  //final cart;
  //_ShoppingCartState(this.cart);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(
              0.5,
              Text(
                "Корзина",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
            ),
            ListView.separated(
              controller: ScrollController(),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: FadeAnimation(
                    1,
                    Row(
                      children: <Widget>[
                        Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.scaleDown,
                                      image: NetworkImage(cart[index].picture),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                )
                            )
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                  children: <Widget>[
                                    Container(
                                      width: 100.0,
                                      child: Text(
                                        cart[index].name,
                                        style: TextStyle(fontWeight: FontWeight.bold,),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete ,
                                        color: Colors.red,
                                      ),
                                      onPressed:() {
                                        setState(() {
                                          sum = sum - cart[index].price*(cart[index].num);
                                          cart.removeAt(index);
                                        });
                                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Продукт был удалён")));
                                      },
                                    ),
                                  ]
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(1.0),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.red,
                                        size: 15.0,
                                      ),
                                      onPressed:() {
                                        setState(() {
                                          if (cart[index].num != 0)
                                            cart[index].num -= 1;
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      (cart[index].num ).toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(1.0),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.red,
                                        size: 15.0,
                                      ),
                                      onPressed:() {
                                        setState(() {
                                          cart[index].num += 1;
                                        });
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                      cart[index].price.toString() + "р.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                );
              },
              separatorBuilder: (context, index){
                return Divider();
              },
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
            ),
            SizedBox(height: 21.0),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FadeAnimation(
                  1.5,
                  Text(
                    "Всего:",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.5,
                  Text(
                    sum.toString() + "р.",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FadeAnimation(
                  1.75,
                  Text(
                    "Оплата за доставку",
                    style: TextStyle(
                      fontSize: 14.0,
                    )
                  )
                ),
                FadeAnimation(
                  1.75,
                  Text(
                    "0р.",
                    style: TextStyle(
                      fontSize: 14.0,
                    )
                  )
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FadeAnimation(
                  2.0,
                  Text(
                    "Итог:",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
                FadeAnimation(
                  2.0,
                  Text(
                    sum.toString() + "р.",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )
                  )
                )
              ],
            ),
            Spacer(),
            FadeAnimation(
              2.0,
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Payment()));
                   // sum = 0;
                    //cart.removeRange(0, cart.length);
                },
                color: Colors.green,
                height: 50.0,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "Оформить заказ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  )
                )
              )
            ),
            SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }
}