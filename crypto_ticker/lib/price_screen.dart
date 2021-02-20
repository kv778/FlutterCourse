import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem> list = [];
    for(String currency in currenciesList) {
      list.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }
    return list;
  }

  List<Widget> cupertinoPickerItems() {
    List<Widget> list = [];
    for(String currency in currenciesList) {
      list.add(
        Text(currency),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 35.0,
              children: cupertinoPickerItems(),
              onSelectedItemChanged: (selectedIndex) {
                print(selectedIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton(
// value: selectedCurrency,
// items: getDropdownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value;
// });
// },
// ),