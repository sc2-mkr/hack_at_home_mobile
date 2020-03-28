import 'package:flutter/material.dart';
import 'package:hackathome/Utility/Theme.dart';
import 'Pages/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = "Spesa a Casa Tua";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        backgroundColor: SC2Theme.backgroundColor
      ),
      home: Home(),
    );
  }
}

