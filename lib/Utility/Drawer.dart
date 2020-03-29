import 'package:flutter/material.dart';
import 'package:hackathome/Pages/About.dart';
import 'package:hackathome/Pages/Home.dart';

// ignore: camel_case_types
class getDrawer extends StatefulWidget {
  getDrawer({Key key, this.title}) : super(key: key);

  final String title;

  @override
  getDrawerState createState() => getDrawerState();
}

class getDrawerState extends State<getDrawer>{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
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
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Accedi/Registrati'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Impostazioni'),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('About'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
        ],
      ),
    );
  }
}