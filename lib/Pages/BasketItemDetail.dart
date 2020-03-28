import 'package:flutter/material.dart';
import 'package:hackathome/Utility/BasketItem.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';

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
        color: Colors.blue[700],
        child: Scaffold(
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