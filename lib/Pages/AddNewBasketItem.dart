import 'package:flutter/material.dart';
import 'package:hackathome/Pages/BasketItemDetail.dart';
import 'package:hackathome/Pages/NewOrder.dart';
import 'package:hackathome/Utility/Basket.dart';
import 'package:hackathome/Utility/BasketItem.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';

import '../main.dart';

class AddNewBasketItem extends StatefulWidget {

  @override
  AddNewBasketItemState createState() => AddNewBasketItemState();
}

class AddNewBasketItemState extends State<AddNewBasketItem> {
  String name = "";

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (text){
              name = text;
            },
            decoration: InputDecoration(
                hintText: 'Nome del prodotto'
            ),
          ),
        ),
        RaisedButton(
          textColor: Colors.white,
          child: Text("AGGIUNGI"),
          color: Colors.blue,
          onPressed: (){
            Basket.entries.insert(0,BasketItem(name: name));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NewOrder()),
            );
          },
        )
      ],
    );
  }
}