import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.currency, this.crypto});
  final String currency;
  final String crypto;
  var price;

  Future<dynamic> getPrice() async {
    http.Response response = await http.get('https://api.coincap.io/v2/assets/$crypto');
    String data = response.body;
    price =  jsonDecode(data)['data'][currency];
    return price;
  }
}