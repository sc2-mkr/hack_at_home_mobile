import 'package:flutter/material.dart';
import 'package:hackathome/Utility/BasketItem.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';

import '../main.dart';

class BasketItemDetail extends StatefulWidget {
  BasketItemDetail(this.item);

  final BasketItem item;

  @override
  BasketItemDetailState createState() => BasketItemDetailState();
}

class BasketItemDetailState extends State<BasketItemDetail> {
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
    return Column(
      children: <Widget>[
        Text(widget.item.getName())
      ],
    );
  }
}