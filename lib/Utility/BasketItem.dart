import 'package:flutter/material.dart';

class BasketItem {
  final String name;

  BasketItem({Key key, this.name});

  getName(){
    return this.name;
  }

}