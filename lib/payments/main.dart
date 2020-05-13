import 'package:flutter/material.dart';
import 'existing-cards.dart';
import 'payment-service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/data.dart';
import 'package:flutterapp/shop/shop.dart';
import 'package:flutterapp/login/login.dart';
import 'package:flutterapp/maps/full_map.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Payment> {

  onItemPress(BuildContext context, int index) async {
    switch(index) {
      case 0:
        payViaNewCard(context);
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ExistingCardsPage()
        ));
    }
  }

  payViaNewCard(BuildContext context) async {
    cart = [];
    sum = 0;
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(
        message: 'Please wait...'
    );
    await dialog.show();
    var response = await StripeService.payWithNewCard(
        amount: '15000',
        currency: 'USD'
    );
    await dialog.hide();
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          duration: new Duration(milliseconds: response.success == true ? 1200 : 3000),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch(index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: Colors.green);
                  text = Text('Оплатить новой картой');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: Colors.green);
                  text = Text('Оплатить существующей');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: theme.primaryColor,
            ),
            itemCount: 2
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          color: dataList[shopIndex].shopColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:40.0, right: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(
                      Icons.home,
                      size: 20,
                      color: navbarIndex == 0 ? Colors.black : Colors.white
                  ),
                  onPressed: () {
                    setState(() {
                      navbarIndex = 0;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Shop(logo: 'NBAfH', shop: 'NBAQv', fileName: 'data.json'),
                    ));
                  }
              ),
              IconButton(
                  icon: Icon(
                      Icons.map,
                      size: 20,
                      color: navbarIndex == 1 ? Colors.black : Colors.white
                  ),
                  onPressed: () {
                    setState(() {
                      navbarIndex = 1;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FullMapPage(),
                    ));
                  }
              ),
              IconButton(
                  icon: Icon(
                      Icons.credit_card,
                      size: 20,
                      color: navbarIndex == 2 ? Colors.black : Colors.white
                  ),
                  onPressed: () {
                    setState(() {
                      navbarIndex = 2;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Payment(),
                    ));
                  }
              ),
              IconButton(
                  icon: Icon(
                      Icons.person,
                      size: 20,
                      color: navbarIndex == 3 ? Colors.black : Colors.white
                  ),
                  onPressed: () {
                    setState(() {
                      navbarIndex = 3;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}