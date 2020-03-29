import 'package:hackathome/Utility/BasketItem.dart';

class Basket{
  static List entries = [];
  static String userID = "";
  static String userName = "";
  static String address = "";
  static String phoneNumber = "";
  static String city ="";
  static String listID = "";

  static clean(){
    entries = [];
    userID = "";
    userName = "";
    address = "";
    phoneNumber = "";
    city ="";
  }

  static getEntries(){
    return entries;
  }
  static getUserName(){
    return userName;
  }
  static getAddress(){
    return address;
  }
  static getPhoneNumber(){
    return phoneNumber;
  }

  static getCity(){
    return city;
  }

  static removeEntries(int index){
    entries.removeAt(index);
  }

  static addEntries(BasketItem item){
    entries.insert(0, item);
  }

  static setUserName(input){
    userName = input;
  }

  static setAddress(input){
    address = input;
  }

  static setPhoneNumber(input){
    phoneNumber = input;
  }

  static setCity(input){
    city = input;
  }
}