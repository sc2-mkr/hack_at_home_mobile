import 'Basket.dart';
import 'BasketItem.dart';
import 'package:dio/dio.dart';

class SendBasketToServer{

  static send() async {
    var dio = Dio();
    
    String Url = "http://79.37.45.118:8080/shippinglists";
    Response response = await dio.post(Url,data: {"address": Basket.getAddress(),"city": Basket.getCity()});

    print(response.statusCode);
    if(response.statusCode==200) {
      final newId = response.data["id"];

      print("Start!");
      for (BasketItem element in Basket.getEntries()) {
        FormData formData = FormData.fromMap({
          "img": await MultipartFile.fromFile(element.getImagePath()),
        });

        Response response = await dio.post(
          "http://79.37.45.118:8080/shippinglists/$newId/items?text=${Uri.encodeComponent(element.getName())}",
          data: formData,
          onSendProgress: (int sent, int total) {
            print("$sent/$total");
          },
        );
        Basket.clean();
      }
    }
  }
}