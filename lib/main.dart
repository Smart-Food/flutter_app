import 'package:flutterapp/Animation/FadeAnimation.dart';
//import 'package:flutterapp/menu.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutterapp/onboarding/onboarding.dart';

void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage()
    )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );

    _scaleAnimation = Tween<double>(
        begin: 1.0,
        end: 30.0
    ).animate(_scaleController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(child: Onboarding(), type: PageTransitionType.fade));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scaleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.6),
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.3),
                  ]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(1, Text("Добро пожаловать в приложение SmartFood.",
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, height: 1.1),)),
              SizedBox(height: 30,),
              FadeAnimation(1.2, Text("Мы поможем вам заказать самые свежие продукты из супермаркетов",
                style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 25, fontWeight: FontWeight.w100),)),
              SizedBox(height: 150,),
              FadeAnimation(1.4, InkWell(
                onTap: () {
                  setState(() {
                    hide = true;
                  });
                  _scaleController.forward();
                },
                child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green[700]
                        ),
                        child: hide == false ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("Найти ближайший магазин", style: TextStyle(color: Colors.white, fontSize: 17),),
                            Icon(Icons.arrow_forward, color: Colors.white,)
                          ],
                        ) : Container(),
                      ),
                    )
                ),
              )),
              SizedBox(height: 60,)
            ],
          ),
        ),
      ),
    );
  }
}