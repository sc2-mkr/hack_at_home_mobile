import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:hackathome/Pages/ShippingListDetail.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/GetBasketFromServer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';
import 'package:hackathome/Utility/variableBasket.dart';

import '../main.dart';

class ShippingList extends StatefulWidget {
  ShippingList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ShippingListState createState() => ShippingListState();
}

class ShippingListState extends State<ShippingList> {
  @override
  Widget build(BuildContext context) {
    return StatusBarCleaner(
        color: SC2Theme.darkmainColor,
        child: Scaffold(
          backgroundColor: SC2Theme.backgroundColor,
          appBar: AppBar(title: Text(MyApp().title),),
          drawer: getDrawer(),
          body: getBody(),
        )
    );
  }

  getBody(){
    return FutureBuilder<List<variableBasket>>(
      future: GetBasketFromServer.fetch(),
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(snapshot.data[index].getUserName()),
                  subtitle: Text("${snapshot.data[index].getAddress()} - ${snapshot.data[index].getCity()}"),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShippingListDetail(basket: snapshot.data[index])),
                    );
                  },
                );
              },
          );
        }else{
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}