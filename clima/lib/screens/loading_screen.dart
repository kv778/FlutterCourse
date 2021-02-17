import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
