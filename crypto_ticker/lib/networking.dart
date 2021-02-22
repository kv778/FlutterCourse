import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';

class NetworkHelper {
  NetworkHelper({this.currency});
  final String currency;
  var price;
  Future<dynamic> getPrice(String crypto) async {
    http.Response response = await http.get('https://api.coincap.io/v2/assets/$crypto');
    //http.Response response = await http.get('https://min-api.cryptocompare.com/data/price?fsym=$crypto&tsyms=USD&api_key=$apiKey');
    String data = response.body;
    price =  jsonDecode(data)['data'][currency];
    crypto = '';
    return price;
  }
}
