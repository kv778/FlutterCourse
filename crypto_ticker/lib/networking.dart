import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.currency});
  final String currency;
  var price;

  Future<dynamic> getPrice() async {
    http.Response response = await http.get('https://api.coincap.io/v2/assets/bitcoin');
    String data = response.body;
    price =  jsonDecode(data)['data']['priceUsd'];
    return price;
  }
}