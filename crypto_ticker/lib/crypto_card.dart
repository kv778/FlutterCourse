import 'package:flutter/material.dart';
import 'networking.dart';

var priceData;
double priceUSD;
String roundedPrice;
NetworkHelper networkHelper = NetworkHelper(currency: 'priceUsd');

class cryptoCard extends StatefulWidget {
  cryptoCard({this.cryptoID, this.cryptoType});
  String cryptoID;
  String cryptoType;

  @override
  _cryptoCardState createState() => _cryptoCardState();
}

class _cryptoCardState extends State<cryptoCard> {

  void getPriceData() async {
    priceData = await networkHelper.getPrice(widget.cryptoType);
    setState(() {
      priceUSD = double.parse(priceData);
      roundedPrice = priceUSD.toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    super.initState();
    getPriceData();
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.cryptoType = '';
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
          '1 ${widget.cryptoID} = $roundedPrice USD',
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
