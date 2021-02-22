import 'package:crypto_ticker/price_screen.dart';
import 'package:flutter/material.dart';
import 'networking.dart';

NetworkHelper networkHelper = NetworkHelper(currency: 'priceUsd');

class cryptoCard extends StatefulWidget {
  cryptoCard({this.cryptoID, this.cryptoType, this.currency});
  String cryptoID;
  String cryptoType;
  String currency;

  @override
  _cryptoCardState createState() => _cryptoCardState();
}

class _cryptoCardState extends State<cryptoCard> {
  var priceData;
  double priceUSD;
  String roundedPrice;

  void getPriceData() async {
    priceData = await networkHelper.getPrice(widget.cryptoType);
    setState(() {
      priceUSD = double.parse(priceData);
      roundedPrice = priceUSD.toStringAsFixed(0);
      print(roundedPrice);
    });
  }

  @override
  void initState() {
    super.initState();
    getPriceData();
  }

  @override
  void deactivate() {
    priceData = 0;
    priceUSD = 0;
    roundedPrice='';
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 ${widget.cryptoID} = $roundedPrice ${widget.currency}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
