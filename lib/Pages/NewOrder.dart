import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hackathome/Pages/AddNewBasketItem.dart';
import 'package:hackathome/Pages/BasketItemDetail.dart';
import 'package:hackathome/Utility/Basket.dart';
import 'package:hackathome/Utility/Colorized.dart';
import 'package:hackathome/Utility/SendBasketToServer.dart';
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
        BasketPage(),
        MoreInformation(),
        NameAndAddress(),
        Final()
      ],
    );
  }

  _removeItem(index){
    Basket.removeEntries(index);
    setState(() {});
  }

  // ignore: non_constant_identifier_names
  BasketPage(){
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
                  height: 55,
                  child: ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BasketItemDetail(Basket.getEntries()[index])),
                      );
                    },
                    leading: Basket.getEntries()[index].getImagePath()==null ? SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        child: Icon(Icons.shopping_basket,color: SC2Theme.backgroundColor,),
                        backgroundColor: Colorized().getColor(index),
                      ),
                    ):
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: FileImage(File(Basket.getEntries()[index].getImagePath())),
                      ),
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
                  onPressed: (){_controller.animateToPage(1, duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  MoreInformation(){
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text("Ci servono ancora alcune informazioni",style: TextStyle(fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 32.0, left:32.0),
              child: Center(
                child: Text("Come ad esempio il tuo",
                style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0, left:32.0),
              child: Center(
                child: Text("Numero telefonico",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 32.0, left:32.0),
              child: Center(
                child: Text("In modo che chi prenderà in consegna la tua richiesta possa contattarti",
                style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (text) {
                  Basket.setPhoneNumber(text);
                },
                decoration: InputDecoration(
                    hintText: 'Numero di Telefono'
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    child: Text("AVANTI",style: TextStyle(color: SC2Theme.mainColor, fontSize: 18),),
                    onPressed: (){_controller.animateToPage(2, duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: FlatButton(
                    child: Text("INDIETRO",style: TextStyle(color: Colors.brown[300], fontSize: 18),),
                    onPressed: (){_controller.animateToPage(0, duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  NameAndAddress(){
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 32.0, left: 32.0),
              child: Center(child: Text("Per ultimo",style: TextStyle(fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0, left: 32.0),
              child: Center(child: Text("Ci servirebbe il tuo",style: TextStyle(fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 32.0, left: 32.0),
              child: Center(child: Text("Nome e Cognome",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (text) {
                  Basket.setUserName(text);
                },
                decoration: InputDecoration(
                    hintText: 'Nome e Cognome'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:16, right: 32.0, left: 32.0),
              child: Center(child: Text("e il tuo",style: TextStyle(fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0, left: 32.0),
              child: Center(child: Text("Indirizzo Civico",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:16, right: 32.0, left: 32.0),
              child: Center(child: Text("in modo che ti possano portare la spesa a casa",style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                onChanged: (text) {
                  Basket.setAddress(text);
                },
                decoration: InputDecoration(
                    hintText: 'Indirizzo Civico'
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    child: Text("AVANTI",style: TextStyle(color: SC2Theme.mainColor, fontSize: 18),),
                    onPressed: (){_controller.animateToPage(3, duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: FlatButton(
                    child: Text("INDIETRO",style: TextStyle(color: Colors.brown[300], fontSize: 18),),
                    onPressed: (){_controller.animateToPage(1, duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Final(){
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 32.0, left: 32.0),
              child: Center(child: Text("Abbiamo finito!!!",style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0, left: 32.0),
              child: Center(child: Text("Premi il pulsante",style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0, left: 32.0),
              child: Center(child: Text("Finito",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0, left: 32.0),
              child: Center(child: Text("Per inviare la tua richiesta",style: TextStyle(fontSize: 20), textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SizedBox(
                height: 50,
                child: RaisedButton(
                  color: SC2Theme.mainColor,
                  textColor: Colors.white,
                  child: Text("FINITO",style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                  onPressed: (){
                    _sendDataToServer();
                  },
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: FlatButton(
                child: Text("INDIETRO",style: TextStyle(color: Colors.brown[300], fontSize: 18),),
                onPressed: (){_controller.animateToPage(2, duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _sendDataToServer() async {
      int result = await SendBasketToServer.send();
      if(result==0){
        Navigator.pop(context);
      }
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