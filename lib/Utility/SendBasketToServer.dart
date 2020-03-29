import 'Basket.dart';
import 'BasketItem.dart';
import 'package:dio/dio.dart';

class SendBasketToServer{

  static send() async {
    var dio = Dio();
    String Url = "http://79.37.45.118:8080/shippinglists?city=${Uri.encodeComponent(Basket.getCity())}&address=${Uri.encodeComponent(Basket.getAddress())}";
    Response response = await dio.post(Url);

    print(response.statusCode);
    if(response.statusCode==200) {
      final newId = response.data["id"];

      print("Start!");
      for (BasketItem element in Basket.getEntries()) {
        FormData formData = FormData.fromMap({
          "img": await MultipartFile.fromFile(element.getImagePath()),
        });

        Response response = await dio.post(
          "http://79.37.45.118:8080/shippinglists/$newId/items",
          data: formData,
          onSendProgress: (int sent, int total) {
            print("$sent/$total");
          },
        );
        print(response);
      }
    }
  }
}