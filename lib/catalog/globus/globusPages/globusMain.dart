import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/catalog/story.dart';
import 'package:flutterapp/animation/fadeAnimation.dart';

class GlobusMain extends StatefulWidget {
  final String logo, shop;
  const GlobusMain ({ Key key, this.logo, this.shop }): super(key: key);

  _State createState() => _State();
}

class _State extends State<GlobusMain> {

  double _scrollOffsetY = 0;
  List<Story> _stories = [
    Story(
      "https://clck.ru/N8Wo6",
      "Успей",
      "купить",
    ),
    Story(
      "https://clck.ru/N8Wrd",
      "Социальная",
      "скидка",
    ),
    Story(
      "https://clck.ru/N8WsL",
      "Скидки",
      "по карте",
    ),
    Story(
      "https://clck.ru/N8Wsi",
      "Бонусы",
      "по карте",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0-_scrollOffsetY*0.5,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.bottomCenter,
                child: Image.network(widget.logo),
              )
          ),
          Positioned(
              top: 0-_scrollOffsetY,
              left: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  height: 440,
                  child: Image.network(widget.shop)
              )
          ),
          NotificationListener<ScrollNotification>(
            // ignore: missing_return
            onNotification: (notification) {
              _scrollOffsetY = notification.metrics.pixels;
              setState(() {});
            },
            child: ListView.builder(
                padding: EdgeInsets.only(top: 400),
                itemCount: 5,
                itemExtent: 200.0,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
//                          margin: EdgeInsets.symmetric(vertical: 10,),
                            height: 160,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.white,
                            ),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: _stories.map((story) {
                                return Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FadeAnimation(
                                      1,
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15,
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