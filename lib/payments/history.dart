import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/products/productList.dart';
import '../payments/main.dart';
import 'package:flutterapp/animation/fadeAnimation.dart';

class History extends StatefulWidget {
  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends State<History> {
  @override
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
                "История покупок",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
            ),
            ListView.separated(
              controller: ScrollController(),
              itemCount: history.length,
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
                                        image: NetworkImage(history[index].picture),
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
                                          history[index].name,
                                          style: TextStyle(fontWeight: FontWeight.bold,),
                                        ),
                                      ),
                                      Spacer(),
                                    ]
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        history[index].num.toString(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                        history[index].price.toStringAsFixed(2) + "р.",
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
                    sum.toStringAsFixed(2) + "р.",
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
                        sum.toStringAsFixed(2) + "р.",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}