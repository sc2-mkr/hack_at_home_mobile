import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text(widget.item.getName(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image:FileImage(File(widget.item.getImagePath())),
                fit: BoxFit.cover
              ),
            ),
          ),
        )
      ],
    );
  }
}