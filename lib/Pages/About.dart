import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackathome/Utility/Drawer.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';
import 'package:hackathome/Utility/Theme.dart';

import '../main.dart';

class About extends StatefulWidget {
  About({Key key, this.title}) : super(key: key);

  final String title;

  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
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

  getBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/sc2.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(9999999999)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("SC2 Technology",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Tornesello Alessandro",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("@Iregon"),
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/Iregon.jpg"),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Russo Andrea",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("@Tadsdcz50"),
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/tadsdcz50.jpeg"),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Mele Simone",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("@Simone999"),
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/Simone.jpeg"),
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Centonze Mattia",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("@PlayerUnknown737"),
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(""),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}