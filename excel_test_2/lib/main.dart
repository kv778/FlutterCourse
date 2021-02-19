import 'package:flutter/material.dart';
import 'demo1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter File Upload'),
        ),
        body: Demo1(),
      ),
    );
  }
}
