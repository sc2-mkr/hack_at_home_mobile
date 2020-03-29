import 'package:dio/dio.dart';

class AcceptJob {
  static accept(listID,deliveryManID) async {
    var dio = Dio();
    String Url = "http://79.37.45.118:8080/deliverymans/${deliveryManID}/shippingLists/${listID}/accept";
    Response response = await dio.put(Url);
    print(response);
  }
}