import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/main.dart';

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
      color: Colors.blue[700],
      child:Scaffold(
        appBar: AppBar(title: Text(MyApp().title),),
        drawer: getDrawer(),
        body: getBody(),
      )
    );
  }

  Widget getBody(){
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
                    color: Colors.black,
                    image: new DecorationImage(
                      image: new AssetImage("assets/asset1.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    )
                  ),
                  child: Center(child: Text("Richiedi la spesa", style: TextStyle(fontSize:34,color: Colors.white),)),
                ),
                onTap: (){
                    print("test");
                },
              ),
            )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 8,right: 8,left: 8),
                child: InkWell(
                  child: Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.black,
                        image: new DecorationImage(
                          image: new AssetImage("assets/asset2.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                        )
                    ),
                    child: Center(child: Text("Accetta una Richiesta", style: TextStyle(fontSize:34,color: Colors.white),)),
                  ),
                  onTap: (){
                    print("test");
                  },
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget getDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image:  DecorationImage(
                image: AssetImage("assets/generosity.jpeg"),
                fit: BoxFit.cover
              )
            ),
            child: Text(
              'Hack@Home',
              style: TextStyle(
                color: Color(0xFF212121),
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Accedi/Registrati'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Impostazioni'),
          ),
        ],
      ),
    );
  }
}
