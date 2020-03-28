import 'Basket.dart';
import 'BasketItem.dart';

class SendBasketToServer{
  static send() async {
    print("userName: ${Basket.getUserName()}");
    print("address: ${Basket.getAddress()}");
    print("phone: ${Basket.getPhoneNumber()}");
    for (BasketItem element in Basket.getEntries()){
      print("element_name: ${element.getName()}, image_path: ${element.getImagePath()}");
    }
    return 0;
  }
}