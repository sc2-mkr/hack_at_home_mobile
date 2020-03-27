import 'package:flutter/material.dart';
import 'package:hackathome/Utility/StatusBarCleaner.dart';

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
        appBar: AppBar(title: Text("HackatHome"),),

      )
    );
  }
}