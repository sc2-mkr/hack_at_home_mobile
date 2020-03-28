import 'dart:math';

import 'package:flutter/material.dart';

class Colorized{
  static List color = [
    Colors.red[300],
    Colors.green[300],
    Colors.blue[300],
    Colors.deepPurple[300],
    Colors.pink[300],
    Colors.deepOrange[300],
    Colors.teal[300],
  ];

  getRandomColor(){
    Random random = new Random();
    return color[random.nextInt(color.length)];
  }

  getColor(index){
    return color[index%color.length];
  }
}