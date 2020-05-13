import 'package:flutter/material.dart';
import 'package:flutterapp/data.dart';
import 'package:flutterapp/shop/shop.dart';
import 'package:flutterapp/maps/full_map.dart';
import 'package:flutterapp/payments/main.dart';
import 'package:flutterapp/login/login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      dataList[shopIndex].shopColor,
                      dataList[shopIndex].gradientColor1,
                    ]
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 64.0),
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 100,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white60, width: 2.0)
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://sun9-49.userapi.com/c206816/v206816389/3fe46/TZuEZ_kzsNk.jpg"
                                  )
                              )
                          )
                        ]
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Илья Апальков",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white
                      )
                    ),
                    Text(
                        "Золотой пользователь",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white54
                        )
                    ),
                    SizedBox(height: 10.0),
                    MaterialButton(
                      onPressed: () {},
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: Text("Редактировать",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      )
                    )
                  ]
                )
              ),
              Align(
                alignment: Alignment(1.5, -1.1),
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings, color: Colors.white)
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 350.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)
                    )
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 250.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) => Card(
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.restaurant,
                              size: 60
                            ),
                            Text(
                              "Card Name",
                              style: TextStyle(fontWeight: FontWeight.bold)
                            )
                          ]
                        )
                      )
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                    ),
                  ),
                )
              )
            ]
        )
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