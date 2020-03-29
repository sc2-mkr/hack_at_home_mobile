import 'dart:io';

import 'package:flutter/material.dart';

class BasketItem {
  String name;
  String imagePath;

  BasketItem({Key key, this.name, this.imagePath});

  String getName(){
    return this.name;
  }

  setName(String input){
    name = input;
  }

  getImagePath(){
    return imagePath;
  }

  setImagePath(String input){
    imagePath = input;
  }
}