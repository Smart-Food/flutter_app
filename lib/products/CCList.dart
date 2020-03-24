import 'package:flutter/material.dart';
import 'CCData.dart';
import 'data.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
class CCList extends StatelessWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return CCListState();
//  }
//}
//
//class CCListState extends State<CCList> {
//  //List<CCData> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
      ),
      body: Container(
          child: ListView(
            children: _buildList(),
          )
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.refresh),
//        onPressed: () => _loadCC(),
//      ),
    );
  }
//  _loadCC() async {
//    //final response = await http.get('https://world.openfoodfacts.org/api/v0/product/04963406');
//      //final response = jsonDecode('data.json');
//      //if (response.statusCode == 200) { //success response from server
//        //print(response.body);
////    var allData = (json.decode(response
////    ) as Map) as Map<String, dynamic>;
//
//    var ccDataList = List<CCData>();
//    response.forEach((String key, dynamic val) {
//      var record = CCData(
//          firstName: val['firstName']);
//
//          ccDataList.add(record);
//        });
//        setState(() {
//          data = ccDataList;
//        });
//      //}
//    }
  List<Widget> _buildList() {
    return data.map((CCData f) =>
        ListTile(
          title: Text(f.name),
          subtitle: Text(f.brand),
          leading: CircleAvatar(child: Text(f.value.toString())),
          trailing: Text('${f.price}P'),
        )).toList();
  }
}