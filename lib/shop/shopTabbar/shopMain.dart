import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/animation/fadeAnimation.dart';
import 'package:flutterapp/data.dart';
import 'package:flutterapp/shop/shop.dart';

class ShopMain extends StatefulWidget {
  final String logo, shop;
  const ShopMain ({ Key key, this.logo, this.shop }): super(key: key);

  _ShopState createState() => _ShopState();
}

class _ShopState extends State<ShopMain> {

  double _scrollOffsetY = 0;

  @override
  Widget build(BuildContext context) {
    var shopPage = dataList[shopIndex];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0-_scrollOffsetY*0.25,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                child: Image.asset(shopPage.imageLogo),
              )
          ),
          Positioned(
              top: 0-_scrollOffsetY,
              left: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  height: 370,
                  child: Image.asset(shopPage.imageShop)
              )
          ),
          NotificationListener<ScrollNotification>(
            // ignore: missing_return
            onNotification: (notification) {
              _scrollOffsetY = notification.metrics.pixels;
              setState(() {});
            },
            child: ListView.builder(
                padding: EdgeInsets.only(top: 350),
                itemCount: 5,
                itemExtent: 200.0,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 160,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.white,
                            ),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: shopPage.stories.map((story) {
                                return Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FadeAnimation(
                                      1,
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(70),
                                          border: Border.all(
                                            width: 3,
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            2,
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(70),
                                            child: Image(
                                              image: NetworkImage(story.image),
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(story.name1),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(story.name2),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                      : Container(
                    color: Colors.white,
                    child: Placeholder(),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}