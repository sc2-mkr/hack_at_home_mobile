import 'package:dio/dio.dart';
import 'package:hackathome/Utility/BasketItem.dart';
import 'package:hackathome/Utility/variableBasket.dart';

class GetBasketFromServer{
  static Future<List<variableBasket>> fetch() async {
      var dio = Dio();
      dio.options.connectTimeout = 5000; //5s
      dio.options.receiveTimeout = 3000;

      String Url = "http://79.37.45.118:8080/shippinglists";
      Response response = await dio.get(Url);

      List<variableBasket> listOfBasket = [];

      if(response.statusCode==200){

        for (var item in response.data){
          variableBasket newBasket = new variableBasket();
          if(item["address"]!=""){
            newBasket.setAddress(item["address"]);
          }else{
            newBasket.setAddress("via non inserita");
          }
          if(item["city"]!=""){
            newBasket.setCity(item["city"]);
          }else{
            newBasket.setCity("città non inserita");
          }
          newBasket.setListID(item["id"].toString());
          if(item["shippingItems"]!=null){
            for (var article in item["shippingItems"]){
              newBasket.addEntries(BasketItem(name: article["text"],imagePath: article["photoUrl"]));
            }
          }
          String Url = "http://79.37.45.118:8080/customers/${item["customerId"]}";
          Response response = await dio.get(Url);
          if(response.statusCode==200){
            if(response.data["name"]!=""){
              newBasket.setUserName("${response.data["name"]} ${response.data["surname"]}");
            }
          }
          listOfBasket.add(newBasket);
        }
        return listOfBasket;
      }
  }
}