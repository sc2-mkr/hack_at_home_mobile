import 'package:flutter/material.dart';
import 'package:hackathome/Utility/BasketItem.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';

import '../main.dart';
import 'ListItemDetail.dart';

class ShippingListDetail extends StatefulWidget {
  ShippingListDetail({Key key, this.basket}) : super(key: key);

  final List<BasketItem> basket;

  @override
  ShippingListDetailState createState() => ShippingListDetailState();
}

class ShippingListDetailState extends State<ShippingListDetail> {
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
    return ListView.builder(
        itemCount: widget.basket.length,
        itemBuilder: (context, index){
          NetworkImage image = null;
          try{
            image = NetworkImage("http://79.37.45.118:8080${widget.basket[index].getImagePath()}");
          }catch(e){
            image = null;
          }

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: image!=null?image:null,
              child: image==null?Icon(Icons.shopping_basket):null,
            ),
            title: Text("${widget.basket[index].getName()}"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListItemDetail(widget.basket[index])),
              );
            },
          );
        }
    );
  }
}