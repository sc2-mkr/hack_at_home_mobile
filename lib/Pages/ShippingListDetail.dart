import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathome/Utility/AcceptJob.dart';
import 'package:hackathome/Utility/BasketItem.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';
import 'package:hackathome/Utility/variableBasket.dart';

import '../main.dart';
import 'ListItemDetail.dart';

class ShippingListDetail extends StatefulWidget {
  ShippingListDetail({Key key, this.basket}) : super(key: key);

  final variableBasket basket;

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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 32,right: 32,bottom: 16),
          child: Center(child: Text(widget.basket.getUserName(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0,left: 32,right: 32),
          child: Center(child: Text(widget.basket.getAddress(),style: TextStyle(fontSize: 16))),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0,left: 32,right: 32),
          child: Center(child: Text(widget.basket.getCity(),style: TextStyle(fontSize: 14))),
        ),
        RaisedButton(
          child:Text("ACCETTA"),
          onPressed: (){
            AcceptJob.accept(widget.basket.getListID(),2);
          },
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.basket.getEntries().length,
              itemBuilder: (context, index){
                NetworkImage image = null;
                try{
                  image = NetworkImage("http://79.37.45.118:8080${widget.basket.getEntries()[index].getImagePath()}");
                }catch(e){
                  image = null;
                }

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: image!=null?image:null,
                    child: image==null?Icon(Icons.shopping_basket):null,
                  ),
                  title: Text("${widget.basket.getEntries()[index].getName()}"),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListItemDetail(widget.basket.getEntries()[index])),
                    );
                  },
                );
              }
          ),
        ),
      ],
    );
  }
}