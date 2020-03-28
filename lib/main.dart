import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

