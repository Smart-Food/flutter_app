import 'package:flutter/material.dart';
import 'existing-cards.dart';
import 'payment-service.dart';
import 'package:progress_dialog/progress_dialog.dart';

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
    );;
  }
}