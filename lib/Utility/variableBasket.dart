import 'package:hackathome/Utility/BasketItem.dart';

class variableBasket{
  List<BasketItem> entries = [];
  String userID = "";
  String userName = "";
  String address = "ciao";
  String phoneNumber = "";
  String city ="";
  String listID ="";


  getListID(){
    return listID;
  }

  setListID(input){
    listID = input;
  }

  List<BasketItem> getEntries(){
    return entries;
  }
  getUserName(){
    return userName;
  }
  getAddress(){
    return address;
  }
  getPhoneNumber(){
    return phoneNumber;
  }

  getCity(){
    return city;
  }

  removeEntries(int index){
    entries.removeAt(index);
  }

  addEntries(BasketItem item){
    entries.insert(0, item);
  }

  setUserName(input){
    userName = input;
  }

  setAddress(input){
    address = input;
  }

  setPhoneNumber(input){
    phoneNumber = input;
  }

  setCity(input){
    city = input;
  }
}