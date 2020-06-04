import 'package:flutter/material.dart';
import 'home.dart';


class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата'),
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
                case 2:
                  icon = Icon(Icons.history, color: Colors.green);
                  text = Text('История покупок');
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
            itemCount: 3
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