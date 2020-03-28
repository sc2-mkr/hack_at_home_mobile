import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathome/Pages/AddNewBasketItem.dart';
import 'package:hackathome/Pages/BasketItemDetail.dart';
import 'package:hackathome/Utility/Basket.dart';
import 'package:hackathome/Utility/Colorized.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';
import 'package:hackathome/main.dart';

class NewOrder extends StatefulWidget {
  NewOrder({Key key, this.title}) : super(key: key);

  final String title;

  @override
  NewOrderState createState() => NewOrderState();

}

class NewOrderState extends State<NewOrder> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState(){

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarCleaner(
        color: SC2Theme.darkmainColor,
        child: Scaffold(
          backgroundColor: SC2Theme.backgroundColor,
          appBar: AppBar(title: Text(MyApp().title),),
          body: returnPageView(),
        )
    );
  }

  returnPageView(){
    return PageView(
      physics: new NeverScrollableScrollPhysics(),
      controller: _controller,
      children: [
        Page1(0),
        Page1(1),
        Page1(2),
        Page1(3),
      ],
    );
  }

  _removeItem(index){
    Basket.removeEntries(index);
    setState(() {});
  }

  // ignore: non_constant_identifier_names
  Page1(int numPage){
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.separated(
              itemCount: Basket.getEntries().length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[700],
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BasketItemDetail(Basket.getEntries()[index])),
                      );
                    },
                    leading: Basket.getEntries()[index].getImagePath()==null ? CircleAvatar(
                      child: Icon(Icons.shopping_basket,color: SC2Theme.backgroundColor,),
                      backgroundColor: Colorized().getColor(index),
                    ):
                    CircleAvatar(
                      backgroundImage: FileImage(File(Basket.getEntries()[index].getImagePath())),
                    ),
                    title: Text(Basket.getEntries()[index].getName(),style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    trailing: InkWell(
                      onTap: (){_removeItem(index);},
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.red[700],
                        ),
                        child: Icon(Icons.delete,color: Colors.white,),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: SC2Theme.mainColor,
                    child: Text("AGGIUNGI",style: TextStyle(color: Colors.white, fontSize: 18),),
                    onPressed: (){
                      _addAndWait();
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Text("AVANTI",style: TextStyle(color: SC2Theme.mainColor, fontSize: 18),),
                  onPressed: (){_controller.animateToPage(numPage+1, duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,);
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: FlatButton(
                  child: Text("INDIETRO",style: TextStyle(color: Colors.brown[300], fontSize: 18),),
                  onPressed: (){_controller.animateToPage(numPage-1, duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,);
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _addAndWait() async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewBasketItem()),
    ).then((value){
      if(value=="OK"){
        setState(() {});
      }
    });

  }
}