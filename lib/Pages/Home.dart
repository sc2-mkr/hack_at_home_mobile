import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathome/Pages/NewOrder.dart';
import 'package:hackathome/Pages/ShippingList.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';
import 'package:hackathome/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
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

  Widget getBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.brown[900],
                        image: new DecorationImage(
                          image: new AssetImage("assets/asset1.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        )
                    ),
                    child: Center(child: Text("Richiedi la spesa",
                      style: TextStyle(fontSize: 34, color: Colors.white),)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewOrder()),
                    );
                  },
                ),
              )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 8, right: 8, left: 8),
                child: InkWell(
                  child: Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.brown[900],
                        image: new DecorationImage(
                          image: new AssetImage("assets/asset2.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.brown.withOpacity(0.5), BlendMode.dstATop),
                        )
                    ),
                    child: Center(child: Text("Accetta una Richiesta",
                      style: TextStyle(fontSize: 34, color: Colors.white),)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShippingList()),
                    );
                  },
                ),
              )
          ),
        ],
      ),
    );
  }
}
