import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:clima/services/networking.dart';

String apiKey = '72e25a52b669758e337b66aa0068dd27';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude=0.0;
  double longitude=0.0;
  @override

  void initState() {
    super.initState();
    getPositionData();
  }

  void getPositionData() async {
    Location obj = new Location();
    await obj.getPosition();
    latitude = obj.latitude;
    longitude = obj.longitude;

    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
