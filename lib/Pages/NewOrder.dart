import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathome/Pages/AddNewBasketItem.dart';
import 'package:hackathome/Pages/BasketItemDetail.dart';
import 'package:hackathome/Utility/Basket.dart';
import 'package:hackathome/Utility/BasketItem.dart';
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

  _addItem(){
    Basket.entries.insert(0,BasketItem(name: "Ciao ${Basket.entries.length}"));
    setState(() {});
  }

  _removeItem(index){
    Basket.entries.removeAt(index);
    setState(() {});
  }

  // ignore: non_constant_identifier_names
  Page1(int numPage){
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.separated(
            itemCount: Basket.entries.length,
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
                      MaterialPageRoute(builder: (context) => BasketItemDetail(Basket.entries[index])),
                    );
                  },
                  title: Text(Basket.entries[index].getName()),
                  trailing: InkWell(
                    onTap: (){_removeItem(index);},
                    child: Container(
                      width: 35,
                      height: 35,
                      color: Colors.red[700],
                      child: Icon(Icons.delete,color: Colors.white,),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            color: SC2Theme.mainColor,
            child: Text("AGGIUNGI",style: TextStyle(color: Colors.white),),
            onPressed: (){
              _addAndWait();
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.bottomRight,
          child: FlatButton(
            child: Text("AVANTI",style: TextStyle(color: SC2Theme.mainColor),),
            onPressed: (){_controller.animateToPage(numPage+1, duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,);
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.bottomLeft,
          child: FlatButton(
            child: Text("INDIETRO",style: TextStyle(color: Colors.brown[700]),),
            onPressed: (){_controller.animateToPage(numPage-1, duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,);
            },
          ),
        )
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