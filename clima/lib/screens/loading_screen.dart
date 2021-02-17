import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  void initState() {
    super.initState();
    getPosition();
  }

  void getPosition() async {
    Location obj = new Location();
    await obj.getPosition();
    print(obj.latitude);
    print(obj.longitude);
  }

  void getData() async {
    http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?id=2172797&appid=72e25a52b669758e337b66aa0068dd27');
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
    );
  }
}

//account name: hsi35902
//password: giveapikey
//key: 72e25a52b669758e337b66aa0068dd27